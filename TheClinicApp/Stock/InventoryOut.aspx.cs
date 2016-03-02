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
    public partial class InventoryOut : System.Web.UI.Page
    {


        ErrorHandling eObj = new ErrorHandling();
        IssueHeaderDetails ihd = new IssueHeaderDetails();
        IssueDetails idt = new IssueDetails();
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();




        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                //Binding  Medicine ID and Name
                DataSet ds = stok.ViewMedicines();

                ddlMedicine.DataSource = ds.Tables[0];
                ddlMedicine.DataValueField = "MedicineID";
                ddlMedicine.DataTextField = "Name";
                ddlMedicine.DataBind();



                //Binding  Receipt ID
                DataSet ds1 = rpt.ViewReceiptHeaderDetails();
                ddlReceiptID.DataSource = ds1.Tables[0];
                ddlReceiptID.DataValueField = "ReceiptID";
                ddlReceiptID.DataTextField = "ReceiptID";
                ddlReceiptID.DataBind();




            }
        }



        protected void btnIssue_Click(object sender, EventArgs e)
        {

            //Inserting Issue Header


            ihd.ClinicID = HiddenFieldClinicID.Value;
            ihd.IssuedTo = txtIussedTo.Text;
            ihd.Date = Convert.ToDateTime(txtDate.Text);
            ihd.PrescID = txtPrescID.Text;
            ihd.CreatedBy = "User";
            ihd.CreatedDate = DateTime.Now;
            ihd.UpdatedBy = "User";
            ihd.UpdatedDate = DateTime.Now;

            //Inserting Issue Details

            idt.ClinicID = HiddenFieldClinicID.Value;
            idt.MedicineID = ddlMedicine.SelectedValue;

            idt.Qty = Convert.ToInt32(txtQty.Text);

            idt.CreatedBy = "User";
            idt.CreatedDate = DateTime.Now;
            idt.UpdatedBy = "User";
            idt.UpdatedDate = DateTime.Now;



            //  Calling  Insert Functions

            // ihd.InsertIssueHeaderDetails();
            //idt.InsertIssueDetails();
        }




    }
}