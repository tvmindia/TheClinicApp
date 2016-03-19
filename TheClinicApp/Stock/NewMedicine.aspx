<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="NewMedicine.aspx.cs" Inherits="TheClinicApp.Stock.NewMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.3.2.min.js"></script>
     
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

//Manages hiddenfield inorder to bind the medicine gridview of parent page 
        if ($('#<%=hdnManageGridBind.ClientID %>').val() == "True"  ) {
            parent.GetMedicines(1);
            $('#<%=hdnManageGridBind.ClientID %>').val('False');
        }

        });

 //---------------* Function to check medicine name duplication *-----------------//

        function CheckMedicineNameDuplication(txtmedicineName) {
            debugger;
            var name = document.getElementById('<%=txtmedicineName.ClientID %>').value;
            name = name.replace(/\s/g, '');

            PageMethods.ValidateMedicineName(name, OnSuccess, onError);

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
            <td>Medicine Name </td>
            <td><asp:TextBox ID="txtmedicineName" runat="server" onchange="CheckMedicineNameDuplication(this)"></asp:TextBox>

            </td>


            
       <asp:Image ID="imgWebLnames" runat="server" ToolTip="Login Name is Available" ImageUrl="~/Images/Check.png" Width="10%" Height="10%"  />
                                        
      <asp:Image ID="errorLnames" runat="server" ToolTip="Login Name is Unavailable" ImageUrl="~/Images/newClose.png"  />


        </tr>
        <tr>
            <td>Medicine Code </td>
            <td><asp:TextBox ID="txtCode" runat="server"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"></asp:DropDownList></td>
            <td></td>
        </tr>

         <tr>
            <td>Unit</td>
            <td><asp:TextBox ID="txtUnit" runat="server"></asp:TextBox></td>
             <td></td>
        </tr>

        <tr>
            <td>Reorder Quantity</td>
            <td><asp:TextBox ID="txtOrderQuantity" runat="server"></asp:TextBox></td>
            <td></td>
        </tr>
    </table>


    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
     <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click"/>

     <asp:HiddenField ID="hdnManageGridBind" runat="server"  Value="False"/>

</asp:Content>
