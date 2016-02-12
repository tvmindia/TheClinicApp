using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp.Registration
{
    public partial class Patients : System.Web.UI.Page
    {
        ErrorHandling eObj = new ErrorHandling();
        protected void Page_Load(object sender, EventArgs e)
        {
            Patient Patientobj = new Patient();
            #region GridAllRegistration        
            dtgViewAllRegistration.EmptyDataText = "No Records Found";           
            dtgViewAllRegistration.DataSource=Patientobj.GetAllRegistration();
            dtgViewAllRegistration.DataBind();
            #endregion GridAllRegistration

            #region GridDateRegistration
            dtgViewTodaysRegistration.EmptyDataText = "No Records Found";
            dtgViewTodaysRegistration.DataSource = Patientobj.GetDateRegistration();
            dtgViewTodaysRegistration.DataBind();
            #endregion GridDateRegistration
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            DateTime _date = DateTime.Now;          
            Guid g = Guid.NewGuid();
            int age = Convert.ToInt32(txtAge.Text);
            int year = _date.Year;
            int DOB = year - age;
            string guitemp="2c7a7172-6ea9-4640-b7d2-0c329336f289";
            PatientObj.PatientID = g;
            PatientObj.ClinicID = Guid.Parse(guitemp);
            PatientObj.Name = txtName.Text;
            PatientObj.Address = txtAddress.Text;
            PatientObj.Phone = txtMobile.Text; 
            PatientObj.Email = txtEmail.Text;
            PatientObj.DOB = DOB+"-01-01";
            PatientObj.Gender = txtSex.Text;
            PatientObj.MaritalStatus = txtMarital.Text;
            PatientObj.Occupation = "BUSINESS";
            PatientObj.AddPatientDetails();
            var page = HttpContext.Current.CurrentHandler as Page;
           
           

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string value = Request.Form["txtSearch"];
        }
        
    }
}