<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewCategory.aspx.cs" Inherits="TheClinicApp.Stock.NewCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
      $(document).ready(function () {
          debugger;
//------------* Bind medicine grid of parent page when adding a new medicine * --------------//

    if ($('#<%=hdnCategory.ClientID %>').val() == "True"  ) {
        
        var a = parent.CategoryAddedOrNot("True");
       
    }

});
       </script>

     <table>
        <tr>
            <td>Category Name </td>
            <td>
                <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>

             </td>
        </tr>
       
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
    <asp:HiddenField ID="hdnCategory" runat="server"  Value="False"/>
</asp:Content>
