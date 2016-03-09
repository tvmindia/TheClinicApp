using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            Random random = new Random();
            int verificationCode = random.Next(1000, 10000);
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {

        }
    }
}