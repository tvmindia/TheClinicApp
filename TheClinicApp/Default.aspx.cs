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
                
                if (username.Value.ToString().Trim() !=""  )
                {
                    UIClasses.Const constants = new UIClasses.Const();
                    ClinicDAL.UserAuthendication UA = new ClinicDAL.UserAuthendication(username.Value, password.Value);

                    if (UA.ValidUser)
                    {
                        if (Session[constants.LoginSession] != null)
                        {
                            Session.Remove(constants.LoginSession);
                        }

                        Session.Add(constants.LoginSession, UA);
                        Response.Redirect("home.aspx");
                        
                    }

                  

                }
                else {

                    lblmsg.Text = Messages.LoginFailed;
                }
            
            }
        }

       
    }
}