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
    <link href="../Content/Input.css" rel="stylesheet" />

    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var ac=null;
            ac = <%=listFilter %>;
            $( "#txtSearch" ).autocomplete({
                source: ac
            });
        });
    </script>
    <div class="container bodyBackground" style="width:100%;    overflow-x:hidden;">
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
                                <asp:TextBox ID="txtName" class="form-control textBoxborder" runat="server" required></asp:TextBox>

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
                                <asp:TextBox ID="txtAge" class="form-control textBoxborder" runat="server" required></asp:TextBox>

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
                            <td style="width: 90%">
                                <div class="input-group stylish-input-group">
                                    <input type="text" class="form-control" placeholder="Search" style="height: 20%;" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: .1%;" runat="server" id="btnSearch" onserverclick="btnSearch_ServerClick">
                                            <i class="glyphicon glyphicon-search"></i>

                                        </button>
                                    </span>

                                </div>
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
                        <tr>
                            <td>
                                <a href="#" role="button">Other links</a>
                            </td>
                            <td></td>
                        </tr>
                    </table>




                </div>
          
        </div>
        <footer>
            <div style="position: fixed; background: rgba(0, 153, 153,.4); bottom: 0%; width: 100%; margin-left: 0px; height: 10%;">

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

                        <asp:GridView ID="dtgViewAllRegistration" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="DOB" HeaderText="Age"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                            </Columns>
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
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="DOB" HeaderText="Age"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#E3EAEB"></RowStyle>

                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
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
