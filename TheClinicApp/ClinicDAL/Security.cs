using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace TheClinicApp.ClinicDAL
{
    public class Security
    {
        public bool Login(string username, string password) {
            if (username == password) {
                return true;
            }
            return false;
        }
    }

    public class UserAuthendication
    {
        private string userN;
        private string GroupName;
        private Guid Group_ID;
        private string ClinicName;
        private Guid Clinic_ID;
        private Boolean isValidUser;
        

        public string userName
        {

            get
            {
                return userN;
            }
        }
        public Boolean ValidUser
        {
            get
            {

                return isValidUser;
            }

        }

        public string Clinic
        {

            get
            {
                return ClinicName;
            }
        }
        public string Group
        {

            get
            {
                return GroupName;
            }
        }


        public Guid ClinicID{

            get
            {
                return Clinic_ID;
            }
        }

        public Guid GroupID
        {

            get
            {
                return Group_ID;
            }
        }



        public UserAuthendication(String userName, String password)
        {

            DataTable dt = GetLoginDetails(userName);

            if (dt.Rows.Count > 0)
            {
                string Name = dt.Rows[0]["LoginName"].ToString();
                string Passwd = dt.Rows[0]["Password"].ToString();


                if (userName == Name && password == Passwd)
                {
                    isValidUser = true;
                    userN = userName;
                    ClinicName = " Clinic 1";
                    GroupName = "Thrithvam Ayurveda";
                    //Clinic_ID = new Guid("C0946CD5-EBB4-44CE-9DFC-349BB4D32761");

                    Clinic_ID = new Guid(dt.Rows[0]["ClinicID"].ToString());
                    Group_ID = new Guid("ED6A102A-E904-4471-BF9A-F6BEDB2F36FB");

                }

                else
                {

                    isValidUser = false;
                }
            }

            else
            {
                //This case is temporaray
                if (userName == password)
                {
                    isValidUser = true;
                    userN = userName;
                    ClinicName = " Clinic 1";
                    GroupName = "Thrithvam Ayurveda";
                    Clinic_ID = new Guid("C0946CD5-EBB4-44CE-9DFC-349BB4D32761");
                    Group_ID = new Guid("ED6A102A-E904-4471-BF9A-F6BEDB2F36FB");

                }
                else
                {

                    isValidUser = false;
                }
            }
        }

        public void GetLoginDetails()
        {

        }

        public DataTable GetLoginDetails(string LoginName)
        {
            SqlConnection con = null;

            try
            {
                DataTable dt = new DataTable();
                dbConnection dcon = new dbConnection();
                con = dcon.GetDBConnection();
                SqlCommand cmd = new SqlCommand("GetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@LoginName", SqlDbType.NVarChar, 50).Value = LoginName;
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

    }
}