using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp.UserControl
{
    public partial class ProfilePicUpload : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
            //Button myButton = this.FormView1.FindControl("myButtonId");

            //myButton.Atttibutes.Add("onClientClick","myJavascriptFunction();");
            HttpPostedFile file = Request.Files["fileupload"];

            //check file was submitted
            if (file != null && file.ContentLength > 0)
            {
                string fname = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath(Path.Combine("~/images/", fname)));
            }
        }
        }
    }
}