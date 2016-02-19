using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        ErrorHandling eObj = new ErrorHandling();
        public string listFilter = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            gridDataBind();
            //ProfilePicUpload.onClick += new RadToolBarEventHandler(ProfilePicUpload_onClick);
            //ProfilePicUpload.OnClientButtonClicking = "OnClientButtonClicking";
        }
        #region MainButton
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            DateTime _date = DateTime.Now;          
            
            int age = Convert.ToInt32(txtAge.Text);
            int year = _date.Year;
            int DOB = year - age;
            string guitemp = "2c7a7172-6ea9-4640-b7d2-0c329336f289";
            
            PatientObj.ClinicID = Guid.Parse(guitemp);
            PatientObj.Name = txtName.Text;
            PatientObj.Address = txtAddress.Text;
            PatientObj.Phone = txtMobile.Text;
            PatientObj.Email = txtEmail.Text;
            PatientObj.DOB = DOB + "-01-01";
            PatientObj.Gender = txtSex.Text;
            PatientObj.MaritalStatus = txtMarital.Text;
            PatientObj.Occupation = "BUSINESS";
            //PatientObj.image =null ;
            if (btnSave.Text=="SAVE")
            {
                Guid g = Guid.NewGuid();
                PatientObj.PatientID = g;
                PatientObj.AddPatientDetails();
                var page = HttpContext.Current.CurrentHandler as Page;
            }
            else if(btnSave.Text=="Update")
            {
                PatientObj.PatientID = Guid.Parse(HiddenField1.Value);
                PatientObj.UpdatePatientDetails();
                var page = HttpContext.Current.CurrentHandler as Page;
            }
            gridDataBind();
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
        }
        #endregion GridBind


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
            btnSave.Text = "Update";
            HiddenField1.Value = PatientID.ToString();
        }

        protected void ImgBtnUpdate1_Command(object sender, CommandEventArgs e)
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
            btnSave.Text = "Update";
            HiddenField1.Value = PatientID.ToString();
        }
        #endregion EditPatients

        #region SearchButtonClick
        protected void btnSearch_ServerClick1(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            DataRow dr = null;//;
            string Name = Request.Form["txtSearch"];
            DataTable dt=PatientObj.GetSearchWithName(Name);
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
            btnSave.Text = "Update";
            HiddenField1.Value = PatientID.ToString();
        }
        #endregion SearchButtonClick

        #region GridDelete
        protected void ImgBtnDelete_Command(object sender, CommandEventArgs e)
        {
            Patient PatientObj = new Patient();
            Guid PatientID = Guid.Parse(e.CommandArgument.ToString());
            PatientObj.PatientID = PatientID;
            PatientObj.DeletePatientDetails();
        }

        protected void ImgBtnDelete1_Command(object sender, CommandEventArgs e)
        {   
            Patient PatientObj = new Patient();
            Guid PatientID = Guid.Parse(e.CommandArgument.ToString());
            PatientObj.PatientID = PatientID;
            PatientObj.DeletePatientDetails();

        }
        #endregion GridDelete

    }
}