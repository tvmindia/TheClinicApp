﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TheClinicApp.ClinicDAL
{
    public class Receipt
    {


        #region constructor
        public Receipt()
        {

           // Guid ex = Guid.NewGuid();

            ReceiptID = Guid.NewGuid();


        }
        public Receipt(Guid receipiID)
        {

            // Guid ex = Guid.NewGuid();

            ReceiptID = receipiID;


        }

        #endregion constructor

        #region Property

        public Guid ReceiptID
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

        #region InsertReceiptHeader
        public void InsertReceiptHeader()
        {

            dbConnection dcon = null;

            try
            {            
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertReceiptHeader]";
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@RefNo1", SqlDbType.NVarChar, 255).Value = RefNo1;
                cmd.Parameters.Add("@RefNo2", SqlDbType.NVarChar, 255).Value = RefNo2;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value = Date;         
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;  
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

        #endregion InsertReceiptHeader

        #region UpdateReceiptHeader 
        public void UpdateReceiptHeader(string ReceiptID)
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
                cmd.CommandText = "[UpdateReceiptHeader]";

                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ReceiptID);

              //  cmd.Parameters.Add("@RefNo1", SqlDbType.NVarChar, 255).Value = RefNo1;
                cmd.Parameters.Add("@RefNo2", SqlDbType.NVarChar, 255).Value = RefNo2;
                cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 50).Value = Date;

                cmd.Parameters.Add("@UpdatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
             
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

        #endregion UpdateReceiptHeader

        #region View And Search ReceipteHeader

        public DataSet ViewReceiptHeader(string String)
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
                cmd.CommandText = "[ViewReceiptHeader]";

                if (String == String.Empty)
                {
                    cmd.Parameters.Add("@String", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@String", SqlDbType.NVarChar, 255).Value = String;
                }

                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);

               

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


        #endregion ViewAndSearchReceipteHeader

        #region DeleteReceiptHeader
        public void DeleteReceiptHeader( string ReceiptID)
        {
            dbConnection dcon = null;

            try
            {
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteReceiptHeader]";

                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value =Guid.Parse(ReceiptID);

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

        #endregion InsertReceiptHeader

        //Get Recipt Details by Passing Reference Number
        #region GetReceiptDetailsByReceiptID

        public DataSet GetReceiptDetailsByReceiptID(String RefNo1)
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
                cmd.CommandText = "[GetReceiptDetailsByReceiptID]";

                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);

                cmd.Parameters.Add("@RefNo1", SqlDbType.NVarChar, 255).Value = RefNo1;


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


        #endregion GetReceiptDetailsByReceiptID

        #endregion Methods

    }


   

    public class ReceiptDetails
    {
        #region constructor
        public ReceiptDetails()
        {

           // Guid ex = Guid.NewGuid();

            UniqueID = Guid.NewGuid();


        }
        public ReceiptDetails(Guid UniqueID)
        {

           // Guid ex = Guid.NewGuid();

            this.UniqueID = UniqueID;


        }
        #endregion constructor

        #region Property

        public Guid UniqueID
        {
            get;
            set;
        }
      
         public Guid ReceiptID
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
        public string Unit
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
        public int QTY
        {
            get;
            set;
        }


        #endregion Property

        #region Methods


        #region InsertReceiptDetails
        public void InsertReceiptDetails()
        {

            dbConnection dcon = null;

            try
            {
                        
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertReceiptDetails]";
              
                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;
                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = ReceiptID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);
                cmd.Parameters.Add("@Unit", SqlDbType.NVarChar, 15).Value = Unit;   
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy; 
                cmd.Parameters.Add("@QTY", SqlDbType.Real).Value = QTY;



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

        #endregion InsertReceiptDetails

        #region UpdateReceiptDetails
        public void UpdateReceiptDetails( string UniqueID,string MedicineID)
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
                cmd.CommandText = "[UpdateReceiptDetails]";


                cmd.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UniqueID);
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);
                cmd.Parameters.Add("@Unit", SqlDbType.NVarChar, 15).Value = Unit;                
                cmd.Parameters.Add("@UpdateBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;                
                cmd.Parameters.Add("@QTY", SqlDbType.Real).Value = QTY;
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


        #endregion UpdateReceiptDetails

        #region ViewReceipteDetails

        public DataSet ViewReceiptDetails()
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
                cmd.CommandText = "[ViewReceiptDetails]";


                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);

               
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


        #endregion ViewReceiptDetails

        #region DeleteReceiptrDetails
        public void DeleteReceiptDetails(string UniqueID, string MedicineID)
        {

            dbConnection dcon = null;

            try
            {


                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteReceiptDetails]";

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

        #endregion DeleteReceiptDetails


        #endregion Methods


    }

}