<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="DoctorInformationPage.aspx.cs" Inherits="TheClinicApp.Doctor.DoctorInformationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/simple-sidebar.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/accodin.css" rel="stylesheet" />   
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
  

      <div class="container" style="width:100%; ">
          
        <div class="col-md-12">
           
             <div class="col-md-3" >
                	<div id="sidebar-wrapper" class="sidebar">
            <ul class="sidebar-nav">
                <li class="leftSideBarHeaing"  >
                    
                      CASE HISTORY

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
                 </div>

             <div class="col-md-7">
                 <div id="page-content-wrapper">
            <div class="container-fluid">
                <div  class="row"> 
                    <div class="col-lg-12">
                              
                                         <form class="navbar-form navbar-right" role="search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search this site">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </form>

                                
                                    </div>
                                    </div>
                  
                <div class="row patientDetailsDiv" >
                    <div class="col-md-12" style="margin-top:20px;">
                       
                         <div class="col-md-4">
                             <table>
                                 <tr>
                                    <td>
                             <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>

                                    </td>
                                     
                                 </tr>
                                    <tr>
                                    <td>
                                                       <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>


                                    </td>
                                        </tr>
                             </table>
                             </div>
                             <div class="col-md-3">
                                 <table>
                                 <tr>
                                    <td>
                             <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>:

                                    </td>
                                     <td>
                             <asp:Label ID="lblAgeCount" runat="server" Text=""></asp:Label>

                                     </td>
                                      <td>
                                                       <asp:Label ID="lblMale" runat="server" Text=""></asp:Label>


                                    </td>
                                 </tr>
                                  
                                           <tr>
                                    <td>
                                                       <asp:Label ID="lblHeight" runat="server" Text="Height"></asp:Label>:


                                    </td>
                                               <td>
                                                       <asp:Label ID="lblHeightCount" runat="server" Text=""></asp:Label>

                                               </td>
                                               <td>
                                                   &nbsp
                                               </td>
                                        </tr>
                             </table>
                             </div>
                             <div class="col-md-3" >
                                 <table >
                                         <tr>
                                             <td>

                                             </td>
                                    <td>
                                                       <asp:Label ID="lblLastVisit" runat="server" Text="Last Visit"></asp:Label>:


                                    </td>
                                               <td>
                                                       <asp:Label ID="lblLastVisitDate" runat="server" Text=""></asp:Label>

                                               </td>
                                        </tr>
                                            <tr>
                                                <td>

                                                </td>
                                    <td>
                                                       <asp:Label ID="lblWeight" runat="server" Text="Weight"></asp:Label>:


                                    </td>
                                               <td>
                                                       <asp:Label ID="lblWeightCount" runat="server" Text=""></asp:Label>

                                               </td>
                                        </tr>
                                 </table>
                             </div>
                             <div class="col-md-2">
<img src="../Images/UploadPic.png" /  width="100%;" height="60%;" style="margin-bottom:20px;">
                             </div>
                            
                    </div>
                </div>

                <div class="row" >
                   
                        <!----SECTION ACCORDIN---->
 
 
    <div class="col-md-12"  style="width:100%;">
      <div class="content">
        <div class="accordion-container"> <a href="#" class="accordion-toggle">Symptoms <span class="toggle-icon"><i >
          
            <img src="../Images/plus.png" />
               </i></span></a>
          <div class="accordion-content">
            <form role="form" class="form-horizontal">
              <div class="form-group">
                <label  class="control-label col-lg-3">Symptoms
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtSymptoms" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
              </div>
            </form>
            
            
            
          </div>
          <!--/.accordion-content--> 
        </div>
        <!--/.accordion-container-->
        <div class="accordion-container"> <a href="#" class="accordion-toggle">General Examination Details <span class="toggle-icon"><i >    <img src="../Images/plus.png" /></i></span></a>
          <div class="accordion-content">
               <label  class="control-label col-lg-3">Sleep
                  </label>
                <div class="col-lg-9">
                                                              <asp:TextBox ID="txtSleep" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

             

                </div>

          </div>
          <!--/.accordion-content--> 
        </div>
        <!--/.accordion-container-->
        <div class="accordion-container"> <a href="#" class="accordion-toggle">Systamatic Examination Details<span class="toggle-icon"><i >    <img src="../Images/plus.png" /></i></span></a>
          <div class="accordion-content">
               <label  class="control-label col-lg-3">Cardiovascular
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtCardiovascular" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                <label  class="control-label col-lg-3">Nervoussystem
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtNervoussystem" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                      <label  class="control-label col-lg-3">Musculoskeletal
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtMusculoskeletal" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                 <label  class="control-label col-lg-3">Palloe
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtPalloe" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
               <label  class="control-label col-lg-3">Icterus
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtIcterus" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
               <label  class="control-label col-lg-3">Clubbing
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtClubbing" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                   <label  class="control-label col-lg-3">Cyanasis
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtCyanasis" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                 <label  class="control-label col-lg-3">Bowel
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtBowel" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                    <label  class="control-label col-lg-3">Appettie
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtAppettie" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                <label  class="control-label col-lg-3">Micturation
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtMicturation" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
          </div>
          <!--/.accordion-content--> 
        </div>
        <!--/.accordion-container-->
        <div class="accordion-container"> <a href="#" class="accordion-toggle">Ayurvedic parameters	<span class="toggle-icon"><i >    <img src="../Images/plus.png" /></i></span></a>
          <div class="accordion-content">
               <label  class="control-label col-lg-3">Sleep
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox2" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>

          </div>
          <!--/.accordion-content--> 
        </div>
            <!--/.accordion-container-->
        <div class="accordion-container"> <a href="#" class="accordion-toggle">diagnosis<span class="toggle-icon"><i >    <img src="../Images/plus.png" /></i></span></a>
          <div class="accordion-content">
               <label  class="control-label col-lg-3">diagnosis
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtdiagnosis" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                                

             

                </div>

          </div>
          <!--/.accordion-content--> 
        </div>
                <!--/.accordion-container-->
        <div class="accordion-container"> <a href="#" class="accordion-toggle">Prescription section <span class="toggle-icon"><i >    <img src="../Images/plus.png" /></i></span></a>
          <div class="accordion-content">
               <label  class="control-label col-lg-3">Prescription section
                  </label>
                <div class="col-lg-9">
                                <table style="width:20%">
            <tr>
                <td style="font-size: small">MEDICINE</td><td><input id="txtMedname1" class="Country" type="text" runat="server" /></td><td><input id="txtMeddoz1" type="text" placeholder="Dozage" runat="server" /></td><td><input id="txtMedprescription1" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small">MEDICINE</td><td><input id="txtMedname2" class="Country" type="text" runat="server" /></td><td><input id="txtMeddoz2" type="text" placeholder="Dozage" runat="server" /></td><td><input id="txtMedprescription2" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small">MEDICINE</td><td><input id="txtMedname3" class="Country" type="text" runat="server" /></td><td><input id="txtMeddoz3" type="text" placeholder="Dozage" runat="server" /></td><td><input id="txtMedprescription3" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small">MEDICINE</td><td><input id="txtMedname4" class="Country" type="text" runat="server" /></td><td><input id="txtMeddoz4" type="text" placeholder="Dozage" runat="server" /></td><td><input id="txtMedprescription4" type="text" placeholder="Prescription" runat="server" /></td><td>
        
     <span class="auto-style4">
     <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
         
         </td>
            </tr>
            
    </table> 
             

                </div>

          </div>
          <!--/.accordion-content--> 
        </div>
          <div class="accordion-container"> <a href="#" class="accordion-toggle">Remarks<span class="toggle-icon"><i >
          
            <img src="../Images/plus.png" />
               </i></span></a>
          <div class="accordion-content">
            <form role="form" class="form-horizontal">
              <div class="form-group">
                <label  class="control-label col-lg-3">Remarks
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtRemarks" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
              </div>
            </form>
            
            
            
          </div>
          <!--/.accordion-content--> 
        </div>
      </div>
    </div>

    
    
	</div>

                </div>
                    </div>
            </div>
                        
             <div class="col-md-2" ">
                 <div class="row" >
	  
    <div class="mini-submenu"   style="  margin-left:90%;">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group RightSideBar">
        <span href="#" class="list-group-item active">
         GRID
            <span class="pull-right" id="slide-submenu">
                <i>
                   X</i>
            </span>
        </span>
      
        
    </div>        
</div>

             
                
            </div>
   
       
              
          </div>
      
          <footer  class="footerDiv">
         

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%; ">
                            <div id="Errorbox"  style="height:100%;  display:none;"  runat="server" >
                               <a class="close" data-dismiss="alert">×</a>  

                            <div>
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>      <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

</div>
       </div>                     

                        </td>
                        <td style="height: 100%;   width:20%;">

                        </td>
                        <td style="height: 100%;   width:30%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:80%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:30%;">
                                         <div class="form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE"  type="submit" CssClass="button" ValidationGroup="Submit" />
</div>
                                    </td>
                                    <td>
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>
          </div>
    <asp:HiddenField runat="server" ID="HiddenField1"></asp:HiddenField>
     <!-- Sidebar -->
        

    
        <!-- /#sidebar-wrapper -->
    
    
    
    <%--    <div class="leftSideBar" id="div1">
        <asp:GridView ID="datagrid" runat="server" 
         RowStyle-CssClass="rows"
            AllowPaging="True" >
        </asp:GridView>
        </div>--%>
   
  <script type="text/javascript">
      $(document).ready(function () {
       
          $('.accordion-toggle').on('click', function (event) {
              event.preventDefault();
              // create accordion variables
              var accordion = $(this);
              var accordionContent = accordion.next('.accordion-content');
              var accordionToggleIcon = $(this).children('.toggle-icon');

              // toggle accordion link open class
              accordion.toggleClass("open");
              // toggle accordion content
              accordionContent.slideToggle(250);

              // change plus/minus icon
              if (accordion.hasClass("open")) {
                  accordionToggleIcon.html("<i><img src="+'"'+'../Images/Minus.png'+'"'+"/> </i>");
              } else {
                  accordionToggleIcon.html("<i > <img src=" + '"' + '../Images/plus.png' + '"' + "/></i>");
              }
            
          });
          var iCnt = 0;
          // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
          var container = $(document.createElement('div')).css({
              width: '100%',
              borderTopColor: '#999', borderBottomColor: '#999',
              borderLeftColor: '#999', borderRightColor: '#999'
          });


          $('body').on('click', '#btAdd', function () {

              if (iCnt <= 19) {
                  iCnt = iCnt + 1;
                  <%--int count = document.getElementById('<%=HiddenField2.ClientID%>');
                          count.value=iCnt;--%>
                  // ADD TEXTBOX.
                  $(container).append('<table style="width:20%"><tr><td style="font-size: small">MEDICINE</td> <td><input id="txtMedname5" type="text" class="input" placeholder="Name"/></td><td style="font-size: small"><input id="txtMeddoz5" type="text" class="input" placeholder="Dozage"/></td><td style="font-size: small"><input id="txtMedprescription" type="text" class="input" placeholder="Prescription"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');

                  // SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
                  if (iCnt == 1) {
                      var divSubmit = $(document.createElement('div'));
                      $(divSubmit).append('<input type=button class="bt" onclick="GetTextValue()"' + 'id=btSubmit value=Submit />');
                  }
                  // ADD BOTH THE DIV ELEMENTS TO THE "main" CONTAINER.

                  $('#main').after(container, divSubmit);

              }

                  // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                  // (20 IS THE LIMIT WE HAVE SET)
              else {
                  $(container).append('<label>Reached the limit</label>');
                  $('#btAdd').attr('class', 'bt-disable');
                  $('#btAdd').attr('disabled', 'disabled');
              }

          });
    


      // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
  

   
      });
  </script>
    <script>
        $(function () {

            $('#slide-submenu').on('click', function () {
                $(this).closest('.list-group').fadeOut('slide', function () {
                    $('.mini-submenu').fadeIn();
                });

            });

            $('.mini-submenu').on('click', function () {
                $(this).next('.list-group').toggle('slide');
                $('.mini-submenu').hide();
            })
        })

    </script>
    <%--<script type="text/javascript">

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


     </script>--%>
</asp:Content>
