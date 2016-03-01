
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
        
        #endregion Global Variables

        #region Methods

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtUserInRoles = roleObj.GetDetailsOfAllUserInRoles();
            ddlUsers.DataSource = dtUserInRoles;
            ddlUsers.DataBind(); 

        }

        #endregion Page Load

        #endregion Events
    }
}