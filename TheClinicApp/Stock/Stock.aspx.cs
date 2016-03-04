using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TheClinicApp.Stock
{
    public partial class Stock : System.Web.UI.Page
    {

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();

       
        Receipt rpt = new Receipt();
        ReceiptDetails rptdt = new ReceiptDetails();
      
       
        protected void Page_Load(object sender, EventArgs e)
        {


            //gridview binding for listing the Out of Stock Medicines 
            DataSet gds = stok.OutofStockMedicines();
            GridViewOutofStock.EmptyDataText = "No Records Found";
            GridViewOutofStock.DataSource = gds;
            GridViewOutofStock.DataBind();



            //Binding  Category ID and Name

            DataSet ds = stok.ViewCategory();

            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataBind();
                




        }
 
        protected void btnStock_Click(object sender, EventArgs e)
        {
            //Receipt Header
            rpt.RefNo1 = txtReference1.Text;
            rpt.RefNo2 = txtReference2.Text;
            rpt.Date = Convert.ToDateTime(txtDate.Text);
            rpt.ClinicID = HiddenFieldClinicID.Value;
            rpt.CreatedBy = "user";
            
            //Receipt Details

            rptdt.QTY = Convert.ToInt32(txtQty.Text);
            rptdt.Unit = Convert.ToInt32(txtUnit.Text);
            rptdt.MedicineID = HiddenFieldMedicineID.Value;
            rptdt.ClinicID = HiddenFieldClinicID.Value;
            rptdt.CreatedBy = "user";

            //Calling insert functions
            rpt.InsertReceiptHeaderDetails();
            rptdt.InsertReceiptDetails();


        }
    }
}