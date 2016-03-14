#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-9-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        #region Global Variables

        ClinicDAL.User userObj = new ClinicDAL.User();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods

        #region Encrypt Password
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

        #endregion Encrypt Password

        #endregion Methods

        #region Events

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #endregion Page Load

        #region Reset Button Click
        protected void btnReset_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            userObj.passWord = Encrypt(txtConfirmPassword.Text);
            userObj.loginName = UA.userName;

            if(txtNewPassowrd.Text == txtConfirmPassword.Text)
            {
                userObj.ResetPassword();
            }

            else
            {
                lblError.Text = " Password does not match the confirm password";
            }

        }

        #endregion Reset Button Click

        #endregion Events
    }
}