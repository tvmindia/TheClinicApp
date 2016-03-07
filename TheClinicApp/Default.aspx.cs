using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) {
                
                if (username.Value.ToString().Trim() !=""  )
                {
                    UIClasses.Const constants = new UIClasses.Const();

                    if (username.Value != password.Value)
                    {
                        password.Value = Encrypt(password.Value);
                    }

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
                else {

                    lblmsg.Text = Messages.LoginFailed;
                }
            
            }
        }

       
    }
}