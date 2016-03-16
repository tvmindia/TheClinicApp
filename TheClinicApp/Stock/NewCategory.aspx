<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewCategory.aspx.cs" Inherits="TheClinicApp.Stock.NewCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <table>
        <tr>
            <td>Medicine Name </td>
            <td>
                <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>

             </td>
        </tr>
       
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
</asp:Content>
