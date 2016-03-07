<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TheClinicApp.Admin.User" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableCdn="true"></asp:ScriptManager>

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />

    <script src="../Scripts/DeletionConfirmation.js"></script> 
     <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>


    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <script src="../Scripts/mui.min.js"></script>
    <link href="../Content/mui.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-ui.js"></script>
          <link href="../Content/jquery-ui.css" rel="stylesheet" />--%>
    

    <div class="container-fluid bodyDiv">
        <label class="headingLabel">Create User</label>
        <div class="col-sm-12 Span-One ">
            <div class="col-sm-1">
            </div>
            <div class="col-xs-6">
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
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Login Name:</label>

                            <div class="col-xs-5">

                               
                                            <asp:TextBox ID="txtLoginName" class="form-control textBoxborder" required runat="server" onchange="LoginNameCheck(this)" ValidationGroup="Submit"></asp:TextBox>
                                      
                                        
                                   
                            </div>

                            <div class="col-xs-3">
                                <asp:Image ID="imgWebLnames" runat="server" ToolTip="Login Name is Available" ImageUrl="~/Images/Check.png" Width="25%" Height="18%" />
                                        
                                            <asp:Image ID="errorLnames" runat="server" ToolTip="Login Name is Unavailable" ImageUrl="~/Images/newClose.png" Width="10%" Height="10%" />

                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">First Name:</label>

                            <div class="col-xs-5">

                                <asp:TextBox ID="txtFirstName" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"></asp:TextBox>

                            </div>

                            <div class="col-xs-3"></div>

                        </div>
                      
                    </div>

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Last Name:</label>

                            <div class="col-xs-5">

                                <asp:TextBox ID="txtLastName" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"></asp:TextBox>

                            </div>

                             <div class="col-xs-3"></div>
                        </div>
                       
                    </div>

                </div>

                   <div class="col-xs-12 Span-One">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Password:</label>

                            <div class="col-xs-5">

                                <asp:TextBox ID="txtPassword" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"></asp:TextBox>

                            </div>

                             <div class="col-xs-3"></div>
                        </div>
                       
                    </div>

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Active:</label>

                            <div class="col-xs-8">
                                <asp:RadioButton ID="rdoActiveYes" runat="server" GroupName="Active" Text="Yes" Checked="true" CssClass="checkbox-inline" />
                                <asp:RadioButton ID="rdoActiveNo" runat="server" GroupName="Active" Text="No" CssClass="checkbox-inline" />

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

            <div class="col-xs-5">
                <a href="#" role="button" data-toggle="modal" data-target="#myModal">View All Users </a>

            </div>

        </div>
    </div>
    <%--Footer Region--%>
    <footer class="footerDiv">


        <table style="width: 100%; height: 100%;">
            <tr>
                <td class="footerMessagesColumn" style="width: 50%;">
                    <div id="Errorbox" style="height: 100%; display: none;" runat="server">
                        <a class="close" data-dismiss="alert">×</a>

                        <div>
                            <strong>
                                <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label>
                            </strong>
                            <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

                        </div>
                    </div>

                </td>
                <td style="height: 100%; width: 20%;"></td>
                <td style="height: 100%; width: 30%;">
                    <table class="footerTable" style="width: 100%; margin-left: 0px; padding-left: 0px; padding-top: 80%; margin-top: 3%;">
                        <tr>
                            <td style="width: 30%;">
                                <div class="form-group" >
                                    <asp:Button ID="btnSave" runat="server" Text="Save" type="submit" CssClass="button" ValidationGroup="Submit" OnClick="btnSave_Click" />

                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </table>

                </td>

            </tr>
        </table>



    </footer>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog  modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">View All Users</h4>

                </div>
                <div class="modal-body">

                    <asp:GridView ID="dtgViewAllUsers" runat="server" AutoGenerateColumns="False" Style="text-align: center; width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("UserID")+"|"+Eval("LoginName")+"|"+Eval("FirstName")+"|"+Eval("LastName")+"|"+Eval("Active")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />


                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("UserID")%>' OnCommand="ImgBtnDelete_Command" OnClientClick="ConfirmDelete()" formnovalidate />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LoginName" HeaderText="Login Name">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="First Name">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="LastName" HeaderText="Last Name">+
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Active" HeaderText="Active">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                           <%--  <asp:BoundField DataField="Password" HeaderText="Password">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>--%>

                        </Columns>
                        <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                        <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                        <%--<HeaderStyle BackColor="#001a00" Font-Bold="True" ForeColor="White"></HeaderStyle>--%>

                           <HeaderStyle BackColor="#009933" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                        <RowStyle BackColor="#EFF3FB"></RowStyle>

                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </div>

                <div class="modal-footer">
                </div>
            </div>

        </div>
    </div>


    <asp:HiddenField ID="hdnUserID" runat="server" />
    <script>

        $(document).ready(function () {
            var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
            LnameImage.style.display = "none";
            var errLname = document.getElementById('<%=errorLnames.ClientID %>');
            errLname.style.display = "none";
        })




        function LoginNameCheck(txtLoginName) {
            debugger;
            var name = document.getElementById('<%=txtLoginName.ClientID %>').value;
            name = name.replace(/\s/g, '');
           
            PageMethods.ValidateLoginName(name, OnSuccess, onError);

            function OnSuccess(response, userContext, methodName) {

                var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
                 var errLname = document.getElementById('<%=errorLnames.ClientID %>');
                 if (response == false) {

                     LnameImage.style.display = "block";
                     errLname.style.display = "none";

                 }
                 if (response == true) {
                     errLname.style.display = "block";
                     errLname.style.color = "Red";
                     errLname.innerHTML = "Name Alreay Exists"
                     LnameImage.style.display = "none";

                 }
             }
             function onError(response, userContext, methodName) {


             }
         }

    </script>
</asp:Content>
