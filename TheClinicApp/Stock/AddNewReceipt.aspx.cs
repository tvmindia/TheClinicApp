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

namespace TheClinicApp.Stock
{


    public partial class AddNewReceipt : System.Web.UI.Page
    {

        ErrorHandling eObj = new ErrorHandling();
        IssueHeaderDetails ihd = new IssueHeaderDetails();
        IssueDetails idt = new IssueDetails();
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();
        ReceiptDetails rptdt = new ReceiptDetails();

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




            rpt.InsertReceiptHeader();


            rptdt.InsertReceiptDetails();


        }



    }
}