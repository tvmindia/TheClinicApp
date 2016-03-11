using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp
{
    public partial class AutofillGrid : System.Web.UI.Page
    {

        #region Global Variables

        Stocks stockObj = new Stocks();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables



        #region Methods

        #region Bind Gridview

        public void BindGridview()
        {
            DataSet dsMedicines = new DataSet();
            stockObj.ClinicID = "2C7A7172-6EA9-4640-B7D2-0C329336F289";
            //dsMedicines = stockObj.SearchMedicineStock(DBNull.Value);
            dtgMedicines.DataSource = dsMedicines;
            dtgMedicines.DataBind();
        }

        #endregion Bind Gridview


        [System.Web.Services.WebMethod]
        public static string GetCurrentTime(string name)
        {
            return "Hello " + name + Environment.NewLine + "The Current Time is: "
                    + DateTime.Now.ToString();
         
        }




        #endregion Methods



        protected void Page_Load(object sender, EventArgs e)
        {
            //BindGridview();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

    }
}