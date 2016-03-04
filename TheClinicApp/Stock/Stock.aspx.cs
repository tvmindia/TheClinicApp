using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp.Stock
{
    public partial class Stock : System.Web.UI.Page
    {

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();
        public string listFilter = null;
       
        Receipt rpt = new Receipt();
        ReceiptDetails rptdt = new ReceiptDetails();
      
       
        protected void Page_Load(object sender, EventArgs e)
        {

            bindpageload();



        }

        #region bindpageload

        public void bindpageload()
        {

            //gridview binding for listing the Out of Stock Medicines 
            DataSet gds = stok.OutofStockMedicines();
            GridViewOutofStock.EmptyDataText = "No Records Found";
            GridViewOutofStock.DataSource = gds;
            GridViewOutofStock.DataBind();



            //Binding  Category ID and Name

            DataSet ds = stok.ViewCategory();

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
            //Receipt Header
            rpt.RefNo1 = txtReference1.Text;
            rpt.RefNo2 = txtReference2.Text;
            rpt.Date = Convert.ToDateTime(txtDate.Text);
            rpt.ClinicID = HiddenFieldClinicID.Value;
            rpt.CreatedBy = "user";
            
            //Receipt Details

            rptdt.QTY = Convert.ToInt32(txtQty.Text);
            rptdt.Unit = Convert.ToInt32(txtUnit.Text);
            rptdt.MedicineID = HiddenFieldMedicineID.Value;
            rptdt.ClinicID = HiddenFieldClinicID.Value;
            rptdt.CreatedBy = "user";

            //Calling insert functions
            rpt.InsertReceiptHeaderDetails();
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
                dr = dt.NewRow();
                dr = dt.Rows[0];


                lblUnit.Text = dr["Unit"].ToString();
                lblQuantity.Text = dr["Qty"].ToString();
                lblLastUpdated.Text = dr["UpdatedDate"].ToString();
               
                
              
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Invalid Suggesion');", true);

            }
        }

     
    }
}