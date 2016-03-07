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
             
        //#region PrescriptionProperty
        //public Guid UniqueID
        //{
        //    get;
        //    set;
        //}
        //public Guid MedicineID
        //{
        //    get;
        //    set;
        //}
        
        //public string Qty
        //{
        //    get;
        //    set;
        //}
        //public string Unit
        //{
        //    get;
        //    set;
        //}
        //public string Dosage
        //{
        //    get;
        //    set;
        //}
        //public string Timing
        //{
        //    get;
        //    set;
        //}
        //public int Days
        //{
        //    get;
        //    set;
        //}

        //#endregion PrescriptionProperty

         
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
    public class CaseFile
    {   ErrorHandling eObj = new ErrorHandling();
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

        #region File Methods
        #region AddFile
        public void AddFile()
        {
            dbConnection dcon = new dbConnection();

            try
            {


                dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = dcon.SQLCon;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "[InsertNewFile]";
                pud.Parameters.Add("@FileID", SqlDbType.UniqueIdentifier).Value = FileID;
                pud.Parameters.Add("@PatientID", SqlDbType.UniqueIdentifier).Value = PatientID;
                pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
                pud.Parameters.Add("@FileDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@FileNumber", SqlDbType.NVarChar, 50).Value = FileNumber;
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
                if (dcon.SQLCon != null)
                {
                    dcon.DisconectDB();
                }

            }
        }
        #endregion AddFile

        #region UpdateFile
        public void UpdateFile()
        {
            SqlConnection con = null;
            try
            {

                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand pud = new SqlCommand();
                pud.Connection = con;
                pud.CommandType = System.Data.CommandType.StoredProcedure;
                pud.CommandText = "UpdateFile";
                pud.Parameters.Add("@FileID", SqlDbType.UniqueIdentifier).Value = FileID;
                pud.Parameters.Add("@FileDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
                pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
                pud.Parameters.Add("@FileNumber", SqlDbType.NVarChar, 50).Value = FileNumber;
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
        #endregion UpdateFile
        #endregion File Methods

        #region Visit Class
        public class Visit
        {
            ErrorHandling eObj = new ErrorHandling();
            public Visit(CaseFile caseFile) 
            {
                FileID = caseFile.FileID;
                ClinicID = caseFile.ClinicID;
            }
            public Visit()
            {

            }

            #region VisitsProperty
            public Guid VisitID
            {
                get;
                set;
            }
            public Guid FileID
            {
                get;
                set;
            }
            public Guid DoctorID
            {
                get;
                set;
            }
            public Guid ClinicID
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

            #region Visit Methods

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

            //#region AddPrescriptionDT
            //public void AddPrescriptionDT()
            //{
            //    SqlConnection con = null;
            //    try
            //    {

            //        dbConnection dcon = new dbConnection();
            //        con = dcon.GetDBConnection();
            //        SqlCommand pud = new SqlCommand();
            //        pud.Connection = con;
            //        pud.CommandType = System.Data.CommandType.StoredProcedure;
            //        pud.CommandText = "[InsertPrescriptionDT]";
            //        pud.Parameters.Add("@UniqueID", SqlDbType.UniqueIdentifier).Value = UniqueID;
            //        pud.Parameters.Add("@PrescriptionID", SqlDbType.UniqueIdentifier).Value = PrescriptionID;
            //        pud.Parameters.Add("@ClinicID", SqlDbType.UniqueIdentifier).Value = ClinicID;
            //        pud.Parameters.Add("@MedicineID", SqlDbType.UniqueIdentifier).Value = MedicineID;
            //        pud.Parameters.Add("@Qty", SqlDbType.Real).Value = double.Parse(Qty);
            //        pud.Parameters.Add("@Unit", SqlDbType.Real).Value = double.Parse(Unit);
            //        pud.Parameters.Add("@Dosage", SqlDbType.Real).Value = double.Parse(Dosage);
            //        pud.Parameters.Add("@Timing", SqlDbType.NVarChar, 10).Value = Timing;
            //        pud.Parameters.Add("@Days", SqlDbType.Int).Value = Days;
            //        pud.Parameters.Add("@CreatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
            //        pud.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = DateTime.Now;
            //        pud.Parameters.Add("@UpdatedBY", SqlDbType.NVarChar, 255).Value = "Thomson";
            //        pud.Parameters.Add("@UpdatedDate", SqlDbType.DateTime).Value = DateTime.Now;
            //        //pud.Parameters.Add("@image", SqlDbType.VarBinary).Value = image; 
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
            //            eObj.InsertionNotSuccessMessage(page);

            //        }
            //        else
            //        {
            //            //successfull

            //            var page = HttpContext.Current.CurrentHandler as Page;
            //            eObj.InsertionSuccessMessage(page);


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
            //#endregion AddPrescriptionDT

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

            #endregion Visit Methods

            #region Visit Attachment Class
            public class VisitAttachment
                {
                    ErrorHandling eObj = new ErrorHandling();
                    public VisitAttachment(Visit visit){
                        VisitID = visit.VisitID;
                        ClinicID = visit.ClinicID;
                    }
                    public VisitAttachment()
                    {
                        AttachID = Guid.NewGuid();
                    }
                    public VisitAttachment(Guid AttachID)
                    {
                        this.AttachID = AttachID;
                        /////////////////////////////////////////////////////create sp to get details
                    }
                    #region VisitAttachmentsProperty
                    public Guid AttachID
                    {
                        get;
                        set;
                    }
                    public Guid VisitID
                    {
                        get;
                        set;
                    }
                    public Guid ClinicID
                    {
                        get;
                        set;
                    }
                    public string Description
                    {
                        get;
                        set;
                    }
                    public object Attachment
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
                    #endregion VisitAttachmentsProperty
            
                    #region FileAttachment
                    public int InsertFileAttachment(Boolean isFromMobile = false, string userName = "")
                    {
                        if (AttachID == null)
                        {
                            throw new Exception("AttachID propery is not set!!");
                        }
                        if(VisitID==null){
                            throw new Exception("VisitID propery is not set!!");
                        }
                        if (ClinicID == null)
                        {
                            throw new Exception("ClinicID propery is not set!!");
                        }
                        int result = 0;
                        SqlConnection con = null;
                        try
                        {
                            dbConnection dcon = new dbConnection();
                            con = dcon.GetDBConnection();
                            UIClasses.Const Const = new UIClasses.Const();

                            SqlCommand cmdInsert = new SqlCommand("FileAttachmentInsert", con);
                            cmdInsert.CommandType = CommandType.StoredProcedure;
                            if (isFromMobile)
                            {
                                cmdInsert.Parameters.AddWithValue("@ClinicID", ClinicID);
                                cmdInsert.Parameters.AddWithValue("@CreatedBy", userName);
                            }
                            else
                            {
                                ClinicDAL.UserAuthendication UA = (ClinicDAL.UserAuthendication)HttpContext.Current.Session[Const.LoginSession];
                                cmdInsert.Parameters.AddWithValue("@ClinicID", UA.ClinicID);
                                cmdInsert.Parameters.AddWithValue("@CreatedBy", UA.userName);
                            }
                            cmdInsert.Parameters.AddWithValue("@AttachID", AttachID);
                            cmdInsert.Parameters.AddWithValue("@VisitID", VisitID);
                            cmdInsert.Parameters.AddWithValue("@Description", Description);
                            cmdInsert.Parameters.AddWithValue("@Attachment", Attachment);
                            cmdInsert.Parameters.AddWithValue("@Name", Name);
                            cmdInsert.Parameters.AddWithValue("@Type", Type);
                            cmdInsert.Parameters.AddWithValue("@Size", Size);
                            cmdInsert.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                            result = cmdInsert.ExecuteNonQuery();
                            if (!isFromMobile)
                            {
                                var page = HttpContext.Current.CurrentHandler as Page;
                                eObj.InsertionSuccessMessage(page, "Data Inserted Successfully..!!!!");
                            }
                        }
                        catch (SqlException ex)
                        {
                            if (!isFromMobile)
                            {
                                var page = HttpContext.Current.CurrentHandler as Page;
                                eObj.ErrorData(ex, page);
                            }
                            throw ex;
                        }
                        finally
                        {
                            con.Close();
                        }
                        return result;

                    }
                    #endregion FileAttachment
                }
            #endregion Visit Attachment Class
        }
        #endregion Visit Class

    }
       
}