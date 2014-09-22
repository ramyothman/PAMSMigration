using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Entities.MetaDataSchema
{
    public class Table : Entities.Entity
    {
        public Table() { }
        public Table(string name)
        {
            this.Name = name;
        }
        public Table(string name,string schema)
        {
            this.Name = name;
            this.Schema = schema;
        }

        public Table(string name,string schema,Database parentDatabase)
        {
            this.Name = name;
            this.Schema = schema;
            this.ParentDatabase = parentDatabase;
        }

        #region Properties

        //private Database _database;
        public Database ParentDatabase
        {
            set { _Parent = value; }
            get { return _Parent as Database; }
        }
        private string _schema;
        public string Schema
        {
            set { _schema = value; }
            get { return _schema; }
        }

        private int _primaryColumnCount = 0;
        public int PrimaryColumnCount
        {
            set { _primaryColumnCount = value; }
            get { return _primaryColumnCount; }
        }

        private int _foreignColumnCount = 0;
        public int ForeignColumnCount
        {
            set { _foreignColumnCount = value; }
            get { return _foreignColumnCount; }
        }

        private string _tableId;
        public string TableID
        {
            set { _tableId = value; }
            get { return _tableId; }
        }

        private bool _hasData = false;
        public bool HasData
        {
            set { _hasData = value; }
            get { return _hasData; }
        }

        private int _dataCount = 0;
        public int DataCount
        {
            set { _dataCount = value; }
            get { return _dataCount; }

        }
        private List<Column> _columns = new List<Column>();
        public List<Column> Columns
        {
            set { _columns = value; }
            get { return _columns; }
        }

        private List<RelationShip> _ParentRelationShips = new List<RelationShip>();
        public List<RelationShip> ParentRelationShips
        {
            set { _ParentRelationShips = value; }
            get 
            {
                if (_ParentRelationShips.Count == 0)
                {
                    ParentDatabase.ParentProject.ExtractorManager.DatabaseReaders.GetParentRelations(this);
                }
                return _ParentRelationShips; 
            }
        }

        private List<RelationShip> _ChildRelationShips = new List<RelationShip>();
        public List<RelationShip> ChildRelationShips
        {
            set { _ChildRelationShips = value; }
            get 
            {
                if (_ChildRelationShips.Count == 0)
                {
                    ParentDatabase.ParentProject.ExtractorManager.DatabaseReaders.GetChildRelations(this);
                }
                return _ChildRelationShips; 
            }
        }

        public static Table GetByName(List<Table> tables, string searchName)
        {
            foreach (Table row in tables)
            {
                if (row.Name == searchName)
                    return row;
            }
            return null;
        }

        public static Table GetByNameandSchema(List<Table> tables, string searchName, string searchSchema)
        {
            foreach (Table row in tables)
            {
                if (row.Name == searchName && row.Schema == searchSchema)
                    return row;
            }
            return null;
        }

        public bool HasPrimaryKey
        {
            get
            {
                foreach (Column col in Columns)
                {
                    if (col.IsPrimary)
                        return true;
                }
                return false;
            }
        }

        public bool HasIdentityColumn
        {
            get
            {
                foreach(Column col in Columns)
                {
                    if (col.IsIdentity)
                        return true;
                }
                return false;
            }
        }

        public override void UnSelect()
        {
            
            foreach (Column cols in Columns)
            {
                cols.UnSelect();
            }

        }
        #endregion

        #region ICloneable Members

        public override object Clone()
        {
            if (!this.EntitySelected)
                return null;
            Table tbl = new Table();
            tbl.Name = this.Name;
            tbl.EntitySelected = this.EntitySelected;
            tbl.Id = this.Id;
            tbl.PrimaryColumnCount = this.PrimaryColumnCount;
            tbl.Schema = this.Schema;
            tbl.TableID = this.TableID;
            foreach (Column col in this.Columns)
            {
                Column newCol = col.Clone() as Column;
                if (newCol != null)
                {
                    newCol.Parent = tbl;
                    tbl.Columns.Add(newCol);
                }
            }
            return tbl;

        }

        #endregion
    }
}
