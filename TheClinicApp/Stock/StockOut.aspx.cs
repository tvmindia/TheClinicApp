﻿
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
        ClinicDAL.UserAuthendication UA;
        UIClasses.Const Const = new UIClasses.Const();

        //#region Methods

        //#region Bind Dummy Row


        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
          
            dummy.Columns.Add("IssueNO");
            dummy.Columns.Add("IssuedTo");
            dummy.Columns.Add("IssueID");
           
            //dummy.Columns.Add("Date");
            dummy.Rows.Add();

            gvIssueHD.DataSource = dummy;
            //gvIssueHD.Columns[2].Visible = false;
            gvIssueHD.DataBind();

            

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
        public static string GetIssueHD(string searchTerm, int pageIndex)
        {
            ClinicDAL.UserAuthendication UA;
            UIClasses.Const Const = new UIClasses.Const();

            UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

            string query = "ViewAndFilterIssueHD";
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
                        sda.Fill(ds, "IssueHD");

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

        protected void btnNewIssue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Stock/NewIssue.aspx");
        }

        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {

        }


        //protected void Issue_ServerClick(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "openModal();", true);
        //}

    }
    
}