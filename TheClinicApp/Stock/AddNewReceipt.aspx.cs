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
    
    public partial class AddNewReceipt : System.Web.UI.Page
    {
        ErrorHandling eObj = new ErrorHandling();
        IssueHeaderDetails ihd = new IssueHeaderDetails();
        IssueDetails idt = new IssueDetails();
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();
      
        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        
        public string listFilter = null;

        protected void Page_Load(object sender, EventArgs e)
        {
           
                bindpageload();

           
        }

        
        #region bindpageload

        public void bindpageload()
        {



            listFilter = null;
            listFilter = BindName();

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];


            ihd.ClinicID = UA.ClinicID.ToString();
            idt.ClinicID = UA.ClinicID.ToString();

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

        protected void btnReceipt_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            rpt.CreatedBy = UA.userName;
            rpt.Date = Convert.ToDateTime(txtDate.Text);
            rpt.RefNo1 = txtBillNo.Text;
            rpt.RefNo2 = txtRefNo2.Text;
            rpt.ClinicID = UA.ClinicID.ToString();

            rpt.InsertReceiptHeader();

            string values = HiddenField1.Value;
            
            string[] Invalue = values.Split('|');

           int len= Invalue.Length;
           len = len - 1;
           
               
                   for (int i = 0; i <len ; i = i + 5)
                   {
                       ReceiptDetails rptdt = new ReceiptDetails();

                       rptdt.MedicineName = Invalue[i];
                       rptdt.QTY= Convert.ToInt32(Invalue[i + 4]);
                       rptdt.Unit = Invalue[i+1];
                       rptdt.CreatedBy = UA.userName;
                       rptdt.ClinicID = UA.ClinicID.ToString();
                       rptdt.ReceiptID = rpt.ReceiptID;
                       
                       rptdt.InsertReceiptDetails();
                     
                   }
        }

        #region WebMethod
        
        [WebMethod(EnableSession = true)]
        public static string MedDetails(string MedName)
        {
           ClinicDAL.ReceiptDetails obj= new ClinicDAL.ReceiptDetails();

           UIClasses.Const Const = new UIClasses.Const();
           ClinicDAL.UserAuthendication UA;

           UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

           obj.ClinicID = UA.ClinicID.ToString();

            DataSet ds= obj.GetMedCodeUnitCategory(MedName);


            string Unit = Convert.ToString(ds.Tables[0].Rows[0]["Unit"]);
            string MedCode = Convert.ToString(ds.Tables[0].Rows[0]["MedCode"]);
            string Category = Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"]);

            return String.Format("{0}" + "|" + "{1}"+" | "+"{2}", Unit, MedCode, Category);



        }


        #endregion WebMethod

    }
}