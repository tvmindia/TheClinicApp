using System;
using System.Collections.Generic;
using System.Data;
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
            
            if (!IsPostBack) 
            {
                if (Session[Const.LoginSession] == null) 
                {
                    Response.Redirect(Const.LoginPage);
                
                }
                else 
                {

                    ClinicDAL.UserAuthendication UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
                    string LoginName=UA.userName;
                    lblUserName.Text = LoginName;
                    txtclinic.Text = UA.Clinic;
                    lblGroupName.Text = UA.Group;
                    string Role=UA.GetRoleName(LoginName);


                }
            }
        }
        

    
    }
}