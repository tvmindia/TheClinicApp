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
        #region TokenProperty
        
        public int TokenNo
        {
            get;
            set;
        }

        public string DoctorID
        {
            get;
            set;

        }


        public string PatientID
        {
            get;
            set;
        }

        public DateTime DateTime
        {
            get;
            set;

        }

        public string ClinicID
        {
            get;
            set;
        }

        public string CreatedBy
        {
            get;
            set;
        }
        public DateTime CreateDate
        {
            get;
            set;

        }


        

        
        #endregion Token_Property



        //Methods
        #region Token_Methods

              



        public DataSet ViewToken()
        {

            SqlConnection con = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;

            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[GetTokens]";

             //want to add codding


            sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            ds = new DataSet();
            sda.Fill(ds);
            
            return ds;


        }
        public void DeleteToken(int id)
        {
            SqlConnection con = null;
         

            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[DeleteToken]";
            cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = id;
            //want to add codding
            cmd.ExecuteNonQuery();


            
        }

        public void GenerateToken()
        {

            SqlConnection con = null;
            

            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[InsertTokens]";

            //cmd.Parameters.Add("@TokenNo", SqlDbType.Int) = TokenNo;

            cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
            cmd.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
            cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
            cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
            cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
            cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreateDate;



            cmd.ExecuteNonQuery();



           
        
        }

        #endregion Token_Methods




    }
}