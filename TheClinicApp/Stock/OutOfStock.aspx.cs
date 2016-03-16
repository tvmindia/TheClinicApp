using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp.Stock
{
    public partial class OutOfStock : System.Web.UI.Page
    {
        #region Global Variables

        Stocks stockObj = new Stocks();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables
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


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOutOfStockGridview();
            }
        }
    }
}