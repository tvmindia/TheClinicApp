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
                    <div class="col-md-7" >
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
                            <div class="col-md-7">
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
                             <div class="col-md-5">           
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
                      
                   <table class="tokenPatientDetailsTable" id="divContainer" >
                       <tr>
                           <td class="tokenPatientDetailsTableColumn">
                                       <label  class="subheadingLabel " >Patient Details</label>

                           </td>
                       </tr>

                        <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                     
                                       <asp:Label ID="lblFile" CssClass="largefont " runat="server" Text=""></asp:Label>

                           </td>
                       </tr>
                        <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                    
                                          <asp:Label ID="lblName"  CssClass="tokenPatientDetailsName "  runat="server" Text=""></asp:Label>

                           </td>
                       </tr>
                        <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                        <asp:Label ID="lblAge" runat="server"  CssClass="tokenPatientDetailslabel" Text=""></asp:Label>

                           </td>
                       </tr>
                         <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                 <asp:Label ID="lblGender" runat="server" CssClass="tokenPatientDetailslabel" Text=""></asp:Label>
                           </td>
                       </tr>
                        <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                           <asp:Label ID="lblPhone" runat="server" CssClass="tokenPatientDetailslabel" Text=""></asp:Label>

                           </td>
                       </tr>

                        <tr>
                           <td  class="tokenPatientDetailsTableColumn">
                                    <asp:Label ID="lblToken" Visible="false" CssClass="largefont tokenPatientDetailslabel"  runat="server" Text="Token NO"></asp:Label>

                           </td>
                       </tr>
                        
                   </table>
                                     

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
                    <div class="col-md-5">
                        <br />
                      
                       

                         <div class="rounded_corners"  style="width: 400px">

                             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                                     

                                    
                                     <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False"  CssClass="footable" Style="max-width: 500px">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                  <asp:TemplateField HeaderText="DELETE">
                                                  <ItemTemplate>
                                                       <asp:ImageButton ID="ImgBtnDelete" runat="server"  ImageUrl="~/Images/Cancel.png"   Width="25px"  OnClientClick="return confirm('Deletion Confirmation \n\n\n\n\ Are you sure you want to delete this item ?');" OnClick="ImgBtnDelete_Click"/>

                                                  </ItemTemplate>
                                              </asp:TemplateField>
                               <asp:BoundField HeaderText="DOCTOR NAME" DataField="DOCNAME" />
                                              <asp:BoundField HeaderText="TOKEN NO" DataField="TokenNo" />
                                              <asp:BoundField HeaderText="PATIENT NAME" DataField="Name" />
                                              <asp:BoundField HeaderText="TIME" DataField="DateTime" />
                                               
                                           
                                               
                                         
                            </Columns>
                            <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#3FBF7F" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
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
                                        <asp:Button ID="btnBookToken" runat="server" Text="BOOK TOKEN" CssClass="button " OnClick="btnBookToken_Click" />

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
