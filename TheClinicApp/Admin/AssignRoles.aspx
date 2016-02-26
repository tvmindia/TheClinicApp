<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="AssignRoles.aspx.cs" Inherits="TheClinicApp.Admin.AssignRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
          .selectbox {
            width: 40%;
            background-color: #FFF;
            height:50px;
            font: 120% 'Open Sans', sans-serif;
            color: #000;
            font-weight: normal;
            /*border: 1px solid #ccc;*/
            margin: 5px 0 0 0;
            padding: 5px;
            border-style: solid;
            border-width: 1px;background-color: #d7e5fa; box-shadow: 3px 3px 1px #888888; border-radius: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <link href="../Content/mui.min.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/mui.min.js"></script>
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>


    <div class="mui-container-fluid" >

         <label class="headingLabel">Assign Roles</label>
          <div class="col-xs-12 Span-One">

                 <div class="col-sm-2">
              

 </div>

              <div  class="col-sm-10  Span-One">
                 
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-1 regFormLabels">User:</label>





                            <div class="col-xs-11">
                               
                                <asp:DropDownList ID="ddlUsers" runat="server" CssClass="selectbox">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                   
                                </asp:DropDownList>

      <%--  <div class="mui-dropdown">
  <button class="mui-btn mui-btn--primary" data-mui-toggle="dropdown">
    Dropdown
    <span class="mui-caret"></span>
  </button>
  <ul class="mui-dropdown__menu">
    <li><a href="#">Option 1</a></li>
    <li><a href="#">Option 2</a></li>
    <li><a href="#">Option 3</a></li>
    <li><a href="#">Option 4</a></li>
  </ul>
</div>--%>


                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-1 regFormLabels">Role:</label>





                            <div class="col-xs-11">
                             
                                  <%--<div class="mui-dropdown">
  <button class="mui-btn mui-btn--primary" data-mui-toggle="dropdown">
    Dropdown
    <span class="mui-caret"></span>
  </button>
  <ul class="mui-dropdown__menu">
    <li><a href="#">Option 1</a></li>
    <li><a href="#">Option 2</a></li>
    <li><a href="#">Option 3</a></li>
    <li><a href="#">Option 4</a></li>
  </ul>
</div>--%>
                                 <asp:ListBox ID="lstRoles" runat="server" SelectionMode="Multiple" CssClass="selectbox">
                                

                                    <asp:ListItem>Html</asp:ListItem>
                                    <asp:ListItem>Css</asp:ListItem>


                                </asp:ListBox>

                             <%--   <asp:CheckBoxList ID="cblRoles" runat="server">
                                </asp:CheckBoxList>--%>

                        


                           
            
    

                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>

                    </div>

                
            </div>
              
          </div>

      <%--Footer Region--%> 
     <footer  class="footerDiv">
         

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%; ">
                            <div id="Errorbox"  style="height:100%;  display:none;"  runat="server" >
                               <a class="close" data-dismiss="alert">×</a>  

                            <div>
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>      <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

</div>
       </div>                     

                        </td>
                        <td style="height: 100%;   width:20%;">

                        </td>
                        <td style="height: 100%;   width:30%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:80%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:30%;">
                                         <div class="form-group">
                                        <%--<asp:Button ID="btnSave" runat="server" Text="ADD STOCK"  type="submit" CssClass="button  " " ValidationGroup="Submit" />--%>

                                         </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>
</asp:Content>
