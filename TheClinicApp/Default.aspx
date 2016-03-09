<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheClinicApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 203px;
            height: 117px;
            left:40%;
            top:40%;
            position:fixed;
            z-index:-1;
        }

         .auto-style2 {
            width: 203px;
            height: 117px;
            left:40%;
            top:70%;
            position:fixed;
            z-index:-1;
        }
    </style>
   

    <script src="Scripts/jquery-1.12.0.min.js"></script>
       <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="Content/TheClinicApp.css" rel="stylesheet" />
    <script src="Content/materialize/js/materialize.min.js"></script>
    <link href="Content/materialize/css/materialize.min.css" rel="stylesheet" />
</head>
<body class="Semitransparent_1">
    <form id="form1" runat="server">
    <div class="logo" >
        <img src="Images/LOGO.png"  style="width:50px"/>
        
    </div>
    
    
    <div class="login">
         
        <div class="input-field ">
          <input id="username" runat="server" type="text"  class="validate">
          <label for="username" class="captions">User Name</label>
        </div>
      
          
        <div class="input-field">
          <input id="password" type="password" class="validate" runat="server">
          <label for="password" class="captions">Password</label>
        </div>
       
     <div style="text-align:right">

          <button class="btn waves-effect waves-light" type="submit" name="action"  >Login
    <i class="material-icons right" >
        <img style="width:80%" src="Images/arrowR.png" /></i>
         </button>

       
     </div>  
 <div style="text-align:right">
        <a href="#">  Forgot Password? </a></div>


    </div>

        <div  class="loginerrormessage">
            <asp:Label   ID="lblmsg" runat="server" Text=""></asp:Label>

        </div>
        </form>
</body>
</html>
