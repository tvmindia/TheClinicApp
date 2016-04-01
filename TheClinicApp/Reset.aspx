<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="TheClinicApp.Reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/mui.css" rel="stylesheet" />
    <title>resetpassword</title>
</head>

<body>
    <form id="form1" runat="server">
    <div class="mui-container">
        <h1></h1>
        <div style="height:100px">
         <h1 style="text-align:center">Would You Like to Change Password ?</h1>
        </div>
        <h1></h1>
        <h1></h1>
        <h1></h1>
  <legend>Change Password</legend>
  <div class="mui-textfield">
    <input type="password" placeholder="New Password" id="txtNewPassword" runat="server" />
  </div>
  <div class="mui-textfield">
    <input type="password" placeholder="Confirm Password" id="txtConfirmPassword" runat="server" />
  </div>
  
  <button type="submit" class="mui-btn mui-btn--raised" id="btnReset" runat="server" onserverclick="btnReset_ServerClick">Submit</button>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
          <div id="Errorbox"  style="height:25%;  display:none;"  runat="server" >
    <div>
    
    <asp:Label ID="lblMsgg" runat="server" Text=""></asp:Label>
    </div>
    </div> 
    </div>
    </form>
</body>
</html>
