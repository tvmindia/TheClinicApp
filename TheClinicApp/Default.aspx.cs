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

                    if (username.Value.ToString().Trim() != "")
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

        //protected void btnVerificationCode_ServerClick(object sender, EventArgs e)
        //{
        //    //----------*Add verification code*------------//
        //    Random random = new Random();
        //    int verificationCode = random.Next(1000, 10000);

        //    userObj.verificationCode = verificationCode.ToString();
        //    userObj.Email = txtEmail.Value;
        //    userObj.AddVerificationCode();




        //    //----------*Get verification code*------------//
        //    userObj.Email = txtEmail.Value;
        //    DataTable dtCode = userObj.GetUserVerificationCodeByEmailID();
        //    verificationCode = Convert.ToInt32(dtCode.Rows[0]["VerificationCode"]);
        //    DateTime vcCreatedTime = Convert.ToDateTime(dtCode.Rows[0]["VerificatinCreatedTime"]);
        //    DateTime CurrentTime = DateTime.Now;
        //    MailMessage Msg = new MailMessage();


        //    // Sender e-mail address.
        //    Msg.From = new MailAddress("info.thrithvam@gmail.com");


        //    // Recipient e-mail address.
        //    Msg.To.Add(txtEmail.Value);
        //    string body = verificationCode.ToString();
        //    Msg.Subject = "Verification Code  ";
        //    Msg.Body = body;
        //    Msg.IsBodyHtml = true;



        //    // your remote SMTP server IP.
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.Credentials = new System.Net.NetworkCredential("info.thrithvam", "thrithvam@2015");
        //    smtp.EnableSsl = true;
        //    smtp.Send(Msg);
        //    Msg = null;
        //}

        //protected void txtVerify_ServerClick(object sender, EventArgs e)
        //{
        //    userObj.Email = txtEmail.Value;
        //    DataTable dtCode = userObj.GetUserVerificationCodeByEmailID();
        //    int verificationCode = Convert.ToInt32(dtCode.Rows[0]["VerificationCode"]);
        //    DateTime vcCreatedTime = Convert.ToDateTime(dtCode.Rows[0]["VerificatinCreatedTime"]);
        //    DateTime CurrentTime = DateTime.Now;
        //    if ((CurrentTime - vcCreatedTime) < TimeSpan.FromDays(1))
        //    {
        //        if (verificationCode.ToString() == txtVerificationCode.Value)
        //        {
        //            Response.Redirect("ResetPassword.aspx");
        //        }
        //        else
        //        {
        //            lblError.Text = "Verification Code is not correct";
        //        }

        //    }
        //    else
        //    {
        //        lblError.Text = "Time expired";
        //    }
        //}
        
    }
}