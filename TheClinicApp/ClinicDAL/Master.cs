using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace TheClinicApp.ClinicDAL
{
    public class Master
    {
        ErrorHandling eObj = new ErrorHandling();
        #region Connectionstring
        dbConnection dcon = new dbConnection();
        #endregion Connectionstring
        #region Groupproperty
        public Guid GroupID
        {
            get;
            set;
        }
        public string GroupName
        {
            get;
            set;
        }
        public string Logo
        {
            get;
            set;
        }
        #endregion Groupproperty
        #region ClinicProperty
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
        public string Location
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
         
       #endregion ClinicProperty
        #region AddGroups
        public void InsertGroups()
        {
             SqlConnection con = null;
            try
            {
                
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "[InsertGroup]";
                pud.Parameters.Add("@GroupID", SqlDbType.UniqueIdentifier).Value = GroupID;
                pud.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                pud.Parameters.Add("@Logo", SqlDbType.VarBinary, 255).Value = Phone;
                pud.Parameters.Add("@CreatedBY", SqlDbType.DateTime).Value = "Thomson";
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

        #endregion AddGroups

        #region AddClinics
         public void InsertClinics()
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "[InsertClinics]";
                pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
                pud.Parameters.Add("@GroupID", SqlDbType.UniqueIdentifier).Value = GroupID;
                pud.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                pud.Parameters.Add("@Location", SqlDbType.NVarChar, 255).Value = Location;
                pud.Parameters.Add("@Address", SqlDbType.NVarChar, 255).Value = Address;
                pud.Parameters.Add("@Phone", SqlDbType.NVarChar, 50).Value = Phone;
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
        #endregion AddClinics
    }
       
    }