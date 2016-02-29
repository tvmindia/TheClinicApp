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
            //Doctor DoctorObj = new Doctor();
            Guid PatientID = Guid.Parse(e.CommandArgument.ToString());
        }
    }
}