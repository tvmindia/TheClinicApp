<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="StockOut.aspx.cs" Inherits="TheClinicApp.Stock.StockOut" %>
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

 <%--   //------------- POPUP SCRIPT ---------%>

    <script src="../Scripts/jquery-1.12.0.min.js"></script>
 
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
     <script src="../Scripts/bootstrap.min.js"></script>

     <%--  //------------- AUTOFILL SCRIPT ---------%>
   <script src="../Scripts/jquery-1.8.3.min.js"></script>
    
    <script src="../Scripts/ASPSnippets_Pager.min.js"></script>

     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
      <script type="text/javascript">
          function SetIframeSrc(HyperlinkID) {
              if (HyperlinkID == "NewIssueID") {
                  var issueIframe = document.getElementById('NewIssueFrame');
                  issueIframe.src = "NewIssue.aspx";

                  //$('#NewIssue').modal('show');

              }
          }

        </script> 
    
    <script type="text/javascript">


        $(function () {
            $("[id*=gvReceiptHD] td").click(function () {

                DisplayDetails($(this).closest("tr"));
            });
        });
        function DisplayDetails(row) {
            var refno = "";
            refno =  $("td", row).eq(0).html();
            window.location = "NewIssue.aspx?refNo=" + refno;
            
        }




        $(function () {
           
            GetReceiptHD(1);
        });

        $("[id*=txtSearch]").live("keyup", function () {
            debugger;
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

                        var refno = "";
                        refno +=  $("td", row).eq(0).html();
                        //$("td", row).eq(0).html('<a href="NewIssue.aspx">' + $(this).find("RefNo1").text() + '</a>');
                  //$("td", row).eq(0).html('<a href="NewIssue.aspx?refNo="'+refno+'">' + $(this).find("RefNo1").text() + '</a>');
                    
                    $("td", row).eq(0).html($(this).find("RefNo1").text());
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


 
        
    Search :  
  
 <asp:TextBox runat="server"  ID="txtSearch" ></asp:TextBox>
        <br />
        <br />
         <%--<asp:BoundField DataField="Date" HeaderText="Date"  ItemStyle-CssClass="Match"  />--%>
         <%--<asp:BoundField DataField="RefNo1" HeaderText="RefNo1"  ItemStyle-CssClass="Match"  />--%>
    <asp:GridView ID="gvReceiptHD" runat="server" Style="width: 400px" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
            
               
              <asp:BoundField DataField="RefNo1" HeaderText="RefNo1"   ItemStyle-Font-Underline="true" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Blue" ItemStyle-CssClass="cursorshow" />

                <asp:BoundField DataField="RefNo2" HeaderText="RefNo2"  ItemStyle-CssClass="Match"  />
               


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
    <br />


    <asp:Button ID="btnNewIssue" runat="server" Text="New Issue" OnClick="btnNewIssue_Click" />
    
    <%--<a href="#" role="button"  id="Issue" onclick="openModal()" >New Issue</a>--%>
    <%--<a href="#" role="button" id="NewIssueID" data-toggle="modal" data-target="#NewIssue" onclick="SetIframeSrc('NewIssueID')">New Issue</a>--%>

    
  <%--   //------------- New Issue ---------%>

    <div class="modal fade" id="NewIssue" role="dialog">
        <div class="modal-dialog modal-lg1">

            <!-- Modal content-->

            <div class="modal-content" style="height: 60%; overflow-y: no-display;">
                <div class="modal-header" style="background-color: #00CC99">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size: 20px; color: white">New Issue</h4>

                </div>
                <div class="modal-body" style="background-color: lightgoldenrodyellow; overflow-x: hidden; overflow-y: hidden;">
                    <div class="col-md-12">
                        <%--<iframe style="width: 100%; height: 100%" id="issueIframe"></iframe>--%>
                         <iframe id="NewIssueFrame" style ="width: 100%; height: 100%"></iframe>

                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
