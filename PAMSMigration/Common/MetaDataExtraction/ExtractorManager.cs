﻿using System;
using System.Collections.Generic;
using System.Text;
//using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using Common.MetaDataExtraction.DatabaseExtractors;
using Common.Entities.MetaDataSchema;
using Common.MetaDataExtraction.DatabaseExtractors.Resources;

namespace Common.MetaDataExtraction
{
    public class ExtractorManager
    {
        
        
        DatabaseExtractor databaseSchemaReader;
        
        public void SetDatabaseReader(Project project)
        {
            if (project.DatabaseType == DatabaseTypes.SQLServer && databaseSchemaReader == null)
            {
                databaseSchemaReader = new SQLServerDatabaseExtractor();
                conn = new System.Data.SqlClient.SqlConnection(connectionString);
            }
            else if (project.DatabaseType == DatabaseTypes.Access && databaseSchemaReader == null)
            {
                databaseSchemaReader = null;
            }
            else if (project.DatabaseType == DatabaseTypes.Oracle && databaseSchemaReader == null)
            {
                databaseSchemaReader = null;
            }
            else if (project.DatabaseType == DatabaseTypes.MySQL && databaseSchemaReader == null)
            {
                databaseSchemaReader = null;
            }
        }
        public DatabaseExtractor DatabaseReaders
        {
            get 
            {
                
                return databaseSchemaReader; 
            
            }
        }

        public void SetConnectionString(Project project,string databaseName)
        {
            connectionString = "";
            if (project.DatabaseType == DatabaseTypes.SQLServer)
            {
                if (project.IsWindowsAuthentication)
                {

                    connectionString = DataStructure.SQLConn;
                    connectionString = connectionString.Replace("##DS##", project.ServerName);
                    Entities.MetaDataSchema.Database database = Entities.MetaDataSchema.Database.GetByName(project.Databases, databaseName);

                    if (database != null)
                        connectionString = connectionString.Replace("##IC##", database.Name);
                    else
                        connectionString = connectionString.Replace("initial catalog=##IC##", "");
                }
                else
                {
                    connectionString = DataStructure.SQLPassConn;
                    connectionString = connectionString.Replace("##DS##", project.ServerName);
                    connectionString = connectionString.Replace("##UID##", project.UserName);
                    connectionString = connectionString.Replace("##PASS##", project.Password);
                    if (project.Databases != null)
                    {
                        Entities.MetaDataSchema.Database database = Entities.MetaDataSchema.Database.GetByName(project.Databases, databaseName);

                        if (database != null)
                            connectionString = connectionString.Replace("##IC##", database.Name);
                        else
                            connectionString = connectionString.Replace("initial catalog=##IC##;", "");
                    }
                    else
                    {
                        connectionString = connectionString.Replace("initial catalog=##IC##;", "");
                    }
                }
            }
        }


        string connectionString = "";
        public string ConnectionString
        {
            get
            {
                return connectionString;
            }
        }

        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
        public System.Data.IDataReader SelectStatement(string query)
        {
            if (connectionString != "")
            {

                if (databaseSchemaReader is SQLServerDatabaseExtractor)
                {
                    System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(query);
                    command.CommandType = CommandType.Text;
                    command.Connection = conn;
                    if(conn.State != ConnectionState.Open)
                        conn.Open();
                    System.Data.SqlClient.SqlDataReader dr = command.ExecuteReader();
                    DataTable table = new DataTable();
                    table.Load(dr, LoadOption.OverwriteChanges);
                    dr.Close();
                    //conn.Close();
                    return table.CreateDataReader();
                }
            }
            return null;
            
        }
        public void EXQuery(string query)
        {
            if (connectionString != "")
            {

                if (databaseSchemaReader is SQLServerDatabaseExtractor)
                {
                    System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString);
                    System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(query);
                    command.CommandType = CommandType.Text;
                    command.Connection = conn;
                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                    command.Dispose();
                }
            }
        }

        private static System.Xml.XmlDocument structureDocument;
        public static System.Xml.XmlDocument StructureDocument
        {
            set { structureDocument = value; }
            get 
            {
                if (structureDocument == null)
                {
                    structureDocument = new System.Xml.XmlDocument();
                    System.Xml.XmlDeclaration declaration = structureDocument.CreateXmlDeclaration("1.0", String.Empty, String.Empty);
                    structureDocument.AppendChild(declaration);
                    System.Xml.XmlElement element = structureDocument.CreateElement(DataStructure.MetaDataRoot);
                    
                    string x = structureDocument.OuterXml;
                    structureDocument.AppendChild(element);
                    //x = structureDocument.InnerXml;
                    System.Xml.XmlElement elementStructure = structureDocument.CreateElement(DataStructure.DataStructures);
                    //x = structureDocument.InnerXml;

                    element.AppendChild(elementStructure);
                    //x = structureDocument.InnerXml;
                }
                return structureDocument; 
            }
        }
        
        public Project Connect(DatabaseTypes type,string userName,string password,string database,string serverName,bool winAuth)
        {
            Project project = null;

            try
            {
                project = new Project();
                project.DatabaseType = type;
                project.UserName = userName;
                project.Password = password;
                project.ServerName = serverName;
                project.IsWindowsAuthentication = winAuth;
                SetDatabaseReader(project);
                SetConnectionString(project, database);

                //System.Data.Common.DbConnection conn = null;
                //if (databaseSchemaReader is SQLServerDatabaseExtractor)
                //{
                //    conn = new System.Data.SqlClient.SqlConnection(connectionString);
                //}
                //conn.Open();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return project;
        }
    }

    public enum Type
    {
        Database = 0,
        Table = 1,
        Column = 2
    }
}
