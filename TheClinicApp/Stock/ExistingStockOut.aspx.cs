
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Mar-21-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

#endregion Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class ExistingStockOut : System.Web.UI.Page
    {
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
              dsIssuehdr = Issuehdrobj.GetIssueDetailsByIssueNO(IssueID);

              dtgExistingIssueByIssueNo.DataSource = dsIssuehdr;
              dtgExistingIssueByIssueNo.DataBind();

              foreach (DataRow dr in dsIssuehdr.Tables[0].Rows)
              {
                  lblIssueNo.Text = dr["IssueNo"].ToString();
                  lblIssuedTo.Text = dr["IssuedTo"].ToString();
                  lblIssueDate.Text = ((DateTime)dr["Date"]).ToString("dd-MM-yyyy"); 
              }
            }

        }


        #endregion 

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
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

        }

        #endregion Events
    }
}