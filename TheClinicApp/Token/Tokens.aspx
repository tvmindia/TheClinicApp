<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Tokens.aspx.cs" Inherits="TheClinicApp.Token.Tokens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
   

    <div class="container bodyDiv" style="width:100%;">
          <label  class="headingLabel" >Patient Token Booking</label>
        <div class="col-md-12 Span-One">
                    <div class="col-md-9" >
                        <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>
                         <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                  
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-6">
                                <div class="form-group">
                   
                                    <div class="col-md-12">

                                      <div class="input-group stylish-input-group">
                                    <input type="text" name="txtSearch" class="form-control" placeholder="Patient Search" style="height: 20%;" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" id="btnSearch"  style="height: .1%;"  runat="server" onserverclick="btnSearch_ServerClick">
                                            <i class="glyphicon glyphicon-search"></i>

                                        </button>
                                    </span> 
                                          
                                </div>
                                        
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-6">           
                                <div class="col-md-12">                 
                                     <asp:DropDownList ID="ddlDoctorName" Height="30px" Width="100" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                          <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                      &nbsp
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>
                        <%-- Patient Details Diplay region --%>
                   
                           <div class="col-md-12 Span-One">
                            <div class="col-md-11">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                       <label  class="subheadingLabel" >Patient Details</label>
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-1">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                       <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                       <asp:Label ID="lblFile" runat="server" Text=""></asp:Label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                    
                                </div>
                            </div>
                        </div>
                       
                         <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-11">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <asp:Label ID="lblName" CssClass="largefont"  runat="server" Text=""></asp:Label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-1">           
                                <div class="col-md-12">                 
                                   
                                </div>
                            </div>
                        </div>

                         <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                        <asp:Label ID="lblAge" runat="server" Text=""></asp:Label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                    <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>

                         <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                           <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                   
                                </div>
                            </div>
                        </div>

                     <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-1">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                        
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-11">           
                                <div class="col-md-12">                 
                                    <asp:Label ID="lblToken" Visible="false" CssClass="largefont" runat="server" Text="Token NO"></asp:Label>
                                </div>
                            </div>
                        </div>

                            <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 <%-- hidden fields --%>
                                        <asp:HiddenField ID="HiddenPatientID"  runat="server" />
                                        <asp:HiddenField ID="HiddenClinicID" runat="server" />
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                    </div>
                    <%--token gridview region --%>
                    <div class="col-md-3">
                         <div  >

                             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                                     

                                      <asp:GridView ID="GridViewTokenlist" runat="server" DataKeyNames="UniqueId"   AutoGenerateColumns="False">
                                          <Columns>
                                              <asp:BoundField HeaderText="DOCTOR NAME" DataField="DOCNAME" />
                                              <asp:BoundField HeaderText="TOKEN NO" DataField="TokenNo" />
                                              <asp:BoundField HeaderText="PATIENT NAME" DataField="Name" />
                                              <asp:BoundField HeaderText="TIME" DataField="DateTime" />
                                               
                                              <asp:TemplateField HeaderText="DELETE">
                                                  <ItemTemplate>
                                                       <asp:ImageButton ID="ImgBtnDelete" runat="server"  ImageUrl="~/Images/Delete.png"  Width="25px"  OnClientClick="return confirm('Deletion Confirmation \n\n\n\n\ Are you sure you want to delete this item ?');" OnClick="ImgBtnDelete_Click"/>

                                                  </ItemTemplate>
                                              </asp:TemplateField>
                                               
                                          </Columns>
                                         
                                     </asp:GridView>

                                 </ContentTemplate>
                             </asp:UpdatePanel>

                            
                      


                         </div>
                    </div>

      </div>

     <footer>
            <div  class="footerDiv">

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%; ">
                            <div id="Errorbox"  style="height:100%;  display:none;"  runat="server" >
                               <a class="close" data-dismiss="alert">×</a>  

                            <div>
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>      <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

</div>
       </div>                     

                        </td>
                        
                      <td style="height: 100%;   width:20%;">

                        </td>
                        <td style="height: 100%;   width:30%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;">
                                <tr>
                                    <td style="width:30%;">
                                        <asp:Button ID="btnBookToken" runat="server" Text="BOOK TOKEN" CssClass="button footerButtonColumn" OnClick="btnBookToken_Click" />

                                    </td>
                                    <td>
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            </div>
        </footer>

    </div>
</asp:Content>
