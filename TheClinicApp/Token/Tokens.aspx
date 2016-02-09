<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Tokens.aspx.cs" Inherits="TheClinicApp.Token.Tokens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
   
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <div class="container bodyBackground" style="width:100%;">
        
         
        <div class="col-md-12 Span-One">
           <div class="col-md-8">
               <div class="form-group">
                   <asp:TextBox ID="TextBox1" Text="Search Patient Details" runat="server"></asp:TextBox><br />
                   <asp:TextBox ID="TextBox2" Text="Select a Doctor" runat="server"></asp:TextBox>
                   <div class="col-md-11">
                       
                   </div>
               </div>
               <div class="col-md-4">           
                  <div class="col-md-12">                 
                        &nbsp
                  </div>
               </div>
           </div>
        </div>


    </div>
</asp:Content>
