
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-21-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion  Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class NewIssue : System.Web.UI.Page
    {

        #region Methods

        #region Clear Controls
        public void ClearControls()
        {
            txtDate.Text = string.Empty;
            txtIssuedTo.Text = string.Empty;
        }

        #endregion Clear Controls

        #region Add Issue

        public void AddIssue()
        {

        }

        #endregion  Add Issue

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion Page Load

        #region Add Button Click
        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
        #endregion Add Button Click

        #region New Button Click
        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        #endregion New Button Click

        #endregion Events
    }
}