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
        DataTable dtIssuehdr = null;

        #region Global Variables

      
        //IssueDetails IssuedtlObj = new IssueDetails();
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        IssueHeaderDetails IssuehdrObj = new IssueHeaderDetails();
       

        #endregion Global Variables

        #region Methods

//------------------------------ * MEDICINES  * -------------------------------------------//

        #region Get MedicineDetails By Medicine Name

        /// <summary>
        /// To fill textboxes with medicine details when when medicne name is inserted
        /// </summary>
        /// <param name="MedName"></param>
        /// <returns>String of medicine details</returns>

        [WebMethod]

        public static string MedDetails(string MedName)
        {
            IssueHeaderDetails IssuedtlsObj = new IssueHeaderDetails();

            UIClasses.Const Const = new UIClasses.Const();
            ClinicDAL.UserAuthendication UA;

            UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];

            IssuedtlsObj.ClinicID = UA.ClinicID.ToString();

            DataSet ds = IssuedtlsObj.GetMedicineDetailsByMedicineName(MedName);
            string Unit = "";
            string MedCode = "";
            string Category = "";
            string Qty = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                Unit = Convert.ToString(ds.Tables[0].Rows[0]["Unit"]);
                MedCode = Convert.ToString(ds.Tables[0].Rows[0]["MedCode"]);
                Category = Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"]);
                Qty = Convert.ToString(ds.Tables[0].Rows[0]["Qty"]);
            }

            return String.Format("{0}" + "|" + "{1}" + " | " + "{2}" + " | " + "{3}", Unit, MedCode, Category, Qty);


        }


        #endregion Get MedicineDetails By Medicine Name

        #region Bind List Filter

        /// <summary>
        /// Bind list filter with medicine names
        /// </summary>
        public void BindListFilter()
        {
            listFilter = null;
            listFilter = GetMedicineNames();
        }

        #endregion Bind List Filter

        #region Get Medicine Names

        /// <summary>
        /// Get all medicine names to be binded into list filter
        /// </summary>
        /// <returns></returns>
        private string GetMedicineNames()
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

        #endregion Get Medicine Names

        #region Store Xml To HiddenField

        /// <summary>
        /// Issue details are converted to xml and stored into hidden field ,so that controls can be refilled
        /// </summary>
        public void StoreXmlToHiddenField()
        {
            if (ViewState["IssueHdrID"] != null && ViewState["IssueHdrID"].ToString() != string.Empty)
            {
                string issueid = ViewState["IssueHdrID"].ToString();

                //string issueid = IssuehdrObj.IssueID.ToString();
                DataSet dsIssue = GetIssueDetailsByIssueID(issueid);
                var xml = dsIssue.GetXml();

                hdnXmlData.Value = xml;
            }

           
        }

        #endregion Store Xml To HiddenField#region Store Xml To HiddenField

        #region Get Issue Details By IssueID

        /// <summary>
        /// To fill xml with saved data
        /// </summary>
        /// <param name="IssueID"></param>
        /// <returns>Dataset of issue details by id</returns>
        public DataSet GetIssueDetailsByIssueID(string IssueID)
        {
          
            DataSet dsIssue = null;

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

            IssuehdrObj.ClinicID = UA.ClinicID.ToString();
            dsIssue = IssuehdrObj.GetIssueDetailsByIssueID(IssueID);

            return dsIssue;

        }

        #endregion Get Issue Details By IssueID

 //-----------------------------  * END  MEDICINES AREA * -------------------//

        #region Clear Controls
        public void ClearControls()
        {
            txtDate.Text = string.Empty;
            txtIssuedTo.Text = string.Empty;
        }

        #endregion Clear Controls

        #region Bind Textbox By Generated IssueNo

        /// <summary>
        /// To bind issue no textbox with generated issue no , and is changable
        /// </summary>
        public void BindTextboxByIssueNo()
        {
           
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            IssuehdrObj.ClinicID = UA.ClinicID.ToString();
            string IssueNumber =  IssuehdrObj.Generate_Issue_Number();

           txtIssueNO.Text = IssueNumber;
        }

        #endregion Bind Textbox By IssueNo

        #region Check IssueNo Duplication

        /// <summary>
        ///Checks issue no duplication when Generated issue no is editable
        /// </summary>
        /// <param name="IssueNo"></param>
        /// <returns></returns>

        [WebMethod]
        public static bool CheckIssueNoDuplication(string IssueNo)
        {
            IssueHeaderDetails IssuedtlObj = new IssueHeaderDetails();

            if (IssuedtlObj.CheckIssueNoDuplication(IssueNo)) 
            {
                return true;
            }
            return false;
        }

        #endregion Check IssueNo Duplication

        #endregion Methods

        #region Events

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {

            BindListFilter();


            txtDate.Attributes.Add("readonly", "readonly");
            string issueID = string.Empty;
           
            DataSet dsIssuehdr = null;
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];

//---------- * Checking whether redirection to the page happened by clicking in gridview or by clicking the new issue button *----------//

                if (Request.QueryString["issueID"] == null)
                {

 //-----*Redirection due to new issue button click*-----//

                    if (!IsPostBack)
                    {
                        BindTextboxByIssueNo();
                    }
                    
                }
          
                else
                {

                 
 //-----*Redirection due to Grid link click*-----//

                    hdnHdrInserted.Value = "True";
                
                     issueID = Request.QueryString["issueID"].ToString();
               
                    IssuehdrObj.ClinicID = UA.ClinicID.ToString();
                    DataSet dsHdr = IssuehdrObj.GetIssueHeaderByIssueID(issueID);



                    dtIssuehdr = dsHdr.Tables[0];

                    if (dtIssuehdr.Rows.Count > 0)
                    {
                        ViewState["IssueHdrID"] = Request.QueryString["issueID"].ToString();

                        //foreach (DataRow dr in dsIssuehdr.Tables[0].Rows)
                        //{

                        if (!IsPostBack)
                        {
                            txtIssueNO.Text = dtIssuehdr.Rows[0]["IssueNO"].ToString();
                            txtIssuedTo.Text = dtIssuehdr.Rows[0]["IssuedTo"].ToString();
                            txtDate.Text = ((DateTime)dtIssuehdr.Rows[0]["Date"]).ToString("dd-MM-yyyy");
                        }

                       
                        
                        //}
                        dsIssuehdr = IssuehdrObj.GetIssueDetailsByIssueID(issueID);
                        var xml = dsIssuehdr.GetXml();

                        hdnXmlData.Value = xml;
                    }
             }


         }
        #endregion Page Load

        #region Add Button Click

        /// <summary>
        /// Insert,update,delete operations are handling in this case.
        ///  Case 1 : If removedId hiddenfield has value, case is delete.
        ///  Case 2 : If DetaildId hiddenfield has value, case is Update 
        ///  Case 3 : If DetailId is empty , Case is insert
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        
        {

            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];


            if (hdnRemovedIDs.Value != string.Empty )
            {

 //----------------- * CASE : DELETE *-----------------------------------//

                string hdRemovedIDValue = hdnRemovedIDs.Value;

                string[] RemovedIDs = hdRemovedIDValue.Split(',');

                for (int i = 0; i < RemovedIDs.Length - 1; i++)
                {

                    if ( (RemovedIDs[i] !="") || (RemovedIDs[i] != string.Empty) )
                    {

                        IssueDetails DetailObj = new IssueDetails();
                        string UniqueId = RemovedIDs[i].ToString();

                        //string medId =   DetailObj.GetMedicineIDByUniqueID(Guid.Parse(UniqueId));

                            DetailObj.ClinicID = UA.ClinicID.ToString();
                            DetailObj.DeleteIssueDetails(UniqueId);
                            hdnRemovedIDs.Value = "";
                        
                    }
                }

            }



            if (hdnRemovedIDs.Value == string.Empty)
            {
                if(hdnTextboxValues.Value != "")
                {

                if ((txtIssueNO.Text != string.Empty) && (txtIssuedTo.Text != string.Empty) && (txtDate.Text != string.Empty))
                {

                    IssuehdrObj.ClinicID = UA.ClinicID.ToString();
                    IssuehdrObj.IssuedTo = txtIssuedTo.Text;
                    IssuehdrObj.IssueNO = txtIssueNO.Text;
                    IssuehdrObj.CreatedBy = UA.userName;

                    IssuehdrObj.Date = Convert.ToDateTime(txtDate.Text);



                    if ( (hdnHdrInserted.Value == "") && (hdnTextboxValues.Value != ""))
                    {
                        IssuehdrObj.InsertIssueHeader();
                        hdnHdrInserted.Value = "True";
                        ViewState["IssueHdrID"] = IssuehdrObj.IssueID;

                    }

                    if (ViewState["IssueHdrID"] != null && ViewState["IssueHdrID"].ToString() != string.Empty)
                    {
                      

                     string issueid = ViewState["IssueHdrID"].ToString();

                        IssuehdrObj.ClinicID = UA.ClinicID.ToString();
                        DataSet dsHdr = IssuehdrObj.GetIssueHeaderByIssueID(issueid);

                        dtIssuehdr = dsHdr.Tables[0];


                        if (dtIssuehdr.Rows.Count > 0)
                        {

                            string oldDate = ((DateTime)dtIssuehdr.Rows[0]["Date"]).ToString("dd-MM-yyyy");
                            string newDate = txtDate.Text;

                            if ((txtIssueNO.Text != dtIssuehdr.Rows[0]["IssueNO"].ToString()) || (txtIssuedTo.Text != dtIssuehdr.Rows[0]["IssuedTo"].ToString()) || (oldDate != newDate))
                            {
 // ----------------- *  Update header*-----------------------------------//

                                if (hdnTextboxValues.Value != "")
                                {

                                    IssuehdrObj.ClinicID = UA.ClinicID.ToString();
                                    IssuehdrObj.IssuedTo = txtIssuedTo.Text;
                                    IssuehdrObj.Date = Convert.ToDateTime(txtDate.Text);
                                    IssuehdrObj.UpdatedBy = UA.userName;
                                    //IssuehdrObj.IssueNO = txtIssueNO.Text;
                                    IssuehdrObj.UpdateIssueHeader(ViewState["IssueHdrID"].ToString());
                                }

                            }
                        }
                    }

                    string last = string.Empty;

                   


                    string values = hdnTextboxValues.Value;

                    string[] Rows = values.Split('$');



                    for (int i = 0; i < Rows.Length - 1; i++)
                    {
                        IssueDetails IssuedtlObj = new IssueDetails(); //Object is created in loop as each entry should have different uniqueID
                        string[] tempRow = Rows;

                        last = tempRow[i].Split('|').Last();

                        string[] columns = tempRow[i].Split('|');

                        if (last == string.Empty || last == "")
                        {

 //----------------- * CASE : INSERT *-----------------------------------//
                            if ((columns[0] != null) && (columns[4] != null))
	                        {
		 
	
                            IssuedtlObj.MedicineName = columns[0];
                            IssuedtlObj.Unit = columns[1];
                            IssuedtlObj.Qty = Convert.ToInt32(columns[4]);

                            IssuedtlObj.CreatedBy = UA.userName; ;
                            IssuedtlObj.ClinicID = UA.ClinicID.ToString();

                            if (ViewState["IssueHdrID"] != null && ViewState["IssueHdrID"].ToString() != string.Empty)
                            {
                                IssuedtlObj.IssueID = Guid.Parse(ViewState["IssueHdrID"].ToString());
                            }

                            IssuedtlObj.InsertIssueDetails();
                        }
                        }

                        if (last != string.Empty )
                        {
 //----------------- * CASE : UPDATE *---------------------------------//

                            if ((columns[0] != null) && (columns[4] != null))
                            {
                            string uniqueID = last;
                            IssueDetails UpIssueDtlObj = new IssueDetails(new Guid(uniqueID));

                            UpIssueDtlObj.ClinicID = UA.ClinicID.ToString();
                            UpIssueDtlObj.Qty = Convert.ToInt32(columns[4]);
                            UpIssueDtlObj.UpdatedBy = UA.userName;

                            //string medicineID = IssuedtlObj.GetMedcineIDByMedicineName(columns[0]);

                            UpIssueDtlObj.UpdateIssueDetails(uniqueID);
                        }
                        }

                    }


                    hdnManageGridBind.Value = "True";

                }
            }
            }

            StoreXmlToHiddenField();
          
        }
        #endregion Add Button Click


        #region Get Quantity In Stock 
        [WebMethod]

        public static string GetQtyInStock(string MedName)
        {
            IssueDetails dtlsObj = new IssueDetails();
            string qty = dtlsObj.GetQtyInStock(MedName);
            return qty;
        }

        #endregion Get Quantity In Stock 


        #region New Button Click
        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
        #endregion New Button Click

        #endregion Events
    }
}