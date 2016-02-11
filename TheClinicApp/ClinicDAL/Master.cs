using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheClinicApp.ClinicDAL
{
    public class Master
    {
        #region Connectionstring
        dbConnection dcon = new dbConnection();
        #endregion Connectionstring

        #region MasterProperty
        #region Patientproperty
        public Guid GroupID
        {
            get;
            set;
        }
        public Guid ClinicID
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
        public string Email
        {
            get;
            set;
        }
        public string DOB
        {
            get;
            set;
        }
        public string Gender
        {
            get;
            set;
        }
        public string MaritalStatus
        {
            get;
            set;
        }
        public string Occupation
        {
            get;
            set;
        }
        public string UDF
        {
            get;
            set;
        }
        #endregion Patientproperty
        #endregion MasterProperty

        #region AddGroups
        public void InsertGroup()
        {

        }
        #endregion ADdGroups
    }
}