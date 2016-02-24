using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TheClinicApp.ClinicDAL
{
    public class Stocks
    {

        #region Property
        public string MedicineID
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
        public int Unit
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

        #endregion Property

        #region Methods

        #region Medicines

        #region InsertMedicines 
        public void InsertMedicines()
        {


            dbConnection dcon = null;

            try
            {

                Guid MedicineID = new Guid();

                
                dcon = new dbConnection();
                dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dcon.SQLCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[InsertMedicines]";

                cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;
                cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@CateoryID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(CategoryID);
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@Unit", SqlDbType.Real).Value =Unit;
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;

                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;
                cmd.Parameters.Add("@ReOrderQty", SqlDbType.Real).Value = ReOrderQty;



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
                //cmd.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ClinicID);
                cmd.Parameters.Add("@CateoryID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(CategoryID);
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@Unit", SqlDbType.Real).Value = Unit;
                cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;

                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = CreatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = CreatedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.NVarChar, 255).Value = UpdatedBy;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = UpdatedDate;
                cmd.Parameters.Add("@ReOrderQty", SqlDbType.Real).Value = ReOrderQty;



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

                //cmd.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;
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


        #region Out_of_Stock_MedicineList
        public DataSet OutofStockMedicines()
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
                cmd.CommandText = "[OutofStockMedicines]";

            
                //cmd.Parameters.Add("@Qty", SqlDbType.Real).Value = Qty;
                //cmd.Parameters.Add("@ReOrderQty", SqlDbType.Real).Value = ReOrderQty;

               
               

              

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




        #endregion Medicines

        #endregion Methods
    }
}