﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="StockOut.aspx.cs" Inherits="TheClinicApp.Stock.StockOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }

        .Pager span {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 20px;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #ccc;
        }

        .Pager a {
            text-align: center;
            display: inline-block;
            width: 20px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }

        .highlight {
            background-color: #FFFFAF;
        }

        .cursorshow {
            cursor: pointer;
        }
    </style>


      <%--   //------------- AUTOFILL SCRIPT ---------%>
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/ASPSnippets_Pager.min.js"></script>
   
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">


        $(function () {
            debugger;
            GetReceiptHD(1);
        });
        $("[id*=txtSearch]").live("keyup", function () {

            GetReceiptHD(parseInt(1));
        });
        $(".Pager .page").live("click", function () {
            GetReceiptHD(parseInt($(this).attr('page')));
        });
        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };
        function GetReceiptHD(pageIndex) {
            debugger;
            $.ajax({
                type: "POST",
                url: "../Stock/StockOut.aspx/GetReceiptHD",
                data: '{searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
        var row;
        function OnSuccess(response) {
            debugger;
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var ReceiptHD = xml.find("ReceiptHD");
            if (row == null) {
                row = $("[id*=gvReceiptHD] tr:last-child").clone(true);
            }
            $("[id*=gvReceiptHD] tr").not($("[id*=gvReceiptHD] tr:first-child")).remove();
            if (ReceiptHD.length > 0) {
                $.each(ReceiptHD, function () {
                    $("td", row).eq(0).html('<a href="#s">' + $(this).find("RefNo1").text() + '</a>');
                    
                    //$("td", row).eq(0).html($(this).find("RefNo1").text());
                    $("td", row).eq(1).html($(this).find("RefNo2").text());
                    //$("td", row).eq(2).html($(this).find("Date").text());
                    $("[id*=gvReceiptHD]").append(row);
                    row = $("[id*=gvReceiptHD] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");
                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                $(".Match").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvReceiptHD]").append(empty_row);
            }
        };
    </script>



        Search:
    <asp:TextBox runat="server" ID="txtSearch" AutoPostBack="true"></asp:TextBox>
        <br />
        <br />

        <asp:GridView ID="gvReceiptHD" runat="server" Style="width: 400px" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
            
                <%--<asp:BoundField DataField="RefNo1" HeaderText="RefNo1"  ItemStyle-CssClass="Match"  />--%>
              <asp:BoundField DataField="RefNo1" HeaderText="RefNo1"   ItemStyle-Font-Underline="true" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Blue" ItemStyle-CssClass="cursorshow" />

                <asp:BoundField DataField="RefNo2" HeaderText="RefNo2"  ItemStyle-CssClass="Match"  />
                <%--<asp:BoundField DataField="Date" HeaderText="Date"  ItemStyle-CssClass="Match"  />--%>


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

        <div class="Pager">
        </div>

        <br />
   
    
   

</asp:Content>