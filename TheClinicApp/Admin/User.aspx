<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TheClinicApp.Admin.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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


   
       <div class="container bodyDiv" >

        <label class="headingLabel">Inventory Out</label>
       
       
           <div class="col-sm-12">
               <div class="col-sm-8">.

                     <table class="col-phar-patiedet">
                     <tr>
                         <td> <label class="control-label col-sm-6 regFormLabels">Login Name:</label></td>
                         <td> <asp:TextBox ID="txtIussedTo" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit" >
                                </asp:TextBox>

                         </td>
                     </tr>
                            <tr>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td>  <label class="control-label col-xs-6 regFormLabels">First Name:</label>   

                         </td>
                         <td>     <asp:TextBox ID="txtDate" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit" >
                                </asp:TextBox>

                         </td>
                     </tr>
                            <tr>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td> <label class="control-label col-xs-6 regFormLabels">Last Name:</label>   

                         </td>
                         <td>  <asp:TextBox ID="txtPrescID" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit" >
                                </asp:TextBox>

                         </td>
                     </tr>
                           
                     
                 </table>


               </div>
               <div class="col-sm-4">

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
                                        <asp:Button ID="btnIssue" runat="server" Text="Save"  type="submit" CssClass="button"  ValidationGroup="Submit" />

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
