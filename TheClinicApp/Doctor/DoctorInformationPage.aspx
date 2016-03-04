<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DoctorInformationPage.aspx.cs" Inherits="TheClinicApp.Doctor.DoctorInformationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <%----<link href="../Content/accodin.css" rel="stylesheet" />----%>
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/TheClinicAppDoctors.css" rel="stylesheet" />
    <link href="../Content/selectize.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.js"></script>
    <div class="container-fluid">
   <div class="headingLabel">
         <label class="headingLabel" style="text-align:center">Doctors</label>
         </div>
  </div>

  
<div class="container text-center"> 
    <div class="row">
        <div class="col-sm-7 bad">
            <div class="row">
                <div class="col-sm-12">
                         <div class="col-sm-12">
                             <div  class="row "> 
                                 <div class="input-group stylish-input-group">
                                    <input type="text" class=" form-control" placeholder="Search" aria-haspopup="false" name="txtSearch" id="txtSearch" />

                                    <span class="input-group-addon" style="height: 0%;">
                                        <button type="submit" style="height: 0px;" runat="server" id="Button1" formnovalidate>
                                          
                                            <img src="../Images/Search-WF.png" />
                                        </button>
                                    </span>

                                 </div>

                             </div>

                         </div>

                </div>

            </div>
                    
         <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">
                <div>
              <table style="font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif">
                  <tr>
                      <td>
                          <div>
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
                                           <asp:Label ID="lblPhoneDis" runat="server" Text=""></asp:Label>

                                       </td>

                                   </tr>

                              </table>

                          </div>
                          <div>
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
                                          <asp:Label ID="lblGenderDis" runat="server" Text=""></asp:Label>


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
                                             </div>
                                         
                             </td>

                                         <td>
                                 <img src="../Images/UploadPic.png" / width="75px" height="80px" style="box-shadow:initial"/>
                            </td>
                                         </tr>

                                 </table>     
                    </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
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
                                   <asp:TextBox ID="TextBox1" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ></asp:TextBox>

                               </div>

                           </div>

                       </section>

                   </li>
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">General Examination Details</span></header>
                       <section class="content">
                           <label  class="control-label col-lg-3">Sleep</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox3" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ></asp:TextBox>

                           </div>

                       </section>

                   </li>
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">Systamatic Examination Details</span></header>
                       <section class="content">
                           <label  class="control-label col-lg-3">Cardiovascular</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox4" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Nervoussystem</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox5" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Musculoskeletal</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox6" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Palloe</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox7" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Icterus</label>
                           <div class="col-lg-9">
                                <asp:TextBox ID="TextBox8" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                            <label  class="control-label col-lg-3">Clubbing</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="TextBox9" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Cyanasis </label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="TextBox10" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                 <label  class="control-label col-lg-3">Bowel
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox11" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                    <label  class="control-label col-lg-3">Appettie </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox12" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
                <label  class="control-label col-lg-3">Micturation
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox13" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
       
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Ayurvedic parameters</span></header>
<section class="content">

               <label  class="control-label col-lg-3">Sleep
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox14" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
    </section>

          </li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">diagnosis</span></header>
<section class="content">

               <label  class="control-label col-lg-3">diagnosis
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="TextBox15" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                                

             

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
                                        <td style="text-align:center;font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif"><asp:Label ID="Label15" runat="server" Text="Medicine"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label16" runat="server" Text="Timing"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label17" runat="server" Text="Dozage"></asp:Label></td><td style="text-align:center"><asp:Label ID="Label18" runat="server" Text="Days"></asp:Label></td>
                                    </tr>
            <tr>
                <td style="font-size: small" ><input id="Text5" type="text" placeholder="Medicine" runat="server"  class="dynamicTd"/></td><td><input id="Text6" class="dynamicTd" type="text"  placeholder="Timing" runat="server"  /></td><td><input id="Text7" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="Text8" type="text" placeholder="Days" runat="server" class="dynamicTd" /></td>
            </tr>
            <tr>
                <td style="font-size: small" ><input id="Text9" type="text" placeholder="Medicine" runat="server" class="dynamicTd" /></td><td ><input id="Text10" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="Text11" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="Text12" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td>
            </tr>
            <tr>
                <td style="font-size: small"><input id="Text13" type="text" placeholder="Medicine" runat="server" class="dynamicTd" /></td><td ><input id="Text14" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="Text15" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="Text16" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td>
            </tr>
            <tr>
                <td style="font-size: small" ><input id="Text17" type="text" placeholder="Medicine" runat="server"  class="dynamicTd"/></td><td ><input id="Text18" class="dynamicTd" type="text" placeholder="Timing" runat="server" /></td><td ><input id="Text19" type="text" placeholder="Dozage" runat="server" class="dynamicTd"/></td><td ><input id="Text20" type="text" placeholder="Days" runat="server" class="dynamicTd"/></td><td>
        
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
                                <asp:TextBox ID="TextBox16" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

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
    <div class="col-sm-2" style=" position:fixed; z-index:3; right:0%; width:25%; height:100% ">
        <div id="div2" class="row">
            <div id="sidebar-wrapper">

            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    
                        Case Sheet
                    
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
         
        
    <div class="row">
      <div id="div1" class="list-group leftSideBar1"> 
          <span class="list-group-item active">
                              PATIENT LIST TODAY </span>
                          <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False" CssClass="footable" Style="max-width: 500px" DataKeyNames="UniqueId" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImgBtnUpdate" runat="server" Width="5%" Height="5%" ImageUrl="~/Images/Check.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID") %>' OnCommand="ImgBtnUpdate_Command" formnovalidate />
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

    </div>

</div>
      
   

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
   <%-- <script type="text/javascript">

        function Show() {
           
            //var flag = 0;
            //if (flag==0){
            //    $("#div1").animate({ "right": "-=100%" }, 800);
            //    document.getElementById("#img1").src ="Images/navigate-right-icon.png";
            //}

            $("#div1").animate({ "right": "-=50%" });
            $("#img1").hide();
            $("#img2").show();


        }


        function showback() {
            $("#div1").animate({ "right": "+=50%" });
            $("#img1").show();
            $("#img2").hide();

        }


     </script>--%>
    <div id="flip"  style=" position:fixed; z-index:3; bottom:30%; right:0%; width:5%; height:5% ">
        <label>Tokens</label>
        <img id="img1" src="../Images/Button-Add-icon.png" />

    </div>
    <div id="flip1"  style=" position:fixed; z-index:3; bottom:70%; right:0%; width:5%; height:5% ">
        <label>CaseSheet</label>
        <img id="img2" src="../Images/Button-Add-icon.png" />

    </div>
    <script>

        $("#flip").click(function () {
            $("#div1").animate({
                width: 'toggle'
            });
        });
        $("#flip1").click(function () {
            $("#div2").animate({
                width: 'toggle'
            });
        });


    </script>
    
   
        
</asp:Content>

