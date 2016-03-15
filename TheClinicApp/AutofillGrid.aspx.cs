using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TheClinicApp.ClinicDAL;

using System.Web.Services;
using System.Configuration;



namespace TheClinicApp
{
    public partial class AutofillGrid : System.Web.UI.Page
    {
        private static int PageSize = 2;

        #region Global Variables

        Stocks stockObj = new Stocks();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods

        #region Bind Gridview

        //public void BindGridview()
        //{
        //    DataSet dsMedicines = new DataSet();
        //    stockObj.ClinicID = "2C7A7172-6EA9-4640-B7D2-0C329336F289";
        //    dsMedicines = stockObj.SearchMedicineStock(string.Empty);
        //    dtgMedicines.DataSource = dsMedicines;
        //    dtgMedicines.DataBind();
        //}

        #endregion Bind Gridview


        #endregion Methods

        private void BindData()
        {
            DataSet dsMedicines = new DataSet();
            stockObj.ClinicID = "2C7A7172-6EA9-4640-B7D2-0C329336F289";
            dsMedicines = stockObj.SearchMedicineStock(string.Empty); 
            DataTable dt = dsMedicines.Tables[0];

            //gvDetails.DataSource = dt;
            //gvDetails.DataBind();

        }

      
        protected void Page_Load(object sender, EventArgs e)
        {
            //txt.Attributes.Add("onkeyup", "javascript:setTimeout('__doPostBack(\'txt\',\'\')', 0)");
            //BindGridview();
      
            if (!IsPostBack)
            {
                BindDummyRow();
            }

        }

      
        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("MedicineName");
            dummy.Columns.Add("CategoryName");
            dummy.Columns.Add("MedicineCode");
            dummy.Rows.Add();
            gvMedicines.DataSource = dummy;
            gvMedicines.DataBind();
        }


        [WebMethod]
        public static string GetMedicines(string searchTerm, int pageIndex)
        {

            string query = "[ViewAndFilterMedicine]";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

            var w = GetData(cmd, pageIndex).GetXml();
            return w;
        }

        private static DataSet GetData(SqlCommand cmd, int pageIndex)
        {
           
            string strConnString = ConfigurationManager.ConnectionStrings["ClinicAppConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds, "Medicines");
                        DataTable dt = new DataTable("Pager");
                        dt.Columns.Add("PageIndex");
                        dt.Columns.Add("PageSize");
                        dt.Columns.Add("RecordCount");
                        dt.Rows.Add();
                        dt.Rows[0]["PageIndex"] = pageIndex;
                        dt.Rows[0]["PageSize"] = PageSize;
                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        ds.Tables.Add(dt);
                        return ds;
                    }
                }
            }
        }

       







    }
}