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

            cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
            cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
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

            Guid UniqueID = Guid.NewGuid();
            cmd.Parameters.Add("@Unique", SqlDbType.UniqueIdentifier).Value = UniqueID;
            cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
            cmd.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
            cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
            cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
            cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
            cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreateDate;

            SqlParameter OutparmItemId = cmd.Parameters.Add("@TokenNo", SqlDbType.Int);
            OutparmItemId.Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();

           //int token= Convert.ToInt32(OutparmItemId.Value);




           



           
        
        }

        #endregion Token_Methods




    }
}