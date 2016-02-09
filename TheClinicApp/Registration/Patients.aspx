<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"/>
    <style>

        footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 100;
  
}
    </style>
    <link href="../Content/Input.css" rel="stylesheet" />

    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <div class="container table-responsive bodyBackground" style="width:100%;">
         <div class="col-lg-12 Span-One ">
               <div class="col-md-9" >
    <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                   
                        
                  
                  
                      
                      
                        <div class="col-md-11">
 
        
      </div>
                           <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                           </div>
               
                </div>

        </div>
   <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1 regFormLabels" for="Name" >Name:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11" >
  <asp:TextBox ID="txtName" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Sex:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtSex" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Age:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtAge" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
        
             
        <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Address:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtAddress" class="form-control textBoxborder"   TextMode="multiline" Columns="50" Rows="10" Height="100" runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>

         
        

             <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Mobile:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtMobile" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" for="email">Email:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtEmail" class="form-control textBoxborder" runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             <div class="col-md-12 Span-One">
           <div class="col-md-11">
                       <div class="form-group">
                     <label class="control-label col-md-1" >Marital:</label>
                        
                  
                  
                      
                      
                        <div class="col-md-11">
  <asp:TextBox ID="txtMarital" class="form-control textBoxborder"  runat="server"></asp:TextBox>
        
      </div>
                           </div>
               <div class="col-md-1">           
                  <div class="col-md-12">
                 
                        &nbsp
                    </div>
                   </div>
                </div>

        </div>
             </div>
                   </div>
                 <div class="col-md-3">
                       <div class="table-responsive">          
  <table >
      <tr>
      <td>
          &nbsp
      </td>
          <td>
              &nbsp
          </td>
          </tr>
       <tr style="height:50%;">
      <td>
          <img src="../Images/icon-user-default.jpg" width="70%" height="35%" />
      </td>
          <td>
       
          </td>
          </tr>
      <tr style="height:40%;">
      <td>
          &nbsp
      </td>
          
          <td>
            
          </td>
          </tr>
      
      <tr style="height:40%;" >
      <td style="width:90%">
            <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="Search"  style="height:20%;"/>
                  
                      <span   class="input-group-addon" style="height:0%;"> <button type="submit" style="height:.1%;">
                    <i class="glyphicon glyphicon-search"></i>

                        </button> </span>
                  
                </div>
      </td>
          <td >
              
          </td>
          </tr>
       <tr style="height:40%;">
      <td>
          &nbsp
      </td>
          
          <td>
            
          </td>
          </tr>
      <tr style="height:40%;">
          <td>
              <a href="#" role="button">View All Registrations</a>
          </td>
          <td>

          </td>
      </tr>
       <tr style="height:40%;">
      <td>
          &nbsp
      </td>
          
          <td>
            
          </td>
          </tr>
       <tr style="height:40%;">
          <td>
              <a href="#" role="button">Todays Registrations</a>
          </td>
          <td>

          </td>
      </tr>
       <tr style="height:40%;">
      <td>
          &nbsp
      </td>
          
          <td>
            
          </td>
          </tr>
       <tr>
          <td>
              <a href="#" role="button" class="nounderline">Other links</a>
          </td>
          <td>

          </td>
      </tr>
      </table>
 
                     
                             
    
             </div>
             </div>
        <footer>
           <div style="position:fixed; background-color:gray;  opacity:0.5;bottom:0%; width:100% ; margin-left:0px; height:10%;">

            <table class="auto-style3">
                <tr>
                    <td></td>
                    <td style="background-color:gray; opacity:0.5;" >&nbsp;<asp:Button ID="btnSave" runat="server" Text="SAVE" Height="61px" Width="112px"  BackColor="Transparent" ForeColor="Black"  /></td>
                    <td >&nbsp; <asp:Label ID="Label6" Visible="false" runat="server" Text="✓✓" Font-Bold="True" Font-Italic="True" ForeColor="#33CC33"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Visible="false" Text="✘" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label></td>
                    <td ></td>
                </tr>
            </table>

            
        </div>  
            </footer>
        </div>
</asp:Content>
