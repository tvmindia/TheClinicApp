<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <div class="container" style="width:100%;">
         <form class="form-horizontal" role="form">
   <div class="col-lg-12 Span-One">
         <div class="col-lg-4 ">
                       
                        <label >Name </label>
                        
                    </div>
                    <div class="col-lg-4 ">
                      
                      
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                      
                        
                    </div>
                     <div class="col-lg-4 ">
                        
                    </div>
                </div>
        <div class="col-lg-12 Span-One">
         <div class="col-lg-4 ">
                       
                       <label  >Sex </label>
                        
                    </div>
                    <div class="col-lg-4 ">
                        
                       
                       
                            <asp:TextBox ID="txtSex" runat="server"></asp:TextBox>
                       
                       
                    </div>
                     <div class="col-lg-4 ">
                        
                    </div>
                </div>
        <div class="col-lg-12 Span-One">
         <div class="col-lg-4 ">
                       
                       <label >Age </label>
                        </div>
                   
                    <div class="col-lg-4 ">
                    
                       
                       
                            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                       
                        </div>
                    
                     <div class="col-lg-4 ">
                        
                    </div>
                </div>
             </form>
 </div>
</asp:Content>
