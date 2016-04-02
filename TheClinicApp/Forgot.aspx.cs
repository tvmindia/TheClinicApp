﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp
{
    public partial class Forgot : System.Web.UI.Page
    {
        ClinicDAL.User userObj = new ClinicDAL.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        

        protected void btnVerify_ServerClick(object sender, EventArgs e)
        {
                userObj.Email = txtEmail.Value;
                DataTable dtCode = userObj.GetUserVerificationCodeByEmailID();
                int verificationCode = Convert.ToInt32(dtCode.Rows[0]["VerificationCode"]);
                DateTime vcCreatedTime = Convert.ToDateTime(dtCode.Rows[0]["VerificatinCreatedTime"]);
                string UserID=dtCode.Rows[0]["UserID"].ToString();
               ;
                DateTime CurrentTime = DateTime.Now;
                if ((CurrentTime - vcCreatedTime) < TimeSpan.FromDays(1))
                {
                    if (verificationCode.ToString() == txtVerificationCode.Value)
                    {
                        Response.Redirect("Reset.aspx?UserID=" + UserID);
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

        protected void btnVerificationCode_ServerClick1(object sender, EventArgs e)
        {
            //----------*Add verification code*------------//
            Random random = new Random();
            int verificationCode = random.Next(1000, 10000);

            userObj.verificationCode = verificationCode.ToString();
            userObj.Email = txtEmail.Value;
            userObj.AddVerificationCode();




            //----------*Get verification code*------------//
            userObj.Email = txtEmail.Value;
            DataTable dtCode = userObj.GetUserVerificationCodeByEmailID();
            verificationCode = Convert.ToInt32(dtCode.Rows[0]["VerificationCode"]);
            DateTime vcCreatedTime = Convert.ToDateTime(dtCode.Rows[0]["VerificatinCreatedTime"]);
            DateTime CurrentTime = DateTime.Now;
            MailMessage Msg = new MailMessage();


            // Sender e-mail address.
            Msg.From = new MailAddress("info.thrithvam@gmail.com");


            // Recipient e-mail address.
            Msg.To.Add(txtEmail.Value);
            string body = verificationCode.ToString();
            Msg.Subject = "Verification Code  ";
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
        }
        }
}
