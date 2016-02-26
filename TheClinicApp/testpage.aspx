<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="TheClinicApp.testpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:dropdownlist runat="server" DataSourceID="SqlDataSource1"  ID="dp1"></asp:dropdownlist>

        <div class="content">
        <div class="accordion-container"> <a href="#" class="accordion-toggle" >Symptoms <span class="toggle-icon"><i >
          
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
                <td style="font-size: small" class="dynamicTd">MEDICINE</td><td class="dynamicTd"><input id="txtMedname1" class="Country" type="text" runat="server" /></td><td class="dynamicTd"><input id="txtMeddoz1" type="text" placeholder="Dozage" runat="server" /></td><td class="dynamicTd"><input id="txtMedprescription1" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small" class="dynamicTd">MEDICINE</td><td class="dynamicTd"><input id="txtMedname2" class="Country" type="text" runat="server" /></td><td class="dynamicTd"><input id="txtMeddoz2" type="text" placeholder="Dozage" runat="server" /></td><td class="dynamicTd"><input id="txtMedprescription2" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small" class="dynamicTd">MEDICINE</td><td class="dynamicTd"><input id="txtMedname3" class="Country" type="text" runat="server" /></td><td class="dynamicTd"><input id="txtMeddoz3" type="text" placeholder="Dozage" runat="server" /></td><td class="dynamicTd"><input id="txtMedprescription3" type="text" placeholder="Prescription" runat="server" /></td>
            </tr>
            <tr>
                <td style="font-size: small" class="dynamicTd">MEDICINE</td><td class="dynamicTd"><input id="txtMedname4" class="Country" type="text" runat="server" /></td><td class="dynamicTd"><input id="txtMeddoz4" type="text" placeholder="Dozage" runat="server" /></td><td class="dynamicTd"><input id="txtMedprescription4" type="text" placeholder="Prescription" runat="server" /></td><td>
        
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
    </form>
</body>
</html>
