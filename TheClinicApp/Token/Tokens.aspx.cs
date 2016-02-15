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


            //Gridview Binding to Diplay DoctorName,Token No,Patient Name,TIME
            tok.DateTime = DateTime.Now;

            DataSet gds = tok.ViewToken();
           
            GridViewTokenlist.DataSource = gds;
            GridViewTokenlist.DataBind();

           

        }

        

     
        /// <summary>
        /// inerting values to tokens table and get the token value
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBookToken_Click(object sender, EventArgs e)
        {

            tok.DoctorID = ddlDoctorName.SelectedValue;
            tok.PatientID = HiddenPatientID.Value;
            tok.ClinicID = HiddenClinicID.Value;
            tok.CreateDate = DateTime.Now;
            tok.DateTime =  DateTime.Now;
            tok.CreatedBy = "GIBIN";
          
          
            
            
            int tokenNo = tok.InsertToken();
            lblToken.Text = tokenNo.ToString();
           
          

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
            DataTable dt=dsPdetails.Tables[0];

            if( dt.Rows.Count>0) 
            {
            lblFile.Text = Convert.ToString(dt.Rows[0][0]);
            lblName.Text = Convert.ToString(dt.Rows[0][1]);
            lblAge.Text = Convert.ToString(dt.Rows[0][2]);
            lblPhone.Text = Convert.ToString(dt.Rows[0][3]);
            lblGender.Text = Convert.ToString(dt.Rows[0][4]);
            HiddenPatientID.Value = Convert.ToString(dt.Rows[0][5]);
            HiddenClinicID.Value = Convert.ToString(dt.Rows[0][6]);
            }
        }
    }
}