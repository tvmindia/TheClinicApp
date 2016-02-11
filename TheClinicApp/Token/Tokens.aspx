<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Tokens.aspx.cs" Inherits="TheClinicApp.Token.Tokens" %>
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
   

    <div class="container bodyBackground" style="width:100%;">
          <label  class="headingLabel" >Token</label>
        <div class="col-md-12 Span-One">
                    <div class="col-md-9" >
                        <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                 
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
                            <div class="col-md-10">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                       
                                        <label  class="headingLabel" >Patient Details</label>
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-2">           
                                <div class="col-md-12">                 
                                      
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >File:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> #3598</label>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels  "  >Name:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label class="" > name</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Age:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> 23</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Phone:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label>5936434</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Gender:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> Male</label>
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
                                     <asp:Timer ID="Timer1" Interval="10000" runat="server"></asp:Timer>

                                      <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False">
                                          <Columns>
                                              <asp:BoundField HeaderText="DOCTOR NAME" />
                                              <asp:BoundField HeaderText="TOKEN NO" />
                                              <asp:BoundField HeaderText="PATIENT NAME" />
                                              <asp:BoundField HeaderText="TIME" />
                                          </Columns>
                                     </asp:GridView>

                                 </ContentTemplate>
                             </asp:UpdatePanel>

                            
                      


                         </div>
                    </div>

      </div>

     <footer>
            <div style="position: fixed; background: rgba(0, 0, 0, 0.1); bottom: 0%; width: 100%; margin-left: 0px; height: 10%;">

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
                        <td style="height: 100%;   width:50%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;">
                                <tr>
                                    <td style="width: 10%;">
                                        <asp:Button ID="btnBookToken" runat="server" Text="BOOK TOKEN" CssClass="button footerButtonColumn" OnClick="btnBookToken_Click" />

                                    </td>
                                    <td>
                                        <label style="font-weight: bold; margin-left: 0px;">
                                            <img src="../Images/tick.png" style="font-weight: bold;" /></label></td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            </div>
        </footer>

    </div>
</asp:Content>
