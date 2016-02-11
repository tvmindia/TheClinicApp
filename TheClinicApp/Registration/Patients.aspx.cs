using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp.Registration
{
    public partial class Patients : System.Web.UI.Page
    {
        ErrorHandling eObj = new ErrorHandling();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var page = HttpContext.Current.CurrentHandler as Page;
           
            eObj.ErrorMessage(page);
            eObj.InsertionSuccessMassage(page);
            //eObj.WarningMessage(page);

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string value = Request.Form["txtSearch"];
        }
        
    }
}