using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.Services;

namespace TheClinicApp.Stock
{
    public partial class ExistingStockIn : System.Web.UI.Page
    {

        
        #region objects

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();
        
        public string listFilter = null;

        //passing guid value: ReceiptID
        Guid receipt;

        //login details
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion objects

        protected void Page_Load(object sender, EventArgs e)
        {

            receipt = Guid.Parse(Request.QueryString["ReceiptID"]);
           

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            rpt.ClinicID = UA.ClinicID.ToString();
          
            GetReceiptDetails();

            bindpageload();


        }




        #region bindpageload
        public void bindpageload()
        {
            listFilter = null;
            listFilter = BindName(); 
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


        public void GetReceiptDetails()
        {
            DataSet ds = rpt.GetReceiptDetailsByReceiptID(receipt);

            HiddenFieldCount.Value= ds.Tables[0].Rows.Count.ToString();

            var xml = ds.GetXml();
            
            HiddenFieldXmlData.Value = xml;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }



        #region WebMethod

        [WebMethod(EnableSession = true)]
        public static string MedDetails(string MedName)
        {
            ClinicDAL.ReceiptDetails obj = new ClinicDAL.ReceiptDetails();

            UIClasses.Const Const = new UIClasses.Const();
            ClinicDAL.UserAuthendication UA;

            UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

            obj.ClinicID = UA.ClinicID.ToString();

            DataSet ds = obj.GetMedCodeUnitCategory(MedName);


            string Unit = Convert.ToString(ds.Tables[0].Rows[0]["Unit"]);
            string MedCode = Convert.ToString(ds.Tables[0].Rows[0]["MedCode"]);
            string Category = Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"]);

            return String.Format("{0}" + "|" + "{1}" + " | " + "{2}", Unit, MedCode, Category);



        }


        #endregion WebMethod


    }
}