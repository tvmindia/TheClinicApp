using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheClinicApp.ClinicDAL
{
    public class Receipt
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
        public int  Unit
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
        #endregion Methods

    }

    public class ReceiptDetails
    {
        #region Property

        #endregion Property

        #region Methods
        #endregion Methods


    }

}