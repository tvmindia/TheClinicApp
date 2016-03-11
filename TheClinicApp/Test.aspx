<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="TheClinicApp.Test" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Test</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.rawgit.com/AndreaLombardo/BootSideMenu/master/css/BootSideMenu.css">
  <!-- HTML5 shim e Respond.js per rendere compatibile l'HTML 5 in IE8 -->
  <!-- ATTENZIONE: Respond.js non funziona se la pagina viene visualizzata in locale file:// -->
<!--[if lt IE 9]>
<script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

<style type="text/css">
  .user{
    padding:5px;
    margin-bottom: 5px;
  }
</style>

  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.rawgit.com/AndreaLombardo/BootSideMenu/master/js/BootSideMenu.js"></script>

  <script type="text/javascript">
      $(document).ready(function () {
          $('#test').BootSideMenu({ side: "left", autoClose: false });
          $('#test2').BootSideMenu({ side: "right" });
      });
  </script>

</head>
<body>

  <!--Test -->
    <div style="width:100%">
 <a href="#" role="button" data-toggle="modal" data-target="#TokenRegistration" >Register Token !</a>
    </div>
    <div class="modal fade" id="TodaysRegistration" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Todays Registrations</h4>

                    </div>
                    <div class="modal-body">
                     
                        <asp:GridView ID="dtgViewTodaysRegistration" runat="server" AutoGenerateColumns="False" style="text-align:center;width:100%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <Columns>
                                <asp:TemplateField>
                                   
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                
                            </Columns>

                            <EditRowStyle BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                            <HeaderStyle BackColor="#0080AA" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        
                    </div>
                    <div class="modal-footer">
                       

                    </div>
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
        </div>
  <div id="test">
    <div class="user">
      <img src="http://image.priceprice.k-img.com/ph/images/common/face_japan_01.gif" alt="Esempio" class="img-thumbnail">
      <a href="http://www.lombardoandrea.com" target="_blank" class="navbar-link">Andrea Lombardo</a>
    </div>
    <div class="list-group">
      <a href="#" class="list-group-item active">Cras justo odio</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#subTest" class="list-group-item">Sub menù test</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta Porta Porta sdaf s fs hfuis uif ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
    </div>

    <div class="list-group submenu" id="subTest">
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#subTestSub" class="list-group-item">Sub di Sub</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
    </div> 

    <div class="list-group submenu" id="subTestSub">
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
    </div> 

  </div>
  <!--/Test -->

  <!--Test 2 -->
  <div id="test2">
    <div class="list-group">
      <a href="#" class="list-group-item active">Cras justo odio</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#subRight" class="list-group-item">Sub Menu</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
    </div>

    <div class="list-group submenu" id="subRight">
      <a href="#" class="list-group-item">a destra</a>
      <a href="#subRight2" class="list-group-item">Sub right 2</a>
    </div> 

        <div class="list-group submenu" id="subRight2">
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
    </div> 
  </div>
  <!--/Test 2-->


  <!--Normale contenuto di pagina-->
  <div class="container">
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="https://github.com/AndreaLombardo/BootSideMenu">BootSideMenu</a> 
        </div>
        <p class="navbar-text navbar-right">Realizzato da <a href="http://www.lombardoandrea.com" target="_blank" class="navbar-link">Andrea Lombardo</a></p>
      </div>
    </nav>

    <div class="row">
      <div class="col-md-12">
        <div class="jumbotron">
          <h1>BootSideMenu ;-)</h1>
          <p>Pagina di test...</p>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">HTML</div>
          <div class="panel-body">
            codice html
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">JavaScript</div>
          <div class="panel-body">
            codice JavaScript
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">Call</div>
          <div class="panel-body">
            $('#test').BootSideMenu({side:"left", autoClose:true});
          </div>
        </div>
      </div>
    </div>

  </div>
  <!--Normale contenuto di pagina-->


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
