﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutofillGrid.aspx.cs" Inherits="TheClinicApp.AutofillGrid" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autofill Gridview</title>



    <style type="text/css">
    body
    {
        font-family: Arial;
        font-size: 10pt;
    }
    table
    {
        border: 1px solid #ccc;
    }
    table th
    {
        background-color: #F7F7F7;
        color: #333;
        font-weight: bold;
    }
    table th, table td
    {
        padding: 5px;
        border-color: #ccc;
    }
    .Pager span
    {
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
    .Pager a
    {
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
    .highlight
    {
        background-color: #FFFFAF;
    }

  .cursorshow{cursor:pointer;}
</style>

    <%--<script src="Scripts/jquery.js"></script>
    <script src="Scripts/jquery-1.12.0.min.js"></script>--%>
    <script src="Scripts/jquery-1.8.3.min.js"></script>

    <script src="Scripts/ASPSnippets_Pager.min.js"></script>


<script type="text/javascript">

//---------

    //$(function () {
    //    $("[id*=gvMedicines] td").click(function () {
         
    //        DisplayDetails($(this).closest("tr"));
    //    });
    //});
    //function DisplayDetails(row) {
    //    var message = "";
    //    message += "Code: " + $("td", row).eq(0).html();
    //    message += "\nName: " + $("td", row).eq(1).html();
    //    message += "\nCategory: " + $("td", row).eq(2).html();
    //    alert(message);
    //}



    $(function () {
       
        GetMedicines(1);
    });
    $("[id*=txtSearch]").live("keyup", function () {
        debugger;
        GetMedicines(parseInt(1));
    });
    $(".Pager .page").live("click", function () {
        debugger;
        GetMedicines(parseInt($(this).attr('page')));
    });
    function SearchTerm() {
        return jQuery.trim($("[id*=txtSearch]").val());
    };
    function GetMedicines(pageIndex) {
        debugger;
        $.ajax({
            type: "POST",
            url: "AutofillGrid.aspx/GetMedicines",
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
        var Medicines = xml.find("Medicines");
        if (row == null) {
            row = $("[id*=gvMedicines] tr:last-child").clone(true);
        }
        $("[id*=gvMedicines] tr").not($("[id*=gvMedicines] tr:first-child")).remove();
        if (Medicines.length > 0) {
            $.each(Medicines, function () {
                var medicine = $(this);


                $("td", row).eq(0).html('<a href="#">' + $(this).find("MedicineCode").text() + '</a>');

               
                //$("td", row).eq(0).html($(this).find("MedicineCode").text());
                $("td", row).eq(1).html($(this).find("MedicineName").text());
                $("td", row).eq(2).html($(this).find("CategoryName").text());
                $("[id*=gvMedicines]").append(row);
                row = $("[id*=gvMedicines] tr:last-child").clone(true);
            });
            var pager = xml.find("Pager");
            $(".Pager").ASPSnippets_Pager({
                ActiveCssClass: "current",
                PagerCssClass: "pager",
                PageIndex: parseInt(pager.find("PageIndex").text()),
                PageSize: parseInt(pager.find("PageSize").text()),
                RecordCount: parseInt(pager.find("RecordCount").text())
            });

            $(".MedicineName").each(function () {
                var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
            });
        } else {
            var empty_row = row.clone(true);
            $("td:first-child", empty_row).attr("colspan", $("td", row).length);
            $("td:first-child", empty_row).attr("align", "center");
            $("td:first-child", empty_row).html("No records found for the search criteria.");
            $("td", empty_row).not($("td:first-child", empty_row)).remove();
            $("[id*=gvMedicines]").append(empty_row);
        }
    };
</script>
</head>
<body>
    <form id="form1" runat="server">

   



    <div>

      
      
            Search:
    <asp:TextBox runat="server" ID="txtSearch" AutoPostBack="true"  ></asp:TextBox>



    <asp:GridView ID="gvMedicines" runat="server"   Style="width: 400px" AutoGenerateColumns="False">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                               <%-- <asp:TemplateField>
<ItemTemplate>
<asp:HyperLink ID="HyperLink1" Text='<%# Bind("MedicineCode") %>' NavigateUrl='<%# Bind("MedicineCode", "~/Images/{0}") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>--%>
                                        <asp:BoundField DataField="MedicineCode" HeaderText="Medicine Code" ItemStyle-Font-Underline="true" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Blue" ItemStyle-CssClass="cursorshow"  />
                                        <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                                         
                                      
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

<%--Search  :  <input id="Text1" type="text" onkeydown="test()" />--%>
        
          <%--<asp:TextBox ID="txtSearch" runat="server"  AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"/>--%>

        

        <br />



    </div>
       

    </form>
</body>
</html>
