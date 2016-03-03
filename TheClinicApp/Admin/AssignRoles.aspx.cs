
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Feb-29-2016

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
using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp.Admin
{
    public partial class AssignRoles : System.Web.UI.Page
    {
        #region Global Variables

        RoleAssign roleObj = new RoleAssign();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        DataTable dtUsers = null;
        #endregion Global Variables

        #region Methods

        #region Bind Gridview
        public void BindGriewWithDetailsOfAssignedRoles()
        {
            DataTable dtAssignedRoles = roleObj.GetDetailsOfAllAssignedRoles();
            dtgViewAllUserInRoles.DataSource = dtAssignedRoles;
            dtgViewAllUserInRoles.DataBind();
        }

        #endregion Bind Gridview

        #region Bind Users Dropdown

        public void BindUsersDropdown()
        {
             dtUsers = roleObj.GetDetailsOfAllUsers();
             ViewState["dtUsers"] = dtUsers;


            ddlUsers.DataTextField = "FirstName";
            ddlUsers.DataValueField = "UserID";
            ddlUsers.DataSource = dtUsers;
            ddlUsers.DataBind();

            ddlUsers.Items.Insert(0, "--Select--");
        }

        #endregion Bind Users Dropdown

        #region Bind Roles Dropdown

        public void BindRolesDropdown()
        {
            DataTable dtRoles = roleObj.GetDetailsOfAllRoles();

            ddlRoles.DataTextField = "RoleName";
            ddlRoles.DataValueField = "RoleID";
            ddlRoles.DataSource = dtRoles;
            ddlRoles.DataBind();
            ddlRoles.Items.Insert(0, "--Select--");
        }

        #endregion Bind Roles Dropdown

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindUsersDropdown();
                BindRolesDropdown();
                BindGriewWithDetailsOfAssignedRoles();
            }

        }

        #endregion Page Load

        #region Save Button Click
        protected void btnSave_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            roleObj.UserID = new Guid(ddlUsers.SelectedValue);

            dtUsers = (DataTable)ViewState["dtUsers"];

            //DataRow[] foundRow = dtUsers.Select("UserID = " + ddlUsers.SelectedValue);

            roleObj.RoleID = new Guid(ddlRoles.SelectedValue);

            //roleObj.ClinicID =UA.ClinicID;
            roleObj.ClinicID = new Guid("2c7a7172-6ea9-4640-b7d2-0c329336f289");

            roleObj.CreatedBy = UA.userName;
            roleObj.AssignRole();

            BindGriewWithDetailsOfAssignedRoles();
            //string TotalRole = string.Empty; ;
            //for (int i = 0; i < cblRoles.Items.Count - 1; i++)
            //{
            //    if (cblRoles.Items[i].Selected)
            //        TotalRole += cblRoles.Items[i].Value.ToString() + ","; 
            //}

        }

        #endregion  Save Button Click

        #region Delete Button Click
        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {
            Guid UniqueID = Guid.Parse(e.CommandArgument.ToString());
            roleObj.UniqueID = UniqueID;
            roleObj.DeleteAssignedRoleByUniqueID();
            BindGriewWithDetailsOfAssignedRoles();
        }

        #endregion Delete Button Click

        #endregion Events
    }
}