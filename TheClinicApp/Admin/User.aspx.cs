
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Feb-26-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

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

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    userObj.isActive = true;
                }
            }

            userObj.createdBy = UA.userName;
            userObj.updatedBy = UA.userName; 
            //userObj.UserID = UA.userName;

            userObj.AddUser();
        }

        #endregion Save Button Click

        #endregion Events
    }
}