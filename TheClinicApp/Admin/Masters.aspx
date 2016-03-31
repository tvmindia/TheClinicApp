<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Masters.aspx.cs" Inherits="TheClinicApp.Admin.Masters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/Master/Masterawsome.css" rel="stylesheet" />
    <link href="../Content/Master/MasterRed.css" rel="stylesheet" />
    <link href="../Content/Master/Masterw3.css" rel="stylesheet" />
    <style type="text/css">
        .ddl
        {
            border:2px solid #009688;
            border-radius:5px;
            padding:3px;
            -webkit-appearance: none; 
            background-image:url('../Images/Arrowhead-Down-01.png');
            background-position:120px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            text-overflow: '';/*In Firefox*/
        }
</style>
<h2 class="w3-center" style="font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif;">Masters</h2>	
<div class="w3-container">
<div class="w3-border">
<ul class="w3-navbar w3-theme">
  <li><a class="w3-btn w3-theme testbtn" onclick="openCity(event, 'London')">Groups</a></li>
  <li><a class="w3-btn w3-theme testbtn" onclick="openCity(event, 'Paris')">Clinics</a></li>
  <li><a class="w3-btn w3-theme testbtn" onclick="openCity(event, 'Tokyo')">Doctors</a></li>
</ul>

<div id="London" class="w3-container city w3-animate-opacity">
     <h1></h1>
  <header class="w3-container w3-teal">
  <h1>Add Group</h1>
</header>

<div class="w3-container w3-half w3-margin-top">



<p>
<label class="w3-label w3-validate">Group Name</label>
<input class="w3-input" type="text" runat="server" id="txtGroup" style="width:90%" required /></p>

<p>
<label class="w3-label w3-validate">Logo</label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
</p>


<p>
<button class="w3-btn w3-section w3-teal w3-ripple" id="btGroup" runat="server" onserverclick="btGroup_ServerClick"> Save Group </button></p>



</div>

</div>

<div id="Paris" class="w3-container city w3-animate-opacity"> 
    <h1></h1>
  <header class="w3-container w3-teal">
  <h1 style="font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif;">Add Clinic</h1>
</header>

<div class="w3-container w3-half w3-margin-top">

<p>
<label class="w3-label w3-validate">Group Name</label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="160px" BackColor="#F6F1DB" ForeColor="#7d6754" Font-Names="Andalus" CssClass="ddl" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="GroupID">
        <asp:ListItem Text="----Select----"></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ClinicAppConnectionString4 %>' SelectCommand="SELECT [GroupID], [Name] FROM [Groups]"></asp:SqlDataSource>
</p>

<p>    
<label class="w3-label w3-validate">Clinic Name</label>
<input class="w3-input" type="text" runat="server" id="txtClinic" style="width:90%" required /></p>
<p>
<label class="w3-label w3-validate">Location</label>
<input class="w3-input" type="text" runat="server" id="txtLocation" style="width:90%" required /></p>

 <p>
<label class="w3-label w3-validate">Address</label>
<textarea rows="4" cols="50" class="w3-input" runat="server" id="txtaddress" style="width:90%" required /></p>

 <p>
<label class="w3-label w3-validate">Phone Number</label>
<input class="w3-input" type="text" runat="server" id="txtPhone" style="width:90%" required /></p>


<p>
<button class="w3-btn w3-section w3-teal w3-ripple" id="btclinic" onserverclick="btclinic_ServerClick" runat="server" > Save Clinic </button></p>



</div>
<div id="Errorbox"  style="height:25%;  display:none;"  runat="server" >
    <a class="close" data-dismiss="alert">×</a>
    <div>
         <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>
        <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

    </div>

</div>  
</div>
</div>

<div id="Tokyo" class="w3-container city w3-animate-opacity">
     <h1></h1>
   <header class="w3-container w3-teal">
  <h1>Add Doctor</h1>
</header>

<div class="w3-container w3-half w3-margin-top">



<p>    
<label class="w3-label w3-validate">Doctor Name</label>
<input class="w3-input" type="text" placeholder="Dr." runat="server" id="txtDoctor" style="width:90%" required /></p>
<p>
<label class="w3-label w3-validate">Phone Number</label>
<input class="w3-input" type="text" runat="server" id="txtDrPhone" style="width:90%" required /></p>

 <p>       
<label class="w3-label w3-validate">Email</label>
<input class="w3-input" type="text" runat="server" id="txtEmail" style="width:90%" required /></p>



<p>
<button class="w3-btn w3-section w3-teal w3-ripple" id="btDoctor" runat="server" onserverclick="btDoctor_ServerClick"> Save Doctor </button></p>



</div>
      
</div>
</div>




<!-- Footer -->


<!-- Script for Sidenav, Tabs, Accordions, Progress bars and slideshows -->
<script>
    // Side navigation
    function w3_open() {
        document.getElementsByClassName("w3-sidenav")[0].style.width = "100%";
        document.getElementsByClassName("w3-sidenav")[0].style.textAlign = "center";
        document.getElementsByClassName("w3-sidenav")[0].style.fontSize = "50px";
        document.getElementsByClassName("w3-sidenav")[0].style.paddingTop = "10%";
        document.getElementsByClassName("w3-sidenav")[0].style.display = "block";
    }
    function w3_close() {
        document.getElementsByClassName("w3-sidenav")[0].style.display = "none";
    }

    // Tabs
    function openCity(evt, cityName) {
        var i;
        var x = document.getElementsByClassName("city");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        var activebtn = document.getElementsByClassName("testbtn");
        for (i = 0; i < x.length; i++) {
            activebtn[i].classList.remove("w3-theme-dark");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.classList.add("w3-theme-dark");
    }

    var mybtn = document.getElementsByClassName("testbtn")[0];
    mybtn.click();

    // Accordions
    function myAccFunc(id) {
        document.getElementById(id).classList.toggle("w3-show");
        document.getElementById(id).previousElementSibling.classList.toggle("w3-theme-dark");
    }

    // Slideshows
    var slideIndex = 1;

    function plusDivs(n) {
        slideIndex = slideIndex + n;
        showDivs(slideIndex);
    }

    function showDivs(n) {
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = x.length };
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex - 1].style.display = "block";
    }

    showDivs(1);

    // Progress Bars
    function move() {
        var elem = document.getElementById("myBar");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width == 100) {
                clearInterval(id);
            } else {
                width++;
                elem.style.width = width + '%';
                document.getElementById("demoprgr").innerHTML = width * 1 + '%';
            }
        }
    }
</script>


</asp:Content>
