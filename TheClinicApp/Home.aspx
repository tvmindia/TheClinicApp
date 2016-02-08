<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TheClinicApp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/TheClinicApp.css" rel="stylesheet" />
</head>
<body class="Semitransparent_1">
    <script type="text/javascript">
        function selectTile(id) {
            //debugger;
            var tileList = ['dashboard', 'patient', 'token', 'doctor', 'pharmacy', 'stock'];
            for (i = 0; i < tileList.length; i++) {
                if (id == tileList[i]) {
                    document.getElementById(id).className = id + '_selected'
                }
                else {
                    document.getElementById(tileList[i]).className = tileList[i]
                }

            }

        }

    </script>
    <form id="form1" runat="server">
        <div class="outerTop">
            <table style="width: 99%">
                <tr>
                    <td class="LeftLogo">
                        <img src="Images/LOGO.png" style="width: 20px; padding: 5px;" /></td>
                    <td class="RightLogo"> Hi <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label> &nbsp; | &nbsp;  <asp:Label ID="txtclinic" runat="server" Text=""></asp:Label>&nbsp; | &nbsp;  <asp:Label ID="lblGroupName" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
        <div class="outer">
            <div class="left">
                <div class="tiles">
                    <div class="dashboard_selected" id="dashboard" onclick="selectTile('dashboard')">
                        <div class="TileContent"><br /><br />Dashboard</div>
                    </div>
                    <div class="patient" id="patient" onclick="selectTile('patient')" >
                        <div class="TileContent"><br /><br />Patients</div>
                    </div>
                    <div class="token" id="token" onclick="selectTile('token')">
                        <div class="TileContent"><br /><br />Tokens</div>
                    </div>
                    <div class="doctor" id="doctor" onclick="selectTile('doctor')">
                        <div class="TileContent"><br /><br />Doctors</div>
                    </div>
                    <div class="pharmacy" id="pharmacy" onclick="selectTile('pharmacy')">
                        <div class="TileContent"><br /><br />Pharmacy</div>
                    </div>
                    <div class="stock" id="stock" onclick="selectTile('stock')">
                        <div class="TileContent"><br /><br />Stock</div>
                    </div>
                </div>
            </div>
            <div class="right">
                <iframe id="main" class="mainIframe" frameborder="0" src="underConstruction.aspx"></iframe>


            </div>
            
        </div>

    </form>
</body>
</html>
