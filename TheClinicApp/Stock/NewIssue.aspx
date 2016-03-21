<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewIssue.aspx.cs" Inherits="TheClinicApp.Stock.NewIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <style>
        .ui-autocomplete {
            background: fixed;
            background-color: ghostwhite;
            box-shadow: 1px 5px 10px 5px #4d3319;
        }

        .ui-datepicker {
            background: fixed;
            background-color: ghostwhite;
            box-shadow: 1px 5px 10px 5px #4d3319;
        }
    </style>

    <script>

        $(function () {
            $("[id$=txtDate]").datepicker({
                dateFormat: 'dd-m-yy',
                showOn: 'button',

                buttonImageOnly: true,
                buttonImage: '../Images/calendar4.png'
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>Issued To :</td>
            <td>
                <asp:TextBox ID="txtIssuedTo" runat="server"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td>Date :</td>
            <td> <asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>

        </tr>

        <tr>
            <td> <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click" /></td>
            <td><asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" /></td>
            
     
        </tr>
    </table>


</asp:Content>
