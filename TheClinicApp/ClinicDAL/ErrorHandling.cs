using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TheClinicApp.ClinicDAL
{
    public class ErrorHandling
    {
        public int ErrorNumber
        {
            get;
            set;
        }
   

        public void InsertionSuccessData(Page pg)
        {

            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Success!";
            lblMsgges.Text = "Successfully Inserted";
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   

            divMask1.Attributes["class"] = "alert alert-success fade in";
            // Success.Text = "Successfully Inserted"; 

        }
        public void InsertionSuccessData(Page pg, string msg)//if insert does not happend becasue of already existing
        {
            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Success!";
            lblMsgges.Text = msg;
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   

            divMask1.Attributes["class"] = "alert alert-success fade in";
            
        }
        public void UpdationSuccessData(Page pg)
        {
            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Success!";
            lblMsgges.Text = "Successfully Inserted";
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   

            divMask1.Attributes["class"] = "alert alert-success fade in";
        
        }

        public void UpdationSuccessData(Page pg, string msg)//if update fails
        {
            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Success!";
            lblMsgges.Text = "Successfully Inserted";
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   

            divMask1.Attributes["class"] = "alert alert-success fade in";
        }

       
        public void DeleteSuccessData(Page pg)
        {
            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            lblMsgges.Text = " Deleted Successfully ";
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Danger!";
            divMask1.Attributes["class"] = "alert alert-danger fade in";
        }

        public void WarningSuccessData(Page pg)
        {
            var master1 = pg.Master;
            ContentPlaceHolder mpContentPlaceHolder1;
            mpContentPlaceHolder1 = (ContentPlaceHolder)master1.FindControl("ContentPlaceHolder1");
            HtmlControl divMask1 = (HtmlControl)mpContentPlaceHolder1.FindControl("Errorbox") as HtmlControl;
            Label lblMsgges = mpContentPlaceHolder1.FindControl("lblMsgges") as Label;
            lblMsgges.Text = "Warning Msg";
            divMask1.Style["display"] = "";// divMask1.Style["display"] = "";   
            Label lblErrorCaption = mpContentPlaceHolder1.FindControl("lblErrorCaption") as Label;
            lblErrorCaption.Text = "Warning!";
            divMask1.Attributes["class"] = "alert alert-warning fade in";
        }        
    }
}