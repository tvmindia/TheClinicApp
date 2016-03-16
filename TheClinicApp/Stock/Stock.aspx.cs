using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace TheClinicApp.Stock
{
    public partial class Stock : System.Web.UI.Page
    {

        #region objects 

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();
        public string listFilter = null;
       
        Receipt rpt = new Receipt();
      


        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion objects


        protected void Page_Load(object sender, EventArgs e)
        {

            bindpageload();



        }

        #region bindpageload

        public void bindpageload()
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            stok.ClinicID = UA.ClinicID.ToString();
            //gridview binding for listing the Out of Stock Medicines 
            DataSet gds = stok.ViewOutofStockMedicines();
            GridViewOutofStock.EmptyDataText = "No Records Found";
            GridViewOutofStock.DataSource = gds;
            GridViewOutofStock.DataBind();



            //Binding  Category ID and Name

            stok.ClinicID = UA.ClinicID.ToString();
            DataSet ds = stok.ViewCategories();

            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataBind();




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
 
        protected void btnStock_Click(object sender, EventArgs e)
        {

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            
            // CHECKING MEDICINE ALREADY EXITS condition...


            string Name = Request.Form["txtSearch"];


            if (Name != "")
            {
                DataTable dt = stok.GetMedcineDetails(Name);


                if (dt.Rows.Count == 0)
                {
                    stok.ClinicID = UA.ClinicID.ToString();
                    stok.CategoryID = ddlCategory.SelectedValue;
                    stok.Name = Name;
                    stok.Qty = 0;
                    stok.Unit = txtUnit.Text;
                    stok.CreatedBy = UA.userName;
                    stok.ReOrderQty = 10;
                    stok.MedCode ="med";

                    //calling medicine insertion

                    stok.InsertMedicines();

                    HiddenFieldMedicineID.Value = stok.MedicineID.ToString();


                }
            }
           
             
                 


            //Receipt Header
            rpt.RefNo1 = txtReference1.Text;
            rpt.RefNo2 = txtReference2.Text;
            rpt.Date = Convert.ToDateTime(txtDate.Text);
            rpt.ClinicID = UA.ClinicID.ToString();
            rpt.CreatedBy = UA.userName;
            //rpt.InsertReceiptHeader();

            //Receipt Details MUST BE IN LOOP

            ReceiptDetails rptdt = new ReceiptDetails();
            rptdt.QTY = Convert.ToInt32(txtQty.Text);
            rptdt.Unit =txtUnit.Text;
        
            rptdt.MedicineID = HiddenFieldMedicineID.Value;
            rptdt.ClinicID = UA.ClinicID.ToString();
          
            rptdt.CreatedBy =UA.userName;

            //Calling insert functions
           



            //passing foreign key value 
            rptdt.ReceiptID = rpt.ReceiptID;


            rptdt.InsertReceiptDetails();


        }

        protected void btnSearchMedicine_ServerClick(object sender, EventArgs e)
        {
           // Patient PatientObj = new Patient();

            Stocks stok = new Stocks();

            DataRow dr = null; 
            string Name = Request.Form["txtSearch"];
            if (Name != "")
            {
                DataTable dt = stok.GetMedcineDetails(Name);
                
                if (dt.Rows.Count>0)
                {
                    dr = dt.NewRow();
                    dr = dt.Rows[0];

                    HiddenFieldMedicineID.Value = dr["MedicineID"].ToString();
                    lblUnit.Text = dr["Unit"].ToString();
                    lblQuantity.Text = dr["Qty"].ToString();
                    lblLastUpdated.Text = dr["UpdatedDate"].ToString();
                }
                else
                {


                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Medicine not Exists');", true);
                    
                    

                    
                  
                }


                
               
                
              
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Invalid Suggesion');", true);

            }
        }

     
    }
}