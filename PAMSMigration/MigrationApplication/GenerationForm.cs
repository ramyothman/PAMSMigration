using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using Common.Entities.MetaDataSchema;
using Common.Generation;

namespace MigrationApplication
{
    public partial class GenerationForm : DevExpress.XtraEditors.XtraForm
    {
        public GenerationForm()
        {
            InitializeComponent();
        }
        Common.Entities.MetaDataSchema.Project projectNew = new Common.Entities.MetaDataSchema.Project();
        Common.Entities.MetaDataSchema.Project projectOld = new Common.Entities.MetaDataSchema.Project();
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            splashScreenManager1.ShowWaitForm();
            backgroundWorker1.RunWorkerAsync();
            
            
        }
        StringBuilder strGen = new StringBuilder();
        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            projectNew.ServerName = @"RBM-Shotec";
            projectNew.UserName = "sa";
            projectNew.Password = "welcome";
            projectNew.IsWindowsAuthentication = false;
            projectNew.Name = "Migration Script";
            projectNew.CreateDate = System.DateTime.Now;
            DataType.LoadHashTables(Application.ExecutablePath.Substring(0, Application.ExecutablePath.LastIndexOf("\\")) + "\\" + "DataTypesMapper.xml");
            projectNew.DatabaseType = DatabaseTypes.SQLServer;
            projectNew.CheckHasData = true;
            projectNew.Connect();
            projectNew.ExtractorManager.DatabaseReaders.GetDatabases(projectNew);
            Database database = projectNew.GetDatabaseByName("PAMSDB");
            #region Extrating Table Information
            if (database.Tables != null && database.Tables.Count == 0)
            {
                projectNew.ExtractorManager.DatabaseReaders.GetTables(database);

                foreach (Common.Entities.MetaDataSchema.Table tbl in database.Tables)
                {
                    projectNew.ExtractorManager.DatabaseReaders.GetColumns(tbl);
                }
            }
            #endregion
            strGen = new StringBuilder();
            


            Generator g = new Generator(CodeType.Sql);
            foreach (Table t in database.Tables)
            {
                if (t.HasData)
                {
                    string columnsScript = "[$$<%$$ TableColumn,Name $$%>,$$]";
                    strGen.AppendFormat(string.Format("-- Data Migration for Table {0}.{1} --", t.Schema, t.Name));
                    strGen.AppendFormat(Environment.NewLine);
                    if (t.HasIdentityColumn)
                    {
                        strGen.AppendFormat(Environment.NewLine);
                        strGen.AppendFormat(string.Format("SET IDENTITY_INSERT [{0}].[{1}] ON;", t.Schema, t.Name));
                        strGen.AppendFormat(Environment.NewLine);
                        strGen.AppendFormat(Environment.NewLine);
                    }
                    columnsScript = g.GetCode(columnsScript, "Test", "ClassTest", t);
                    columnsScript = columnsScript.Remove(columnsScript.Length - 1, 1);
                    strGen.AppendFormat(string.Format(@"insert into [{0}].[{1}] ({2})", t.Schema, t.Name, columnsScript));
                    strGen.AppendFormat(Environment.NewLine);
                    strGen.AppendFormat(string.Format(@"select {0} from [{1}].[{2}].[{3}] ", columnsScript, t.ParentDatabase.Name, t.Schema, t.Name));
                    strGen.AppendFormat(Environment.NewLine);
                    if (t.HasIdentityColumn)
                    {
                        strGen.AppendFormat(Environment.NewLine);
                        strGen.AppendFormat(string.Format("SET IDENTITY_INSERT [{0}].[{1}] OFF;", t.Schema, t.Name));
                        strGen.AppendFormat(Environment.NewLine);
                        strGen.AppendFormat(Environment.NewLine);
                    }
                    strGen.AppendFormat("GO");
                    strGen.AppendFormat(Environment.NewLine);
                    strGen.AppendFormat(Environment.NewLine);

                    gridControl1.BeginInvoke(new UpdateDataSourceDelegate(UpdateGridDataSource), new object[] { t });
                }
            }
        }
        
        private delegate void UpdateDataSourceDelegate(Table dataToMerge);
        private void UpdateGridDataSource(Table t)
        {
            schemaDS.TableSchema.AddTableSchemaRow(t.Id, t.Name, t.Schema, t.Schema + "." + t.Name, t.HasData);
        }
        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            splashScreenManager1.CloseWaitForm();
            richTextBox.Text = strGen.ToString();
        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
           // gridControl1.DataSource = schemaDS.TableSchema;
        }

        private void btnGenerateFromOldDatabase_Click(object sender, EventArgs e)
        {
            splashScreenManager1.ShowWaitForm();
            backgroundWorker2.RunWorkerAsync();
        }

        private void backgroundWorker2_DoWork(object sender, DoWorkEventArgs e)
        {
            if (projectNew.Databases.Count == 0)
            {
                projectNew.ServerName = @"RBM-Shotec";
                projectNew.UserName = "sa";
                projectNew.Password = "welcome";
                projectNew.IsWindowsAuthentication = false;
                projectNew.Name = "Migration Script";
                projectNew.CreateDate = System.DateTime.Now;
                DataType.LoadHashTables(Application.ExecutablePath.Substring(0, Application.ExecutablePath.LastIndexOf("\\")) + "\\" + "DataTypesMapper.xml");
                projectNew.DatabaseType = DatabaseTypes.SQLServer;
                projectNew.CheckHasData = true;
                projectNew.Connect();
                projectNew.ExtractorManager.DatabaseReaders.GetDatabases(projectNew);
            }
                Database database = projectNew.GetDatabaseByName("PAMSDB");
                Database oldDatabase = projectNew.GetDatabaseByName("ShotecEgypt");
                #region Extrating Table Information
                if (database.Tables != null && database.Tables.Count == 0)
                {
                    projectNew.ExtractorManager.DatabaseReaders.GetTables(database);

                    foreach (Common.Entities.MetaDataSchema.Table tbl in database.Tables)
                    {
                        projectNew.ExtractorManager.DatabaseReaders.GetTableRelations(tbl);
                        projectNew.ExtractorManager.DatabaseReaders.GetColumns(tbl);

                    }

                }

                if (oldDatabase.Tables != null && oldDatabase.Tables.Count == 0)
                {
                    projectNew.ExtractorManager.DatabaseReaders.GetTables(oldDatabase);

                    foreach (Common.Entities.MetaDataSchema.Table tbl in oldDatabase.Tables)
                    {
                        projectNew.ExtractorManager.DatabaseReaders.GetTableRelations(tbl);
                        projectNew.ExtractorManager.DatabaseReaders.GetColumns(tbl);
                        Table newTable = Table.GetByNameandSchema(database.Tables, tbl.Name, tbl.Schema);
                        if (tbl.HasData)
                            if (tbl.Name == "sysdiagrams")
                                continue;
                            else if (tbl.Name == "Roles" || tbl.Name == "BusinessEntity" || tbl.Name == "Credential" || tbl.Name == "Person" || tbl.Name == "UserRoles" || tbl.Name == "RolePrivileges")
                                continue;
                            else
                                gridControl1.BeginInvoke(new UpdateDataSourceDelegate(UpdateGridDataSource), new object[] { tbl });
                    }
                }
                #endregion
            
            
            strGen = new StringBuilder();
            List<Table> tablesOrdered = new List<Table>();
            OrderTablesBasedOnDependencies(oldDatabase, ref tablesOrdered);
            Generator g = new Generator(CodeType.Sql);
            foreach (Table t in tablesOrdered)
            {
                if (t.Name == "sysdiagrams")
                    continue;
                if (t.HasData)
                {
                    Table newTable = Table.GetByNameandSchema(database.Tables, t.Name, t.Schema);
                    if (newTable == null)
                        continue;
                    if(newTable != null && newTable.HasData)
                    {
                        if (newTable.Name != "Roles" && newTable.Name != "BusinessEntity" && newTable.Name != "Credential" && newTable.Name != "Person" && newTable.Name != "UserRoles" && newTable.Name != "RolePrivileges")
                            continue;
                    }
                    string columnsScript = "";
                    strGen.AppendFormat(string.Format("-- Data Migration for Table {0}.{1} --", t.Schema, t.Name));
                    strGen.AppendFormat(Environment.NewLine);
                    if (t.HasIdentityColumn)
                    {
                        if (newTable.Name != "Roles" && newTable.Name != "BusinessEntity" && newTable.Name != "Credential" && newTable.Name != "Person" && newTable.Name != "UserRoles" && newTable.Name != "RolePrivileges")
                        {
                            strGen.AppendFormat(Environment.NewLine);
                            strGen.AppendFormat(string.Format("SET IDENTITY_INSERT [{0}].[{1}] ON;", t.Schema, t.Name));
                            strGen.AppendFormat(Environment.NewLine);
                            strGen.AppendFormat(Environment.NewLine);
                        }
                    }
                    string oldColumnNames = "";
                    foreach(Column c in t.Columns)
                    {
                        Column newC = Column.GetByName(newTable.Columns, c.Name);
                        if (c.Name == "EgyptBusinessEntityID" || c.Name == "RPEBusinessEntityID" || c.Name == "QatarBusinessEntityID" || c.Name == "EgyptID" || c.Name == "RPEID" || c.Name == "QatarID")
                        {
                            continue;
                        }
                        else
                        {
                            if (newC == null)
                                continue;
                            columnsScript += c.Name + ",";
                            oldColumnNames += GetColumnString(t, c) + ",";
                        }
                        
                    }
                    foreach (Column c in newTable.Columns)
                    {
                        Column oldC = Column.GetByName(t.Columns, c.Name);
                        if (c.Name == "EgyptBusinessEntityID" || c.Name == "RPEBusinessEntityID" || c.Name == "QatarBusinessEntityID" || c.Name == "EgyptID" || c.Name == "RPEID" || c.Name == "QatarID")
                        {
                            if (c.Name == "EgyptBusinessEntityID" || c.Name == "EgyptID")
                            {
                                Column pk = Column.GetByPrimaryKey(t.Columns);
                                if (pk != null)
                                {
                                    columnsScript += c.Name + ",";
                                    oldColumnNames += pk.Name + ",";
                                }
                                else
                                {
                                    columnsScript += c.Name + ",";
                                    oldColumnNames += "0,";
                                }
                            }
                        }
                    }
                    if(columnsScript.Length > 0)
                        columnsScript = columnsScript.Remove(columnsScript.Length - 1, 1);
                    if (oldColumnNames.Length > 0)
                        oldColumnNames = oldColumnNames.Remove(oldColumnNames.Length - 1, 1);
                    strGen.AppendFormat(string.Format(@"insert into [{0}].[{1}] ({2})", t.Schema, t.Name, columnsScript));
                    strGen.AppendFormat(Environment.NewLine);
                    strGen.AppendFormat(string.Format(@"select {0} from [{1}].[{2}].[{3}] ", oldColumnNames, t.ParentDatabase.Name, t.Schema, t.Name));
                    strGen.AppendFormat(Environment.NewLine);
                    if (t.HasIdentityColumn)
                    {
                        if (newTable.Name != "Roles" && newTable.Name != "BusinessEntity" && newTable.Name != "Credential" && newTable.Name != "Person" && newTable.Name != "UserRoles" && newTable.Name != "RolePrivileges")
                        {
                            strGen.AppendFormat(Environment.NewLine);
                            strGen.AppendFormat(string.Format("SET IDENTITY_INSERT [{0}].[{1}] OFF;", t.Schema, t.Name));
                            strGen.AppendFormat(Environment.NewLine);
                            strGen.AppendFormat(Environment.NewLine);
                        }
                    }
                    strGen.AppendFormat("GO");
                    strGen.AppendFormat(Environment.NewLine);
                    strGen.AppendFormat(Environment.NewLine);

                    
                }
            }
        }

        private void OrderTablesBasedOnDependencies(Database db,ref List<Table> tables)
        {
            if (db.Tables.Count == tables.Count)
                return;
            
            foreach(Table t in db.Tables)
            {
                Table check = Table.GetByNameandSchema(tables, t.Name, t.Schema);
                if(check == null)
                {
                    if( t.ParentRelationShips.Count == 0)
                    {
                        tables.Add(t);
                        
                        
                    }
                }
            }

            foreach (Table t in db.Tables)
            {
                Table check = Table.GetByNameandSchema(tables, t.Name, t.Schema);
                if (check == null)
                {
                    tables.Add(t);
                }
            }
            db.Tables = tables;
        }

        private string GetColumnString(Table table, Column col)
        {
            string result = col.Name;
            
            foreach(RelationShip r in table.ParentRelationShips)
            {
                if(r.ChildColumn.Name == col.Name)
                {
                    switch(r.MasterTable.Name)
                    {
                        case "Address":
                            result = string.Format("Migration.fn_GetNewAddressID({0}, 0, 0)", col.Name);
                            break;
                        case "Banks":
                            result = string.Format("Migration.fn_GetNewBankID({0}, 0, 0)", col.Name);
                            break;
                        case "Categories":
                            result = string.Format("Migration.fn_GetNewCategoryID({0}, 0, 0)", col.Name);
                            break;
                        case "Cities":
                            result = string.Format("Migration.fn_GetNewCityID({0}, 0, 0)", col.Name);
                            break;
                        case "ProjectsComments":
                            result = string.Format("Migration.fn_GetNewCommentID({0}, 0, 0)", col.Name);
                            break;
                        case "Currencies":
                            result = string.Format("Migration.fn_GetNewCurrencyID({0}, 0, 0)", col.Name);
                            break;
                        case "Customers":
                            result = string.Format("Migration.fn_GetNewCustomerID({0}, 0, 0)", col.Name);
                            break;
                        case "CustomerSupplierRegistration":
                            result = string.Format("Migration.fn_GetNewCustomerSupplierRegistrationID({0}, 0, 0)", col.Name);
                            break;
                        case "DocumentsJobs":
                            result = string.Format("Migration.fn_GetNewDocID({0}, 0, 0)", col.Name);
                            break;
                        case "ProjectsGuarantee":
                            result = string.Format("Migration.fn_GetNewGuranteeID({0}, 0, 0)", col.Name);
                            break;
                        case "Inquiries":
                            result = string.Format("Migration.fn_GetNewInquiryNumber({0}, 0, 0)", col.Name);
                            break;
                        case "Notifications":
                            result = string.Format("Migration.fn_GetNewNotificationID({0}, 0, 0)", col.Name);
                            break;
                        case "SystemPages":
                            result = string.Format("Migration.fn_GetNewPageID({0}, 0, 0)", col.Name);
                            break;
                        case "PartialOrder":
                            result = string.Format("Migration.fn_GetNewPartialOrderID({0}, 0, 0)", col.Name);
                            break;
                        case "PartialShipment":
                            result = string.Format("Migration.fn_GetNewPartialShipmentID({0}, 0, 0)", col.Name);
                            break;
                        case "Person.Person":
                        case "Person.BusinessEntity":
                            result = string.Format("Migration.fn_GetNewPersonID({0}, 0, 0)", col.Name);
                            break;
                        case "Products":
                            result = string.Format("Migration.fn_GetNewProductID({0}, 0, 0)", col.Name);
                            break;
                        case "ProjectsHistory":
                            result = string.Format("Migration.fn_GetNewProjectHistoryID({0}, 0, 0)", col.Name);
                            break;
                        case "Projects":
                            result = string.Format("Migration.fn_GetNewProjectID({0}, 0, 0)", col.Name);
                            break;
                        case "Roles":
                            result = string.Format("Migration.fn_GetNewRoleID({0}, 0, 0)", col.Name);
                            break;
                        case "Suppliers":
                            result = string.Format("Migration.fn_GetNewSupplierID({0}, 0, 0)", col.Name);
                            break;
                        case "TimeSheet":
                            result = string.Format("Migration.fn_GetNewTimeSheetID({0}, 0, 0)", col.Name);
                            break;
                        case "Transactions":
                            result = string.Format("Migration.fn_GetNewTransactionID({0}, 0, 0)", col.Name);
                            break;
                        case "Visits":
                            result = string.Format("Migration.fn_GetNewVisitID({0}, 0, 0)", col.Name);
                            break;
                        case "ProjectsLog":
                            result = string.Format("Migration.fn_GetProjectLogID({0}, 0, 0)", col.Name);
                            break;
                    }
                }
            }
            return result;
        }

        private void backgroundWorker2_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            splashScreenManager1.CloseWaitForm();
            richTextBox.Text = strGen.ToString();
        }
    }
}