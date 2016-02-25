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



        protected void Page_Load(object sender, EventArgs e)
        {
              


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {

        }
    }
}