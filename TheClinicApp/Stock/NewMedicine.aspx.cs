
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
            StockObj.Unit = txtUnit.Text;

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

             ddlCategory.Items.Insert(0, "--Select--");

        }
        #endregion Bind Category

        #region Clear Controls

        public void ClearControls()
        {
            txtmedicineName.Text = string.Empty;
            txtUnit.Text = string.Empty;
            txtCode.Text = string.Empty;
            txtOrderQuantity.Text = string.Empty;

            BindCategory();
        }

        #endregion Clear Controls

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    BindCategory();
                }

            }
            catch (Exception)
            {
                
                throw;
            }
            
        }

        #endregion Page Load

        #region Add Button Click
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                AddNewMedicine();
            }
            catch (Exception)
            {
                
                throw;
            }
          
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