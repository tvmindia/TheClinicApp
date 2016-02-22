using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TheClinicApp.ClinicDAL
{
    public class Doctor
    {
        ErrorHandling eObj = new ErrorHandling();
        #region Connectionstring
        dbConnection dcon = new dbConnection();
        #endregion Connectionstring
        #region Fileproperty

        public Guid FileID
        {
            get;
            set;
        }
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
        public string FileNumber
        {
            get;
            set;
        }
#endregion Fileproperty
        #region VisitsProperty
        public string VisitID
        {
            get;
            set;
        }
        public string Height
        {
            get;
            set;
        }
        public string Weight
        {
            get;
            set;
        }
        public string Symptoms
        {
            get;
            set;
        }
        public string Cardiovascular
        {
            get;
            set;
        }
        public string Nervoussystem
        {
            get;
            set;
        }
        public string MaritalStatus
        {
            get;
            set;
        }
        public string Musculoskeletal
        {
            get;
            set;
        }
        public string Palloe
        {
            get;
            set;
        }
        public string Icterus
        {
            get;
            set;
        }
        public string Clubbing
        {
            get;
            set;
        }
        public string Cyanasis
        {
            get;
            set;
        }
        public string Bowel
        {
            get;
            set;
        }
        public string Appettie
        {
            get;
            set;
        }
        public string Micturation
        {
            get;
            set;
        }
        public string Sleep
        {
            get;
            set;
        }
        public string Diagnosys
        {
            get;
            set;
        }
        public string Remarks
        {
            get;
            set;
        }
        public Guid PrescriptionID
        {
            get;
            set;
        }
        #endregion Visitsproperty
        #region VisitAttachments
        public Guid AttachID
        {
            get;
            set;
        }
        public string Description
        {
            get;
            set;
        }
        public string Attachment
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Type
        {
            get;
            set;
        }
        public string Size
        {
            get;
            set;
        }
        #endregion VisitAttachments

        #region AddVisits
        public void AddVisits()
        {

            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "[InsertVisits]";
                pud.Parameters.Add("@VisitID", SqlDbType.UniqueIdentifier).Value = VisitID;
                pud.Parameters.Add("@FileID", SqlDbType.UniqueIdentifier).Value = FileID;
                pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
                pud.Parameters.Add("@Date", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@Height", SqlDbType.Real).Value = double.Parse(Height);
                pud.Parameters.Add("@Weight", SqlDbType.Real).Value = double.Parse(Weight);
                pud.Parameters.Add("@Symptoms", SqlDbType.NVarChar, 255).Value = Symptoms;
                pud.Parameters.Add("@Cardiovascular", SqlDbType.NVarChar, 255).Value = Cardiovascular;
                pud.Parameters.Add("@Nervoussystem", SqlDbType.NVarChar, 255).Value = Nervoussystem;
                pud.Parameters.Add("@Musculoskeletal", SqlDbType.NVarChar, 255).Value = Musculoskeletal;
                pud.Parameters.Add("@Palloe", SqlDbType.NVarChar, 255).Value = Palloe;
                pud.Parameters.Add("@Icterus", SqlDbType.NVarChar, 255).Value = Icterus;
                pud.Parameters.Add("@Clubbing", SqlDbType.NVarChar, 255).Value = Clubbing;
                pud.Parameters.Add("@Cyanasis", SqlDbType.NVarChar, 255).Value = Cyanasis;
                pud.Parameters.Add("@Bowel", SqlDbType.NVarChar, 255).Value = Bowel;
                pud.Parameters.Add("@Appettie", SqlDbType.NVarChar, 255).Value = Appettie;
                pud.Parameters.Add("@Micturation", SqlDbType.NVarChar, 255).Value = Micturation;
                pud.Parameters.Add("@Sleep", SqlDbType.NVarChar, 255).Value = Sleep;
                pud.Parameters.Add("@Diagnosys", SqlDbType.NVarChar, 255).Value = Diagnosys;
                pud.Parameters.Add("@Remarks", SqlDbType.NVarChar, 255).Value = Remarks;
                pud.Parameters.Add("@PrescriptionID", SqlDbType.UniqueIdentifier).Value = PrescriptionID;
                pud.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                //pud.Parameters.Add("@image", SqlDbType.VarBinary).Value = image; 
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
        #endregion AddVisits

        #region UpdateVisits
        /// <summary>
        /// Updates the Visits
        /// </summary>
        public void UpdateVisits()
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "UpdateVisits";
                pud.Parameters.Add("@VisitID", SqlDbType.UniqueIdentifier).Value = VisitID;
                pud.Parameters.Add("@Date", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@Height", SqlDbType.Real).Value = double.Parse(Height);
                pud.Parameters.Add("@Weight", SqlDbType.Real).Value = double.Parse(Weight);
                pud.Parameters.Add("@Symptoms", SqlDbType.NVarChar, 255).Value = Symptoms;
                pud.Parameters.Add("@Cardiovascular", SqlDbType.NVarChar, 255).Value = Cardiovascular;
                pud.Parameters.Add("@Nervoussystem", SqlDbType.NVarChar, 255).Value = Nervoussystem;
                pud.Parameters.Add("@Musculoskeletal", SqlDbType.NVarChar, 255).Value = Musculoskeletal;
                pud.Parameters.Add("@Palloe", SqlDbType.NVarChar, 255).Value = Palloe;
                pud.Parameters.Add("@Icterus", SqlDbType.NVarChar, 255).Value = Icterus;
                pud.Parameters.Add("@Clubbing", SqlDbType.NVarChar, 255).Value = Clubbing;
                pud.Parameters.Add("@Cyanasis", SqlDbType.NVarChar, 255).Value = Cyanasis;
                pud.Parameters.Add("@Bowel", SqlDbType.NVarChar, 255).Value = Bowel;
                pud.Parameters.Add("@Appettie", SqlDbType.NVarChar, 255).Value = Appettie;
                pud.Parameters.Add("@Micturation", SqlDbType.NVarChar, 255).Value = Micturation;
                pud.Parameters.Add("@Sleep", SqlDbType.NVarChar, 255).Value = Sleep;
                pud.Parameters.Add("@Diagnosys", SqlDbType.NVarChar, 255).Value = Diagnosys;
                pud.Parameters.Add("@Remarks", SqlDbType.NVarChar, 255).Value = Remarks;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                //SqlParameter OutparamId = pud.Parameters.Add("@OutparamId", SqlDbType.SmallInt);
                //OutparamId.Direction = ParameterDirection.Output;
                SqlParameter Output = new SqlParameter();
                Output.DbType = DbType.Int32;
                Output.ParameterName = "@Status";
                Output.Direction = ParameterDirection.Output;
                pud.Parameters.Add(Output);
                pud.ExecuteNonQuery();
                if (int.Parse(Output.Value.ToString()) == -1)
                {
                    // ////not successfull
                    // var page = HttpContext.Current.CurrentHandler as Page;
                    //eObj.U
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
        #endregion UpdateVisits

        #region GetVisitsUsingID
        public DataTable GetVisitsUsingID()
        {
            DataTable dt = null;
            SqlConnection con = null;
            dbConnection dcon = new dbConnection();
            con = dcon.GetDBConnection();
            SqlCommand cmd = new SqlCommand("SearchPatientWithName", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@VisitID", SqlDbType.UniqueIdentifier).Value = VisitID;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            return dt;

        }
        #endregion GetPatientDetails

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

        //#region DeletePatientDetails

        //public void DeletePatientDetails()
        //{
        //    SqlConnection con = null;
        //    try
        //    {

        //        dbConnection dcon = new dbConnection();
        //        con = dcon.GetDBConnection();
        //        SqlCommand pud = new SqlCommand();
        //        pud.Connection = con;
        //        pud.CommandType = System.Data.CommandType.StoredProcedure;
        //        pud.CommandText = "DeletePatientDetails";
        //        pud.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;

        //        SqlParameter Output = new SqlParameter();
        //        Output.DbType = DbType.Int32;
        //        Output.ParameterName = "@Status";
        //        Output.Direction = ParameterDirection.Output;
        //        pud.Parameters.Add(Output);
        //        pud.ExecuteNonQuery();
        //        if (Output.Value.ToString() == "")
        //        {
        //            //not successfull   

        //            var page = HttpContext.Current.CurrentHandler as Page;
        //            eObj.WarningMessage(page);

        //        }
        //        else
        //        {
        //            //successfull

        //            var page = HttpContext.Current.CurrentHandler as Page;
        //            eObj.DeleteSuccessMessage(page);


        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        var page = HttpContext.Current.CurrentHandler as Page;
        //        eObj.ErrorData(ex, page);

        //    }

        //    finally
        //    {
        //        if (con != null)
        //        {
        //            con.Dispose();
        //        }

        //    }

        //}
        //#endregion DeletePatientDetails

    }
}