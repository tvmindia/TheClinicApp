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
    public partial class ExistingStockIn : System.Web.UI.Page
    {

        
        #region objects

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();
        public string listFilter = null;

        Receipt rpt = new Receipt();


        //passing guid value: ReceiptID
        Guid receipt;

        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion objects

        protected void Page_Load(object sender, EventArgs e)
        {

            receipt = Guid.Parse(Request.QueryString["ReceiptID"]);
           

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            rpt.ClinicID = UA.ClinicID.ToString();
          
            GridViewReceiptDetails();

            //assign value for receipt


        }

        public void GridViewReceiptDetails()
        {



            DataSet gds = rpt.GetReceiptDetailsByReceiptID(receipt);
            GridViewReceiptDT.EmptyDataText = "No Records Found";
            GridViewReceiptDT.DataSource = gds;
            GridViewReceiptDT.DataBind();




            lblBillNo.Text = gds.Tables[0].Rows[0][0].ToString();

            lblRefNo2.Text = gds.Tables[0].Rows[0][1].ToString();
            lblDate.Text = gds.Tables[0].Rows[0][2].ToString();



        }



    }
}