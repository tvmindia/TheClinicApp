<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DoctorInformationPage.aspx.cs" Inherits="TheClinicApp.Doctor.DoctorInformationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/simple-sidebar.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
<%--    <link href="../Content/mui.min.css" rel="stylesheet" />--%>
    <script src="../Scripts/mui.min.js"></script>
<%--    <link href="../Content/accodin.css" rel="stylesheet" />   --%>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery.js"></script>
    <%--<style>
        table#t01 tr:nth-child(even) {
    background-color: #eee;
     
}
        table#t01 tr:nth-child(odd) {
            background-color: #fff;
        }
        
    </style>--%>

 <div class="container-fluid">
     <div class="headingLabel">
         <label class="headingLabel" style="text-align:center">Doctors</label>
         </div>
                <div  class="row"> 
                     <div class="col-md-12">
                         <div class="col-md-9">
                             <div  class="row "> 
                                 <div class="input-group stylish-input-group">
                                    <input type="text" class=" form-control" placeholder="Search" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: 0px;" runat="server" id="btnSearch"  onserverclick="btnSearch_ServerClick"  formnovalidate>
                                          
                                            <img src="../Images/Search-WF.png" />
                                        </button>
                                    </span>

                                </div>
           </div>
                             </div>
                         </div>
                    </div>
                </div>
    <div id="page-content-wrapper">
            <div class="container-fluid">
                <div  class="row"> 
                     <div class="col-md-12">
                         <div class="col-md-9">
                             <div  class="row "> 
                                
                  
                                    </div>
                  
                <div class="row patientDetailsDiv  mui-panel" >
                    <table>
                             
                                 <tr>
                                     <td>
                                         <table id="t01" style="width:550px">
                                             <tr>
                                                 <td style="font-size:large">

                                                 <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                                     </td>

                                             </tr>
                                             <tr>
                                                 <td>
                                                     <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>:
                                                 </td>
                                                 <td>
                                                      <asp:Label ID="lblPhonedis" runat="server" Text=""></asp:Label>
                                                 </td>
                                             </tr>
                                             
                                 </table>
                           
                             
                               
                                 <table id="t02" style="width:550px">
                                     <tr>
                                                 <td style="width:275px">
                                                 <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                                 </td>
                                          <td>
                                              <table style="width:274px">
                                                  <tr>
                                                      <td style="width:137px">
                             <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>:

                                    </td>
                                     <td style="width:137px">
                                         <asp:Label ID="lblAgeCount" runat="server" Text=""></asp:Label>

                                     </td>
                                     </tr>
                                     <tr>
                                         <td style="width:137px">
                                          <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>:


                                    </td>
                                      <td style="width:137px">
                                          <asp:Label ID="lblGenderString" runat="server" Text=""></asp:Label>


                                    </td>
                                    
                                        </tr>
                                     </table>
                                              </td>
                                 </tr>
                                   
                                
                                      <tr>
                                    <td>
                                        <asp:Label ID="lblLastVisit" runat="server" Text="Last Visit"></asp:Label>:

                                    </td>
                                             <td>
                                                 <asp:Label ID="lblLastVisitDate" runat="server" Text=""></asp:Label>

                                             </td>

                                         </tr>
                                    

                                 </table>
                             </td>
                                         <td>
                                 <img src="../Images/UploadPic.png" / width="75px" height="80px" style="box-shadow:initial"/>
                            </td>
                                         </tr>

                                 </table>

                </div>
                             <div class="row" >
                                 <!----SECTION ACCORDIN---->
                                  <div   style="margin-top:40px;">
       <div class="col-md-12"  style="width:100%;">
           <div class="content">
               <ul class="accordion-menu">
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">Symptoms</span></header>
                       <section class="content">
                           <div class="form-group">
                               <label  class="control-label col-lg-3">Symptoms</label>
                               <div class="col-lg-9">
                                   <asp:TextBox ID="txtSymptoms" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ></asp:TextBox>

                               </div>

                           </div>

                       </section>

                   </li>
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">General Examination Details</span></header>
                       <section class="content">
                           <label  class="control-label col-lg-3">Sleep</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtSleep" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ></asp:TextBox>

                           </div>

                       </section>

                   </li>
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">Systamatic Examination Details</span></header>
                       <section class="content">
                           <label  class="control-label col-lg-3">Cardiovascular</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtCardiovascular" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Nervoussystem</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtNervoussystem" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Musculoskeletal</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtMusculoskeletal" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Palloe</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtPalloe" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Icterus</label>
                           <div class="col-lg-9">
                                <asp:TextBox ID="txtIcterus" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                            <label  class="control-label col-lg-3">Clubbing</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtClubbing" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Cyanasis </label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtCyanasis" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                 <label  class="control-label col-lg-3">Bowel
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtBowel" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                    <label  class="control-label col-lg-3">Appettie </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtAppettie" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                <label  class="control-label col-lg-3">Micturation
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtMicturation" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
       
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Ayurvedic parameters</span></header>
<section class="content">

               <label  class="control-label col-lg-3">Sleep
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox2" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
    </section>

          </li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">diagnosis</span></header>
<section class="content">

               <label  class="control-label col-lg-3">diagnosis
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtdiagnosis" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                                

             

                </div>

        
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Prescription section</span></header>
<section class="content">

               <label  class="control-label col-lg-3">Prescription section
                  </label>
                <div class="col-lg-9">
                                <table style="width:20%">
                                    <tr>
                                        <td style="text-align:center;font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif"><asp:Label ID="Label1" runat="server" Text="Medicine"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label2" runat="server" Text="Timing"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label3" runat="server" Text="Dozage"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label4" runat="server" Text="Days"></asp:Label></td>
                                    </tr>
            <tr>
                <td style="font-size: small" ><input id="Text1" type="text" placeholder="Medicine" runat="server"  class="dynamicTd"/></td><td><input id="txtMedname1" class="dynamicTd" type="text"  placeholder="Timing" runat="server"  /></td><td><input id="txtMeddoz1" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="txtMedprescription1" type="text" placeholder="Days" runat="server" class="dynamicTd" /></td>
            </tr>
            <tr>
                <td style="font-size: small" ><input id="Text2" type="text" placeholder="Medicine" runat="server" class="dynamicTd" /></td><td ><input id="txtMedname2" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="txtMeddoz2" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="txtMedprescription2" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td>
            </tr>
            <tr>
                <td style="font-size: small"><input id="Text3" type="text" placeholder="Medicine" runat="server" class="dynamicTd" /></td><td ><input id="txtMedname3" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="txtMeddoz3" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="txtMedprescription3" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td>
            </tr>
            <tr>
                <td style="font-size: small" ><input id="Text4" type="text" placeholder="Medicine" runat="server"  class="dynamicTd"/></td><td ><input id="txtMedname4" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="txtMeddoz4" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="txtMedprescription4" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td><td>
        
     <span class="auto-style4">
     <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
         
         </td>
            </tr>
            
    </table> 
             
                      <div id="main">
                          </div>
                </div>

         
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Remarks </span></header>
<section class="content">

            <form role="form" class="form-horizontal">
              <div class="form-group">
                <label  class="control-label col-lg-3">Remarks
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtRemarks" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
              </div>
            </form>
            
            
            
      
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">File Attachment</span></header>
<section class="content">
   
            
            
            
      
</section>
</li>
</ul>
          </div>
    </div>
       </div>

                             </div>

                         </div>
                         
                    <div class="col-md-3" ">
                        <div class="row" >
                            <div >
                                <div class="mini-submenu" style=" margin-left:10%"><img src="../Images/Check.png" style="width:30px;height:30px;" /></div>
                                <div class="list-group leftSideBar1">
                                    <span href="#" class="list-group-item active">
                                        TOKENS
                                        <span class="pull-right" id="slide-submenu">
                                            <i>
                   X</i>
            </span>
        </span>
        <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False" CssClass="footable" Style="max-width: 500px" DataKeyNames="UniqueId" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Check.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID") %>' OnCommand="ImgBtnUpdate_Command" formnovalidate />
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:BoundField HeaderText="Token No" DataField="TokenNo" />
                <asp:BoundField HeaderText="Patient Name" DataField="Name" />
                <asp:BoundField HeaderText="Time" DataField="DateTime" />




            </Columns>

            <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#336666"></PagerStyle>

            <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                        </asp:GridView>

    </div> 

	    </div>

                 </div>
                        <div class="col-lg-3">
                            
                        <div class="row">
                            <div id="sidebar-wrapper">

            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Case Sheet
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
                
            </ul>
        </div>
                            </div>
                        </div>
                            </div>

             
                
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
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE"  type="submit" CssClass="button  "  ValidationGroup="Submit" />
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
                  $(container).append('<table style="width:50%"><tr><td style="font-size: small" ><input id="txtMedicine5" type="text" placeholder="Medicine" runat="server"  class="dynamicTd"/></td><td><input id="txtTiming5" class="dynamicTd" type="text"  placeholder="Timing" runat="server"  /></td><td><input id="txtDozage5" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="txtDays5" type="text" placeholder="Days" runat="server" class="dynamicTd" /></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');
                 
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
          var divValue, values = '';

          function GetTextValue() {
              $(divValue)
                  .empty()
                  .remove();

              values = '';

              $('.input').each(function () {
                  divValue = $(document.createElement('div')).css({
                      padding: '5px', width: '200px'
                  });


                  var datas = document.getElementById('<%=HiddenField1.ClientID%>');

                  values += this.value + ' ';

                  datas.value = values;
              })
              }
  
              
   
              });
          
  </script>
    <script>
        $(function () {
              <%--Right Side Bar Menu Click --%>
            $('#slide-submenu').on('click', function () {
                $(this).closest('.list-group').fadeOut('slide', function () {
                    $('.mini-submenu').fadeIn();
                });

            });
            <%--Right Side Bar Menu Click --%>

             <%--Left Side Bar Menu Click --%>
           $('.mini-submenu').on('click', function () {
                $(this).next('.list-group').toggle('slide');
                $('.mini-submenu').hide();
            })


            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        })
        <%--Left Side Bar Menu Click --%>


  <%--Accordian Open Close--%>
        function toggle(e) {
            if (e.className == 'closed') {
                e.className = 'open';
            }
            else {
                e.className = 'closed';
            }
        }
         <%--Accordian Open Close--%>
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
