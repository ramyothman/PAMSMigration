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
        Common.Entities.MetaDataSchema.Project project = new Common.Entities.MetaDataSchema.Project();
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            splashScreenManager1.ShowWaitForm();
            backgroundWorker1.RunWorkerAsync();
            
            
        }
        StringBuilder strGen = new StringBuilder();
        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            project.ServerName = @"RBM-Shotec";
            project.UserName = "sa";
            project.Password = "welcome";
            project.IsWindowsAuthentication = false;
            project.Name = "Migration Script";
            project.CreateDate = System.DateTime.Now;
            DataType.LoadHashTables(Application.ExecutablePath.Substring(0, Application.ExecutablePath.LastIndexOf("\\")) + "\\" + "DataTypesMapper.xml");
            project.DatabaseType = DatabaseTypes.SQLServer;
            project.CheckHasData = true;
            project.Connect();
            project.ExtractorManager.DatabaseReaders.GetDatabases(project);
            Database database = project.GetDatabaseByName("PAMSDB");
            #region Extrating Table Information
            if (database.Tables != null && database.Tables.Count == 0)
            {
                project.ExtractorManager.DatabaseReaders.GetTables(database);

                foreach (Common.Entities.MetaDataSchema.Table tbl in database.Tables)
                {
                    project.ExtractorManager.DatabaseReaders.GetColumns(tbl);
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
            schemaDS.TableSchema.AddTableSchemaRow(t.Id, t.Name, t.Schema, t.Schema + "." + t.Name);
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
    }
}