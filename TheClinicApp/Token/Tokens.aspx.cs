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
            GridViewTokenlist.EmptyDataText = "No Records Found";

            if(!IsPostBack)
            {

                //binding the values of doctor dropdownlist

                DataSet ds = tok.DropBindDoctorsName();

                ddlDoctorName.DataSource = ds.Tables[0];
                ddlDoctorName.DataValueField = "DoctorID";
                ddlDoctorName.DataTextField = "Name";
                ddlDoctorName.DataBind();
            }

            gridviewbind();

        

           

        }

        public void gridviewbind()
        {
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
            
                lblToken.Text = "Token No: " + tokenNo.ToString();
                lblToken.Visible = true;
 
         

            //gridview bind when book button click

                if (IsPostBack)
                {
                    gridviewbind();

                }
           
          

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

                lblFile.Text = "File Number &nbsp&nbsp  : &nbsp &nbsp &nbsp  " + Convert.ToString(dt.Rows[0][0]);
            lblName.Text = Convert.ToString(dt.Rows[0][1]);
            DateTime date = DateTime.Now;
            int year = date.Year;
            DateTime dateTimeObj = Convert.ToDateTime(dt.Rows[0][2]);
            int Age = year - dateTimeObj.Year;
            lblAge.Text = Age.ToString();
            lblPhone.Text ="Phone Number &nbsp&nbsp  : &nbsp &nbsp &nbsp  "+ Convert.ToString(dt.Rows[0][4]);
            if (Convert.ToString(dt.Rows[0][4]) == "")
                {
                  lblPhone.Text ="Phone Number &nbsp&nbsp  : &nbsp &nbsp &nbsp  "+   "Phone Number Not Specified";
                      
                }

                lblGender.Text = Convert.ToString(dt.Rows[0][3]);
            if (Convert.ToString(dt.Rows[0][4]) == "")
            {
                lblGender.Text = "Gender Not Specified";
            }
            HiddenPatientID.Value = Convert.ToString(dt.Rows[0][5]);
            HiddenClinicID.Value = Convert.ToString(dt.Rows[0][6]);
            }
        }

        protected void ImgBtnDelete_Click(object sender, ImageClickEventArgs e)
        {
           
             GridViewRow gr = ((ImageButton)sender).NamingContainer as GridViewRow;
             string ProductID = GridViewTokenlist.DataKeys[gr.RowIndex].Values["UniqueId"].ToString();

             tok.DeleteToken(ProductID);
             gridviewbind();
           
        }

       

     
      
    }
}