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

namespace TheClinicApp.Registration
{
    public partial class Patients : System.Web.UI.Page
    {
        #region GlobalVariables
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        Patient PatientObj = new Patient();
        TokensBooking tok = new TokensBooking();
        ErrorHandling eObj = new ErrorHandling();
        #endregion GlobalVariables
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
            PatientObj.ClinicID = UA.ClinicID;
            DateTime _date = DateTime.Now;
            if (txtAge.Text != "")
            {
                int age = Convert.ToInt32(txtAge.Text);
                int year = _date.Year;
                int DOB = year - age;
                PatientObj.DOB = DateTime.Parse(DOB + "-01-01");
            }            
            string clinID = UA.ClinicID.ToString();
            PatientObj.Name = txtName.Text;
            PatientObj.Address = txtAddress.Text;
            PatientObj.Phone = txtMobile.Text;
            PatientObj.Email = txtEmail.Text;
            if (rdoMale.Checked == true)
            {
                PatientObj.Gender = "Male";
            }
            else
            {
                if (rdoFemale.Checked == true)
                {
                    PatientObj.Gender = "Female";
                }
            }

            if (rdoSingle.Checked == true)
            {
                PatientObj.MaritalStatus ="Single";
            }
            else if (rdoMarried.Checked == true)
                {
                    PatientObj.MaritalStatus ="Married";
                }
            else if (rdoDivorced.Checked == true)
                {
                    PatientObj.MaritalStatus = "Divorced";
                }
            
            
            PatientObj.Occupation = "BUSINESS";
            PatientObj.CreatedBy = UA.userName;
            PatientObj.UpdatedBy = UA.userName;
            string filenum = "F"+clinID.Substring(0,4) + txtName.Text.Substring(0, 3) + txtMobile.Text.Substring(7,3);
            PatientObj.FileNumber = filenum.Trim();

            if (HiddenField1.Value=="")
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
                
                var page = HttpContext.Current.CurrentHandler as Page;

            }
            else
            {
                PatientObj.PatientID = Guid.Parse(HiddenField1.Value);
                PatientObj.UpdatePatientDetails();
                var page = HttpContext.Current.CurrentHandler as Page;
            }
            gridDataBind();
            lblFileCount.Text = PatientObj.FileNumber;
            lblFile.Text = PatientObj.FileNumber;
            lblName.Text = txtName.Text;
            lblAge.Text = txtAge.Text;
            lblPhone.Text = txtMobile.Text;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "openModal();", true);
        }

        #endregion MainButton

        #region GridBind
        public void gridDataBind()
        {

            
            #region GridAllRegistration
            dtgViewAllRegistration.EmptyDataText = "No Records Found";
            dtgViewAllRegistration.DataSource = PatientObj.GetAllRegistration();
            dtgViewAllRegistration.DataBind();
            #endregion GridAllRegistration

            listFilter = null;
            listFilter = BindName();
            #region GridDateRegistration
            dtgViewTodaysRegistration.EmptyDataText = "....Till Now No Registration....";
            dtgViewTodaysRegistration.DataSource = PatientObj.GetDateRegistration();
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
            if (Patient[6].Trim() == "Male")
            {
                rdoFemale.Checked = false;
                rdoMale.Checked = true;
            }
            else if (Patient[6].Trim() == "Female")
            {
                rdoMale.Checked = false;
                rdoFemale.Checked = true;
            }
            
            DateTime dt = Convert.ToDateTime(Patient[5]);
            int Age = year - dt.Year;
            txtAge.Text = Age.ToString();
            txtAddress.Text = Patient[2];
            txtMobile.Text = Patient[3];
            txtEmail.Text = Patient[4];
            if (Patient[7].Trim()=="Single")
            {
                rdoDivorced.Checked = false;
                rdoMarried.Checked = false;
                rdoSingle.Checked = true;
            }
            else if(Patient[7].Trim()=="Married")
            {
                rdoDivorced.Checked = false;
                rdoSingle.Checked = false;
                rdoMarried.Checked = true;
            }
            else if (Patient[7].Trim() == "Divorsed")
            {
                rdoSingle.Checked = false;
                rdoMarried.Checked = false;
                rdoDivorced.Checked = true;
            }
                        
            ProfilePic.Src = "../Handler/ImageHandler.ashx?PatientID=" + PatientID.ToString();
            ProfilePic.Visible = true;
            btnnew.Visible = true;
            HiddenField1.Value = PatientID.ToString();
            
        }
        #endregion EditPatients

        #region SearchButtonClick
        protected void btnSearch_ServerClick1(object sender, EventArgs e)
        {
           
            DataRow dr = null;
            string path = Server.MapPath("~/Content/ProfilePics/").ToString();
            string Name = Request.Form["txtSearch"];
            if (Name != " ")
            {
                DataTable dt = PatientObj.GetSearchWithName(Name);
                dr = dt.NewRow();
                dr = dt.Rows[0];
                DateTime date = DateTime.Now;
                int year = date.Year;
                Guid PatientID = Guid.Parse(dr["PatientID"].ToString());
                txtName.Text = dr["Name"].ToString();
                string Gender= dr["Gender"].ToString();
                if (Gender.Trim() == "Male")
                {

                    rdoMale.Checked = true;
                }
                else if (Gender.Trim() == "Female")
                {
                    rdoFemale.Checked = true;
                }
                DateTime DT = Convert.ToDateTime(dr["DOB"].ToString());
                int Age = year - DT.Year;
                txtAge.Text = Age.ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtMobile.Text = dr["Phone"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                string Status= dr["MaritalStatus"].ToString();
                if (Status.Trim() == "Single")
                {
                    rdoSingle.Checked = true;
                }
                else if (Status.Trim() == "Married")
                {
                    rdoMarried.Checked = true;
                }
                else if (Status.Trim() == "Divorsed")
                {
                    rdoDivorced.Checked = true;
                }
                ProfilePic.Src = "../Handler/ImageHandler.ashx?PatientID=" + PatientID.ToString();
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
            
            txtAge.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            
            lblErrorCaption.Text = "";
            lblMsgges.Text = "";
            ProfilePic.Src = "../Images/UploadPic.png";
        }
        #endregion clearfield

        #region BookingToken
        protected void btntokenbooking_Click(object sender, EventArgs e)
        {
            btnnew.Visible = true;
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            tok.DoctorID = ddlDoctorName.SelectedValue;
            tok.PatientID = HiddenField1.Value;
            if(tok.PatientID=="")
            {
                tok.PatientID = PatientObj.GetPatientID(txtName.Text, txtAddress.Text, txtMobile.Text, txtEmail.Text).ToString();
                
            }
            tok.ClinicID = UA.ClinicID.ToString();
            tok.CreateDate = DateTime.Now;
            tok.DateTime = DateTime.Now;
            tok.CreatedBy = UA.userName;
            int tokenNo = tok.InsertToken();
            lblTokencount.Text = ":" + tokenNo.ToString();
            lblToken.Visible = true;
            divDisplayNumber.Visible = true;
        }
        #endregion BookingToken

        #region ClearScreen
        protected void btnnew_Click(object sender, EventArgs e)
        {
            ClearFields();
            ProfilePic.Src = "../Images/UploadPic.png";
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