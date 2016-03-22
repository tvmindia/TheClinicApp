﻿
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

#endregion  Included Namespaces

namespace TheClinicApp.Stock
{
    public partial class NewIssue : System.Web.UI.Page
    {
        public string listFilter = null;
        IssueHeaderDetails IssuehdrObj = new IssueHeaderDetails();
        IssueDetails IssuedtlObj = new IssueDetails();

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        

        #region Methods

        #region Clear Controls
        public void ClearControls()
        {
            txtDate.Text = string.Empty;
            txtIssuedTo.Text = string.Empty;
        }

        #endregion Clear Controls

        #region Add Issue

        public void AddIssue()
        {

        }

        #endregion  Add Issue

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
            bindpageload();
        }
        #endregion Page Load

        #region Add Button Click
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            IssuehdrObj.ClinicID = UA.ClinicID.ToString();
            IssuehdrObj.IssuedTo = txtIssuedTo.Text;
            //IssuehdrObj.IssueNO = txtIssueNO.Text;
            IssuehdrObj.CreatedBy = UA.userName;

           
            IssuehdrObj.Date = Convert.ToDateTime(txtDate.Text);

                IssuehdrObj.InsertIssueHeader();


                string values = hdnTextboxValues.Value;

                string[] Textboxvalues = values.Split('|');

                int len = Textboxvalues.Length;
                len = len - 1;

                for (int i = 0; i < len; i = i + 5)
                {
                    IssuedtlObj.MedicineName = Textboxvalues[i];
                    IssuedtlObj.Qty = Convert.ToInt32(Textboxvalues[i + 4]);
                    IssuedtlObj.Unit = Textboxvalues[i + 1];
                    IssuedtlObj.CreatedBy = UA.userName; ;
                    IssuedtlObj.ClinicID = UA.ClinicID.ToString();
                    IssuedtlObj.IssueID = IssuehdrObj.IssueID;

                    IssuedtlObj.InsertIssueDetails();
                }
        }
        #endregion Add Button Click

        #region New Button Click
        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        #endregion New Button Click

        #endregion Events
    }
}