using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Messages = TheClinicApp.UIClasses.Messages;


namespace TheClinicApp
{
    public partial class Default : System.Web.UI.Page
    {
        //ClinicDAL.User userObj = new ClinicDAL.User();
        protected void Page_Load(object sender, EventArgs e)
        {

       
            if (IsPostBack)
            {
                if (username.Value != "" && password.Value != "")
                {

                    
                        UIClasses.Const constants = new UIClasses.Const();

                        //if (username.Value != password.Value)
                        //{
                        //    password.Value = Encrypt(password.Value);
                        //}

                        //ClinicDAL.UserAuthendication UA = new ClinicDAL.UserAuthendication(username.Value, password.Value);

                        ClinicDAL.UserAuthendication UA = new ClinicDAL.UserAuthendication(username.Value, password.Value);

                        if (UA.ValidUser)
                        {
                            if (Session[constants.LoginSession] != null)
                            {
                                Session.Remove(constants.LoginSession);
                            }

                            Session.Add(constants.LoginSession, UA);
                            Response.Redirect(constants.HomePage);

                        }



                    }
                    else
                    {

                        lblmsg.Text = Messages.LoginFailed;
                    }

                
            }
        }

       
        
    }
}