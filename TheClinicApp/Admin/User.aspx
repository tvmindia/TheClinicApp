<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TheClinicApp.Admin.User" EnableEventValidation="false" %>
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


   <div class="container-fluid bodyDiv" >
        <label class="headingLabel">Create User</label>
        <div class="col-sm-12 Span-One ">
            

             <div class="col-xs-10">
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
                            <label class="control-label col-xs-2 regFormLabels">Login Name:</label>





                            <div class="col-xs-10">
                                <asp:TextBox ID="txtLoginName" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit" pattern="^[A-z][A-z\.\s]+$"
                                    ></asp:TextBox>

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
                            <label class="control-label col-xs-2 regFormLabels">First Name:</label>





                            <div class="col-xs-10">
                                <asp:TextBox ID="txtFirstName" class="form-control textBoxborder" required runat="server"  ValidationGroup="Submit"></asp:TextBox>

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
                            <label class="control-label col-xs-2 regFormLabels">Last Name:</label>





                            <div class="col-xs-10">
                             
                               <asp:TextBox ID="txtLastName" class="form-control textBoxborder" required runat="server"  ValidationGroup="Submit"></asp:TextBox>

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
                            <label class="control-label col-xs-2 regFormLabels">Active:</label>





                            <div class="col-xs-10">
                                <asp:RadioButton ID="rdoActiveYes" runat="server" GroupName="Active" Text="Yes" Checked="true" CssClass="checkbox-inline" />
                                <asp:RadioButton ID="rdoActiveNo" runat="server"  GroupName="Active" Text="No" CssClass="checkbox-inline"/>
                             
                                
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

            <div class="col-xs-2">
                 <a href="#" role="button" data-toggle="modal" data-target="#myModal" >View All Users </a>

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
                                        <asp:Button ID="btnSave" runat="server" Text="Save"  type="submit" CssClass="button"  ValidationGroup="Submit" OnClick="btnSave_Click"  />

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

    <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog  modal-lg">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">View All Users</h4>

                    </div>
                    <div class="modal-body" >
                        
                        <asp:GridView ID="dtgViewAllUsers" runat="server" AutoGenerateColumns="False" style="text-align:center;width:100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("UserID")+"|"+Eval("LoginName")+"|"+Eval("FirstName")+"|"+Eval("LastName")+"|"+Eval("Active")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("UserID")%>' OnCommand="ImgBtnDelete_Command" OnClientClick="return confirm('Are you sure');"  formnovalidate />
                                       

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LoginName" HeaderText="LOGIN NAME">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FirstName" HeaderText="FIRST NAME">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="LastName" HeaderText="LAST NAME">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Active" HeaderText="ACTIVE">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#001a00" Font-Bold="True" ForeColor="White"></HeaderStyle>

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

</asp:Content>
