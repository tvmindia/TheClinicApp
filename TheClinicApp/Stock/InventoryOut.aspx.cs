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




        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                DataSet ds = stok.ViewMedicines();

                ddlMedicine.DataSource = ds.Tables[0];
                ddlMedicine.DataValueField = "MedicineID";
                ddlMedicine.DataTextField = "Name";
                ddlMedicine.DataBind();

            }
        }

 

        protected void btnIssue_Click(object sender, EventArgs e)
        {


        }
    }
}