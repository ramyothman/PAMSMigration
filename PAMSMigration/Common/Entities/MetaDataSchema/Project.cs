using System;
using System.Collections.Generic;
using System.Text;
using Common.MetaDataExtraction.DatabaseExtractors;
//using Common.MetaDataExtraction.DatabaseExtractors.Resources;


namespace Common.Entities.MetaDataSchema
{
    public class Project : Entities.Entity
    {
        #region Properties

        private SchemaDS _SchemaDataset;
        public SchemaDS SchemaDataset
        {
            get
            {
                if (_SchemaDataset == null)
                {
                    _SchemaDataset = new SchemaDS();
                }
                return _SchemaDataset;
            }
        }

        private DateTime _createDate = DateTime.MinValue;
        public DateTime CreateDate
        {
            set { _createDate = value; }
            get { return _createDate; }
        }

        private string _userName;
        public string UserName
        {
            set { _userName = value; }
            get { return _userName; }
        }

        private string _password;
        public string Password
        {
            set { _password = value; }
            get { return _password; }
        }

        private string _serverName;
        public string ServerName
        {
            set { _serverName = value; }
            get { return _serverName; }
        }

        private List<Database> _databases = new List<Database>();
        public List<Database> Databases
        {
            set { _databases = value; }
            get { return _databases; }
        }

        private bool _isWindowsAuthentication = true;
        public bool IsWindowsAuthentication
        {
            set { _isWindowsAuthentication = value; }
            get { return _isWindowsAuthentication; }
        }

        private DatabaseTypes _databaseType;
        public DatabaseTypes DatabaseType
        {
            set { _databaseType = value; }
            get { return _databaseType; }
        }

        private bool _checkHasData = false;
        public bool CheckHasData
        {
            set { _checkHasData = value; }
            get { return _checkHasData; }
        }
        #endregion

        private Common.MetaDataExtraction.ExtractorManager _extractorManager = new Common.MetaDataExtraction.ExtractorManager();
        public Common.MetaDataExtraction.ExtractorManager ExtractorManager
        {
            get { return _extractorManager; }
        }

        public void Connect()
        {
            ExtractorManager.SetConnectionString(this, "");
            ExtractorManager.SetDatabaseReader(this);
            ExtractorManager.Connect(DatabaseType, UserName, Password, "", ServerName, IsWindowsAuthentication);
        }

        public Database GetDatabaseByName(string dbname)
        {
            Database result = null;
            foreach (Database db in Databases)
            {
                if (db.Name == dbname)
                {
                    result = db;
                    break;
                }
            }
            return result;
        }

        #region General Methods
        public override void UnSelect()
        {
            
            foreach (Database db in Databases)
            {
                db.UnSelect();
            }
        }
        #endregion
    }
}
