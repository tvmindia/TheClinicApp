<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewMedicine.aspx.cs" Inherits="TheClinicApp.Stock.NewMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.3.2.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
//------------* Bind medicine grid of parent page when adding a new medicine * --------------//

    if ($('#<%=hdnManageGridBind.ClientID %>').val() == "True"  ) {
        parent.GetMedicines(1);
        $('#<%=hdnManageGridBind.ClientID %>').val('False');
    }

});
       </script>
    <table>
        <tr>
            <td>Medicine Name </td>
            <td><asp:TextBox ID="txtmedicineName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Medicine Code </td>
            <td><asp:TextBox ID="txtCode" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"></asp:DropDownList></td>
        </tr>

         <tr>
            <td>Unit</td>
            <td><asp:TextBox ID="txtUnit" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Reorder Quantity</td>
            <td><asp:TextBox ID="txtOrderQuantity" runat="server"></asp:TextBox></td>
        </tr>
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
     <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click"/>

     <asp:HiddenField ID="hdnManageGridBind" runat="server"  Value="False"/>

</asp:Content>
