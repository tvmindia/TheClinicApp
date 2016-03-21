
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-18-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion  Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class StockOut : System.Web.UI.Page
    {
        private static int PageSize = 5;


        //#region Methods

        //#region Bind Dummy Row

        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("RefNo1");
            dummy.Columns.Add("RefNo2");
            //dummy.Columns.Add("Date");
            dummy.Rows.Add();
            gvReceiptHD.DataSource = dummy;
            gvReceiptHD.DataBind();
        }

        //#endregion Bind Dummy Row


        //#endregion Methods

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDummyRow();

            }
        }


        [WebMethod]
        public static string GetReceiptHD(string searchTerm, int pageIndex)
        {
            ClinicDAL.UserAuthendication UA;
            UIClasses.Const Const = new UIClasses.Const();

            UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

            string query = "ViewAndFilterReceiptHD";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = UA.ClinicID;

            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int).Direction = ParameterDirection.Output;

            var xml = GetData(cmd, pageIndex).GetXml();
            return xml;
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
                        sda.Fill(ds, "ReceiptHD");

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


        //protected void Issue_ServerClick(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "openModal();", true);
        //}

    }
    
}