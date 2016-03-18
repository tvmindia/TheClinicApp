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
     
    <script>   
        $(document).ready(function () {

            var iCnt = 0;
            // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
            var container = $(document.createElement('div')).css({
                width:'100%',
                borderTopColor: '#999', borderBottomColor: '#999',
                borderLeftColor: '#999', borderRightColor: '#999'
            });


            $('body').on('click', '#btAdd', function () {
                      
                if (iCnt <= 19) {
                    iCnt = iCnt + 1;
                          <%--int count = document.getElementById('<%=HiddenField2.ClientID%>');
                          count.value=iCnt;--%>
                    // ADD TEXTBOX.
                    $(container).append('<table style="width:50%"><tr><td><input id="txtMedname5" type="text" class="input" placeholder="Medicine"/></td><td><input id="txtMedname5" type="text" class="input" placeholder="Timmings"/></td><td><input id="txtMeddoz5" type="text" class="input" placeholder="Dozage"/></td><td><input id="txtMedDays5" type="text" class="input" placeholder="Days"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');

                    // SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
                    if (iCnt == 1) {
                        var divSubmit = $(document.createElement('div'));
                        $(divSubmit).append('<input type=button class="bt" onclick="GetTextValue()"' + 'id=btSubmit value=Submit />');
                    }
                    // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                          
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
                    alert(values);
                    datas.value = values;
                      



                });




            }
              
          
                  
</script>
   <script>
       $(document).ready(function () {
           debugger;
           var ac=null;
           ac = <%=listFilter %>;
             $( "#txtSearch" ).autocomplete({
                 source: ac
             });
         });

       $(function () {
           $('#btnnew').click(function () {
               $('input[type=text]').each(function () {
                   $(this).val('');
               })
           })
       })
         </script>


    <style>
             input[type="text"] {
    width: 125px;
    box-shadow: 1px 1px 1px 1px #347300;
}
        </style>

    <div class="container-fluid">
        <div class="headingLabel">
         <label class="headingLabel" style="text-align:center">Doctors</label>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Doctors Test/DoctorTesting.aspx">LinkButton</asp:LinkButton>
         </div>
  </div>
  
    <div class="container text-center bodyDiv"> 
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
                                  <asp:HiddenField ID="HiddenField2" runat="server" />
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
                          <img src="../Images/UploadPic.png/" style="box-shadow:initial;width:75px;" id="ProfilePic" runat="server"/>
                          <asp:HiddenField ID="HiddenField1" runat="server" />

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
                       <header onclick="toggle(this.parentNode)"><span class="title">Personal Details</span></header>
                       <section class="content">
                            <label  class="control-label col-lg-3">Height</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtHeight" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Weight</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtWeight" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>

                           <div class="form-group">
                               <label  class="control-label col-lg-3">Symptoms</label>
                               <div class="col-lg-9">
                                   <asp:TextBox ID="txtSymptoms" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ></asp:TextBox>

                               </div>

                           </div>
                           <label  class="control-label col-lg-3">Bowel</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtBowel" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Appettie</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtAppettie" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Micturation</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtMicturation" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                           <label  class="control-label col-lg-3">Sleep</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtSleep" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>

                       </section>

                   </li>
               

                  
                   <li class="closed">
                       <header onclick="toggle(this.parentNode)"><span class="title">Systematic Examination Details</span></header>
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
                         
                
</section>
</li>
<li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">General Examination Details</span></header>
<section class="content">

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
                            <label  class="control-label col-lg-3">Lymph Nodes </label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtLymphGen" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                           </div>
                            <label  class="control-label col-lg-3">Edima </label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtEdima" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
                           </div>
    </section>

          </li>
                   <li class="closed">
<header onclick="toggle(this.parentNode)"><span class="title">Clinical Data</span></header>
<section class="content">
   
                        <label  class="control-label col-lg-3">Pulse</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtPulse" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>  
                        <label  class="control-label col-lg-3">Blood Pressur</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtBp" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>  
                        <label  class="control-label col-lg-3">Tounge</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtTounge" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>   
                         <label  class="control-label col-lg-3">Heart</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtHeart" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>  
                         <label  class="control-label col-lg-3">Lymphnodes</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtLymphClinic" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                         <label  class="control-label col-lg-3">Respiration Rate</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtRespRate" class="form-control " TextMode="SingleLine"    Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>

                           </div>
                            <div class="form-group">
                               <label  class="control-label col-lg-3">Others</label>
                               <div class="col-lg-9">
                                   <asp:TextBox ID="txtOthers" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ></asp:TextBox>

                               </div>

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
<header onclick="toggle(this.parentNode)"><span class="title">Remarks </span></header>
<section class="content">

        
              <div class="form-group">
                <label  class="control-label col-lg-3">Remarks
                  </label>
                <div class="col-lg-9">
                                <asp:TextBox ID="txtRemarks" class="form-control " TextMode="multiline"  Height="100"  Width="100%" runat="server" required ValidationGroup="Submit"></asp:TextBox>
             

                </div>
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
                <td ><input id="Text1" type="text" placeholder="Medicine" class="input"/></td><td><input id="txtMedname1" class="input" type="text"  placeholder="Timing" /></td><td><input id="txtMeddoz1" type="text" placeholder="Dozage" class="input"/></td><td ><input id="txtMedprescription1" type="text" placeholder="Days" class="input" /></td>
            </tr>
            <tr>
                <td><input id="Text2" type="text" placeholder="Medicine" class="input" /></td><td ><input id="txtMedname2" class="input" type="text" placeholder="Timing" /></td><td ><input id="txtMeddoz2" type="text" placeholder="Dozage" class="input"/></td><td ><input id="txtMedprescription2" type="text" placeholder="Days" class="input"/></td>
            </tr>
            <tr>
                <td><input id="Text3" type="text" placeholder="Medicine" class="input" /></td><td ><input id="txtMedname3" class="input" type="text" placeholder="Timing" /></td><td ><input id="txtMeddoz3" type="text" placeholder="Dozage" class="input"/></td><td ><input id="txtMedprescription3" type="text" placeholder="Days" class="input"/></td>
            </tr>
            <tr>
                <td ><input id="Text4" type="text" placeholder="Medicine" class="input"/></td><td ><input id="txtMedname4" class="input" type="text" placeholder="Timing" /></td><td ><input id="txtMeddoz4" type="text" placeholder="Dozage" class="input"/></td><td ><input id="txtMedprescription4" type="text" placeholder="Days" class="input"/></td><td>
        
<%--     <span class="auto-style4" />--%>
     <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
         
         </td>
            </tr>
            
    </table>
    <div id="main">

    </div>

                </div>

</section>

</li>

               </ul>

           </div>
    </div>
       </div>
      </div>
         
     </div>
    <div class="col-sm-2" style=" position:fixed; z-index:3; right:0%; width:25%; height:100% ">
        <div id="div2" style="border:dashed;width:100%;height:250px;" class="row">
            <span class="list-group-item active">Visit History</span>
          <asp:GridView ID="GridViewVisitsHistory" runat="server" AutoGenerateColumns="False" CssClass="footable" Style="max-width: 100%;min-width:100%;" DataKeyNames="FileID" CellPadding="4" GridLines="None" ForeColor="#333333">
              <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
              <Columns>
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:ImageButton ID="ImgBtnUpdateVisits" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("VisitID")+"|" + Eval("PrescriptionID") %>' OnCommand="ImgBtnUpdateVisits_Command" formnovalidate />



                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField HeaderText="Date" DataField="CreatedDate" />
                  <asp:BoundField HeaderText="Remarks" DataField="Remarks" />
              </Columns>

              <EditRowStyle BackColor="#2461BF"></EditRowStyle>

              <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>

              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

              <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

              <RowStyle BackColor="#EFF3FB"></RowStyle>

              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

              <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

              <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

              <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

              <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView> 
        </div>
         
        
    <div class="row" id="div1" style="border:dashed;width:100%;height:250px;">
      
          <span class="list-group-item active">Patient List Today</span>
          <asp:GridView ID="GridViewTokenlist" runat="server" AutoGenerateColumns="False" CssClass="footable" Style="max-width:100%;min-width:100%;" DataKeyNames="UniqueId" CellPadding="4" GridLines="None" ForeColor="#333333">
              <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
              <Columns>
                  <asp:BoundField HeaderText="Token No" DataField="TokenNo" />
                  <asp:BoundField HeaderText="Patient Name" DataField="Name" />

                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("PatientID")%>' OnCommand="ImgBtnUpdate_Command1" formnovalidate />


                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>

              <EditRowStyle BackColor="#2461BF"></EditRowStyle>

              <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>

              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

              <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

              <RowStyle BackColor="#EFF3FB"></RowStyle>

              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

              <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

              <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

              <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

              <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView>
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
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>
                                <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

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
                                        <asp:Button ID="btnSave" runat="server" Text="SAVE"  type="submit" CssClass="button" OnClick="btnSave_Click" ValidationGroup="Submit" />
</div>
                                    </td>
                                    
                                        <td style="width:40%">
                                        <div class="form-group">
                                        <asp:Button ID="btnnew" runat="server" Text="NEW"  type="submit" CssClass="button" OnClinicClick="btnnew_Click()" Visible="false" formnovalidate />
                                            </div>
                                       
                                       </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>  

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

    <div id="flip" class="demo" style=" position:fixed; z-index:3; bottom:30%; right:0%; width:5%; height:5% ">
        <label>Tokens</label>
        <img id="img1" src="../Images/Button-Add-icon.png" />

    </div>
    <div id="flip1" class="demo1" style=" position:fixed; z-index:3; bottom:70%; right:0%; width:5%; height:5% ">
        <label>CaseSheet</label>
        <img id="img2" src="../Images/Button-Add-icon.png" />

    </div>
    <script>
       
        $("#flip").click(function () {
            $("#div1").animate({
                width: 'toggle'
            });
            if ($("#flip").attr("class") == "demo") {
                var element = document.getElementById("flip");
                element.setAttribute("class", "clicked");
            }
            else{
                var element = document.getElementById("flip");
                element.setAttribute("class", "demo");
            }
        });
       
        $("#flip1").click(function () {
            $("#div2").animate({
                width: 'toggle'
            

            });
            if ($("#flip1").attr("class") == "demo1") {
                var element = document.getElementById("flip1");
                element.setAttribute("class", "clicked1");
            }
            else{
                var element = document.getElementById("flip1");
                element.setAttribute("class", "demo1");
            }
        });

        $("#flip,#flip1").click(function () {
            if (($("#flip").attr("class") == "clicked") && ($("#flip1").attr("class") == "clicked1")) {
                $(".col-sm-7").animate({
                    width: "95%"
                }, 450); // how long the animation should be

            }
            else {
                $(".col-sm-7").animate({
                    width: "75%"
                }, 450);
            }
            
        });
      

    </script>
    
   
        
</asp:Content>

