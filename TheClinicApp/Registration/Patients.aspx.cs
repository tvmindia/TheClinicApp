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
            if (FileUpload1.HasFile)
            {
                byte[] ImageByteArray = null;
                ImageByteArray = ConvertImageToByteArray(FileUpload1);
                PatientObj.Picupload = ImageByteArray;
                PatientObj.ImageType = Path.GetExtension(FileUpload1.PostedFile.FileName);
                
            }
            
            if (btnSave.Text == "SAVE")
            {
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
        //}
        public void MakeFile(DataRow dr, string fileName, string filePath)
        {
            byte[] buffer = (byte[])dr["image"];
            //byte[] buffer = new byte[dr["image"], 0, null, 0, int.MaxValue)];dr["image"], 0, buffer, 0, int.MaxValue);

            System.IO.File.WriteAllBytes(filePath + fileName, buffer);
                                   
        }
       


        //public void FileInsert()
        //{
        //    Control ctl = this.Parent;
        //    bool isValidFile = false;
        //    bool largerSize = false;
        //    try
        //    {
        //        //validation
        //        isValidFile = ValidateFileType();
        //        int Size = Convert.ToInt32(FileUpload1.PostedFile.ContentLength) / 1024;
        //        int sizeinMB = Size / 1024;
        //        string fileSize;
        //        if (sizeinMB == 0)
        //        {
        //            fileSize = Size + "KB";
        //        }
        //        else
        //        {
        //            fileSize = sizeinMB + "MB";
        //        }
        //        largerSize = ValidateSize(sizeinMB);

        //        if ((isValidFile) && (FileUpload1.PostedFile.ContentLength > 0))
        //        {
        //            if (largerSize == false)
        //            {
        //                string tempFile = "";
        //                string filePath = Server.MapPath("/Content/Fileupload/");
        //                string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
        //                string fileName = FileUpload1.PostedFile.FileName;
        //                string pathToCheck = filePath + fileName;
        //                if (System.IO.File.Exists(pathToCheck))
        //                {
        //                    int counter = 2;
        //                    while (System.IO.File.Exists(pathToCheck))
        //                    {
        //                        tempFile = "(" + counter.ToString() + ")" + fileName;
        //                        pathToCheck = filePath + tempFile;
        //                        counter++;
        //                    }
        //                    fileName = tempFile;
        //                }
        //                filePath += fileName;
        //                FileUpload1.SaveAs(filePath);
        //                {
        //                    if (type_value == "BOQ" || type_value == "BOQHeader")
        //                    {
        //                        cmd = new SqlCommand();
        //                        cmd.Connection = cntion.GetDBConnection();
        //                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //                        cmd.CommandText = "[InsertDocAttachmentDetails]";

        //                        // cmd.Parameters.Add("@paramId", SqlDbType.Int).Value = Id;
        //                        cmd.Parameters.Add("@Filename", SqlDbType.NVarChar, 100).Value = fileName.ToString();
        //                        cmd.Parameters.Add("@Image", SqlDbType.VarBinary).Value = FileUpload1.FileContent;
        //                        cmd.Parameters.Add("@Filetype", SqlDbType.NVarChar, 5).Value = ext;
        //                        cmd.Parameters.Add("@Filesize", SqlDbType.NVarChar, 50).Value = fileSize;
        //                        cmd.Parameters.Add("@Date", SqlDbType.SmallDateTime).Value = System.DateTime.Now;
        //                        cmd.Parameters.Add("@userName", SqlDbType.VarChar, 50).Value = UA.userName;
        //                        cmd.Parameters.Add("@Type", SqlDbType.VarChar, 50).Value = type_value;

        //                        cmd.Parameters.Add("@itemID", SqlDbType.UniqueIdentifier).Value = (Guid.Parse(ItemID) != Guid.Empty) ? Guid.Parse(ItemID) : Guid.Empty;


        //                        cmd.Parameters.Add("@RevisionID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(RevisionID);

        //                        SqlParameter ouparamid = cmd.Parameters.Add("@outparamid", SqlDbType.UniqueIdentifier);
        //                        ouparamid.Direction = ParameterDirection.Output;
        //                        cmd.ExecuteNonQuery();


        //                        lblmsg.ForeColor = System.Drawing.Color.Green;
        //                        lblmsg.Text = "File uploaded successfully.";
        //                    }
        //                    else
        //                    {
        //                        //byte[] buffer;
        //                        //buffer = (byte[])dt.Rows[0]["BinaryFile"];
        //                        punchObj.image = FileUpload1.FileContent;
        //                        punchObj.FileType = ext;
        //                        punchObj.id = EILId;
        //                        punchObj.EILType = EilType;
        //                        punchObj.fileSize = fileSize;
        //                        punchObj.fileUpload = fileName.ToString();
        //                        punchObj.InsertEILAttachment();
        //                    }
        //                }
        //            }
        //            else
        //            {
        //                if (largerSize == true)
        //                {
        //                    lblmsg.ForeColor = System.Drawing.Color.Red;
        //                    lblmsg.Text = "File should  be less than 10 mb of size";
        //                }
        //                if (FileUpload1.PostedFile.ContentLength == 0)
        //                {
        //                    lblmsg.ForeColor = System.Drawing.Color.Red;
        //                    lblmsg.Text = "File Does not have content..";
        //                }
        //            }

        //        }
        //        else
        //        {
        //            if (isValidFile == false)
        //            {
        //                lblmsg.ForeColor = System.Drawing.Color.Red;
        //                lblmsg.Text = "Please Upload bmp,gif,png,jpg,jpeg,doc,docx,xls,xlsx,pdf file types";
        //            }
        //        }

        //        //validation


        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        // DropFill();
        //        if (cntion.GetDBConnection() != null)
        //        {
        //            cntion.GetDBConnection().Close();
        //        }
        //    }

        //}


    }

}