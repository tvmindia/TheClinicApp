<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewCategory.aspx.cs" Inherits="TheClinicApp.Stock.NewCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableCdn="true"></asp:ScriptManager>


  <script>
      $(document).ready(function () {
         
          //images that represents medicine name duplication hide and show
          var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
          LnameImage.style.display = "none";
          var errLname = document.getElementById('<%=errorLnames.ClientID %>');
          errLname.style.display = "none";

      });
 //---------------* Function to check category name duplication *--------------//

      function CheckCategoryNameDuplication(txtCategoryName) {
          debugger;
          var name = document.getElementById('<%=txtCategoryName.ClientID %>').value;
          name = name.replace(/\s/g, '');

          PageMethods.ValidateCategoryName(name, OnSuccess, onError);

          function OnSuccess(response, userContext, methodName) {

              var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
              var errLname = document.getElementById('<%=errorLnames.ClientID %>');
              if (response == false) {

                  LnameImage.style.display = "block";
                  errLname.style.display = "none";

              }
              if (response == true) {
                  errLname.style.display = "block";
                  errLname.style.color = "Red";
                  errLname.innerHTML = "Name Alreay Exists"
                  LnameImage.style.display = "none";

              }
          }
          function onError(response, userContext, methodName) {

          }
      }






       </script>

     <table>
        <tr>
            <td>Category Name </td>
            <td>
                <asp:TextBox ID="txtCategoryName" runat="server" onchange="CheckCategoryNameDuplication(this)"></asp:TextBox>

             </td>

              <asp:Image ID="imgWebLnames" runat="server" ToolTip="Login Name is Available" ImageUrl="~/Images/Check.png"  Width="10%" Height="10%"  />
                                        
      <asp:Image ID="errorLnames" runat="server" ToolTip="Login Name is Unavailable" ImageUrl="~/Images/newClose.png"  />

        </tr>
       
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click"/>
  
</asp:Content>
