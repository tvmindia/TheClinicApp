using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace TheClinicApp.Stock
{
    public partial class StockIN : System.Web.UI.Page
    {


        #region objects

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();
        public string listFilter = null;

        Receipt rpt = new Receipt();



        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion objects

        protected void Page_Load(object sender, EventArgs e)
        {
           
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            rpt.ClinicID = UA.ClinicID.ToString();

            GridViewStockIN();
        }



        public void GridViewStockIN()
        {

            //gridview binding for listing the Out of Stock Medicines
            string str="";
            DataSet gds = rpt.ViewReceiptHeader(str); 
            GridViewStockin.EmptyDataText = "No Records Found";
            GridViewStockin.DataSource = gds;
            GridViewStockin.DataBind();
            GridViewStockin.Columns[0].Visible = false;


        }
    }
}