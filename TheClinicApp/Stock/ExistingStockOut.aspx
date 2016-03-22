<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="ExistingStockOut.aspx.cs" Inherits="TheClinicApp.Stock.ExistingStockOut" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    Issue No :
    <asp:Label ID="lblIssueNo" runat="server" Text=""></asp:Label>
    <br />

    Issued To :
    <asp:Label ID="lblIssuedTo" runat="server" Text=""></asp:Label>
    <br />

    Date :
    <asp:Label ID="lblIssueDate" runat="server" Text=""></asp:Label>
    <br />

     <br />
     <br />

    <asp:GridView ID="dtgExistingIssueByIssueNo" runat="server" AutoGenerateColumns="False" Style="text-align: center; width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>

                                <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("IssueID")+"|"+Eval("IssuedTo")+"|"+Eval("IssueNO")+"|"+Eval("Date")+"|"+Eval("Qty")+"|"+Eval("MedCode")+"|"+Eval("MedicineName")+"|"+Eval("CategoryName")%>' OnCommand="ImgBtnUpdate_Command" />


                                </ItemTemplate>

                            </asp:TemplateField>


                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("UniqueID")+"|"+Eval("MedicineID")%>' OnClientClick="ConfirmDelete()"  OnCommand="ImgBtnDelete_Command" />


                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                                 <asp:BoundField DataField="Unit" HeaderText="Unit">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="Qty" HeaderText="Qty">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                
                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <%--<HeaderStyle BackColor="#001a00" Font-Bold="True" ForeColor="White"></HeaderStyle>--%>
                            <HeaderStyle BackColor="#009933" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView>

    <asp:HiddenField ID="hdnIssueID" runat="server" />
</asp:Content>
