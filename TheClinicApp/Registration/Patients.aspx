<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>

<%@ Register Src="~/UserControl/ProfilePicUpload.ascx" TagPrefix="uc1" TagName="ProfilePicUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <%--<style>
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 100;
        }

        .footerTable {
            height: 100%;
            background-color: transparent;
            padding-left: 0px;
            margin-left: 0px;
            width: 100%;
        }

        .button {
            background-color: gray;
            border: none;
            color: red;
            font-weight: bold;
            font-size: 16px;
            height: 100%;
            width: 100%;
            font: bolder 900;
            z-index: 1;
            margin-right: 0%;
            padding-right: 0%;
        }

        .headingLabel {
            margin-left: 20%;
            color: seagreen;
            font: bold;
            font-size: 17px;
            text-decoration: underline;
            padding-top: 2%;
        }

        .footerMessagesColumn {
            margin-left: 2%;
            width: 30%;
            padding-left: 2%;
          
        }

        .footerButtonColumn {
            width: 30%;
            margin-left: 0%;
         
        }

        .footerbuttonTable {
            margin-left: 1%;
        }
    </style>--%>
    <style>
        
    </style>
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
    function ClearTextBox() {
            $('textarea').empty();

            $("input:text").val('');
        }
    </script>
    <script>
        $(document).ready(function () {
            debugger;
            var ac=null;
            ac = <%=listFilter %>;
            $( "#txtSearch" ).autocomplete({
                source: ac
            });
        });
    </script>

    <div class="container bodyDiv" >
        <label class="headingLabel">New Patient Registration </label>
        <div class="col-lg-12 Span-One ">
            <div class="col-md-9">
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">






                            <div class="col-md-11">
                            </div>
                            <div class="col-md-1">
                                <div class="col-md-12">
                                    &nbsp
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Name:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtName" class="form-control textBoxborder" runat="server"
                                    ></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Sex:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtSex" class="form-control textBoxborder" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Age:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtAge" class="form-control textBoxborder" runat="server" required TextMode="Number"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>


                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Address:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtAddress" class="form-control textBoxborder" TextMode="multiline" Columns="50" Rows="10" Height="100" runat="server" required></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>




                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Mobile:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtMobile" class="form-control textBoxborder" runat="server" maxlength="10"  pattern="[0-9]{10}"  ></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels" for="email" >Email:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtEmail" class="form-control textBoxborder" runat="server" type="email"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 Span-One">
                    <div class="col-md-11">
                        <div class="form-group">
                            <label class="control-label col-md-1 regFormLabels">Marital:</label>





                            <div class="col-md-11">
                                <asp:TextBox ID="txtMarital" class="form-control textBoxborder" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="col-md-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-md-3">
                    <table style="height: 100%;">
                      
                        <tr>
                            <td>
                                <uc1:ProfilePicUpload runat="server" ID="ProfilePicUpload" />
                                
                            </td>
                            <td></td>
                        </tr>
                        <tr style="height:200px;">
                            <td>&nbsp
                            </td>

                            <td>&nbsp
                            </td>
                        </tr>
                      
                        <tr style="height: 40%;">
                            <td style="width: 100%">
                                <div class=" auto-complete">
                                <div class="input-group stylish-input-group">
                                    <input type="text" class="form-control" placeholder="Search" style="height: 20%;" name="txtSearch" id="txtSearch"  />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: .1%;" runat="server" id="btnSearch" onserverclick="btnSearch_ServerClick">
                                            <i class="glyphicon glyphicon-search"></i>

                                        </button>
                                    </span>

                                </div>
                                    </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr style="height: 100%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                           <tr style="height: 100%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                           <tr style="height: 100%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                            <tr style="height: 100%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                        <tr style="height: 40%;">
                            <td>
                                <a href="#" role="button" data-toggle="modal" data-target="#myModal">View All Registrations </a>
                            </td>
                            <td></td>
                        </tr>
                        <tr style="height: 40%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                        <tr style="height: 40%;">
                            <td>
                                <a href="#" role="button" data-toggle="modal" data-target="#TodaysRegistration">Todays Registrations</a>
                            </td>
                            <td></td>
                        </tr>
                        <tr style="height: 40%;">
                            <td>&nbsp
                            </td>

                            <td></td>
                        </tr>
                       
                    </table>




                </div>
          
        </div>
        <footer>
            <div  class="footerDiv">

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
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;">
                                <tr>
                                    <td style="width:30%;">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE" CssClass="button footerButtonColumn" OnClick="btnSave_Click" />

                                    </td>
                                    <td>
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            </div>
        </footer>

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">View All Registrations</h4>

                    </div>
                    <div class="modal-body">

                        <asp:GridView ID="dtgViewAllRegistration" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID")+"," + Eval("Name") + "," + Eval("Address")+","+ Eval("Phone")+","+ Eval("Email")+","+Eval("DOB")+","+Eval("Gender")+","+Eval("MaritalStatus")%>' OnCommand="ImgBtnUpdate_Command" />
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#0080AA" Font-Bold="True" ForeColor="White"></HeaderStyle>

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
                        <button data-dismiss="modal" class="btn  btn-large">Close</button>

                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="TodaysRegistration" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Todays Registrations</h4>

                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="dtgViewTodaysRegistration" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandArgument='<%# Eval("PatientID")+"," + Eval("Name") + "," + Eval("Address")+","+ Eval("Phone")+","+ Eval("Email")+","+Eval("DOB")+","+Eval("Gender")+","+Eval("MaritalStatus")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#0080AA" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn  btn-large">Close</button>

                    </div>
                </div>

            </div>
        </div>

         

    </div>
</asp:Content>
