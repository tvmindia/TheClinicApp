﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace TheClinicApp.ClinicDAL
{
    public class TokensBooking
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


        #region GetPatientDetails

        public DataSet GetpatientDetails( string str)
        {
            SqlConnection con = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;
            try
            {
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[ViewPatientDetails]";

                cmd.Parameters.Add("@string", SqlDbType.NVarChar).Value = str;
                 
                sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
               
                ds = new DataSet();
                sda.Fill(ds);

                return ds;

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }

            }
        }

        #endregion GetPatientDetails


        #region Doctorbind
        /// <summary>
        /// get datas from doctors table
        /// </summary>
        /// <returns> return doctor dataset</returns>
        public DataSet DropBindDoctorsName()
        {
            SqlConnection con = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;
            try
            {
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[GetDoctorDetails]";

                 sda= new SqlDataAdapter(cmd) ;
                 ds = new DataSet();
                 sda.Fill(ds);

                 return ds;
                

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }

            }

        
    
        }

        #endregion Doctorbind

        #region InsertToken
        /// <summary>
        /// to insert a new token all params should be set.
        /// </summary>
        /// <returns>return generated token number</returns>
        public int InsertToken()
        {

            SqlConnection con = null;
            
            try
            {

            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[InsertTokens]";

           // Guid UniqueID = Guid.NewGuid();
          //  cmd.Parameters.Add("@Unique", SqlDbType.UniqueIdentifier).Value = UniqueID;
            cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(DoctorID);
            cmd.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(PatientID);
            cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
            cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
            cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
            cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreateDate;

            SqlParameter OutparmItemId = cmd.Parameters.Add("@TokenNo", SqlDbType.Int);
            OutparmItemId.Direction = ParameterDirection.Output;

           

            cmd.ExecuteNonQuery();
            TokenNo = Convert.ToInt32(OutparmItemId.Value);
            return TokenNo;
                 
             }

            catch (Exception ex)
            {
                 
                throw ex;
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }

            }
         




        }
        #endregion InsertToken

        #region ViewToken
        public DataSet ViewToken()
        {

            SqlConnection con = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;
            try
            { 
            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[ViewPatientsBooking]";

            //cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
            cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
            sda = new SqlDataAdapter();
            cmd.ExecuteNonQuery();
            sda.SelectCommand = cmd;
            ds = new DataSet();
            sda.Fill(ds);
          

            return ds;

            }

            catch (Exception ex)
            {
                 
                throw ex;
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }

            }

        }

        #endregion ViewToken
 
        #region DeleteToken

        /// <summary>
        /// to delete tokens
        /// </summary>
        /// <param name="id"></param>
        
        public void DeleteToken(int id)
        {
            SqlConnection con = null;

            try
            {          
            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[DeleteToken]";
            cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = id;            
            cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }
            }



            
        }

        #endregion DeleteToken

     
        
        #endregion Token_Methods




    }
}