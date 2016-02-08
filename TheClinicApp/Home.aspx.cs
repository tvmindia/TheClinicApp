using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp
{
    public partial class Home : System.Web.UI.Page
    {
        UIClasses.Const Const = new UIClasses.Const();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session[Const.LoginSession] == null) { }
                else {

                    ClinicDAL.UserAuthendication UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
                    lblUserName.Text = UA.userName;
                    txtclinic.Text = UA.Clinic;
                    lblGroupName.Text = UA.Group;
                }
            }
        }
    }
}