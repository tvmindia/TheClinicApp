using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data;
using System.Data.SqlClient;

namespace TheClinicApp.Doctor
{
    public partial class DoctorInformationPage : System.Web.UI.Page
    {
        ErrorHandling eObj = new ErrorHandling();
        TokensBooking tok = new TokensBooking();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewTokenlist.EmptyDataText = "No Records Found";
            gridviewbind();
            //Patient Patientobj = new Patient();
            //#region GridAllRegistration
            //datagrid.EmptyDataText = "No Records Found";
            ////datagrid.DataSource = Patientobj.GetAllRegistration();
            //datagrid.DataBind();
            //#endregion GridAllRegistration
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {

        }
        public void gridviewbind()
        {
            //Gridview Binding to Diplay DoctorName,Token No,Patient Name,TIME
            tok.DateTime = DateTime.Now;
            DataSet gds = tok.ViewToken();
            GridViewTokenlist.DataSource = gds;
            GridViewTokenlist.DataBind();
        }

        protected void ImgBtnUpdate_Command(object sender, CommandEventArgs e)
        {
            DataRow dr = null;
            Patient PatientObj = new Patient();
            PatientObj.PatientID = Guid.Parse(e.CommandArgument.ToString());
            DataTable dt = PatientObj.SelectPatient();
            dr = dt.NewRow();
            dr = dt.Rows[0];
            DateTime date = DateTime.Now;
            int year = date.Year;
            //Guid PatientID = Guid.Parse(dr["PatientID"].ToString());
            lblName.Text= dr["Name"].ToString();
            //lblMale.Text = dr["Gender"].ToString();
            DateTime DT = Convert.ToDateTime(dr["DOB"].ToString());
            int Age = year - DT.Year;
            lblAge.Text = Age.ToString();
            lblAddress.Text = dr["Address"].ToString();
            lblLastVisitDate.Text = dr["CreatedDate"].ToString();
           
            //HiddenField1.Value = PatientID.ToString();
        }
    }
}