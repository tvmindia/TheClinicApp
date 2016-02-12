﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace TheClinicApp.ClinicDAL
{
    public class Patient
    {
        ErrorHandling eObj = new ErrorHandling();
        #region Connectionstring
        dbConnection dcon = new dbConnection();
        #endregion Connectionstring
         
        #region Patientproperty
        public Guid PatientID
        {
            get;
            set;
        }
        public Guid ClinicID 
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
        public string Email
        {
            get;
            set;
        }
        public string DOB
        {
            get;
            set;
        }
        public string Gender
        {
            get;
            set;
        }
        public string MaritalStatus
        {
            get;
            set;
        }
        public string Occupation
        {
            get;
            set;
        }
        public string UDF
        {
            get;
            set;
        }
        #endregion Patientproperty

        #region AddPatientDetails
        public void AddPatientDetails()
        {

            SqlConnection con = null;
            try
            {
                
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "[InsertPatientDetails]";
                pud.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
                pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
                pud.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                pud.Parameters.Add("@Address", SqlDbType.NVarChar, 255).Value = Address;
                pud.Parameters.Add("@Phone", SqlDbType.NVarChar, 50).Value = Phone;
                pud.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = Email;
                pud.Parameters.Add("@DOB", SqlDbType.Date).Value = DOB;
                pud.Parameters.Add("@Gender", SqlDbType.NVarChar, 50).Value = Gender;
                pud.Parameters.Add("@MaritalStatus", SqlDbType.NVarChar, 50).Value = MaritalStatus;
                pud.Parameters.Add("@Occupation", SqlDbType.NVarChar, 255).Value = Occupation;
                pud.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                SqlParameter Output = new SqlParameter();
                Output.DbType = DbType.Int32;
                Output.ParameterName = "@Status";
                Output.Direction = ParameterDirection.Output;
                pud.Parameters.Add(Output);              
                pud.ExecuteNonQuery();

                if (Output.Value.ToString() == "")
                {
                    //not successfull   

                    var page = HttpContext.Current.CurrentHandler as Page;
                    eObj.InsertionNotSuccessMessage(page);

                }
                else
                {
                    //successfull
                    
                    var page = HttpContext.Current.CurrentHandler as Page;
                    eObj.InsertionSuccessMessage(page);


                }


            }
            catch (Exception ex)
            {
                var page = HttpContext.Current.CurrentHandler as Page;
                eObj.ErrorData(ex, page);
            
            }

            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }

            }
            
        }
        #endregion AddPatientDetails

        #region UpdatePatientDetails
        /// <summary>
        /// Updates the PatientDetails
        /// </summary>
        public void UpdateBOQ(string username)
        {
            SqlConnection con = null;
            try
            {
                
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "UpdatePatientDetails";
                pud.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
                pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
                pud.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                pud.Parameters.Add("@Address", SqlDbType.NVarChar, 255).Value = Address;
                pud.Parameters.Add("@Phone", SqlDbType.NVarChar, 50).Value = Phone;
                pud.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = Email;
                pud.Parameters.Add("@DOB", SqlDbType.Date).Value = DOB;
                pud.Parameters.Add("@Gender", SqlDbType.NVarChar, 50).Value = Gender;
                pud.Parameters.Add("@MaritalStatus", SqlDbType.NVarChar, 50).Value = MaritalStatus;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = username;
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                SqlParameter OutparamId = pud.Parameters.Add("@OutparamId", SqlDbType.SmallInt);
                OutparamId.Direction = ParameterDirection.Output;

                pud.ExecuteNonQuery();
                //if (int.Parse(OutparamId.Value.ToString()) != 0)
                //{
                //    //not successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page, "Not Updated");
                //}
                //else
                //{
                //    //successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page);
                //}


            }
            catch (Exception ex)
            {
                //var page = HttpContext.Current.CurrentHandler as Page;
                //eObj.ErrorData(ex, page);
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
        #endregion UpdatePatientDetails

        #region GetPatientDetails
        public void GetPatientDetails()
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "UpdatePatientDetails";
                pud.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
                
                SqlParameter OutparamId = pud.Parameters.Add("@OutparamId", SqlDbType.SmallInt);
                OutparamId.Direction = ParameterDirection.Output;
                SqlDataReader dr;
                dr=pud.ExecuteReader();
                //if (int.Parse(OutparamId.Value.ToString()) != 0)
                //{
                //    //not successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page, "Not Updated");
                //}
                //else
                //{
                //    //successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page);
                //}


            }
            catch (Exception ex)
            {
                //var page = HttpContext.Current.CurrentHandler as Page;
                //eObj.ErrorData(ex, page);
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

        #region SearchPatientDetails
        public void SearchPatientDetails(string searchtxt)
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "UpdatePatientDetails";
                pud.Parameters.Add("@string", SqlDbType.NVarChar, 255).Value = searchtxt;
               
                SqlParameter OutparamId = pud.Parameters.Add("@OutparamId", SqlDbType.SmallInt);
                OutparamId.Direction = ParameterDirection.Output;
                string strreturn;
                strreturn=pud.ExecuteScalar().ToString();
                //if (int.Parse(OutparamId.Value.ToString()) != 0)
                //{
                //    //not successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page, "Not Updated");
                //}
                //else
                //{
                //    //successfull
                //    var page = HttpContext.Current.CurrentHandler as Page;
                //    eObj.UpdationSuccessData(page);
                //}


            }
            catch (Exception ex)
            {
                //var page = HttpContext.Current.CurrentHandler as Page;
                //eObj.ErrorData(ex, page);
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

        #endregion SearchPatientDetails

        #region ViewAllRegistration
        /// <summary>
        /// ***********
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllRegistration()
        {
            SqlConnection con = null;
           
            try
            {
                DataTable dt = new DataTable();
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand("ViewAllRegistration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                dt = new DataTable();
                adapter.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                //var page = HttpContext.Current.CurrentHandler as Page;
                //eObj.ErrorData(ex, page);
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
        #endregion ViewAllRegistration

        #region ViewDateRegistration
        public DataTable GetDateRegistration()
        {
            SqlConnection con = null;
            try
            {
                DateTime now = DateTime.Now;
                DataTable dt1 = new DataTable();
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand("ViewDateRegistration", con);
                cmd.Parameters.Add("@CreatedDate", SqlDbType.NVarChar, 50).Value = now.ToString("yyyy-MM-dd");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                dt1 = new DataTable();
                adapter.Fill(dt1);
                return dt1;
            }
            catch (Exception ex)
            {
                var page = HttpContext.Current.CurrentHandler as Page;
                eObj.ErrorData(ex, page);
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
        #endregion ViewDateRegistration

    }

}