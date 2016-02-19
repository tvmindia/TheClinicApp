using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TheClinicApp.ClinicDAL
{
    public class Receipt
    {
        #region Property

        public string ReceiptID
        {
            get;
            set;
        }
        public string ClinicID
        {
            get;
            set;
        }
        public string RefNo1
        {
            get;
            set;
        }
        public string RefNo2
        {
            get;
            set;

        }
        public DateTime Date
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

        #region InsertReceiptHeaderDetails
        public void InsertReceiptHeaderDetails()
        {


            SqlConnection con = null;

            try
            {

                Guid ReceiptID = new Guid();

                DateTime now = DateTime.Now;
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertReceiptHeaderDetails]";

                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@RefNo1", SqlDbType.NVarChar, 255).Value = RefNo1;
                cmd.Parameters.Add("@RefNo2", SqlDbType.NVarChar, 255).Value = RefNo2;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value = now.ToString("yyyy-MM-dd");
         
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;



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

        #endregion InsertReceiptHeaderDetails
        
        #region UpdateReceiptHeaderDetails
        public void UpdateReceiptHeaderDetails()
        {

            SqlConnection con = null;

            try
            {

                DateTime now = DateTime.Now;
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateReceiptHeaderDetails]";



                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;

                //cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);

                cmd.Parameters.Add("@RefNo1", SqlDbType.NVarChar, 255).Value = RefNo1;
                cmd.Parameters.Add("@RefNo2", SqlDbType.NVarChar, 255).Value = RefNo2;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value = now.ToString("yyyy-MM-dd");

                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;


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


        #endregion UpdateReceiptHeaderDetails

        #region ViewReceipteHeaderDetails

        public DataSet ViewReceiptHeaderDetails()
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
                cmd.CommandText = "[ViewReceiptHeaderDetails]";

                //cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
                //cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
                //cmd.Parameters.Add("@DateTime", SqlDbType.NVarChar, 50).Value = now.ToString("yyyy-MM-dd");

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


        #endregion ViewReceiptHeaderDetails

        #region DeleteReceiptHeaderDetails
        public void DeleteReceiptHeaderDetails()
        {

            SqlConnection con = null;

            try
            {


                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteReceiptHeaderDetails]";

                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value =ReceiptID;

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

        #endregion InsertReceiptHeaderDetails

        #endregion Methods

    }

    public class ReceiptDetails
    {
        #region Property

        public string UniqueID
        {
            get;
            set;
        }
        public string ReceiptID
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
        public int Unit
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


        #region InsertReceiptDetails
        public void InsertReceiptDetails()
        {


            SqlConnection con = null;

            try
            {

                Guid UniqueID = new Guid();

                DateTime now = DateTime.Now;
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertReceiptDetails]";

                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;
                
                cmd.Parameters.Add("@Unit", SqlDbType.Real).Value = Unit;                           

                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;



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

        #endregion InsertReceiptDetails

        #region UpdateReceiptDetails
        public void UpdateReceiptDetails()
        {

            SqlConnection con = null;

            try
            {

                DateTime now = DateTime.Now;
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateReceiptDetails]";



                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;
                //cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;
                //cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;

                cmd.Parameters.Add("@Unit", SqlDbType.Real).Value = Unit;

                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;

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


        #endregion UpdateReceiptDetails

        #region ViewReceipteDetails

        public DataSet ViewReceiptDetails()
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
                cmd.CommandText = "[ViewReceiptDetails]";

                //cmd.Parameters.Add("@DoctorID", SqlDbType.UniqueIdentifier).Value = DoctorID;
                //cmd.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = DateTime;
                //cmd.Parameters.Add("@DateTime", SqlDbType.NVarChar, 50).Value = now.ToString("yyyy-MM-dd");

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


        #endregion ViewReceiptDetails

        #region DeleteReceiptrDetails
        public void DeleteReceiptDetails()
        {

            SqlConnection con = null;

            try
            {


                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteReceiptDetails]";

                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;

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

        #endregion DeleteReceiptDetails


        #endregion Methods


    }

}