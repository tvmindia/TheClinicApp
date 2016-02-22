<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true"  EnableEventValidation="false" CodeBehind="Patients.aspx.cs" Inherits="TheClinicApp.Registration.Patients" %>

<%@ Register Src="~/UserControl/ProfilePicUpload.ascx" TagPrefix="uc1" TagName="ProfilePicUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <style>
.ui-autocomplete {
background: space;
background-color: ghostwhite;
 box-shadow:1px 5px 10px 5px #ccffe6;
}
    </style>

    <%--<style>
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 100;
        }

        .footerTable {
            height: 100%;
            background-color: transparent;
            padding-left: 0px;
            margin-left: 0px;
            width: 100%;
        }

        .button {
            background-color: gray;
            border: none;
            color: red;
            font-weight: bold;
            font-size: 16px;
            height: 100%;
            width: 100%;
            font: bolder 900;
            z-index: 1;
            margin-right: 0%;
            padding-right: 0%;
        }

        .headingLabel {
            margin-left: 20%;
            color: seagreen;
            font: bold;
            font-size: 17px;
            text-decoration: underline;
            padding-top: 2%;
        }

        .footerMessagesColumn {
            margin-left: 2%;
            width: 30%;
            padding-left: 2%;
          
        }

        .footerButtonColumn {
            width: 30%;
            margin-left: 0%;
         
        }

        .footerbuttonTable {
            margin-left: 1%;
        }
    </style>--%>
    <style>
        
    </style>
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
    function ClearTextBox() {
            $('textarea').empty();

            $("input:text").val('');
    }
    var W3CDOM = (document.createElement && document.getElementsByTagName);

    function initFileUploads() {
        if (!W3CDOM) return;
        var fakeFileUpload = document.createElement('div');
        fakeFileUpload.className = 'fakefile';
        fakeFileUpload.appendChild(document.createElement('input'));
        var image = document.createElement('img');
        image.src='pix/button_UploadPic.png';
        fakeFileUpload.appendChild(image);
        var x = document.getElementsByTagName('input');
        for (var i=0;i<x.length;i++) {
            if (x[i].type != 'file') continue;
            if (x[i].parentNode.className != 'fileinputs') continue;
            x[i].className = 'file hidden';
            var clone = fakeFileUpload.cloneNode(true);
            x[i].parentNode.appendChild(clone);
            x[i].relatedElement = clone.getElementsByTagName('input')[0];
            x[i].onchange = x[i].onmouseout = function () {
                this.relatedElement.value = this.value;
            }
        }
    }
    //$('#btnSave').bind("click",function(){ 
    //var imgVal = $('#fileupload').val(); 
    //alert(imgVal);
    //return false;
    //});
    <%--function previewFile() {
        var preview = document.querySelector('#<%=Image1.ClientID %>');
        var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }--%>
    </script>
    <%--<script>
        function OnClientButtonClicking(sender, args) {

            var btn = args.get_item();
            if (btn.get_value() == 'Delete') {

                args.set_cancel(!confirm('Do you want to delete ?'));
            }
            if (btn.get_value() == 'Save') {
                debugger;
                args.set_cancel(!validate());
            }
            if (btn.get_value() == 'Update') {

                args.set_cancel(!validate());
            }

        }
    </script>--%>
    <script>
        $(document).ready(function () {
            debugger;
            var ac=null;
            ac = <%=listFilter %>;
            $( "#txtSearch" ).autocomplete({
                source: ac
            });
        });
        //$('input[type="file"]').on('change', function (event, files, label) {
        //    var file_name = this.value.replace(/\\/g, '/').replace(/.*\//, '')
        //    $('.filename').text(file_name);
        //});
    </script>
 <asp:ScriptManager runat="server"></asp:ScriptManager>
    
    <div class="container-fluid bodyDiv" >
        <label class="headingLabel">New Patient Registration </label>
        <div class="col-sm-12 Span-One ">
            <div class="col-xs-8">
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
                            <label class="control-label col-xs-1 regFormLabels">Name:</label>





                            <div class="col-xs-11">
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
                            <label class="control-label col-xs-1 regFormLabels">Sex:</label>





                            <div class="col-xs-11">
                                <asp:TextBox ID="txtSex" class="form-control textBoxborder" required runat="server"  ValidationGroup="Submit"></asp:TextBox>

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
                            <label class="control-label col-xs-1 regFormLabels">Age:</label>





                            <div class="col-xs-11">
                             
                                <asp:TextBox ID="txtAge" class="form-control textBoxborder numberTypeTextBox" runat="server" required  ValidationGroup="Submit" type="number" min ="0" max="120" ></asp:TextBox>

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
                            <label class="control-label col-xs-1 regFormLabels">Address:</label>





                            <div class="col-xs-11">
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
                            <label class="control-label col-xs-1 regFormLabels">Mobile:</label>





                            <div class="col-xs-11">
                                <asp:TextBox ID="txtMobile" class="form-control textBoxborder" runat="server" maxlength="10"  pattern="[0-9]{10}"  ></asp:TextBox>

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
                            <label class="control-label col-xs-1 regFormLabels" for="email" >Email:</label>





                            <div class="col-xs-11">
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
                            <label class="control-label col-xs-1 regFormLabels">Marital:</label>





                            <div class="col-xs-11">
                                <asp:TextBox ID="txtMarital" class="form-control textBoxborder" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
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
            </div>
           
            <div class="col-xs-4" style="height:350px;width:30%;" >
                  
                <table style="height:100%;width:100%;margin-left:0px; padding-left:0px;">
                    <tr style="height:100%;width:100%;">
                        <td style="height:100px;width:100%;">
                           <div class="fileinputs">
                               <input type="file" class="file" />
	<div class="fakefile">
		
		<img src="../Images/UploadPic.png" style="width:60%;height:40%" />
	</div>
<%--<asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" style="display:none"/>
                               <asp:Image ID="Image1" onclick="ImageButton1_Click" ImageUrl="~/Images/icon-user-default.jpg" runat="server" formnovalidate />--%>
<%--<asp:ImageButton ID="ImageButton1" runat="server" onclick="ImageButton1_Click" ImageUrl="~/Images/icon-user-default.jpg" formnovalidate/>--%>
      <%--<asp:FileUpload ID="fileupload" CssClass="file" runat="server" />---%>                         
 <%--<input type="file" id="fileupload" class="file" name="annex" />
<span class="filename"></span>
 <div class="fakefile">  
  <img src="../Images/UploadPic.png" style="width:60%;height:40%" OnClick="document.getElementById('fileupload').click()" />
 </div>--%>
</div>  
                        </td>
                        
                    </tr>
                    

                    <tr style="height:100%;width:100%;">
                        <td style="height:100%;width:100%;">
                               <div>
                                <div class="input-group stylish-input-group">
                                    <input type="text" class="form-control" placeholder="Search" style="height: 20%;" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: 0px;;" runat="server" id="btnSearch" onserverclick="btnSearch_ServerClick1" formnovalidate>
                                          
                                            <img src="../Images/Search-WF.png" />
                                        </button>
                                    </span>

                                </div>
                                    </div>
                        </td>
                        
                    </tr>

                       <tr style="height:100%;width:100%;">
                        <td style="height:100px;width:100%;">
                                <a href="#" role="button" data-toggle="modal" data-target="#myModal" >View All Registrations </a>
                        </td>
                        
                    </tr>
                    <tr style="height:100%;width:100%;">
                        <td style="height:100%;width:100%;">
                              <a href="#" role="button" data-toggle="modal" data-target="#TodaysRegistration" >Todays Registrations</a>
                        </td>
                        
                    </tr>
                </table>

              

                </div>
          
        </div>
        <footer  class="footerDiv">
         

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
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:80%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:30%;">
                                         <div class="form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE"  type="submit" CssClass="button  " OnClick="btnSave_Click" ValidationGroup="Submit" />
</div>
                                    </td>
                                    <td>
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog  modal-lg">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">View All Registrations</h4>

                    </div>
                    <div class="modal-body" >
                        
                        <asp:GridView ID="dtgViewAllRegistration" runat="server" AutoGenerateColumns="False" style="text-align:center;width:100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID")+"|" + Eval("Name") + "|" + Eval("Address")+"|"+ Eval("Phone")+"|"+ Eval("Email")+"|"+Eval("DOB")+"|"+Eval("Gender")+"|"+Eval("MaritalStatus")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("PatientID")%>' OnCommand="ImgBtnDelete_Command" formnovalidate />
                                       

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="PATIENT NAME">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="ADDRESS">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="PHONE">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="EMAIL">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#001a00" Font-Bold="True" ForeColor="White"></HeaderStyle>

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
                                        <asp:ImageButton ID="ImgBtnUpdate1" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandArgument='<%# Eval("PatientID")+"|" + Eval("Name") + "|" + Eval("Address")+"|"+ Eval("Phone")+"|"+ Eval("Email")+"|"+Eval("DOB")+"|"+Eval("Gender")+"|"+Eval("MaritalStatus")%>' OnCommand="ImgBtnUpdate1_Command" formnovalidate />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete1" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("PatientID")%>' OnCommand="ImgBtnDelete1_Command" formnovalidate />
                                       

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

    </div>
    
</asp:Content>
