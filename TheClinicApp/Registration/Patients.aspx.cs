﻿using System;
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

namespace TheClinicApp.Registration
{
    public partial class Patients : System.Web.UI.Page
    {
        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;

        TokensBooking tok = new TokensBooking();
        ErrorHandling eObj = new ErrorHandling();
        public string listFilter = null;
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            gridDataBind();

        }
        #endregion PageLoad

        #region MainButton
        protected void btnSave_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            Patient PatientObj = new Patient();
            DateTime _date = DateTime.Now;
            int age = Convert.ToInt32(txtAge.Text);
            int year = _date.Year;
            int DOB = year - age;                      
            PatientObj.ClinicID = UA.ClinicID;
            PatientObj.Name = txtName.Text;
            PatientObj.Address = txtAddress.Text;
            PatientObj.Phone = txtMobile.Text;
            PatientObj.Email = txtEmail.Text;
            PatientObj.DOB = DOB + "-01-01";
            PatientObj.Gender = txtSex.Text;
            PatientObj.MaritalStatus = txtMarital.Text;
            PatientObj.Occupation = "BUSINESS";
            PatientObj.FileNumber = "HO343499";
            
            if (btnSave.Text == "SAVE")
            {
                if (FileUpload1.HasFile)
                {
                    byte[] ImageByteArray = null;
                    ImageByteArray = ConvertImageToByteArray(FileUpload1);
                    PatientObj.Picupload = ImageByteArray;
                    PatientObj.ImageType = Path.GetExtension(FileUpload1.PostedFile.FileName);

                }
                Guid g = Guid.NewGuid();
                PatientObj.PatientID = g;
                PatientObj.AddPatientDetails();
                PatientObj.AddFile();

                ////var page = HttpContext.Current.CurrentHandler as Page;

            }
            else if (btnSave.Text == "Update")
            {
                PatientObj.PatientID = Guid.Parse(HiddenField1.Value);
                PatientObj.UpdatePatientDetails();
                //var page = HttpContext.Current.CurrentHandler as Page;

            }
            gridDataBind();
            

            lblFileCount.Text = PatientObj.FileNumber;
            lblFile.Text = PatientObj.FileNumber;
            lblName.Text = txtName.Text;
            lblAge.Text = txtAge.Text;
            lblGender.Text = txtSex.Text;
            lblPhone.Text = txtMobile.Text;
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            btnnew.Visible = true;
        }

        #endregion MainButton

        #region GridBind
        public void gridDataBind()
        {

            Patient Patientobj = new Patient();
            #region GridAllRegistration
            dtgViewAllRegistration.EmptyDataText = "No Records Found";
            dtgViewAllRegistration.DataSource = Patientobj.GetAllRegistration();
            dtgViewAllRegistration.DataBind();
            #endregion GridAllRegistration

            listFilter = null;
            listFilter = BindName();
            #region GridDateRegistration
            dtgViewTodaysRegistration.EmptyDataText = "....Till Now No Registration....";
            dtgViewTodaysRegistration.DataSource = Patientobj.GetDateRegistration();
            dtgViewTodaysRegistration.DataBind();
            #endregion GridDateRegistration

            DropdownDoctors();
        }
        #endregion GridBind

        #region BindDropdownDoc
        public void DropdownDoctors()
        {
            DataSet ds = tok.DropBindDoctorsName();

            ddlDoctorName.DataSource = ds.Tables[0];
            ddlDoctorName.DataValueField = "DoctorID";
            ddlDoctorName.DataTextField = "Name";
            ddlDoctorName.DataBind();



        }
        #endregion BindDropdownDOc

        #region BindDataAutocomplete
        private string BindName()
        {
            Patient PatientObj = new Patient();

            DataTable dt = PatientObj.GetSearchBoxData();

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

        #region EditPatients
        protected void ImgBtnUpdate_Command(object sender, CommandEventArgs e)
        {
            DateTime date = DateTime.Now;
            int year = date.Year;
            string[] Patient = e.CommandArgument.ToString().Split(new char[] { '|' });
            Guid PatientID = Guid.Parse(Patient[0]);
            txtName.Text = Patient[1];
            txtSex.Text = Patient[6];
            DateTime dt = Convert.ToDateTime(Patient[5]);
            int Age = year - dt.Year;
            txtAge.Text = Age.ToString();
            txtAddress.Text = Patient[2];
            txtMobile.Text = Patient[3];
            txtEmail.Text = Patient[4];
            txtMarital.Text = Patient[7];
            //object image=(Patient[8]);
            //MakeFile(image,Patient[1],path);
            ProfilePic.Src = "../Handler/ImageHandler.ashx?PatientID=" + PatientID.ToString();
            ProfilePic.Visible = true;
            btnSave.Text = "Update";
            btnnew.Visible = true;
            HiddenField1.Value = PatientID.ToString();
            
        }

        
        protected void ImgBtnUpdate1_Command(object sender, CommandEventArgs e)
        {
            DateTime date = DateTime.Now;
            int year = date.Year;
            string[] Patient = e.CommandArgument.ToString().Split(new char[] { '|' });
            Guid PatientID = Guid.Parse(Patient[0]);
            txtName.Text = Patient[1];
            //txtSex.Text = Patient[6];
            DateTime dt = Convert.ToDateTime(Patient[5]);
            int Age = year - dt.Year;
            txtAge.Text = Age.ToString();
            txtAddress.Text = Patient[2];
            txtMobile.Text = Patient[3];
            txtEmail.Text = Patient[4];
            txtMarital.Text = Patient[7];
            ProfilePic.Src = "../Handler/ImageHandler.ashx?PatientID=" + PatientID.ToString();
            ProfilePic.Visible = true;
            btnSave.Text = "Update";
            btnnew.Visible = true;
            HiddenField1.Value = PatientID.ToString();
        }
        #endregion EditPatients

        #region SearchButtonClick
        protected void btnSearch_ServerClick1(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            DataRow dr = null;//;
            string path = Server.MapPath("~/Content/ProfilePics/").ToString();
            string Name = Request.Form["txtSearch"];
            if (Name != "")
            {
                DataTable dt = PatientObj.GetSearchWithName(Name);
                dr = dt.NewRow();
                dr = dt.Rows[0];
                DateTime date = DateTime.Now;
                int year = date.Year;
                Guid PatientID = Guid.Parse(dr["PatientID"].ToString());
                txtName.Text = dr["Name"].ToString();
                txtSex.Text = dr["Gender"].ToString();
                DateTime DT = Convert.ToDateTime(dr["DOB"].ToString());
                int Age = year - DT.Year;
                txtAge.Text = Age.ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtMobile.Text = dr["Phone"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtMarital.Text = dr["MaritalStatus"].ToString();
                
                HiddenField1.Value = PatientID.ToString();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Invalid Suggesion');", true);

            }
        }
        #endregion SearchButtonClick

        #region GridDelete
        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {
            Patient PatientObj = new Patient();
            Guid PatientID = Guid.Parse(e.CommandArgument.ToString());
            PatientObj.PatientID = PatientID;
            PatientObj.DeletePatientDetails();
            gridDataBind();
        }

        protected void ImgBtnDelete1_Command(object sender, CommandEventArgs e)
        {
            Patient PatientObj = new Patient();
            Guid PatientID = Guid.Parse(e.CommandArgument.ToString());
            PatientObj.PatientID = PatientID;
            PatientObj.DeletePatientDetails();

            gridDataBind();
        }
        #endregion GridDelete

        #region clearfield
        public void ClearFields()
        {
            txtName.Text = "";
            txtSex.Text = "";
            txtAge.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtMarital.Text = "";
            btnSave.Text = "Save";
            lblErrorCaption.Text = "";
            lblMsgges.Text = "";
            ProfilePic.Src = "../Images/UploadPic.png";
        }
        #endregion clearfield

        #region BookingToken
        protected void btntokenbooking_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            tok.DoctorID = ddlDoctorName.SelectedValue;
            tok.PatientID = HiddenField1.Value;
            tok.ClinicID = UA.ClinicID.ToString();
            tok.CreateDate = DateTime.Now;
            tok.DateTime = DateTime.Now;
            tok.CreatedBy = UA.userName;

            int tokenNo = tok.InsertToken();

            lblTokencount.Text = "Token No: " + tokenNo.ToString();
            lblToken.Visible = true;
            divDisplayNumber.Visible = true;
        }
        #endregion BookingToken

        #region ClearScreen
        protected void btnnew_Click(object sender, EventArgs e)
        {
            ClearFields();
            btnnew.Visible = false;
            divDisplayNumber.Visible = false;
        }
        #endregion ClearScreen

        #region Paging 
        protected void dtgViewAllRegistration_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dtgViewAllRegistration.PageIndex = e.NewPageIndex;
            dtgViewAllRegistration.DataBind();
        }

        #endregion Paging

        #region convertImage
        private byte[] ConvertImageToByteArray(FileUpload fuImage)
        {
            byte[] ImageByteArray;
            try
            {
                MemoryStream ms = new MemoryStream(fuImage.FileBytes);
                ImageByteArray = ms.ToArray();
                return ImageByteArray;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion convertImage

    }

}