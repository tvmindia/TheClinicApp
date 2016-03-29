 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace TheClinicApp.Stock


{
    public partial class InventoryOut : System.Web.UI.Page
    {


        ErrorHandling eObj = new ErrorHandling();
        IssueHeaderDetails ihd = new IssueHeaderDetails();
        IssueDetails idt = new IssueDetails();
        Stocks stok = new Stocks();
        Receipt rpt = new Receipt();

        //login details

        UIClasses.Const Const = new UIClasses.Const();
        ClinicDAL.UserAuthendication UA;



        public string listFilter = null;




        protected void Page_Load(object sender, EventArgs e)
        {
            
            bindpageload();
            string iss=ihd.Generate_Issue_Number();
            txtIssueNo.Text = iss;
        }



        #region bindpageload

        public void bindpageload()
        {

           

            listFilter = null;
            listFilter = BindName();
           
            UA = (ClinicDAL.UserAuthendication)Session[Const.LoginSession];


            ihd.ClinicID = UA.ClinicID.ToString();
            idt.ClinicID = UA.ClinicID.ToString();

        }


        #endregion bindpageload



        #region BindDataAutocomplete
        private string BindName()
        {
            // Patient PatientObj = new Patient();
            Stocks stok = new Stocks();

            DataTable dt = stok.SearchBoxMedicine();

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

        #endregion BindDataAutocomplete



        protected void btnIssue_Click(object sender, EventArgs e)
        {         
            //assigning values to Inserting Issue Header
            
            ihd.IssueNO = txtIssueNo.Text;
            ihd.IssuedTo = txtIussedTo.Text;
            ihd.Date = Convert.ToDateTime(txtDate.Text);
            ihd.CreatedBy = UA.userName;
            
            //assigning values to  Inserting Issue Details

            idt.CreatedBy = UA.userName;
            idt.IssueID = ihd.IssueID;  //passing foreign key value 
     
            string values = HiddenField1.Value;
            //int count = Convert.ToInt32(HiddenField2.ToString());
            string[] Invalue = values.Split(' ');

            //int count = Invalue.Length - 1;
            foreach (string item in Invalue)
            {
                Response.Write(Invalue[0]);
                //    for (int i = 0; i < count; i = i + 3)
                //    {
                //    string x = Invalue[i], y = Invalue[i + 1], z = Invalue[i + 2];
                //    try
                //    {
                //        String strConnString = ConfigurationManager.ConnectionStrings["dynamic_dbConnectionString"].ConnectionString;
                //        SqlConnection con = new SqlConnection(strConnString);

                //        string cmdText1 = "INSERT INTO Medchart_patientregister(ID,Medname,Meddoz,Medpres)VALUES ((select ID from Patientregister where name='" + name + "'),'" + x + "','" + y + "','" + z + "')";


                //        SqlCommand cmd1 = new SqlCommand(cmdText1, con);

                //        con.Open();
                //        cmd1.ExecuteNonQuery();
                //        con.Close();

                //        //lblError.Text = "Data Saved";

                //    }
                //    catch (Exception)
                //    {
                //        Console.Write("not entered");
                //        //lblError.Text = ex.Message;
                //    }


                //}


            }

           
             
          


            //  Calling  Insert Functions

            // ihd.InsertIssueHeaderDetails();



           

            //idt.InsertIssueDetails();
        }




    }
}