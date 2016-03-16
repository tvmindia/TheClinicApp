
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-16-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion  Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class NewMedicine : System.Web.UI.Page
    {
        #region Global Variables

        Stocks StockObj = new Stocks();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods

        #region Add New Medicine
        public void AddNewMedicine()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            StockObj.Name = txtmedicineName.Text;
            StockObj.MedCode = txtCode.Text;
            StockObj.CategoryID = ddlCategory.SelectedValue;
            StockObj.ReOrderQty = Convert.ToInt32(txtOrderQuantity.Text);
            StockObj.ClinicID = UA.ClinicID.ToString();
            StockObj.CreatedBy = UA.userName;

            StockObj.InsertMedicines();

        }

        #endregion Add New Medicine

        #region Bind Category
        public void BindCategory()
        {
             UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

             StockObj.ClinicID = UA.ClinicID.ToString();

             ddlCategory.DataSource = StockObj.ViewCategories();
             ddlCategory.DataTextField = "Name";
             ddlCategory.DataValueField = "CategoryID";
             ddlCategory.DataBind();

        }
        #endregion Bind Category

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategory();
        }

        #endregion Page Load

        #region Add Button Click
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddNewMedicine();
        }
        #endregion Add Button Click

        #endregion Events
    }
}