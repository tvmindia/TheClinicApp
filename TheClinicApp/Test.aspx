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
    <script src="Scripts/jquery-1.12.0.min.js"></script>
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
    <a href="#" role="button" data-toggle="modal" data-target="#TokenRegistration" >Register Token !</a>
    <form runat="server">
  <!--Test -->
    <div style="width:100%">
 
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
        </form>
    </body>
  
</html>
