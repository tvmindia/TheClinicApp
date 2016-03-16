<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="OutOfStock.aspx.cs" Inherits="TheClinicApp.Stock.OutOfStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:GridView ID="gvOutOfStock" runat="server"  AutoGenerateColumns="False">
                                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                    <Columns>
                                        <%--  <asp:BoundField DataField="MedicineID" HeaderText="MedicineID" />--%>
                                        <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                                        <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                                        <asp:BoundField DataField="ReOrderQty" HeaderText="ReOrder Quantity" />
                                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name"/>
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
</asp:Content>
