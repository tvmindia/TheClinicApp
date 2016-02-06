using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Messages = TheClinicApp.UIClasses.Messages;

namespace TheClinicApp
{
    public partial class Default : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) {
                ClinicDAL.Security secObj = new ClinicDAL.Security();
                if (username.Value.ToString().Trim() !="" && secObj.Login(username.Value, password.Value))
                {
                    Response.Redirect("home.aspx");

                }
                else {

                    lblmsg.Text = Messages.LoginFailed;
                }
            
            }
        }

       
    }
}