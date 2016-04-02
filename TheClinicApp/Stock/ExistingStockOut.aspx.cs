
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-21-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class ExistingStockOut : System.Web.UI.Page
    {
        public string listFilter = null;

        #region Global Variables

        IssueHeaderDetails Issuehdrobj = new IssueHeaderDetails();
        IssueDetails IssuedtlObj = new IssueDetails();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        #endregion Global Variables

        #region Methods

        #region BindGridviewWithExistingByIssueNo

        public void BindGridviewAndLabels()
        {
            string IssueID = string.Empty;
            DataSet dsIssuehdr = null;

            if (Request.QueryString["IssueID"] != null || hdnIssueID.Value != null)
            {
                if (Request.QueryString["IssueID"] != null)
                {
                    hdnIssueID.Value = Request.QueryString["IssueID"].ToString();
                    IssueID = Request.QueryString["IssueID"].ToString();
                }
                else
                {
                    if (hdnIssueID.Value != null || hdnIssueID.Value != string.Empty)
                    {
                        IssueID = hdnIssueID.Value;
                    }
                }
               
                UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

              Issuehdrobj.ClinicID = UA.ClinicID.ToString();
              dsIssuehdr = Issuehdrobj.GetIssueDetailsByIssueID(IssueID);

              //dtgExistingIssueByIssueNo.DataSource = dsIssuehdr;
              //dtgExistingIssueByIssueNo.DataBind();

              foreach (DataRow dr in dsIssuehdr.Tables[0].Rows)
              {
                  lblIssueNo.Text = dr["IssueNo"].ToString();
                  lblIssuedTo.Text = dr["IssuedTo"].ToString();
                  lblIssueDate.Text = ((DateTime)dr["Date"]).ToString("dd-MM-yyyy"); 
              }
            }

        }


        #endregion 

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


        #region Bind List Filter

        public void BindListFilter()
        {
            listFilter = null;
            listFilter = BindName();
        }

        #endregion Bind List Filter

        #region Get MedicineDetails By Medicine Name

        [WebMethod]
        public static string MedDetails(string MedName)
        {
            IssueHeaderDetails IssuedtlsObj = new IssueHeaderDetails();

            UIClasses.Const Const = new UIClasses.Const();
            ClinicDAL.UserAuthendication UA;

            UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

            IssuedtlsObj.ClinicID = UA.ClinicID.ToString();

            DataSet ds = IssuedtlsObj.GetMedicineDetailsByMedicineName(MedName);

            string Unit = Convert.ToString(ds.Tables[0].Rows[0]["Unit"]);
            string MedCode = Convert.ToString(ds.Tables[0].Rows[0]["MedCode"]);
            string Category = Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"]);

            return String.Format("{0}" + "|" + "{1}" + " | " + "{2}", Unit, MedCode, Category);

        }


        #endregion Get MedicineDetails By Medicine Name
        
        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

            BindListFilter();
          

            try
            {
                BindGridviewAndLabels();
                
            }
            catch (Exception)
            {
                
                throw;
            }

            
        }
        #endregion Page Load

        #region Delete Image Button Click 
        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            string[] ExistingStock = e.CommandArgument.ToString().Split(new char[] { '|' });
            if (ExistingStock.Length > 0)
	        {
                string UniqueID = ExistingStock[0];
                string MedicineID = ExistingStock[1];

                IssuedtlObj.ClinicID = UA.ClinicID.ToString();

                try
                {
                    IssuedtlObj.DeleteIssueDetails(UniqueID, MedicineID);

                    //hdnManageGridBind.Value = "True";

                    BindGridviewAndLabels();
                }
                catch (Exception)
                {
                    
                    throw;
                }
                
	        }         
            
         
           
        }

        #endregion Delete Image Button Click

        protected void ImgBtnUpdate_Command(object sender, CommandEventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            string[] ExistingStock = e.CommandArgument.ToString().Split(new char[] { '|' });

            //if (ExistingStock.Length > 0)
            //{
            //    string UniqueID = ExistingStock[0];
            //    string MedicineID = ExistingStock[1];

            //    IssuedtlObj.UniqueID = Guid.Parse( ExistingStock[0]);
            //    IssuedtlObj.ClinicID = UA.ClinicID.ToString();
            //    IssuedtlObj.MedicineID = ExistingStock[1];
            //}
                //IssuedtlObj.UpdateIssueDetails();
           
            
        }

        #endregion Events
    }
}