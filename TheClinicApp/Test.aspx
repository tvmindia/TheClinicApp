<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="TheClinicApp.Test" %>

<!DOCTYPE html>

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
</html>
