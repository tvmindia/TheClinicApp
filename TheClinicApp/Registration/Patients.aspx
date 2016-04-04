<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true"  EnableEventValidation="false" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>

<%@ Register Src="~/UserControl/ProfilePicUpload.ascx" TagPrefix="uc1" TagName="ProfilePicUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel DefaultButton="btnSave" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />                
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
<style>
.ui-autocomplete {
background: fixed;
font-size:small;
font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif;
background-color: ghostwhite;
 box-shadow:1px 1px 1px 1px #f3e6d8;
}
#divDisplayNumber{
    background-color:ghostwhite;
   
}
.modal-lg1{
    width:40%;
    overflow-x:hidden;
    overflow-y:hidden;
}
</style>

        <%--------------------------Stylesheet and Scripts---------------------------%>
    
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
         
    <script>
        $(document).ready(function () {
            var ac=null;
            ac = <%=listFilter %>;
            $( "#txtSearch" ).autocomplete({
                source: ac
            });
           
          
          });
         </script>      
   
 <asp:ScriptManager runat="server"></asp:ScriptManager>
        <script type="text/javascript">
            function openModal() {
                $('#TokenRegistration').modal('show');
            }
            function openmyModal() {
                $('#myModal').modal('show');
            }
        </script>
       
  <%-------------------Main Container-----------------------------%>
          
    <div class="container-fluid bodyDiv" >
        <label class="headingLabel">New Patient Registration </label>

        <%-----------------------Main div-----------------------%>

        <div class="col-sm-12 Span-One ">

            <%-----------------------left div with textfield-----------------------%>

            <div class="col-xs-9">
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <div class="col-xs-11">
                            </div>
                            <div class="col-xs-1">
                                <div class="col-xs-12">
                                    &nbsp
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                             <div class="col-xs-11">
                            </div>
                            <div class="col-xs-1">
                                <div class="col-xs-12">
                                    &nbsp
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Name:</label>
                             <div class="col-xs-10">
                                <asp:TextBox ID="txtName" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit" pattern="^[A-z][A-z\.\s]+$"
                                    ></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Sex:</label>

                             <div class="col-xs-10">
                                
                                 <asp:RadioButton ID="rdoMale" runat="server" GroupName="Active" Text="Male" CssClass="checkbox-inline" />
                                <asp:RadioButton ID="rdoFemale" runat="server" GroupName="Active" Text="Female" CssClass="checkbox-inline" />
                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
             
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Age:</label>
                             <div class="col-xs-10">
                             
                                <asp:TextBox ID="txtAge" class="form-control textBoxborder numberTypeTextBox" runat="server" required  ValidationGroup="Submit" type="number" min ="1" max="200" ></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>


                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Address:</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtAddress" class="form-control textBoxborder" TextMode="multiline" Columns="50" Rows="10" Height="100" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                 <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Mobile:</label>
                             <div class="col-xs-10">
                                <asp:TextBox ID="txtMobile" class="form-control textBoxborder" runat="server" minlength="10" pattern="{10}[0-9]"  ></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels" for="email" >Email:</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtEmail" class="form-control textBoxborder" runat="server" type="email" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:TextBox>

                            </div>
                              
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-2 regFormLabels">Marital:</label>
                             <div class="col-xs-10">
                               
                                 <asp:RadioButton ID="rdoSingle" runat="server" GroupName="Status" Text="Single" CssClass="checkbox-inline" />
                                <asp:RadioButton ID="rdoMarried" runat="server" GroupName="Status" Text="Married" CssClass="checkbox-inline" />
                                 <asp:RadioButton ID="rdoDivorced" runat="server" GroupName="Status" Text="Divorced" CssClass="checkbox-inline" />
                           

                            </div>
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






                <%----------------------------------------- Display token and file number--------------------------------------------------%>

             
                
                
                
                
                    <div class="col-md-12" id="divDisplayNumber" visible="false" style="font-size:20px" runat="server">
                    <table>
                        <tr>
                            <td>
                                 <asp:Label ID="lblDisplayFileNumber" runat="server" Text="File Number"></asp:Label>:
                            </td>
                            <td>
                                <asp:Label ID="lblFileCount" runat="server" Text=""></asp:Label>
                            </td>
                            </tr>
                        <tr>
                            <td>
                                 <asp:Label ID="lblTokenNumber" runat="server" Text="Token Number"></asp:Label>:
                            </td>
                            <td>
                                <asp:Label ID="lblTokencount" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
           
            <%-----------------------Right div with upload-----------------------%>

            <div class="col-xs-4" style="height:400px;width:20%;" >
                  
                <table style="height:100%;width:100%;margin-left:0px; padding-left:0px;">
                    <tr style="height:100%;width:100%;">
                        <td style="height:100px;width:100%;">
                             <img src="../Images/UploadPic.png" style="width:50%;" id="ProfilePic" runat="server" />
                            <asp:FileUpload ID="FileUpload1" ForeColor="Green" required Font-Size="12px" runat="server" />

                        </td>
                        
                    </tr>
                    

                    <tr style="height:100%;width:100%;">
                        <td style="height:100%;width:100%;">
                               <div>
                                <div class="input-group stylish-input-group">
                                    <input type="text" class=" form-control" placeholder="Search" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: 0px;" runat="server" id="btnSearch" onserverclick="btnSearch_ServerClick1" formnovalidate>
                                          
                                            <img src="../Images/Search-WF.png" />
                                        </button>
                                    </span>

                                </div>
                                    </div>
                        </td>
                        
                    </tr>

                       <tr style="height:100%;width:100%;">
                        <td style="height:50px;width:100%;">
                                <a href="#" role="button" data-toggle="modal" data-target="#myModal" >View All Registrations </a>
                        </td>
                        
                    </tr>
                    <tr style="height:100%;width:100%;">
                        <td style="height:50px;width:100%;">
                              <a href="#" role="button" data-toggle="modal" data-target="#TodaysRegistration" >Todays Registrations</a>
                        </td>
                        
                    </tr>
                     <tr style="height:100%;width:100%;">
                        <td style="height:50px;width:100%;">
                              <a href="#" role="button" data-toggle="modal" data-target="#TokenRegistration" >Register Token !</a>
                        </td>
                        
                    </tr>
                      
                </table>

              

                </div>
          
        </div>

        <%-----------------------footer div-----------------------%>

        <footer  class="footerDiv">
         

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%;height:25% ">
                            <div id="Errorbox"  style="height:25%;  display:none;"  runat="server" >
                               <a class="close" data-dismiss="alert">×</a>  

                            <div>
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>
                                 <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

                            </div>

                            </div>                     

                        </td>
                        <td style="height: 100%;   width:20%;"> 

                        </td>
                        <td style="height: 100%;   width:30%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:80%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:40%;">
                                       
                                         <div class="form-group">
                                       
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE" type="submit" CssClass="button" OnClick="btnSave_Click" ValidationGroup="Submit" />
                                        </div>
                                    </td>
                                    <td style="width:40%">
                                        <div class="form-group">
                                        <asp:Button ID="btnnew" runat="server" Text="NEW"  type="submit" CssClass="button" OnClick="btnnew_Click" Visible="false" formnovalidate />
                                            </div>
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>

        <!---------------------------------------------------------------------------------------------------------------------------------->
        <!---------------------------------------------------------------------------------------------------------------------------------->



        <!---------------------------------- Modal Section --------------------------------------->
        <div class="modal fade" id="TokenRegistration" role="dialog">
            <div class="modal-dialog modal-lg1">

                <!-- Modal content-->
                
                <div class="modal-content" style="height:60%;overflow-y:no-display;">
                    <div class="modal-header" style="background-color:#00CC99">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="font-size:20px;color:white">Token Registration</h4>

                    </div>
                    <div class="modal-body" style="background-color:lightgoldenrodyellow;overflow-x:hidden;overflow-y:hidden;">
                        <div class="col-md-12">
                            Would You Like to Book A Token ?
                        </div>
                         <div class="col-md-12">
                           <button type="button" class="close" data-dismiss="modal" style="color:green">>>>Skip</button>
                        </div>
                        <div class="col-md-12">
                            
                     <asp:Label Text="Select Your Doctor" Font-Size="Large" Font-Bold="true"  runat="server"></asp:Label>
                            <asp:DropDownList ID="ddlDoctorName" Height="40%" Width="100%" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-md-12 Span-One">
                        
                    <div class="col-md-7" >
                        <div class="col-md-12 Span-One">
                            
                             
                        </div>
                         

                        <div class="col-md-12 Span-One">
                            <div class="col-md-7">
                                <div class="form-group">
                   
                                    
                                </div>
                           
                            </div>
                             <div class="col-md-5">           
                                
                            </div>
                        </div>

                          <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    
                                </div>
                           
                            </div>
                             
                        </div>
                        <%-- Patient Details Diplay region --%>
                        
                      
                   <table class="tokenPatientDetailsTable TileContent" id="divContainer" style="display:none" >
                       <tr>
                           <td class="tokenPatientDetailsTableColumn">
                                       <label  class="subheadingLabel" style="text-align:center" >Patient Details</label>

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

                        </div>
                    </div>
                    <div class="modal-footer" style="background-color:lightgoldenrodyellow">
                       <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:0%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:90%;">
                                         <div class="form-group">
                                        <asp:Button ID="btntokenbooking" runat="server" Text="BOOK TOKEN"  type="submit" CssClass="button" OnClick="btntokenbooking_Click" BorderColor="DarkSeaGreen" BackColor="wheat" ValidationGroup="Submit" formnovalidate />
</div>
                                    </td>
                                    <td>
                                       </td>
                                </tr>
                            </table>
                        ....
                    </div>
                </div>
                
            </div>
        </div>


        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog  modal-lg">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">View All Registrations</h4>

                    </div>
                    <div class="modal-body" >
                        
                        <asp:GridView ID="dtgViewAllRegistration" runat="server" AutoGenerateColumns="False" style="text-align:center;width:100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" AllowPaging="true" OnPageIndexChanging="dtgViewAllRegistration_PageIndexChanging" PageSize="5">
                            
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID")+"|" + Eval("Name") + "|" + Eval("Address")+"|"+ Eval("Phone")+"|"+ Eval("Email")+"|"+Eval("DOB")+"|"+Eval("Gender")+"|"+Eval("MaritalStatus")+"|"+Eval("image")+"|"+Eval("ImageType")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("PatientID")%>' OnClientClick="return confirm('Deletion Confirmation \n\n\n\n\ Are you sure you want to delete this item ?');" OnCommand="ImgBtnDelete_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Patient Name">
                                    
                                     <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#0080AA" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                            </div>
                   
                    <div class="modal-footer">
                   

                    </div>
                </div>

            </div>
        </div>
      
        
        <div class="modal fade" id="TodaysRegistration" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Todays Registrations</h4>

                    </div>
                    <div class="modal-body">
                     
                        <asp:GridView ID="dtgViewTodaysRegistration" runat="server" AutoGenerateColumns="False" style="text-align:center;width:100%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnUpdate1" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandArgument='<%# Eval("PatientID")+"|" + Eval("Name") + "|" + Eval("Address")+"|"+ Eval("Phone")+"|"+ Eval("Email")+"|"+Eval("DOB")+"|"+Eval("Gender")+"|"+Eval("MaritalStatus")+"|"+Eval("image")+"|"+Eval("ImageType")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete1" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("PatientID")%>' OnClientClick="return confirm('Deletion Confirmation \n\n\n\n\ Are you sure you want to delete this item ?');" OnCommand="ImgBtnDelete_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                
                            </Columns>

                            <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#0080AA" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        
                    </div>
                    <div class="modal-footer">
                       

                    </div>
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
        </div>
        <!------------------------------------------------------------------------------------------>
    </div>
      
        </asp:Panel>
    
</asp:Content>
