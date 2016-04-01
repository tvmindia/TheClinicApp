<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="TheClinicApp.Doctors_Test.Doctors" %>

<!DOCTYPE html>

<html class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><script id="tinyhippos-injected">if (window.top.ripple) { window.top.ripple("bootstrap").inject(window, document); }</script><!--<![endif]-->
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
     <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Content/DoctorStyle/css/bootstrap-spinner.css" rel="stylesheet" />
    <link href="../Content/DoctorStyle/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/DoctorStyle/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/DoctorStyle/css/slicknav.css" rel="stylesheet" />
    <link href="../Content/DoctorStyle/css/jquery-ui.css" rel="stylesheet" />

    <link href="../Content/DoctorStyle/css/normalize.min.css" rel="stylesheet" />
    <link href="../Content/DoctorStyle/css/main.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    
    <script src="../Content/DoctorStyle/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <style>
    .bt,.bt1 {
   border: 2px solid #66ff66;
   background: #666666;
   color: #ffffff;
   font-size: 12px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
    
    .table {
    margin-bottom: 5px;
    max-width: 100%;
    width: 100%;
}
        </style>
    
</head>

    <body>
        
        <script>
            $(document).ready(function () {
                                
                var iCnt = 0;

                //Removing Div on btRemove button click
                $("body").on("click", "#btRemove", function () {
                    debugger;
                    if (iCnt > 1) {
                        $(this).closest("div").remove();

                        if ($('#btAdd' + (iCnt) + '').css('visibility') == 'visible') {
                            debugger;
                            alert(0010);
                            //Nothing doing
                        }
                        else {

                            $('#btAdd' + (iCnt - 1) + '').css('visibility', 'visible')


                        }
                        iCnt = iCnt - 1;
                    }

                });


                // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
                var container = $(document.createElement('div')).css({
                    width: '100%',
                    borderTopColor: '#FFFFFF', borderBottomColor: '#FFFFFF',
                    borderLeftColor: '#FFFFFF', borderRightColor: '#FFFFFF'
                });

                //Onclick function for Adding Controls and Textboxes
                $('body').on('click', ('#btAdd,.bt'), function () {

                    if (iCnt <= 100) {
                        iCnt = iCnt + 1;

                        // ADD TEXTBOX And Controls
                        $(container).append('<div><table class="table" style="width:100%;border:0;"><tr><td><input id="txtMedname5" type="text" class="input" placeholder="Medicine"/></td><td><input id="txtMedname5" type="text" class="input" placeholder="Timmings"/></td><td><input id="txtMeddoz5" type="text" class="input" placeholder="Dozage"/></td><td><input id="txtMedDays5" type="text" class="input" placeholder="Days"/></td><td style="background:#E6E5E5"><input type="button" id="btRemove" class="bt1" value="-" style="width:20px" /></td><td style="background:#E6E5E5"><input type="button" id="btAdd' + (iCnt) + '" value="+" onclick=this.style="visibility:hidden;" class="bt" style="width:20px" /></td></tr></table><div>');

                        // ADD THE DIV ELEMENTS TO THE "Prescription" CONTAINER.

                        $('#maindiv').after(container);

                    }

                        // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                        // (20 IS THE LIMIT WE HAVE SET)
                    else {
                        $(container).append('<label>Reached the limit</label>');
                        $('#btAdd').attr('class', 'bt-disable');
                        $('#btAdd').attr('disabled', 'disabled');

                    }

                });
                var ac=null;
                ac = <%=listFilter %>;
                $( "#txtSearch" ).autocomplete({
                    source: ac
                })
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
                    values += this.value + '|';
                    alert(values);
                    datas.value = values;
                });

            }
         </script>
         
        <form runat="server">
                  
         <!-- #main-container -->
         
         
         <div class="main_body">
         <div class="left_part">
         <div class="logo"><a href="#"><img src="../Content/DoctorStyle/images/logo.png"></a></div>
         <ul class="menu">
         <li><a href="#">Registration</a></li>
         <li><a href="#">Token</a></li>
         <li><a href="#">Doctor</a></li>
         <li><a href="#">Pharmacy</a></li>
         <li><a href="#">Stock</a></li>
         </ul>
         
         <p class="copy">♥ © 2016 Ayurveda ♥</p>
         </div>
         <div class="right_part">
         <div class="tagline">Doctors Live Sheet</div>
         <div class="grey_sec">
         <div class="search_div">
         <input class="field" id="txtSearch" type="search" placeholder="Search here...">
         <input class="button" type="submit" value="Search">
         </div>
         <ul class="top_right_links"><li><a class="save" id="btnsave" onclick="GetTextValue();" onserverclick="btnsave_ServerClick" runat="server"><span></span>Save</a></li><li><a class="new" href="#"><span></span>New</a></li></ul>
         </div>
         <div class="right_form">
         
         <div class="id_card">
         <div class="photo"><img Src="../Images/UploadPic.png" style="width:142px; height:142px;"></div>
         <div class="fields">
         <div class="field_div"><label>Name</label>:<label id="lblName" /></div>
         <div class="field_div"><label>Age</label>:<label id="lblAge" /></div>
         <div class="field_div"><label>Mobile</label>:<label id="lblPhone" /></div>
         <div class="field_div"><label>Address</label>:<label id="lblAddress" /></div>
         </div>         
         </div>
         
         <div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">
  <h3 class="ui-accordion-header ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons" role="tab" id="ui-id-1" aria-controls="ui-id-2" aria-selected="true" aria-expanded="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Personal Details</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-id-2" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false" style="display: block;">
  <div class="row field_row">
  <div class="col-lg-4">
  <div class="row">
      
  <div class="col-lg-8"><label for="height">Height</label>  
  <div class="input-group spinner height" data-trigger="spinner" id="customize-spinner">
          <input type="text" class="form-control text-center" value="1" data-max="200" data-min="1" data-step="1" id="txtHeight" runat="server" >
          <div class="input-group-addon">
            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
          </div>
        </div>
        <div class="input-group spinner height" data-trigger="spinner" id="customize-spinner">
          <input type="text" class="form-control text-center" value="1" data-max="200" data-min="1" data-step="1" id="txtHeightinch" runat="server">
          <div class="input-group-addon">
            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
          </div>
        </div>
  </div>
  <div class="col-lg-4"><label for="weight">Weight</label>
  <div class="input-group spinner weight" data-trigger="spinner" id="customize-spinner">
          <input type="text" class="form-control text-center" value="1" data-max="200" data-min="1" data-step="1" id="txtWeight" runat="server">
          <div class="input-group-addon">
            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
          </div>
        </div>
  </div>
  </div>
  </div>
  <div class="col-lg-4"><label for="bowel">Bowel</label><input id="bowel" type="text" name="bowel" runat="server"></div>
  <div class="col-lg-4"><label for="appettie">Appettie</label><input id="appettie" type="text" name="appettie"  runat="server"></div>
  </div>
  
  <div class="row field_row">  
  <div class="col-lg-4"><label for="micturation">Micturation</label><input id="micturation" type="text" name="micturation" runat="server"></div>
  <div class="col-lg-4"><label for="sleep">Sleep</label><input id="sleep" type="text" name="sleep" runat="server"></div>  
  </div>
  
  <div class="row">  
  <div class="col-lg-12"><label for="symptoms">Symptoms</label><textarea id="symptoms" runat="server"></textarea></div>
  </div>
  
  </div>
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-3" aria-controls="ui-id-4" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Systematic Examination</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-4" aria-labelledby="ui-id-3" role="tabpanel" aria-hidden="true" style="display: none;">
  <div class="row">  
  <div class="col-lg-4"><label for="cardiovascular">Cardiovascular</label><input id="cardiovascular" type="text" name="cardiovascular" runat="server"></div>
  <div class="col-lg-4"><label for="nervoussystem">Nervoussystem</label><input id="nervoussystem" type="text" name="nervoussystem" runat="server"></div>  
  <div class="col-lg-4"><label for="musculoskeletal">Musculoskeletal</label><input id="musculoskeletal" type="text" name="musculoskeletal" runat="server"></div>  
  </div>
  </div>
  
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-5" aria-controls="ui-id-6" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>General Examination</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-6" aria-labelledby="ui-id-5" role="tabpanel" aria-hidden="true" style="display: none;">
  <div class="row field_row">  
  <div class="col-lg-4"><label for="palloe">Palloe</label><input id="palloe" type="text" name="palloe" runat="server"></div>
  <div class="col-lg-4"><label for="icterus">Icterus</label><input id="icterus" type="text" name="icterus" runat="server"></div>  
  <div class="col-lg-4"><label for="clubbing">Clubbing</label><input id="clubbing" type="text" name="clubbing" runat="server"></div>  
  </div>
  <div class="row">  
  <div class="col-lg-4"><label for="cyanasis">Cyanasis</label><input id="cyanasis" type="text" name="cyanasis" runat="server"></div>
  <div class="col-lg-4"><label for="lymphnodes">Lymphnodes</label><input id="lymphGen" type="text" name="lymphGen" runat="server"></div>  
  <div class="col-lg-4"><label for="edima">Edima</label><input id="edima" type="text" name="edima" runat="server"></div>  
  </div>
  </div>
  
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-7" aria-controls="ui-id-8" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Diagnosys</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-8" aria-labelledby="ui-id-7" role="tabpanel" aria-hidden="true" style="display: none;">
  <div class="row">  
  <div class="col-lg-12"><label for="diagnosys">Diagnosys</label><textarea id="diagnosys" runat="server"></textarea></div>
  </div>
  </div>
  
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-9" aria-controls="ui-id-10" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Remarks</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-10" aria-labelledby="ui-id-9" role="tabpanel" aria-hidden="true" style="display: none;">
  <div class="row">  
  <div class="col-lg-6"><label for="remarks">Remarks</label><input id="remarks" type="text" name="remarks" runat="server"></div>
  </div>
  </div>
  
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-11" aria-controls="ui-id-12" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Clinical Details</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-12" aria-labelledby="ui-id-11" role="tabpanel" aria-hidden="true" style="display: none;">
  <div class="row field_row">  
  <div class="col-lg-4"><label for="pulse">Pulse</label><input id="pulse" type="text" name="pulse" runat="server"></div>
  <div class="col-lg-4"><label for="bp">Bp</label><input id="bp" type="text" name="bp" runat="server"></div>  
  <div class="col-lg-4"><label for="tounge">Tounge</label><input id="tounge" type="text" name="tounge" runat="server"></div>  
  </div>
  <div class="row field_row">  
  <div class="col-lg-4"><label for="heart">Heart</label><input id="heart" type="text" name="heart" runat="server"></div>
  <div class="col-lg-4"><label for="lymphnodes">Lymphnodes</label><input id="lymphnodes" type="text" name="lymphnodes" runat="server"></div>  
  <div class="col-lg-4"><label for="resp_rate">Resp rate</label><input id="resp_rate" type="text" name="resp_rate" runat="server"></div>  
  </div>
  <div class="row">  
  <div class="col-lg-12"><label for="others">Others</label><textarea id="others" runat="server"></textarea></div>
  </div>
  </div>
  
  <h3 class="ui-accordion-header ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-id-13" aria-controls="ui-id-14" aria-selected="false" aria-expanded="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Prescription Section</h3>
  <div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-id-14" aria-labelledby="ui-id-13" role="tabpanel" aria-hidden="true" style="display: none;">
  
  <table class="table" style="width:100%;border:0;" >
  <tbody><tr>
    <th>Medicine</th>
    <th>Dozage</th>
    <th>Qty</th>
    <th>Unit</th>
  </tr>
  <tr>
     <td ><input id="Text4" type="text" placeholder="Medicine" class="input"/></td><td ><input id="txtMedname4" class="input" type="text" placeholder="Timing" /></td><td ><input id="txtMeddoz4" type="text" placeholder="Dozage" class="input"/></td><td ><input id="txtMedprescription4" type="text" placeholder="Days" class="input"/></td><td style="background:#E6E5E5">
    <input type="button" value="-" class="bt1" onclick="this.style.visibility = 'visible'; btAdd.style.visibility = 'visible';" style="width:20px;"/></td><td style="background:#E6E5E5">
         <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt1" style="width:20px" />         
         </td>
  </tr>
  </tbody>      
  </table>       
  <div id="maindiv"> 
  </div>
  </div>
     
  
</div>
         
             <asp:HiddenField ID="HiddenField1" runat="server" />
         </div>
         
         </div>         
         </div>
         
         
         </form>
         
         
         <script src="../Content/DoctorStyle/js/jquery-1.11.1.min.js"></script>
         <script src="../Content/DoctorStyle/js/bootstrap.min.js"></script>
         <script src="../Content/DoctorStyle/js/jquery.slicknav.js"></script>
         <script src="../Content/DoctorStyle/js/jquery-ui.js"></script>
<script src="../Content/DoctorStyle/js/jquery.spinner.js"></script>
         
       

       
			<script>
			var test=jQuery.noConflict();
            test(function(){
              test('#customize-spinner').spinner('changed',function(e, newVal, oldVal){
                test('#old-val').text(oldVal);
                test('#new-val').text(newVal);
              });
            })
            </script>
        
        
        <script src="../Content/DoctorStyle/js/main.js"></script>
 
        
    

</body>

</html>
