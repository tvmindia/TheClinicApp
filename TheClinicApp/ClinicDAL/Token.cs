using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace TheClinicApp.ClinicDAL
{
    public class Token
    {
        //Property
        #region Token_Property
        
        public int TokenNo
        {
            get;
            set;
        }

        public string DoctorId
        {
            get;
            set;

        }

        public DateTime datetime
        {
            get;
            set;

        }

        public string clinicId
        {
            get;
            set;
        }


        

        
        #endregion Token_Property



        //Methods
        #region Token_Methods

              

        public void CreateToken()
        {

        }


        public void ViewToken()
        {

        }
        public void DeleteToken()
        {
            //SqlConnection con = null;
            //DataSet ds = null;
            //SqlDataAdapter sda = null;


            //dbConnection dcon = new dbConnection();
            //con = dcon.GetDBConnection();
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "[sp_name]";



            
        }

        public void generate_token()
        {
            


           
        
        }

        #endregion Token_Methods




    }
}