<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>
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
   <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1 regFormLabels" for="Name">Name:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtName" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Sex:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtSex" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Age:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtAge" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        
             
        <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Address:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtAddress" class="form-control textBoxborder"   TextMode="multiline" Columns="50" Rows="10" Height="100" runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>

         
        

             <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Mobile:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtMobile" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" for="email">Email:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtEmail" class="form-control textBoxborder" runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Marital:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtMarital" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Height:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtHeight" class="form-control textBoxborder" runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-4">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-8">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Weight:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtWeight" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
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
