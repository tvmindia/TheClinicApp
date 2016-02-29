using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TheClinicApp.Pharmacy
{
    public partial class Pharmacy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
        }
        //#region  PlaceControls

        //public void PlaceControls()
        //{
        //    {
        //        //HtmlGenericControl divcontrol = new HtmlGenericControl();
        //        //divcontrol.Attributes["class"] = "col-md-12 Span-One col-md-6 form-group";
        //        //divcontrol.TagName = "div";
        //        Table table = new Table();
        //        StringBuilder html = new StringBuilder();
        //        datatableobj = systabledefenitionobj.GetComboBoxDetails(_mode);
        //        lblmasterName.Text = datatableobj.Rows[0]["Table_Description"].ToString();
        //        int totalrows = datatableobj.Rows.Count;
        //        if (totalrows < 6)//------if no of rows less than 6 place all controls in one side
        //        {
        //            for (int f = 0; f < datatableobj.Rows.Count; f++)
        //            {

        //                TableRow row = new TableRow();
        //                TableCell cell = new TableCell();
        //                TableCell cell1 = new TableCell();
        //                Label lbl = new Label();
        //                lbl.Attributes.Add("class", "control-label col-md-3");

        //                lbl.Text = datatableobj.Rows[f]["Field_Name"].ToString();
        //                TextBox box = new TextBox();
        //                box.Attributes.Add("class", "form-control");
        //                box.ID = "txt" + datatableobj.Rows[f]["Field_Name"].ToString();



        //                CheckBox checkbox = new CheckBox();
        //                checkbox.ID = "chk" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                checkbox.Text = "chk" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                // CheckBoxList chkCheckbox = new CheckBoxList();


        //                if (datatableobj.Rows[f]["Field_DataType"].ToString() == "B")
        //                {
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(checkbox);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);
        //                }
        //                else if (datatableobj.Rows[f]["Field_DataType"].ToString() == "S" | datatableobj.Rows[f]["Field_DataType"].ToString() == "A")
        //                {
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(box);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);
        //                }
        //                else if (datatableobj.Rows[f]["Field_DataType"].ToString() == "C" | datatableobj.Rows[f]["Field_DataType"].ToString() == "N")
        //                {
        //                    RadComboBox combo = new RadComboBox();
        //                    //combo.Attributes.Add("class", "span1 col-md-1 form-control");
        //                    combo.ID = "cmb" + datatableobj.Rows[f]["Field_Name"].ToString();

        //                    combo.EnableLoadOnDemand = true;
        //                    combo.ItemsRequested += new RadComboBoxItemsRequestedEventHandler(combo_ItemsRequested);
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(combo);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);
        //                }
        //                table.Rows.Add(row);
        //                placeholder.Controls.Add(table);


        //                if (datatableobj.Rows[f]["Field_DataType"].ToString() == "U" | datatableobj.Rows[f]["Field_DataType"].ToString() == "D")
        //                {
        //                    HtmlGenericControl divcontrol = new HtmlGenericControl("div");
        //                    //  divYogesh.Attributes.Add("class", "myClass");


        //                    HiddenField hf = new HiddenField();
        //                    hf.ID = "hf" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                    divcontrol.Controls.Add(hf);
        //                    placeholder.Controls.Add(divcontrol);
        //                }

        //            }
        //        }
        //        //---- if no of rows greater than 6 then place controls in 2 sides
        //        else
        //        {
        //            //HiddenField hf = new HiddenField();
        //            TableRow row = new TableRow();

        //            for (int f = 0; f < datatableobj.Rows.Count; f++)
        //            {

        //                TableCell cell = new TableCell();
        //                TableCell cell1 = new TableCell();
        //                // TableCell cell2 = new TableCell();
        //                Label lbl = new Label();
        //                lbl.Attributes.Add("class", "control-label col-md-3");

        //                lbl.Text = datatableobj.Rows[f]["Field_Name"].ToString();
        //                lbl.ID = "lbl" + datatableobj.Rows[f]["Field_Name"].ToString();

        //                TextBox box = new TextBox();
        //                box.Attributes.Add("class", "form-control");

        //                box.ID = "txt" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                // box.ValidationGroup = "Submit";
        //                // string ValidationGroup = "Submit";
        //                //RequiredFieldValidator rfv = new RequiredFieldValidator();
        //                //rfv.ControlToValidate = box.ID;
        //                //rfv.ID = "rfv" + datatableobj.Rows[f]["Field_Name"];
        //                ////rfv.EnableClientScript = false;
        //                //rfv.ValidationGroup = ValidationGroup;
        //                //rfv.ForeColor = System.Drawing.Color.Red;
        //                //rfv.SetFocusOnError = true;
        //                //rfv.ErrorMessage = "*Comments field is mandatory";
        //                //rfv.Enabled = true;

        //                if (datatableobj.Rows[f]["Field_DataType"].ToString() == "U" | datatableobj.Rows[f]["Field_DataType"].ToString() == "D")
        //                {

        //                    HtmlGenericControl divcontrol = new HtmlGenericControl("div");
        //                    //  divYogesh.Attributes.Add("class", "myClass");


        //                    HiddenField hf = new HiddenField();
        //                    hf.ID = "hf" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                    divcontrol.Controls.Add(hf);
        //                    placeholder.Controls.Add(divcontrol);


        //                }
        //                if (datatableobj.Rows[f]["Field_DataType"].ToString() == "B")
        //                {
        //                    CheckBox checkbox = new CheckBox();
        //                    checkbox.ID = "chk" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                    // checkbox.Text = "chk" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(checkbox);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);
        //                }
        //                else if (datatableobj.Rows[f]["Field_DataType"].ToString() == "S" | datatableobj.Rows[f]["Field_DataType"].ToString() == "A")
        //                {
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(box);
        //                    // cell1.Controls.Add(rfv);
        //                    //cell2.Controls.Add(rfv);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);
        //                    //row.Cells.Add(cell2);
        //                }
        //                else if (datatableobj.Rows[f]["Field_DataType"].ToString() == "C" | datatableobj.Rows[f]["Field_DataType"].ToString() == "N")
        //                {
        //                    RadComboBox combo = new RadComboBox();
        //                    combo.ID = "cmb" + datatableobj.Rows[f]["Field_Name"].ToString();
        //                    combo.EnableLoadOnDemand = true;
        //                    combo.ItemsRequested += new RadComboBoxItemsRequestedEventHandler(combo_ItemsRequested);
        //                    cell.Controls.Add(lbl);
        //                    cell1.Controls.Add(combo);
        //                    row.Cells.Add(cell);
        //                    row.Cells.Add(cell1);

        //                }
        //                int s = row.Cells.Count;
        //                //  if ((f + 1) % 2 == 0)
        //                if (s % 4 == 0)// take coloum count . if count is multiple of 4 then it create next row. so each row contain 4 coloumns
        //                {
        //                    table.Rows.Add(row);

        //                    row = new TableRow();
        //                }
        //                table.Rows.Add(row);

        //            }

        //        }

        //        placeholder.Controls.Add(table);



        //    }
        //}

        //#endregion  PlaceControls

    }
}