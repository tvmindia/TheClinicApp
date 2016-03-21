
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-21-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion  Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class NewIssue : System.Web.UI.Page
    {
        public string listFilter = null;
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        

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

        #region bindpageload

        public void bindpageload()
        {



            listFilter = null;
            listFilter = BindName();

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

        }


        #endregion bindpageload


        #region BindDataAutocomplete
        private string BindName()
        {
            // Patient PatientObj = new Patient();
            Stocks stok = new Stocks();

            DataTable dt = stok.SearchBoxMedicine();

            StringBuilder output = new StringBuilder();
            output.Append("[");
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                output.Append("\"" + dt.Rows[i]["Name"].ToString() + "\"");

                if (i != (dt.Rows.Count - 1))
                {
                    output.Append(",");
                }
            }
            output.Append("]");
            return output.ToString();
        }

        #endregion BindDataAutocomplete

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["refNo"] != null)
            {
                string a = "gr";

                a = Request.QueryString["refNo"].ToString();
            }
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