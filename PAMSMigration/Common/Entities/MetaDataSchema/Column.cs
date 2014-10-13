using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Entities.MetaDataSchema
{
    public class Column : Entities.Entity
    {
        public Column() { }
        public Column(string name)
        {
            this.Name = name;
        }
        public Column(string name,string type)
        {
            this.Name = name;
            this.ColumnDataType = new DataType() { SQLType = type};
        }
        public Column(string name, string type,Table parentTable)
        {
            this.Name = name;
            this.ColumnDataType = new DataType() { SQLType = type };
            this.Parent = parentTable;
        }
        #region Properties
        

        private string _columnID;
        /// <summary>
        /// Column Id
        /// </summary>
        public string ColumnId
        {
            set { _columnID = value; }
            get { return _columnID; }
        }

        //private Table _table;
        public Table ParentTable
        {
            set { _Parent = value; }
            get { return _Parent as Table; }
        }

        //private View _view;
        public View ParentView
        {
            set { _Parent = value; }
            get { return _Parent as View; }
        }
        //private Function _parentFunction;
        public Function ParentFunction
        {
            set { _Parent = value; }
            get { return _Parent as Function; }
        }
        public StoredProcedure ParentStoredProcedure
        {
            set { _Parent = value; }
            get { return _Parent as StoredProcedure; }
        }
        private DataType _dataType = new DataType();
        public DataType ColumnDataType
        {
            set { _dataType = value; }
            get { return _dataType; }
        }

        private ColumnDirection _columnDirection = ColumnDirection.Input;
        public ColumnDirection ColumnDirection
        {
            set { _columnDirection = value; }
            get { return _columnDirection; }
        }

        private int _length;
        public int Length
        {
            set { _length = value; }
            get { return _length; }
        }

        private int _precision;
        public int Precision
        {
            set { _precision = value; }
            get { return _precision; }
        }
        private int _scale;
        public int Scale
        {
            set { _scale = value; }
            get { return _scale; }
        }
        private int _ordinalPosition;
        public int OrdinalPosition
        {
            set { _ordinalPosition = value; }
            get { return _ordinalPosition; }
        }

        private ColumnType _indexType = ColumnType.Normal;
        public ColumnType IndexType
        {
            set { _indexType = value; }
            get { return _indexType; }
        }

        private bool _allowNull = true;
        public bool AllowNull
        {
            set { _allowNull = value; }
            get { return _allowNull; }
        }

        private bool _isIdentity = false;
        public bool IsIdentity
        {
            set { _isIdentity = value; }
            get { return _isIdentity; }
        }

        private bool _isComputed = false;
        public bool IsComputed
        {
            set { _isComputed = value; }
            get { return _isComputed; }
        }

        /// <summary>
        /// Check whether a column is Primary Key or not
        /// </summary>
        public bool IsPrimary
        {
            get
            {
                if (_indexType == ColumnType.PrimaryKey || _indexType == ColumnType.PrimaryForeignKey)
                    return true;
                return false;
            }
            set
            {
                if (value)
                {
                    if (ParentTable != null)
                        ParentTable.PrimaryColumnCount++;
                    if (_indexType == ColumnType.ForiegnKey)
                        _indexType = ColumnType.PrimaryForeignKey;
                    else if (_indexType == ColumnType.Normal)
                        _indexType = ColumnType.PrimaryKey;
                }
                else
                {
                    if (_indexType == ColumnType.PrimaryKey)
                        _indexType = ColumnType.Normal;
                    else if (_indexType == ColumnType.PrimaryForeignKey)
                    {
                        _indexType = ColumnType.ForiegnKey;
                        
                    }
                }
            }
        }

        public bool IsForeign
        {
            get
            {
                if (_indexType == ColumnType.ForiegnKey || _indexType == ColumnType.PrimaryForeignKey)
                    return true;
                return false;
            }
            set
            {
                if (value)
                {
                    if (ParentTable != null)
                        ParentTable.ForeignColumnCount++;
                    if (_indexType == ColumnType.PrimaryKey)
                        _indexType = ColumnType.PrimaryForeignKey;
                    else if (_indexType == ColumnType.Normal)
                        _indexType = ColumnType.ForiegnKey;
                }
                else
                {
                    if (_indexType == ColumnType.ForiegnKey)
                        _indexType = ColumnType.Normal;
                    else if (_indexType == ColumnType.PrimaryForeignKey)
                        _indexType = ColumnType.PrimaryKey;
                }
            }
        }
        #endregion

        #region ICloneable Members

        public override object Clone()
        {
            //if (!this.EntitySelected)
            //    return null;
            Column col = new Column();
            col.Name = this.Name;
            col.ColumnDataType = this.ColumnDataType;
            col.AllowNull = this.AllowNull;
            col.ColumnDirection = this.ColumnDirection;
            col.ColumnId = this.ColumnId;
            col.IndexType = this.IndexType;
            col.IsComputed = this.IsComputed;
            col.IsForeign = this.IsForeign;
            col.IsIdentity = this.IsIdentity;
            col.IsPrimary = this.IsPrimary;
            col.Length = this.Length;
            col.OrdinalPosition = this.OrdinalPosition;
            col.Precision = this.Precision;
            col.Scale = this.Scale;
            return col;
            
        }

        #endregion

        public static Column GetByName(List<Column> columns, string searchName)
        {
            foreach (Column col in columns)
            {
                if (col.Name.ToLower() == searchName.ToLower())
                    return col;
            }
            return null;
        }

        public static Column GetByPrimaryKey(List<Column> columns)
        {
            foreach (Column col in columns)
            {
                if (col.IsPrimary)
                    return col;
            }
            return null;
        }
    }
}
