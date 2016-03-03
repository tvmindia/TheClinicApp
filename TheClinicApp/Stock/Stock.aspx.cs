using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheClinicApp.ClinicDAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TheClinicApp.Stock
{
    public partial class Stock : System.Web.UI.Page
    {

        ErrorHandling eObj = new ErrorHandling();
        Stocks stok = new Stocks();

      
       
        protected void Page_Load(object sender, EventArgs e)
        {


            //gridview binding for listing the Out of Stock Medicines 
            DataSet gds = stok.OutofStockMedicines();
            GridViewOutofStock.EmptyDataText = "No Records Found";
            GridViewOutofStock.DataSource = gds;
            GridViewOutofStock.DataBind();




        }
 
        protected void btnStock_Click(object sender, EventArgs e)
        {

        }
    }
}