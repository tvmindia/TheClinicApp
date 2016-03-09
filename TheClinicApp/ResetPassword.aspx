<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="TheClinicApp.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblNewPassword" runat="server" Text="Label">

    </asp:Label>
      <asp:TextBox ID="txtNewPassowrd" runat="server">

    </asp:TextBox>

    <asp:Label ID="lblConfirmPassword" runat="server" Text="Label">

    </asp:Label>
  
    <asp:TextBox ID="txtConfirmPassword" runat="server">

    </asp:TextBox>

    <asp:Button ID="btnReset" runat="server" Text="Reset" />
</asp:Content>
