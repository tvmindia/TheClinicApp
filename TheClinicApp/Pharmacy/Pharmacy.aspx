﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Pharmacy.aspx.cs" Inherits="TheClinicApp.Pharmacy.Pharmacy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*.auto-style1 {
            width: 10%;
        }
        .auto-style3 {
            width: 350px;
        }*/
        table#t01 tr:nth-child(even) {
    background-color: #eee;
     
}
        table#t01 tr:nth-child(odd) {
            background-color: #fff;
        }
        table#t01{
            box-shadow: 1px 1px 1px 1px #737373;
        }
        .auto-style1 {
            height: 17px;
        }
        input[type="text"] {
    width: 125px;
    box-shadow: 1px 1px 1px 1px #347300;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- load MUI -->
   
    <link href="../Content/mui.min.css" rel="stylesheet" />
    <script src="../Scripts/mui.min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
 
    <div class="mui-container"> 
        
        <div class="col-md-12">
             <label class="headingLabel" style="text-align:center">Pharmacy Page</label>
             <div class="col-md-9">
                 <div class="row">
                 <div class="input-group stylish-input-group mui-select">
                                    <input type="text" class=" form-control" placeholder="Search" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: 0px;" runat="server" id="btnSearch" formnovalidate>
                                          
                                            <img src="../Images/Search-WF.png" />
                                        </button>
                                    </span>

                                </div>

                 </div>
                 


        <div class="mui-panel"> 
           
            <h1>Patient Details</h1>
         <div class="col-phar-patient">
             <table class="table-responsive">
                 <tr>
                     <td style="width:100%">
                         <asp:Label ID="lblName" runat="server"  Text="Mr.THOMSON K VARKEY" style="font-size: large"></asp:Label>

                     </td>
                      <td style="width:100%">
                         <asp:Label ID="lblPhone" runat="server" Text="9656605436" style="font-size: medium;text-align:right"></asp:Label>
                     </td>

                 </tr>
                 </table>
             </div>
            <div style="width:100%">
             <table id="t01" style="width:98.75%" >
                 <tr>
                     <td class="auto-style1">
                         <asp:Label ID="lblAddress" runat="server" Text="KATTINGAL HOUSE CHOONDAL P.O PUTHUSSERY"></asp:Label>
                     </td>
                     <td class="auto-style1">
                        
                     </td>
                 </tr>
                  <tr>
                         <td class="auto-style3">
                             <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>:

                         </td>
                         <td class="auto-style1">
                             <asp:Label ID="lblAgeCount" runat="server" Text="23"></asp:Label>

                         </td>
                      </tr>
                 <tr>

                     <td class="auto-style3">
                         <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>:
                     </td>
                         <td class="auto-style1">
                             <asp:Label ID="lblMale" runat="server" Text="MALE"></asp:Label>


                         </td>
                     </tr>
                 <tr>
                    
                     <td>

                     </td>
                 </tr>
                 </table>
                             </div>    
        </div>
            
            
 
        <div class="row">
            <div class="mui-panel">
                <h1>Medicine Details</h1>
                <table style="width:100px">
                    <tr>
                        
                        <td>
                            <input id="txtMedname1" class="Country" type="text" runat="server" placeholder="Medicine" /></td>
                        <td>
                            <input id="txtMeddoz1" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription1" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text1" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text8" type="text" placeholder="Prescription" runat="server" /></td>
                    </tr>
                    <tr>
                        
                        <td>
                            <input id="txtMedname2" class="Country" type="text" runat="server" placeholder="Medicine" /></td>
                        <td>
                            <input id="txtMeddoz2" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription2" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text2" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text7" type="text" placeholder="Prescription" runat="server" /></td>

                    </tr>
                    <tr>
                        
                        <td>
                            <input id="txtMedname3" class="Country" type="text" runat="server" placeholder="Medicine" /></td>
                        <td>
                            <input id="txtMeddoz3" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription3" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text3" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text6" type="text" placeholder="Prescription" runat="server" /></td>
                    </tr>
                    <tr>
                        
                        <td>
                            <input id="txtMedname4" class="Country" type="text" runat="server" placeholder="Medicine" /></td>
                        <td>
                            <input id="txtMeddoz4" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription4" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text4" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>
                            <input id="Text5" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>

                            <span class="auto-style4" />
                            <input type="button" id="btAdd" value="+" class="bt" />

                        </td>
                    </tr>

                </table> 
            </div>

    </div>

             </div>
            <div class="col-md-3">
                <div class="row" >
                     <div class="list-group leftSideBar">
                          <span class="list-group-item active">
                              PATIENT LIST TODAY </span>
                         <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False" CssClass="footable" Style="max-width: 500px" DataKeyNames="UniqueId" CellPadding="4" GridLines="None" ForeColor="#333333">
              <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
              <Columns>
                  <asp:BoundField HeaderText="Token No" DataField="TokenNo" />
                  <asp:BoundField HeaderText="Patient Name" DataField="Name" />

                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID")%>' OnCommand="ImgBtnUpdate_Command" formnovalidate />


                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>

              <EditRowStyle BackColor="#2461BF"></EditRowStyle>

              <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>

              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

              <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

              <RowStyle BackColor="#EFF3FB"></RowStyle>

              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

              <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

              <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

              <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

              <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                     </div>

                </div>

            </div>

        </div>
        <footer  class="footerDiv">
         

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%; ">
                            <div id="Errorbox"  style="height:100%;  display:none;"  runat="server" >
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
                                    <td style="width:30%;">
                                         <div class="form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE"  type="submit" CssClass="button" OnClick="btnSave_Click" ValidationGroup="Submit" />
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
    </div>
  
</asp:Content>
