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
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            DateTime _date = DateTime.Now;          
            Guid g = Guid.NewGuid();
            int age = Convert.ToInt32(txtAge.Text);
            int year = _date.Year;
            int DOB = year - age;
            string guitemp = "2c7a7172-6ea9-4640-b7d2-0c329336f289";
            PatientObj.PatientID = g;
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
            PatientObj.AddPatientDetails();
            var page = HttpContext.Current.CurrentHandler as Page;
        }
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
            dtgViewTodaysRegistration.EmptyDataText = "No Records Found";
            dtgViewTodaysRegistration.DataSource = Patientobj.GetDateRegistration();
            dtgViewTodaysRegistration.DataBind();
            #endregion GridDateRegistration
        }

       
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            string value = Request.Form["txtSearch"];
          DataTable dt = PatientObj.GetSearchBoxDataByAnyValue(value);
        

        }
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

        protected void ImgBtnUpdate_Command(object sender, CommandEventArgs e)
        {
             
                string[] Patient = e.CommandArgument.ToString().Split(new char[] { ',' });
                Guid PatientID = Guid.Parse(Patient[0]);
                txtName.Text = Patient[1];
                txtSex.Text = Patient[6];
                txtAge.Text = Patient[5];
                txtAddress.Text = Patient[2];
                txtMobile.Text = Patient[3];
                txtEmail.Text = Patient[4];
                txtMarital.Text = Patient[7];
             
        }

        protected void ImgBtnUpdate_Command1(object sender, CommandEventArgs e)
        {
            string[] Patient = e.CommandArgument.ToString().Split(new char[] { ',' });
            Guid PatientID = Guid.Parse(Patient[0]);
            txtName.Text = Patient[1];
            txtSex.Text = Patient[6];
            txtAge.Text = Patient[5];
            txtAddress.Text = Patient[2];
            txtMobile.Text = Patient[3];
            txtEmail.Text = Patient[4];
            txtMarital.Text = Patient[7];
        }

        protected void ImgBtnUpdate1_Command(object sender, CommandEventArgs e)
        {
            string[] Patient = e.CommandArgument.ToString().Split(new char[] { ',' });
            Guid PatientID = Guid.Parse(Patient[0]);
            txtName.Text = Patient[1];
            txtSex.Text = Patient[6];
            txtAge.Text = Patient[5];
            txtAddress.Text = Patient[2];
            txtMobile.Text = Patient[3];
            txtEmail.Text = Patient[4];
            txtMarital.Text = Patient[7];
        }

     
    }
}