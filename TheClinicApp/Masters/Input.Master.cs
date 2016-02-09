using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp.Masters
{
    public partial class Input : System.Web.UI.MasterPage
    {
        UIClasses.Const Const = new UIClasses.Const();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)

        {
            if (Session[Const.LoginSession] == null)
            {
                Response.Redirect(Const.LoginPage);
            }
            
        
        }

       
    }
}