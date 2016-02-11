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

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Patient PatientObj = new Patient();
            Guid g = Guid.NewGuid();
            string guitemp="2c7a7172-6ea9-4640-b7d2-0c329336f289";
            PatientObj.PatientID = g;
            PatientObj.ClinicID = Guid.Parse(guitemp);
            PatientObj.Name = txtName.Text;
            PatientObj.Address = txtAddress.Text;
            PatientObj.Phone = txtMobile.Text;
            PatientObj.Email = txtEmail.Text;
            PatientObj.DOB = txtAge.Text;
            PatientObj.Gender = txtSex.Text;
            PatientObj.MaritalStatus = txtMarital.Text;
            PatientObj.Occupation = "BUSINESS";
            PatientObj.AddPatientDetails();
            var page = HttpContext.Current.CurrentHandler as Page;
           
            //eObj.ErrorMessage(page);
            //eObj.InsertionSuccessMassage(page);
            //eObj.WarningMessage(page);

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            string value = Request.Form["txtSearch"];
        }
        
    }
}