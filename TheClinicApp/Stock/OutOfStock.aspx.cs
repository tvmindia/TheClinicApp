
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-16-2016

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

#endregion Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class OutOfStock : System.Web.UI.Page
    {
        #region Global Variables

        Stocks stockObj = new Stocks();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods

        #region Bind Out Of Stock Gridview
        public void BindOutOfStockGridview()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            stockObj.ClinicID = UA.ClinicID.ToString();
            //gridview binding for listing the Out of Stock Medicines 
            DataSet gds = stockObj.ViewOutofStockMedicines();
            gvOutOfStock.EmptyDataText = "No Records Found";
            gvOutOfStock.DataSource = gds;
            gvOutOfStock.DataBind();
        }

        #endregion Bind Out Of Stock Gridview

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOutOfStockGridview();
            }
        }
        #endregion Page Loads

        #endregion Events
    }
}