<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewMedicine.aspx.cs" Inherits="TheClinicApp.Stock.NewMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table>
        <tr>
            <td>Medicine Name </td>
            <td><asp:TextBox ID="txtmedicineName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Medicine Code </td>
            <td><asp:TextBox ID="txtCode" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Reorder Quantity</td>
            <td><asp:TextBox ID="txtOrderQuantity" runat="server"></asp:TextBox></td>
        </tr>
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
</asp:Content>
