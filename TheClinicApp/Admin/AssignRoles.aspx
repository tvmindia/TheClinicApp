<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="AssignRoles.aspx.cs" Inherits="TheClinicApp.Admin.AssignRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />

    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>


    <div class="container-fluid bodyDiv" >

         <label class="headingLabel">Assign Roles</label>
          <div class="col-xs-12 Span-One">

                 <div class="col-sm-2">
              

 </div>

              <div class="col-sm-8">
                   <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">


                            



                            <div class="col-xs-11">
                            </div>
                            <div class="col-xs-1">
                                <div class="col-xs-12">
                                    &nbsp
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">






                            <div class="col-xs-11">
                            </div>
                            <div class="col-xs-1">
                                <div class="col-xs-12">
                                    &nbsp
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-1 regFormLabels">User:</label>





                            <div class="col-xs-11">
                               
                                <asp:DropDownList ID="ddlUsers" runat="server" CssClass="selectpicker">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                   
                                </asp:DropDownList>
        

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
                                <asp:DropDownList ID="ddlRoles" runat="server" >
                                    <asp:ListItem>--Select--</asp:ListItem>
                                   
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>

                    </div>

                <div class="col-sm-2">

                    </div>
            </div>
              
          </div>

      






      <footer  class="footerDiv">
          </footer>

</asp:Content>
