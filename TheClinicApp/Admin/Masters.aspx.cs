using System;
using System.Collections.Generic;
using System.Data;
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
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDropDownGroupforDoc();
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
            MasterObj.createdBy = UA.userName;
            MasterObj.updatedBy = UA.userName;
            MasterObj.ClinicID = Guid.Parse(ddlClinicforDoc.SelectedValue);
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
             MasterObj.Logo = ImageByteArray;
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

        public void BindDropDownGroupforDoc()
        {
            
            DataTable dt = new DataTable();
            dt = MasterObj.BindGroupName();
            ddlGroupforDoc.DataSource = dt;
            ddlGroupforDoc.DataTextField = "Name";
            ddlGroupforDoc.DataBind();
            ddlGroupforDoc.Items.Insert(0, new ListItem("--select Group--", "-1"));
            ddlClinicforDoc.Items.Insert(0, new ListItem("--select Clinic--", "-1"));
        } 

        

        
        protected void ddlGroupforDoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtClinics = null;

            try
            {
                dtClinics = new DataTable();
                string project = ddlClinicforDoc.SelectedValue;
                dtClinics = MasterObj.GetAllClinics();

                ddlClinicforDoc.DataSource = dtClinics;
                ddlClinicforDoc.DataTextField = "Name";
                ddlClinicforDoc.DataValueField = "ClinicID";
                ddlClinicforDoc.DataBind();
                


            }
            catch (Exception)
            {


            }
        } 

    }
}