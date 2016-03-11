<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutofillGrid.aspx.cs" Inherits="TheClinicApp.AutofillGrid" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script>
        function test()
        {
            alert(1);
        }  
    </script>

</head>
<body>
    <form id="form1" runat="server">


    <div>

        


Search  :  <input id="Text1" type="text" onkeydown="test()" />
        
          <%--<asp:TextBox ID="txtSearch" runat="server"  AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"/>--%>
<hr />
        <asp:GridView ID="dtgMedicines" runat="server" Style="width: 400px" AutoGenerateColumns="False">
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

        <br />



    </div>


    </form>
</body>
</html>
