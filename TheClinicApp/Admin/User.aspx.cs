
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Feb-26-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Web.Services;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.IO;

#endregion Included Namespaces

namespace TheClinicApp.Admin
{
    public partial class User : System.Web.UI.Page
    {
        #region Global Variables

        ClinicDAL.CryptographyFunctions CryptObj = new CryptographyFunctions();
        ClinicDAL.User userObj = new ClinicDAL.User();
        ClinicDAL.Master mstrObj = new ClinicDAL.Master();
        ClinicDAL.RoleAssign roleObj = new RoleAssign();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        public Guid DoctorRoleID = new Guid("69668C0B-1231-4229-A7FA-5C0CD3744435");

        #endregion Global Variables

        #region Methods

//---* To USER *--//

        #region Add User To User Table
        public void AddUserToUserTable()
         {
             UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

             userObj.firstName = txtFirstName.Text;
             userObj.loginName = txtLoginName.Text;
             userObj.lastName = txtLastName.Text;

             if (rdoActiveYes.Checked == true)
             {
                 userObj.isActive = true;
             }
             else
             {
                 if (rdoActiveNo.Checked == true)
                 {
                     userObj.isActive = false;
                 }
             }
             userObj.ClinicID = UA.ClinicID;
             //userObj.ClinicID = new Guid("2c7a7172-6ea9-4640-b7d2-0c329336f289");
             userObj.createdBy = UA.userName;
             userObj.updatedBy = UA.userName;
             userObj.passWord = CryptObj.Encrypt(txtPassword.Text);

             if (btnSave.Text == "Save")
             {
                 userObj.AddUser();
                 BindGriewWithDetailsOfAllUsers();
             }
             else
             {
                 if (btnSave.Text == "Update")
                 {
                     userObj.UserID = Guid.Parse(hdnUserID.Value);
                     userObj.UpdateuserByUserID();
                     BindGriewWithDetailsOfAllUsers();

                 }

             }
         }

        #endregion Add User To User Table   

 //---* To DOCTOR *--//

        #region Add User To Doctor Table
        public void AddUserToDoctorTable()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            mstrObj.loginName = txtLoginName.Text;

            mstrObj.ClinicID = UA.ClinicID;
            mstrObj.DoctorName = txtFirstName.Text;
            mstrObj.DoctorPhone = txtPhoneNumber.Text;
            mstrObj.DoctorEmail = txtEmail.Text;
            mstrObj.createdBy = UA.userName;
            mstrObj.updatedBy = UA.userName;

            mstrObj.InsertDoctors();
        }

        #endregion Add User To Doctor Table


        //---* To USER-In-ROLES *--//

        #region

        public void AddUserRole()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            roleObj.ClinicID = UA.ClinicID;
            roleObj.RoleID = DoctorRoleID;
            roleObj.CreatedBy = UA.userName;
           

          DataTable  dtUsers = roleObj.GetDetailsOfAllUsers();
        
            foreach(DataRow dr in dtUsers.Rows)
            {
                if(dr["LoginName"].ToString() == txtLoginName.Text)
                {
                    roleObj.UserID = Guid.Parse(dr["UserID"].ToString());
                }
            }

            roleObj.AssignRole();
          //roleObj.UserID = Guid.Parse(foundRow["UserID"].ToString());


        }

        #endregion 

        #region Bind Gridview
        public void BindGriewWithDetailsOfAllUsers()
        {
            DataTable dtUsers = userObj.GetDetailsOfAllUsers();
            dtgViewAllUsers.DataSource = dtUsers;
            dtgViewAllUsers.DataBind();
        }

        #endregion Bind Gridview

        #region ValidateLoginName
       [WebMethod]
        public static bool ValidateLoginName(string LogName)
        {
            string loginName = LogName;

            ClinicDAL.User userObj = new ClinicDAL.User();
            if (userObj.ValidateUsername(loginName))
            {
                return true;
            }
            return false;
        }

        #endregion ValidateLoginName

       // #region Encrypt Password
       //private string Encrypt(string clearText)
       //{
       //    string EncryptionKey = "MAKV2SPBNI99212";
       //    byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
       //    using (Aes encryptor = Aes.Create())
       //    {
       //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
       //        encryptor.Key = pdb.GetBytes(32);
       //        encryptor.IV = pdb.GetBytes(16);
       //        using (MemoryStream ms = new MemoryStream())
       //        {
       //            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
       //            {
       //                cs.Write(clearBytes, 0, clearBytes.Length);
       //                cs.Close();
       //            }
       //            clearText = Convert.ToBase64String(ms.ToArray());
       //        }
       //    }
       //    return clearText;
       //}

       //#endregion Encrypt Password

        #endregion Methods

       #region Events

        #region Page Load
       protected void Page_Load(object sender, EventArgs e)
        {
            BindGriewWithDetailsOfAllUsers(); 
        }

        #endregion Page Load

        #region Save Button Click

        /// <summary>
        /// To create a new user
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
//---------*User is not doctor , operation :add user to user table 

            if (rdoNotDoctor.Checked == true)
            {
                AddUserToUserTable();
            }

//---------* User is a doctor , Operations : 1.add user to user table , 2.add user to the doctor table , 3.add user - role(doctor) to assignroles table

            else
            {
                if(rdoDoctor.Checked == true)
                {
                    AddUserToUserTable();
                    AddUserToDoctorTable();
                    AddUserRole();
                }
            }
        }

        #endregion Save Button Click

        #region Update Image Button Click
        protected void ImgBtnUpdate_Command(object sender, CommandEventArgs e)
        {
            string[] Users = e.CommandArgument.ToString().Split(new char[] { '|' });
            Guid UserID = Guid.Parse(Users[0]);
            userObj.UserID = UserID;

            txtLoginName.Text = Users[1];
            txtFirstName.Text = Users[2];
            txtLastName.Text = Users[3];

            bool isActive = Convert.ToBoolean(Users[4]);

            if (isActive)
            {
                rdoActiveYes.Checked = true;
                 }
            else
            {
                rdoActiveNo.Checked = true;
              }

            btnSave.Text = "Update";
            hdnUserID.Value = UserID.ToString();
            txtLoginName.ReadOnly = true;

        }

        #endregion  Update Image Button Click

        #region Delete Image Button Click
        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {
            Guid UserID = Guid.Parse(e.CommandArgument.ToString());
            userObj.UserID = UserID;
            userObj.DeleteUserByUserID();
            BindGriewWithDetailsOfAllUsers();

        }
        #endregion Delete Image Button Click

        #endregion Events


    }
}