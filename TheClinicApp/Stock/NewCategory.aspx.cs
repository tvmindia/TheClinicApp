
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-16-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class NewCategory : System.Web.UI.Page
    {
        #region Global Variables

        Category CategoryObj = new Category();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods


        #region Validate Category Name

        [WebMethod]
        public static bool ValidateCategoryName(string CategoryName)
        {
            Category CategoryObj = new Category();

            if (CategoryObj.ValidateCategoryName(CategoryName))
            {
                return true;
            }
            return false;
        }

        #endregion  Validate Category Name

        #region Add New Medicine
        public void AddNewCategory()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            CategoryObj.CategoryName = txtCategoryName.Text;
            CategoryObj.ClinicID = UA.ClinicID;
            CategoryObj.CreatedBy = UA.userName;

            CategoryObj.AddNewCategory();

        }

        #endregion Add New Medicine

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
            try
            {
                AddNewCategory();

                hdnCategory.Value = "True";
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        #endregion Add Button Click

        #endregion Events
    }
}