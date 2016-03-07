<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="TheClinicApp.Test" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
   <link href="Content/simple-sidebar.css" rel="stylesheet" />

    <!-- Custom CSS -->
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Start Bootstrap
                    </a>
                </li>
                <li>
                    <a href="#">Dashboard</a>
                </li>
                <li>
                    <a href="#">Shortcuts</a>
                </li>
                <li>
                    <a href="#">Overview</a>
                </li>
                <li>
                    <a href="#">Events</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Simple Sidebar</h1>
                        <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
                        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>

</body>

</html>
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1 {
  text-align:center;
  font-family:'consolas',sans-serif;
}
ul.accordion-menu {
	list-style:none;
	padding:0;
	font-family:'consolas',sans-serif;
	font-weight:400;
	font-size:16px;

}

ul.accordion-menu li {

	background:none;

	

	padding:0;

}

ul.accordion-menu li header {

	background-color:#DDD;

	border:1px solid #CCC;

	cursor:pointer;

	padding:10px 20px;

	text-align:left;

	transition:all 200ms ease;

	user-select:none;

	-khtml-user-select:none;

	-moz-user-select:none;

	-ms-user-select:none;

	-webkit-touch-callout:none;

	-webkit-user-select:none;

}

ul.accordion-menu li header:hover {

	background-color:#CECECE;

	border-color:#C0C0C0;

}

ul.accordion-menu li section.content {

	border-bottom:1px solid #CCC;

	border-left:1px solid #CCC;

	border-right:1px solid #CCC;

	max-height:180px;

	overflow:hidden;

	padding:20px;

	transition:all 200ms linear;

}

ul.accordion-menu li section.content p {

	margin:0;	

}

ul.accordion-menu li.closed section.content {

	max-height:0;

	padding:0 20px;

}

ul.accordion-menu li.open header {

	background-color:#d93434;

	border:1px solid #b02929;

}

ul.accordion-menu li.open header span.title {

	color:#FFF;

}

    </style>
    <script>
        function toggle(e) {
            if (e.className == 'closed') {
                e.className = 'open';
            }
            else {
                e.className = 'closed';
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    
<ul class="accordion-menu">
<li class="open">
<header onclick="toggle(this.parentNode)"><span class="title">She asked if it would hurt...</span></header>
<section class="content">

I smiled and said no<br>
The lie ran down my chin like embryo<br>
She smiles like a corpse<br>
Like zombies eatin dust in Mexico<br>
Life dries cold beneath the dead soul lights<br>
When death sleeps it dreams of you
  
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">The sound of the ocean is dead</span></header>
<section class="content">
<p>Its just the echo of the blood in your head<br>
Sister burn the temple<br>
And stand beneath the moon<br>
The sound of the ocean is dead<br>
Its just the echo of the blood in your head </p>
  <h6>AcidBath - Dead Girl</h6>
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">A creature made of sunshine</span></header>
<section class="content">
<p>her eyes were like the sky<br>
rabbit howls like something old<br>
as we twitch to a lullaby<br>
the scalpel shines in god's sunshine<br>
the streetlights whisper pain<br>
down here near the poison stream<br>
our god has gone insane<br>
  <h6>AcidBath - Scream of the Butterfly</h6>
</p>
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Met an angel with a sawed off shotgun...</span></header>
<section class="content">
<p>Wanted by the FBI<br>
  We dropped some acid,<br>
  killed our parents<br>
  Then we hit the road.
  <h6>AcidBath - Scream of the Butterfly</h6></p>
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">there's blood on the moon as we plan our escape </span></header>
<section class="content">
<p>the goddess in bloom<br>
handcuffed and raped<br>
there's blood in the bathtub baby<br>
murdered the king<br>
there's blood on the moon<br>
there's blood on just about<br> everything
<h6>AcidBath - Scream of the Butterfly</h6></p>
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">sunshine in the house of flames</span></header>
<section class="content">
<p>she loves it where she gets it<br>
but it's never felt the same<br>
surgery, in the house of dissection<br>
when your candle burns out.. I will resurrect you.
  <h6>AcidBath - Scream of the Butterfly</h6></p>
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">With sunlight in her hair she smiles like she don't care </span></header>
<section class="content">
<p>her dreams are<br>
liquid blue<br>
I cut myself again and again to<br> remind myself of you<br>
<h6>AcidBath - Scream of the Butterfly</h6></p>
</section>
</li>

</ul>
  
    </form>
</body>
</html>--%>
