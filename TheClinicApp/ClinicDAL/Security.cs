using System;
using System.Collections.Generic;
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
}