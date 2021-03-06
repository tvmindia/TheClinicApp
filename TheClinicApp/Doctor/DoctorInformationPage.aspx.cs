﻿#region CopyRight

//Author      : Thomson K Varkey
//Created Date: Feb-22-2016

#endregion CopyRight

#region Included Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data;
using System.Data.SqlClient;
using System.Text;
#endregion Included Namespaces

namespace TheClinicApp.Doctor
{
    public partial class DoctorInformationPage : System.Web.UI.Page
    {
        #region Global Variable
        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;
        ClinicDAL.ErrorHandling eObj = new ClinicDAL.ErrorHandling();
        ClinicDAL.TokensBooking tok = new ClinicDAL.TokensBooking();
        ClinicDAL.CaseFile.Visit CaseFileObj = new ClinicDAL.CaseFile.Visit();
        ClinicDAL.Patient PatientObj = new ClinicDAL.Patient();
        ClinicDAL.Doctor DoctorObj = new ClinicDAL.Doctor();

        public string listFilter = null;
        #endregion Global Variable

        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            listFilter = null;
            listFilter = BindName();
            gridviewbind();
        }
        #endregion PageLoad

        #region Methods
        #region SearchButton
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {

        }
        #endregion SearchButton

        #region GridBindTokens
        public void gridviewbind()
        {
            //Gridview Binding to Diplay DoctorName,Token No,Patient Name,TIME
            tok.DateTime = DateTime.Now;
            DataSet gds = tok.ViewToken();
            GridViewTokenlist.EmptyDataText = "No Records Found";
            GridViewTokenlist.DataSource = gds;
            GridViewTokenlist.DataBind();

            
        }
        #endregion GridBindTokens

        #region BindSearch
        private string BindName()
        {
            DataTable dt = PatientObj.GetSearchBoxData();

            StringBuilder output = new StringBuilder();
            output.Append("[");
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                output.Append("\"" + dt.Rows[i]["Name"].ToString() + "\"");

                if (i != (dt.Rows.Count - 1))
                {
                    output.Append(",");
                }
            }
            output.Append("]");
            return output.ToString();
        }
        #endregion BindSearch

        #region MainButtonSave
        protected void btnSave_Click(object sender, EventArgs e)
        {
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];
            CaseFileObj.DoctorID = Guid.Parse("469489AE-6237-47B3-B8CC-74B62EC81D77");
            CaseFileObj.FileID = Guid.Parse(HiddenField2.Value);
            CaseFileObj.ClinicID = UA.ClinicID;
            CaseFileObj.Height = float.Parse(txtHeight.Text);
            CaseFileObj.Weight=float.Parse(txtWeight.Text);
            CaseFileObj.Symptoms=txtSymptoms.Text;
            CaseFileObj.Bowel=txtBowel.Text;
            CaseFileObj.Appettie=txtAppettie.Text;
            CaseFileObj.Micturation=txtMicturation.Text;
            CaseFileObj.Sleep=txtSleep.Text;
            CaseFileObj.Cardiovascular=txtCardiovascular.Text;
            CaseFileObj.Nervoussystem=txtNervoussystem.Text;
            CaseFileObj.Musculoskeletal=txtMicturation.Text;
            CaseFileObj.Palloe=txtPalloe.Text;
            CaseFileObj.Icterus=txtIcterus.Text;
            CaseFileObj.Clubbing=txtClubbing.Text;
            CaseFileObj.Cyanasis=txtCyanasis.Text;
            CaseFileObj.LymphGen=txtLymphGen.Text;
            CaseFileObj.Edima=txtEdima.Text;
            CaseFileObj.Diagnosys=txtdiagnosis.Text;
            CaseFileObj.Remarks=txtRemarks.Text;
            CaseFileObj.Pulse=txtPulse.Text;
            CaseFileObj.Bp=txtBp.Text;
            CaseFileObj.Tounge=txtTounge.Text;
            CaseFileObj.Heart=txtHeart.Text;
            CaseFileObj.LymphClinic=txtLymphClinic.Text;
            CaseFileObj.RespRate=txtRespRate.Text;
            CaseFileObj.Others=txtOthers.Text;
            CaseFileObj.CreatedBy = UA.userName;
            CaseFileObj.UpdatedBy = UA.userName;
            CaseFileObj.AddVisits();
  
            string values = HiddenField1.Value;
            
        }
        #endregion MainButtonSave

        #region FillPatientDetails
        protected void ImgBtnUpdate_Command1(object sender, CommandEventArgs e)
        {
            DataRow dr = null;            
            PatientObj.PatientID = Guid.Parse(e.CommandArgument.ToString());
            Guid PatientIDForFile = Guid.Parse(e.CommandArgument.ToString());

            DoctorObj.PatientIdForFile = PatientIDForFile;
            DataTable DtFileID = DoctorObj.GetFileIDUSingPatientID();
            dr = DtFileID.NewRow();
            dr = DtFileID.Rows[0];
            Guid FileIDForGrid =Guid.Parse(dr["FileID"].ToString());

            DataTable GridBindVisits = new DataTable();
            GridBindVisits=CaseFileObj.GetGridVisits(FileIDForGrid);
            GridViewVisitsHistory.EmptyDataText = "No Records Found";
            GridViewVisitsHistory.DataSource = GridBindVisits;
            GridViewVisitsHistory.DataBind();
            DataTable dt = PatientObj.SelectPatient();
            dr = dt.NewRow();
            dr = dt.Rows[0];
            DateTime date = DateTime.Now;
            int year = date.Year;
            Guid PatientID = Guid.Parse(dr["PatientID"].ToString());
            lblName.Text = dr["Name"].ToString();
            lblGenderDis.Text = dr["Gender"].ToString();
            HiddenField2.Value = FileIDForGrid.ToString();
            DateTime DT = Convert.ToDateTime(dr["DOB"].ToString());
            int Age = year - DT.Year;
            lblAgeCount.Text = Age.ToString();
            lblAddress.Text = dr["Address"].ToString();
            lblLastVisitDate.Text = dr["CreatedDate"].ToString();
            ProfilePic.Src = "../Handler/ImageHandler.ashx?PatientID=" + PatientID.ToString();
            ProfilePic.Visible = true;

            //HiddenField1.Value = PatientID.ToString();
        }
        #endregion FillPatientDetails

        #region Update Visits
        protected void ImgBtnUpdateVisits_Command(object sender, CommandEventArgs e)
        {
            
            string[] Visits = e.CommandArgument.ToString().Split(new char[] { '|' });
            CaseFileObj.VisitID = Guid.Parse(Visits[0]);
            CaseFileObj.GetVisits();
            txtHeight.Text = CaseFileObj.Height.ToString();
            txtWeight.Text = CaseFileObj.Weight.ToString();
            txtSymptoms.Text = CaseFileObj.Symptoms;
            txtCardiovascular.Text = CaseFileObj.Cardiovascular;
            txtNervoussystem.Text = CaseFileObj.Nervoussystem;
            txtMusculoskeletal.Text = CaseFileObj.Musculoskeletal;
            txtPalloe.Text = CaseFileObj.Palloe;
            txtIcterus.Text = CaseFileObj.Icterus;
            txtClubbing.Text = CaseFileObj.Clubbing;
            txtCyanasis.Text = CaseFileObj.Cyanasis;
            txtBowel.Text = CaseFileObj.Bowel;
            txtAppettie.Text = CaseFileObj.Appettie;
            txtMicturation.Text = CaseFileObj.Micturation;
            txtSleep.Text = CaseFileObj.Sleep;
            txtdiagnosis.Text = CaseFileObj.Diagnosys;
            txtRemarks.Text = CaseFileObj.Remarks;
            txtPulse.Text = CaseFileObj.Pulse;
            txtBp.Text = CaseFileObj.Bp;
            txtTounge.Text = CaseFileObj.Tounge;
            txtHeart.Text = CaseFileObj.Heart;
            txtLymphGen.Text = CaseFileObj.LymphGen;
            txtLymphClinic.Text = CaseFileObj.LymphClinic;
            txtRespRate.Text = CaseFileObj.RespRate;
            txtOthers.Text = CaseFileObj.Others;
            btnnew.Visible = true;
            string PrescriptionID = Visits[1];
        }
        #endregion Update Visits
        #endregion Methods
    }
}