
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

#endregion Included Namespaces

namespace TheClinicApp.Admin
{
    public partial class User : System.Web.UI.Page
    {
        #region Global Variables

        ClinicDAL.User userObj = new ClinicDAL.User();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        
        #endregion Global Variables

        #region Methods

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
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            userObj.firstName = txtFirstName.Text;
            userObj.loginName = txtLoginName.Text;
            userObj.lastName = txtLastName.Text;
            
            if(rdoActiveYes.Checked == true)
            {
                userObj.isActive = true;
            }
            else
            {
                if(rdoActiveNo.Checked == true)
                {
                    userObj.isActive = false;
                }
            }
            //userObj.ClinicID = UA.ClinicID;
            userObj.ClinicID = new Guid("2c7a7172-6ea9-4640-b7d2-0c329336f289");
            userObj.createdBy = UA.userName;
            userObj.updatedBy = UA.userName; 
           

            if(btnSave.Text == "Save")
            {
                 userObj.AddUser();
                 BindGriewWithDetailsOfAllUsers();
            }
            else
            {
                if(btnSave.Text == "Update" )
                {
                    userObj.UserID = Guid.Parse(hdnUserID.Value);
                    userObj.UpdateuserByUserID();
                    BindGriewWithDetailsOfAllUsers();

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