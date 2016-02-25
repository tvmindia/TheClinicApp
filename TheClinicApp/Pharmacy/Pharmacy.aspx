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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
 
    <div class="container"> 
        <div class="col-md-12">
             <div class="col-md-9">
                 <div class="input-group">
             <input type="text" class="form-control" placeholder="Search" style="height: 20%; top: 0px; left: 0px;" aria-haspopup="false" name="txtSearch" id="txtSearch" />
             <span class="input-group-addon" style="height: 0%;">
                  <button type="submit" style="height: 0px;" runat="server" id="btnSearch" onserverclick="btnSearch_ServerClick" formnovalidate>
                <img src="../Images/Search-WF.png" />

            </button>

        </span>

    </div>
        <div class="jumbotron"> 
            <h1>PATIENT DETAILS</h1>
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
            <div class="jumbotron">
                <h1>MEDICINE DETAILS</h1>
                <table>
                    <tr>
                        <td style="font-size: small">MEDICINE</td>
                        <td>
                            <input id="txtMedname1" class="Country" type="text" runat="server" /></td>
                        <td>
                            <input id="txtMeddoz1" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription1" type="text" placeholder="Prescription" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="font-size: small">MEDICINE</td>
                        <td>
                            <input id="txtMedname2" class="Country" type="text" runat="server" /></td>
                        <td>
                            <input id="txtMeddoz2" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription2" type="text" placeholder="Prescription" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="font-size: small">MEDICINE</td>
                        <td>
                            <input id="txtMedname3" class="Country" type="text" runat="server" /></td>
                        <td>
                            <input id="txtMeddoz3" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription3" type="text" placeholder="Prescription" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="font-size: small">MEDICINE</td>
                        <td>
                            <input id="txtMedname4" class="Country" type="text" runat="server" /></td>
                        <td>
                            <input id="txtMeddoz4" type="text" placeholder="Dozage" runat="server" /></td>
                        <td>
                            <input id="txtMedprescription4" type="text" placeholder="Prescription" runat="server" /></td>
                        <td>

                            <span class="auto-style4" />
                            <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />

                        </td>
                    </tr>

                </table> 
            </div>

    </div>

             </div>
            <div class="col-md-3">
                <div class="row" >
                    <div class="mini-submenu"   style="margin-left:90%;">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </div>
                     <div class="list-group leftSideBar1">
                          <span href="#" class="list-group-item active">
                              PATIENT LIST TODAY

                          </span>

                     </div>

                </div>

            </div>

        </div>

    </div>
</asp:Content>