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
}