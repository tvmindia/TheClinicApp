
#region CopyRight

//Author      : SHAMILA T P
//Created Date: Feb-26-2016

#endregion CopyRight

#region Included Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

#endregion Included Namespaces

namespace TheClinicApp.ClinicDAL
{
    public class User
    {

        #region Global Variables
       
        ErrorHandling eObj = new ErrorHandling();
        dbConnection dcon = new dbConnection();


        private Guid Clinic_ID;

        public Guid ClinicID
        {
            get;
            set;
        }

        public Guid UserID
        {
            get;
            set;

        }
        public string loginName
        {
            get;
            set;
         }

        public string firstName
        {
            get;
            set;
        }

        public string lastName
        {
            get;
            set;
        }

        public bool isActive
        {
            get;
            set;
        }

        public string updatedBy
        {
            get;
            set;
        }

        public DateTime updatedDate
        {
            get;
            set;
        }

        public string createdBy
        {
            get;
            set;
        }

        public DateTime createdDate
        {
            get;
            set;
        }

        #endregion Global Variables

        #region AddUser
        public void AddUser()
        {
            dbConnection dcon = new dbConnection();

            try
            {


                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[InsertUsers]";
               
                cmd.Parameters.Add("@LoginName", SqlDbType.NVarChar,255).Value = loginName;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 255).Value = firstName;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 255).Value = lastName;
                cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = isActive;


                //cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = "2C7A7172-6EA9-4640-B7D2-0C329336F289";
                cmd.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = createdBy;
                cmd.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = updatedBy;
               
               
                SqlParameter Output = new SqlParameter();
                Output.DbType = DbType.Int32;
                Output.ParameterName = "@Status";
                Output.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Output);
                cmd.ExecuteNonQuery();

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
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }
        }
        #endregion AddUsers

        #region Update User By UserID

        public void UpdateuserByUserID()
        {
            dbConnection dcon = new dbConnection();

            try
            {


                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateUserByUserID]";

                cmd.Parameters.Add("@LoginName", SqlDbType.NVarChar, 255).Value = loginName;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 255).Value = firstName;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 255).Value = lastName;
                cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = isActive;


                //cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = "2C7A7172-6EA9-4640-B7D2-0C329336F289";
                cmd.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = createdBy;
                cmd.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = updatedBy;


                SqlParameter Output = new SqlParameter();
                Output.DbType = DbType.Int32;
                Output.ParameterName = "@Status";
                Output.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Output);
                cmd.ExecuteNonQuery();

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
                    eObj.UpdationSuccessMessage(page);


                }


            }
            catch (Exception ex)
            {
                var page = HttpContext.Current.CurrentHandler as Page;
                eObj.ErrorData(ex, page);

            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }
        }

        #endregion Update User By UserID

        #region Delete User By UserID

        public void DeleteUserByUserID()
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "DeleteUserByUserID";
                cmd.Parameters.Add("@UserID", SqlDbType.UniqueIdentifier).Value = UserID;

                SqlParameter Output = new SqlParameter();
                Output.DbType = DbType.Int32;
                Output.ParameterName = "@Status";
                Output.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Output);
                cmd.ExecuteNonQuery();
                if (Output.Value.ToString() == "")
                {
                    //not successfull   

                    var page = HttpContext.Current.CurrentHandler as Page;
                    eObj.WarningMessage(page);

                }
                else
                {
                    //successfull

                    var page = HttpContext.Current.CurrentHandler as Page;
                    eObj.DeleteSuccessMessage(page);


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

        #endregion Delete User By UserID

    }
}