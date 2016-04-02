using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheClinicApp.Admin
{
    public partial class Masters : System.Web.UI.Page
    {
        ClinicDAL.Master MasterObj = new ClinicDAL.Master();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btclinic_ServerClick(object sender, EventArgs e)
        {
            MasterObj.GroupID = Guid.Parse(DropDownList1.SelectedValue);
            MasterObj.ClinicName=txtClinic.Value;
            MasterObj.ClinicAddress=txtaddress.Value;
            MasterObj.ClinicLocation=txtLocation.Value;
            MasterObj.ClinicPhone=txtPhone.Value;
            MasterObj.InsertClinics();
        }

        protected void btDoctor_ServerClick(object sender, EventArgs e)
        {
            MasterObj.DoctorName=txtDoctor.Value;
            MasterObj.DoctorPhone=txtDrPhone.Value;
            MasterObj.DoctorEmail=txtEmail.Value;
            MasterObj.InsertDoctors();
        }

        protected void btGroup_ServerClick(object sender, EventArgs e)
        {
             MasterObj.GroupName=txtGroup.Value;
             byte[] ImageByteArray = null;
             ImageByteArray = ConvertImageToByteArray(FileUpload1);
             //MasterObj.Logo = ImageByteArray;
             MasterObj.InsertGroups();
        }

        private byte[] ConvertImageToByteArray(FileUpload fuImage)
        {
            byte[] ImageByteArray;
            try
            {
                MemoryStream ms = new MemoryStream(fuImage.FileBytes);
                ImageByteArray = ms.ToArray();
                return ImageByteArray;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}