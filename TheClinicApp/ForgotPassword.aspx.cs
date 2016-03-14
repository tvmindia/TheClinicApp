#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-9-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Threading;
using System.Web.Configuration;

using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        #region Global Variables

        ClinicDAL.User userObj = new ClinicDAL.User();

        #endregion Global Variables

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
//----------*Add verification code*------------//

            Random random = new Random();
            int verificationCode = random.Next(1000, 10000);

            userObj.verificationCode = verificationCode.ToString();
            userObj.Email = txtEmail.Text;
            userObj.AddVerificationCode();

        }

        #endregion Page Load

        #region Verify Button Click
        protected void btnVerify_Click(object sender, EventArgs e)
        {
 //----------*Get verification code*------------//
            userObj.Email = txtEmail.Text;
            DataTable dtCode = userObj.GetUserVerificationCodeByEmailID();
            int verificationCode = Convert.ToInt32(dtCode.Rows[0]["VerificationCode"]);
            DateTime vcCreatedTime = Convert.ToDateTime(dtCode.Rows[0]["VerificatinCreatedTime"]);
            DateTime CurrentTime = DateTime.Now;

            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress("info.thrithvam@gmail.com");
            // Recipient e-mail address.
            Msg.To.Add(txtEmail.Text);

            string body = verificationCode.ToString();

            Msg.Subject = "Verification Code  " ;

            Msg.Body = body;

            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("info.thrithvam", "thrithvam@2015");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            Msg = null;


           if(  (CurrentTime - vcCreatedTime) < TimeSpan.FromDays(1)     )
           {
               if (verificationCode.ToString() == txtVerificationCode.Text)
               {
                   Response.Redirect("ResetPassword.aspx");
               }
               else
               {
                   lblError.Text = "Verification Code is not correct"; 
               }

           }
           else
           {
               lblError.Text = "Time expired";
           }

        }

        #endregion  Verify Button Click
    }
}