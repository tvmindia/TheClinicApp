<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheClinicApp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/TheClinicApp.css" rel="stylesheet" />
    <link href="Content/simple-sidebar.css" rel="stylesheet" />
   <link href="Content/Input.css" rel="stylesheet" />
    <style>
    
    </style>
    <script src="Scripts/jquery-1.12.0.min.js"></script>
</head>
<body class="Semitransparent_1">
    <script type="text/javascript">
        var settingOpen = 0;
        function selectTile(id) {
            //debugger;
            var tileList = ['dashboard', 'patient', 'token', 'doctor', 'pharmacy', 'stock'];
            var IframeUrl = ['test.aspx', '../Registration/Patients.aspx', '../Token/Tokens.aspx', '../Doctor/DoctorInformationPage.aspx', '../Pharmacy/Pharmacy.aspx', '../Stock/Stock.aspx'];
            for (i = 0; i < tileList.length; i++) {
                if (id == tileList[i]) {
                    document.getElementById(id).className = id + '_selected'
                    document.getElementById('main').src = IframeUrl[i];
                }
                else {
                    document.getElementById(tileList[i]).className = tileList[i]
                
                }

            }

        }

        function openSettings() {
            if (settingOpen == 0) {
                $("#settings").fadeIn("slow", function () {
                    
                });
                settingOpen = 1;
            }
            else {
                $("#settings").fadeOut("slow", function () {

                });
                settingOpen = 0;
            }

        }

        function OpenPageOnHyperLinkClick(HyperLinkid)
        {
            var url = "";

            if (HyperLinkid == "hlkAssignRoles")
            {
                NavigateUrl = "../Admin/AssignRoles.aspx";
            }

            else if (HyperLinkid == "hlkCreateUser")
            {
                NavigateUrl = "../Admin/User.aspx";
            }
            else if (HyperLinkid == "hlkInputMasters")
            {
                NavigateUrl = "../ForgotPassword.aspx";
            }


            document.getElementById('main').src = NavigateUrl;
            document.getElementById('settings').style.display = "none";
          
        }


    </script>
    <form id="form1" runat="server">
        <div class="outerTop">
            <table style="width: 99%">
                <tr>
                    <td class="LeftLogo">
                        <img src="Images/LOGO.png" style="width: 15px; padding: 1px;" /></td>
                    <td class="RightLogo">Hi
                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                        &nbsp; | &nbsp; 
                        <asp:Label ID="txtclinic" runat="server" Text=""></asp:Label>&nbsp; | &nbsp; 
                        <asp:Label ID="lblGroupName" runat="server" Text=""></asp:Label>
                           &nbsp; | &nbsp; <img src="Images/settings.png" class="settingsLogo" title="Settings/Logout"/ onclick="openSettings()" />
                    </td>
                 
                </tr>
            </table>
        </div>
        <div class="outer">
            <div class="left">
                <div class="tiles">
                    <div class="dashboard_selected" id="dashboard" onclick="selectTile('dashboard')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Dashboard</div>
                    </div>
                    <div class="patient" id="patient" onclick="selectTile('patient')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Patients</div>
                    </div>
                    <div class="token" id="token" onclick="selectTile('token')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Tokens</div>
                    </div>
                    <div class="doctor" id="doctor" onclick="selectTile('doctor')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Doctors</div>
                    </div>
                    <div class="pharmacy" id="pharmacy" onclick="selectTile('pharmacy')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Pharmacy</div>
                    </div>
                    <div class="stock" id="stock" onclick="selectTile('stock')">
                        <div class="TileContent">
                            <br />
                            <br />
                            Stock</div>
                    </div>
                </div>
            </div>
            <div class="right">
                <iframe id="main" class="mainIframe" frameborder="0" ></iframe>


            </div>

        </div>

          <div class="settings" id="settings">

                
             <ul class="Settings-nav" >
                 
                <li><a id="hlkAssignRoles" onclick="OpenPageOnHyperLinkClick(id)">Assign Roles</a></li>
               <li><a id="hlkCreateUser"  onclick="OpenPageOnHyperLinkClick(id)">Create User</a> </li>
                 <li><a id="hlkInputMasters" onclick="OpenPageOnHyperLinkClick(id)">Add Masters</a></li>
               </ul>

          </div>
         


    </form>
</body>
</html>
