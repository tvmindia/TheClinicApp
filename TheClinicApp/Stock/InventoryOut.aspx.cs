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
    public partial class InventoryOut : System.Web.UI.Page
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



        protected void btnIssue_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];


           ihd.ClinicID =UA.ClinicID.ToString();
           idt.ClinicID = UA.ClinicID.ToString();

       //    HiddenFieldClinicID.Value = "";


            //Request.Form.GetValues("txtSearch1")

            //Inserting Issue Header


         
            ihd.IssuedTo = txtIussedTo.Text;
            ihd.Date = Convert.ToDateTime(txtDate.Text);
           
            ihd.CreatedBy = UA.userName;
            ihd.CreatedDate = DateTime.Now;


            
            

            //Inserting Issue Details

        
          // idt.MedicineID = ddlMedicine.SelectedValue;

           // idt.Qty = Convert.ToInt32(txtQty.Text);

            idt.CreatedBy = UA.userName;
            idt.CreatedDate = DateTime.Now;
          


            //  Calling  Insert Functions

            // ihd.InsertIssueHeaderDetails();
            //idt.InsertIssueDetails();
        }




    }
}