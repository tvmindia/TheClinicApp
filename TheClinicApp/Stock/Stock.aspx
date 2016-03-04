<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="TheClinicApp.Stock.Stock" %>

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
    <script src="../Scripts/mui.min.js"></script>
    
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
   




    <div class="container-fluid bodyDiv">
        <label class="headingLabel">Stocks</label>
        <div class="col-sm-12 Span-One ">

            <%-- center Block --%>

            

            <div class="col-xs-7  ">

      <%--          <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-3 regFormLabels">Code:</label>

                            </div>
                        </div>

                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <div class="input-group stylish-input-group">
                                <input type="text" class="form-control" placeholder="Search" style="height: 20%;" aria-haspopup="false" name="txtSearch" id="txtCodeSearch" />

                                <span class="input-group-addon" style="height: 0%;">
                                    <button type="submit" style="height: 0px;" runat="server" id="btnSearch">

                                        <img src="../Images/Search-WF.png" />
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>--%>


                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-3 regFormLabels">Medicine Name:</label>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <div class="input-group stylish-input-group">
                                <input type="text" class="form-control" placeholder="Search" style="height: 20%;" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                <span class="input-group-addon" style="height: 0%;">
                                    <button type="submit" style="height: 0px;" runat="server" id="btnSearchMedicine" onserverclick="btnSearchMedicine_ServerClick" formnovalidate>
                                        <img src="../Images/Search-WF.png" />
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <br />
                                <label class="control-label col-xs-4 regFormLabels">Category:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <br />
                           <%-- <asp:TextBox ID="txtCategory" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"> </asp:TextBox>--%>
                            <asp:DropDownList ID="ddlCategory" style="width:70%"  runat="server"></asp:DropDownList>
                        
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-6 regFormLabels">Date:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtDate" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"> </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-4 regFormLabels">Unit:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtUnit" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"> </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-4 regFormLabels">Quantity:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtQty" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit"> </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-4 regFormLabels">Reference:1/Bill No:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtReference1" class="form-control textBoxborder numberTypeTextBox" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label col-xs-4 regFormLabels">Reference:2/Bill No:</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtReference2" class="form-control textBoxborder numberTypeTextBox" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 Span-One">
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>

              
                  <%-- Primary Keys Receipt Header and Details --%>
                <asp:HiddenField ID="HiddenFieldReceiptID" runat="server" />
                <asp:HiddenField ID="HiddenFieldUniqueID" runat="server" />

                <%-- ClinicID,MedicineID Foreign Keys --%>
                <asp:HiddenField ID="HiddenFieldClinicID" runat="server" />
                <asp:HiddenField ID="HiddenFieldMedicineID" runat="server" />




                 <label class="subheadingLabel_1 ">Existing Details</label>
                <div class="rounded_corners" style="height:200px; ">

                   

                    <div class="col-xs-12 Span-One">
                        <div class="col-xs-4">
                            <div class="form-group">
                                <br />
                                <label class="control-label col-xs-4 regFormLabels">Unit:</label>

                                <div class="col-xs-8">
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-8">
                            <div class="col-xs-12">
                             
                                <asp:Label ID="lblUnit" class="control-label col-xs-4 regFormLabels" runat="server">
                                 </asp:Label>
                            </div>

                        </div>

                    </div>

                    <div class="col-xs-12 Span-One">
                        <div class="col-xs-4">
                            <div class="form-group">
                                <label class="control-label col-xs-4 regFormLabels">Quantity:</label>


                                <div class="col-xs-8">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-8">
                            <div class="col-xs-12">
                                     
                                   <asp:Label ID="lblQuantity" class="control-label col-xs-4 regFormLabels" runat="server">
                                 </asp:Label>
                            </div>
                        </div>


                    </div>

                    <div class="col-xs-12 Span-One">
                        <div class="col-xs-4">
                            <div class="form-group">
                                <label class="control-label col-xs-4 regFormLabels">Last Updated:</label>

                                <div class="col-xs-8">
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-8">
                            <div class="col-xs-12">
                                     <asp:Label ID="lblLastUpdated" class="control-label col-xs-4 regFormLabels" runat="server">
                                 </asp:Label>
                                
                            </div>
                        </div>

                    </div>

                </div>


            </div>


            <%--OUT OF STOCK/LESS STOCK LIST Block--%>

            <div class="col-xs-5  rounded_corners" style="height: 100%; width: 40%;">
                <div class="">
                    <label class="subheadingLabel_1 ">Out Of Stock List </label>

                    <div class="rounded_corners" style="width: 400px">

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewOutofStock" runat="server" Style="width: 400px" AutoGenerateColumns="False">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <%--  <asp:BoundField DataField="MedicineID" HeaderText="MedicineID" />--%>
                                        <asp:BoundField DataField="Name" HeaderText="Medicine Name" />
                                        <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                                        <asp:BoundField DataField="ReOrderQty" HeaderText="ReOrder Quantity" />
                                    </Columns>
                                    <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                                    <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                                    <HeaderStyle BackColor="#3FBF7F" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                    <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                                    <RowStyle BackColor="#EFF3FB"></RowStyle>

                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                    <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                    <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                    <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                    <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                </asp:GridView>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                </div>
                <br />
                <div class=" ">
                    <br />
                    <div>

                        <a id="hlkExternalIssue" href="../Stock/InventoryOut.aspx">External Issue </a>

                    </div>
                    <br />
                    <div><a href="#">View All Items </a></div>
                    <br />
                    <div><a href="#">Usage (Receive/Issue Detail) </a></div>
                    <br />


                </div>
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
                                <div class="form-group">
                                    <asp:Button ID="btnStock" runat="server" Text="ADD STOCK" type="submit" CssClass="button" OnClick="btnStock_Click" ValidationGroup="Submit" />

                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </table>

                </td>

            </tr>
        </table>



    </footer>





</asp:Content>
