﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TheClinicApp.ClinicDAL
{
    public class Stocks
    {

        #region constructor

        public Stocks()
        {

             MedicineID  = Guid.NewGuid();
        }
        public Stocks(Guid MedicineID1)
        {

            // Guid ex = Guid.NewGuid();

            MedicineID = MedicineID1;


        }

        #endregion constructor


        #region Property
        public Guid MedicineID
        {
            get;
            set;
        }
        public string ClinicID
        {
            get;
            set;
        }
        public string CategoryID
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;

        }
        public string Unit
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
        public int ReOrderQty
        {
            get;
            set;
        }

        public string  MedCode
        {
            get;
            set;
        }



        #endregion Property

        #region Methods


        #region Category

        #region ViewCategory

        public DataSet ViewCategory()
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
                cmd.CommandText = "[ViewCategory]";

               

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


        #endregion ViewMedicines

        #endregion Category


        #region Medicines

        #region SearchBoxMedicine
        public DataTable SearchBoxMedicine()
        {

            DataTable dt = null;
            SqlConnection con = null;
            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand("SearchBoxMedicine", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            return dt;

        }
        #endregion SearchBoxMedicine

        #region SearchWithName
        public DataTable GetMedcineDetails(string SearchName)
        {

            DataTable dt = null;
            SqlConnection con = null;
            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand("SearchMedicineWithName", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = SearchName;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            return dt;

        }
        #endregion SearchWithName
        
        #region InsertMedicines
        public void InsertMedicines()
        {


            dbConnection dcon = null;

            try
            {

               

                
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertMedicines]";

                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@CategoryID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(CategoryID);
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@Unit", SqlDbType.NVarChar, 15).Value = Unit;
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;                
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;              
                cmd.Parameters.Add("@ReOrderQty", SqlDbType.Real).Value = Convert.ToInt32( ReOrderQty);
                cmd.Parameters.Add("@MedCode", SqlDbType.NVarChar, 20).Value = MedCode;



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

        #endregion InsertMedicines

        #region UpdateMedicines
        public void UpdateMedicines(string MedicineID )
        {

            dbConnection dcon = null;

            try
            {

                
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[UpdateMedicines]";



                cmd.Parameters.Add("@ReceiptID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(MedicineID);             
                cmd.Parameters.Add("@CateoryID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(CategoryID);
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@Unit", SqlDbType.NVarChar, 15).Value = Unit; 
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;
                             
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;                
                cmd.Parameters.Add("@ReOrderQty", SqlDbType.Real).Value = ReOrderQty;
                cmd.Parameters.Add("@MedCode", SqlDbType.NVarChar, 20).Value = MedCode;



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


        #endregion UpdateMedicines 

        #region ViewMedicines

        public DataSet ViewMedicines()
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
                cmd.CommandText = "[ViewMedicines]";

            

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


        #endregion ViewMedicines

        #region DeleteMedicines
        public void DeleteMedicines(string MedicineID)
        {

            dbConnection dcon = null;

            try
            {


                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[DeleteMedicines]";

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

        #endregion InsertMedicines

        #region View_Out_of_Stock_MedicineList
        public DataSet ViewOutofStockMedicines()
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
                cmd.CommandText = "[ViewOutofStockMedicines]";

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

#endregion Out_of_Stock_MedicineList

        #region SearchMedicineStock

        public DataSet SearchMedicineStock(string String )
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
                cmd.CommandText = "[SearchMedicineStock]";

                cmd.Parameters.Add("@String", SqlDbType.NVarChar, 255).Value = String;
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


        #endregion ViewMedicines


        #endregion Medicines

        #endregion Methods
    }
}