<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="underConstruction.aspx.cs" Inherits="TheClinicApp.underConstruction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       .underConstructionLogo {
    background-position: center center;
    position: absolute;
    top: 2%;
    background-image: url('../Images/screw.png');
    background-repeat: no-repeat;
    width: 90%;
    height: 80%;
    background-size: 10%;
    text-align: center;
    vertical-align: bottom;
}

.underConstructionTitle {
    font-family: 'Segoe UI Light';
    font-size: xx-large;
    color: #333333;
    position: relative;
    top: 60%;
}
   </style>
    <div class="fullsizeDiv">
        <div class="underConstructionLogo">
      
        <p class="underConstructionTitle">
            <asp:Label ID="lblmsg" runat="server" Text="Oops ! Sorry ,this page is under construction !!"></asp:Label></p>
    </div>
    </div>
</asp:Content>
