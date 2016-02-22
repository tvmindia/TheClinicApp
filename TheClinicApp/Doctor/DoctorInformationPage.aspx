<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="DoctorInformationPage.aspx.cs" Inherits="TheClinicApp.Doctor.DoctorInformationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
      
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/simple-sidebar.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

     <!-- Sidebar -->
        <div id="sidebar-wrapper" class="sidebar">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"  >
                    <a href="#">
                      Case History/Followup	

                    </a>
                </li>
                <li>
                    <a href="#" >CS03-12,1.2016</a>
                </li>
                <li>
                    <a href="#">CS03-12,1.2016</a>
                </li>
                <li>
                    <a href="#">CS03-12,1.2016</a>
                </li>
                <li>
                    <a href="#">CS03-12,1.2016</a>
                </li>
                <li>
                    <a href="#">CS03-12,1.2016</a>
                </li>
                <li>
                    <a href="#">CS02-10.4.2015</a>
                </li>
                <li>
                    <a href="#">CS02-10.4.2015</a>
                </li>
            </ul>
        </div>

    
        <!-- /#sidebar-wrapper -->

    <div  style=" position:fixed;   z-index:3; background-color:lemonchiffon;   opacity:0.5;   bottom:50%;    right:0%; width:2%; height:5% ">
                       
            
             <img id="img1" onclick="Show()" src="../Images/navigate-right-icon.png"  />
             <img id="img2" style="display:none"  onclick="showback()"  src="../Images/navigate-left-icon.png" />

        </div>
        <div class="leftSideBar" id="div1">
        hkghgbvjhbj    
        </div>
    <script type="text/javascript">

         function Show() {
             
             //var flag = 0;
             //if (flag==0){
             //    $("#div1").animate({ "right": "-=100%" }, 800);
             //    document.getElementById("#img1").src ="Images/navigate-right-icon.png";
             //}

             $("#div1").animate({ "right": "-=100%" });
             $("#img1").hide();
             $("#img2").show();

                                   
             }

         
         function showback() {
             $("#div1").animate({ "right": "+=100%" });
             $("#img1").show();
             $("#img2").hide();

         }

        
     </script>
</asp:Content>
