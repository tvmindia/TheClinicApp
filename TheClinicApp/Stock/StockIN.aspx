<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="StockIN.aspx.cs" Inherits="TheClinicApp.Stock.StockIN" %>

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


    <div class="container-fluid bodyDiv">
        <label class="headingLabel">Stocks IN</label>
        <div class="col-sm-12 Span-One ">

            <%-- center Block --%>



            <div class="col-xs-6  ">
                Search:
    <asp:TextBox runat="server" ID="txtSearch" AutoPostBack="true"></asp:TextBox>

            </div>

            <div class="col-xs-6  ">
                <asp:Button ID="btnAddNewReceipt" runat="server" Text="Add New Receipt" OnClick="btnAddNewReceipt_Click" />
            </div>

        </div>
        <div class="col-sm-12 Span-One ">
            <br />
        </div>

        <div class="col-sm-12 Span-One ">
            <div>
                <asp:GridView ID="GridViewStockin" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Receipt ID" DataField="ReceiptID" />
                        <asp:HyperLinkField DataTextField="RefNo1" HeaderText="Bill Number" DataNavigateUrlFields="ReceiptID" DataNavigateUrlFormatString="~/Stock/ExistingStockIn.aspx?ReceiptID={0}" />
                        <asp:BoundField DataField="RefNo2" HeaderText="Reference Number" />
                        <asp:BoundField HeaderText="Date" DataField="Date" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>
