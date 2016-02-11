using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace TheClinicApp.Token
{
    public partial class Tokens : System.Web.UI.Page
    {


        ErrorHandling eObj = new ErrorHandling();
        TokensBooking tok = new TokensBooking();
         
        protected void Page_Load(object sender, EventArgs e)
        {


            if(!IsPostBack)
            {

                //binding the values of doctor dropdownlist

                DataSet ds = tok.DropBindDoctorsName();

                ddlDoctorName.DataSource = ds.Tables[0];
                ddlDoctorName.DataValueField = "DoctorID";
                ddlDoctorName.DataTextField = "Name";
                ddlDoctorName.DataBind();
            }


           

        }

        

     

        protected void btnBookToken_Click(object sender, EventArgs e)
        {
            //tokenNo get the token value
            int tokenNo = tok.InsertToken();
           
          

        }
       /// <summary>
       /// patient search
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {

            
            string value = Request.Form["txtSearch"];
             
            DataSet dsPdetails = tok.GetpatientDetails(value);


        }
    }
}