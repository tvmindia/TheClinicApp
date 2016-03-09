using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TheClinicApp.ClinicDAL
{
    public class IssueHeaderDetails
    {

        public IssueHeaderDetails ()
        {


            IssueID = Guid.NewGuid();


        }

        #region Property

        public Guid IssueID
        {
            get;
            set;
        }
        public string ClinicID
        {
            get;
            set;
        }
        public string IssuedTo
        {
            get;
            set;
        }
        public DateTime Date
        {
            get;
            set;
        }
        public string PrescID
        {
            get;
            set;
        }
        public string CreatedBy
        {
            get;
            set;
        }
        public DateTime CreatedDate
        {
            get;
            set;
        }
        public string UpdatedBy
        {
            get;
            set;
        }
        public DateTime UpdatedDate
        {
            get;
            set;
        }
        #endregion Property

        #region Methods 

        #region InsertIssueHeaderDetails
        public void InsertIssueHeaderDetails()
        {
             dbConnection dcon=null;
           try
            {
 

                
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertIssueHeaderDetails]";

                cmd.Parameters.Add("@IssueID", SqlDbType.UniqueIdentifier).Value = IssueID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@IssuedTo", SqlDbType.NVarChar, 255).Value = IssuedTo;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value = Date;
               //? PrescID 
               cmd.Parameters.Add("@PrescID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(PrescID);
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                



                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }

        #endregion InsertIssueHeaderDetails

        #region UpdateIssueHeaderDetails
        public void UpdateIssueHeaderDetails( string IssueID)
        {

            dbConnection dcon = null;

            try
            {

                //DateTime now = DateTime.Now;
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateIssueHeaderDetails]";


                cmd.Parameters.Add("@IssueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(IssueID);
             
                cmd.Parameters.Add("@IssuedTo", SqlDbType.NVarChar, 255).Value = IssuedTo;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value =Date;
               
               
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                //cmd.Parameters.Add("@UpdatedBy", SqlDbType.DateTime).Value = UpdatedDate;


                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }


        #endregion UpdateIssueHeaderDetails

        #region ViewIssueHeaderDetails

        public DataSet ViewIssueHeaderDetails()
        {

            dbConnection dcon = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;
            try
            {

                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[ViewIssueHeaderDetails]";

               

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
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }


        #endregion ViewIssueHeaderDetails

        #region DeleteIssueHeaderDetails
    /// <summary>
    /// 
    /// </summary>
    /// <param name="IssueID"></param>
        public void DeleteIssueHeaderDetails(string IssueID)
        {

            dbConnection dcon = null;

            try
            {


                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteIssueHeaderDetails]";

                cmd.Parameters.Add("@IssueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(IssueID);

                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }



        #endregion DeleteIssueHeaderDetails

        #endregion Methods

    }
    public class IssueDetails
    {

        IssueHeaderDetails ihd = new IssueHeaderDetails();
        
        public IssueDetails()
        {
            UniqueID = Guid.NewGuid();
            
        }


        #region Property
        public Guid UniqueID
        {
            get;
            set;
        }
        public string IssueID
        {
            get;
            set;
        }
        public string ClinicID
        {
            get;
            set;
        }
        public string MedicineID
        {
            get;
            set;
        }
        public int Qty
        {
            get;
            set;
        }
        public string CreatedBy
        {
            get;
            set;
        }
        public DateTime CreatedDate
        {
            get;
            set;
        }
        public string UpdatedBy
        {
            get;
            set;
        }
        public DateTime UpdatedDate
        {
            get;
            set;
        }
        public string ReceiptID
        {
            get;
            set;
        }
        #endregion Property

        #region Methods


        #region InsertIssueDetails
        public void InsertIssueDetails()
        {

            dbConnection dcon = null;

            try
            {

                 
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertIssueDetails]";

                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;
                cmd.Parameters.Add("@IssueID", SqlDbType.UniqueIdentifier).Value = ihd.IssueID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
             
             
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ReceiptID);


                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }

        #endregion InsertIssueDetails

        #region UpdateIssueDetails
        public void UpdateIssueDetails(string UniqueID)
        {

            dbConnection dcon = null;

            try
            {

                DateTime now = DateTime.Now;
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateIssueDetails]";

                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UniqueID);

                cmd.Parameters.Add("@IssueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(IssueID);
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ReceiptID);
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;
               
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = UpdatedDate;

                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }

        }


        #endregion UpdateIssueDetails

        #region ViewIssueDetails

        public DataSet ViewIssueDetails()
        {

            dbConnection  dcon = null;
            DataSet ds = null;
            SqlDataAdapter sda = null;
            try
            {

                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[ViewIssueDetails]";

               

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
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }


            }

        }


        #endregion ViewIssueDetails

        #region DeleteIssueDetails

        public void DeleteIssueDetails(string UniqueID,string MedicineID )
        {

            dbConnection dcon = null;

            try
            {


                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteIssueDetails]";

                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UniqueID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);

                cmd.ExecuteNonQuery();

            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }


            }

        }



        #endregion DeleteIssueDetails



        #endregion Methods

    }
}