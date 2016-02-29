using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;

namespace TheClinicApp.Doctor
{
    public partial class DoctorInformationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}