﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master"  AutoEventWireup="true" ValidateRequest="false" CodeBehind="NewIssue.aspx.cs" Inherits="TheClinicApp.Stock.NewIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%-- NOTE :  validateRequest is set to false for disabling request validation on a page--%>



    <%--   //------------- DATEPICKER SCRIPT AND  STYLES---------%>

    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-ui.js"></script>
    <link href="../Content/jquery-ui.css" rel="stylesheet" />


    <%--Date picker styles--%>
    <style>
        .ui-autocomplete {
            background: fixed;
            background-color: ghostwhite;
            box-shadow: 1px 5px 10px 5px #4d3319;
        }

        .ui-datepicker {
            background: fixed;
            background-color: ghostwhite;
            box-shadow: 1px 5px 10px 5px #4d3319;
        }
   
       .warning{
            
             background: url(../Images/Button-Warning-icon.png) no-repeat;
            
             background-size:9% 90%;
           padding-left:1%;
            text-indent: 11%;
            border:1px solid #ccc;
           
        }
    </style>

    <%--Date picker scripts--%>

    <script>

  function      RemoveWarning(ControlNo)
  {
      //debugger;

      //--------------* To remove warning msg from textbox if the medicine is not out of stock , and is called onfocus event of quantity textbox *-------------------//
            $("#txtQuantity"+ControlNo).removeClass("warning");
            $("#txtQuantity"+ControlNo).css({'color':'black'});
            $("#txtQuantity"+ControlNo).attr('type','number');
 
  
        }


        $(function () {
            $("[id$=txtDate]").datepicker({
                dateFormat: 'dd-m-yy',
                showOn: 'button',

                buttonImageOnly: true,
                buttonImage: '../Images/calendar4.png',
 
               
            });

           
        });

    </script>


    <script>  
            
  //----------------------------------------------------------  * MEDICINES  * --------------------------------------------------------------------------------------------------
      
        //----------* Global variables *--------//

        var RemovedIDs = ''; //Uniqueids of details to be deleted are stored to this by appending commas
        var divValue;
        var values = '';     //User Inputs in all textboxes are stored into this by appending '|' as columnwise and '$' as rowwise 



        function autocompleteonfocus(controlID)
        {
//---------* Medicine auto fill, it also filters the medicine that has been already saved  *----------//

            //debugger;
            var topcount =document.getElementById('<%=hdnRowCount.ClientID%>').value;
 
            if (topcount==0)
            {
                var ac=null; 
                ac = <%=listFilter %>;
                $( "#txtMedicine"+controlID).autocomplete({
                    source: ac
                });
            }
            else
            {
                var ac=null;
                ac = <%=listFilter %>;
                var i=1;
                while(i<=topcount)
                {
                    if (i==1)
                    {
                        var item=  document.getElementById('txtMedicine'+i).value 
                                 
                        var result = ac.filter(function(elem){
                            return elem != item; 
                        });

                    }
                    else
                    {
                        if (document.getElementById('txtMedicine'+i) != null)

                        {
                            var item=  document.getElementById('txtMedicine'+i).value 
                                                           

                            result = result.filter(function(elem){
                                return elem != item; 
                            }); 
                        }
                    }
                    i++;
                }
            
                            
                $( "#txtMedicine"+controlID).autocomplete({
                    source: result
                });

            }

        } 





        function AddRow()
        {
           
 //----------- * Function to add row -- it creates a row if rowcont is zero , othewise create a row and append it to the existing rows *-------//  
           
          
            var hidCount= document.getElementById('<%=hdnRowCount.ClientID%>').value;
          
            if (hidCount== "0")
            {
                var iCnt = 0;
               
                var container = $(document.createElement('div')).css({
                    width:'100%',
                    borderTopColor: '#999', borderBottomColor: '#999',
                    borderLeftColor: '#999', borderRightColor: '#999'
                });


                if (iCnt==0)
                {
                    CreateDynamicContols();
                }
            
                function CreateDynamicContols()
                {  
                    iCnt=1;

                    $(container).append('<table style="width:80%" id="Header"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td><td><input id="hdnQty'+iCnt+'" type="hidden"  /></td> </tr> </table>');
                   
                    $('#main').after(container);

                    $('body').on('click', '.bt1', function  () {
                        
                        if (iCnt >= 1) {

                            if (iCnt == 1) 
                            {
                                $(this).closest("table").remove();
                                document.getElementById("Header").remove();

                                $(container).append('<table style="width:80%" id="Header"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    
                                $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td><td><input id="hdnQty'+iCnt+'" type="hidden"  /></td> </tr> </table>');
                   
                                $('#main').after(container);

                            }
                            else
                            {
                                $(this).closest("table").remove();
                            }


                          var tempRowCount  = iCnt - 1;

                        } 
                    
                        document.getElementById('<%=hdnRowCount.ClientID%>').value = tempRowCount;

                    }); 
                 

                    $('body').on('click', '.bt', function () 
                    {
                      
                        if (iCnt <= 200)
                        {
                            iCnt = iCnt + 1;
                       
                            $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td><td><input id="hdnQty'+iCnt+'" type="hidden"  /></td> </tr> </table>');
                            $('#main').after(container);                            
                          
                        }
                         
                        else
                        {
                            $(container).append('<label>Reached the limit</label>');
                            $('.bt').attr('class', 'bt-disable');
                            $('.bt').attr('disabled', 'disabled');
                        }

                        document.getElementById('<%=hdnRowCount.ClientID%>').value = iCnt;

                    });

                }
                if (document.getElementById('<%=hdnRowCount.ClientID%>').value != 0) {
                    RefillTextboxesWithXmlData();
                }

            }
            else
            {
                for(iCnt=1;iCnt<=hidCount;iCnt++)
                {
                    
                    var container = $(document.createElement('div')).css({
                        width:'100%',
                        borderTopColor: '#999', borderBottomColor: '#999',
                        borderLeftColor: '#999', borderRightColor: '#999'
                    });

                    if(iCnt==1)
                    {
                        $(container).append('<table style="width:80%" id="Header"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td> <td><input id="hdnQty'+iCnt+'" type="hidden" /></td></tr> </table>');
                    }
                    else  if (iCnt==hidCount-1)
                    {
                       
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td><td><input id="hdnQty'+iCnt+'" type="hidden"  /></td> </tr> </table>');
                    }

                    else 
                    {
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td> <td><input id="hdnQty'+iCnt+'" type="hidden"  /></td></tr> </table>');
                        
                    }         

                    $('#main').before(container);

                }  


                
                iCnt=iCnt-1;

                $('body').on('click', '.bt1', function  () {
                 
                    var RemoveButtonId = $(this).closest('.bt1').attr('id') //document.getElementById(this.Id);
                   
                    var id = RemoveButtonId.substring(8,20); 
                    
                    if (iCnt >= 1) {

                        RemovedIDs += document.getElementById('hdnDetailID'+id).value+',';

                        if (RemovedIDs == ',') {
                            RemovedIDs = '';
                        }

                        document.getElementById('<%=hdnRemovedIDs.ClientID%>').value = RemovedIDs;

                        if (iCnt == 1) {
                            $(this).closest("table").remove();
                            document.getElementById("Header").remove();
                            
                            $(container).append('<table style="width:80%" id="Header"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    
                            $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')" onfocus="RemoveWarning('+iCnt+')" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td> <td><input id="hdnQty'+iCnt+'" type="hidden" /></td></tr> </table>');
                   
                            $('#main').after(container);
 
                        }
                        else{
                            $(this).closest("table").remove();
                        }
                     var   tempRowCount  = iCnt - 1;
                    } 

                    document.getElementById('<%=hdnRowCount.ClientID%>').value = tempRowCount;

                }); 

                 
                $('body').on('click', '.bt', function () 
                {
                  
                    if (iCnt <= 200)
                    {
                        iCnt = iCnt + 1;
                       
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" min="1" type="number" placeholder="Quantity" onblur="CheckMedicineIsOutOfStock('+iCnt+')"  onfocus="RemoveWarning('+iCnt+')"/></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td><td ><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"/></td><td><input id="hdnQty'+iCnt+'" type="hidden" /></td> </tr> </table>');
                        $('#main').after(container);                            
                        
                    }
                                
                        
                    else
                    {
                        $(container).append('<label>Reached the limit</label>');
                        $('.bt').attr('class', 'bt-disable');
                        $('.bt').attr('disabled', 'disabled');
                    }

                    
                    document.getElementById('<%=hdnRowCount.ClientID%>').value = iCnt;

                });
                //RefillTextboxesWithXmlData();

            }

           
        }


 

        // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
       

        function GetTextBoxValues()
        {
 //------------ *   Function to get textbox values -- stores textbox values into hidden field when data is submitted *-----------//
debugger;

          
            values = '';



            var i=1;
           
            $('.input').each(function () {
                 
                    i++;

            });
            

            var NumberOfColumns = i-1;
            
            var NumberOfRows = NumberOfColumns/5;
          
            for (var k = 1; k <= NumberOfRows; k++) 
            {
   var qty =  document.getElementById('txtQuantity'+k).value ;
    if(qty.indexOf('Must be') > -1)
    {
    document.getElementById('txtQuantity'+k).value  = document.getElementById('hdnQty'+k).value; 
    }

                if(( (document.getElementById('txtQuantity'+k) != null) &&(document.getElementById('txtQuantity'+k).value != '' ) && (isNaN(document.getElementById('txtQuantity'+k).value))== false ) && ( (document.getElementById('txtMedicine'+k) != null) &&(document.getElementById('txtMedicine'+k).value != '' ) )) 
                {
     var CurrentMedName = document.getElementById('txtMedicine'+k).value;
if(values.indexOf(CurrentMedName) > -1)
{
}
else
{
values += document.getElementById('txtMedicine'+k).value +'|'+document.getElementById('txtUnit'+k).value +'|'+document.getElementById('txtCode'+k).value +'|'+ document.getElementById('txtCategory'+k).value +'|'+ document.getElementById('txtQuantity'+k).value+'|'+document.getElementById('hdnDetailID'+k).value+'$';
             }              
                }
                
                if ((document.getElementById('txtQuantity'+k) != null) &&((document.getElementById('txtQuantity'+k).value == '' ) || (isNaN(document.getElementById('txtQuantity'+k).value)== true ))) 
                {
    
                
                    if ((document.getElementById('hdnDetailID'+k) != null) &&(document.getElementById('hdnDetailID'+k).value != '' ) )
                    {
                        RemovedIDs += document.getElementById('hdnDetailID'+k).value+',';


                        if (RemovedIDs == ',') {
                            RemovedIDs = '';
                        }


                        document.getElementById('<%=hdnRemovedIDs.ClientID%>').value = RemovedIDs;
                    }
              
            }



            }

            document.getElementById('<%=hdnTextboxValues.ClientID%>').value = values;

            }



            function BindControlsByMedicneName(ControlNo) 
            {        
 //-----------------------* Function to bind textboxes by medicine name -- fills textboxes when focus is lost from medicine textbox  *-----------------//
            
                if (ControlNo>=1)
                {
                    var MedicineName = document.getElementById('txtMedicine'+ControlNo).value;
                    // alert(MedicineName);

                }
           
            

                if (MedicineName!="")
                { 
              
                    PageMethods.MedDetails(MedicineName,  OnSuccess, onError);  
                }

                function OnSuccess(response, userContext, methodName) 
                {      
                    if (ControlNo>=1)
                    {     
                        
                            
                        var MedicineDetails = new Array();
                        MedicineDetails = response.split('|'); 
                    
                   
                        document.getElementById('txtUnit'+ControlNo).value=MedicineDetails[0];
                        document.getElementById('txtCode'+ControlNo).value=MedicineDetails[1];
                        document.getElementById('txtCategory'+ControlNo).value=MedicineDetails[2];
                        document.getElementById('txtQuantity'+ControlNo).placeholder = " Out Of: " +MedicineDetails[3];
                        document.getElementById('hdnQty'+ControlNo).value = parseInt(MedicineDetails[3]);
                        
                        
                      
                        //Qty = parseInt(MedicineDetails[3]);
                    }
              
                }          
                function onError(response, userContext, methodName)
                {      
             
                }    


            }



            function CheckMedicineIsOutOfStock(ControlNo)
            {


//-----------* Checks whether medicine is out of stock , when user input quantity , and is called onblur event of quantity textbox *-----------//               
                if (document.getElementById('txtMedicine'+ControlNo)!=null && document.getElementById('txtQuantity'+ControlNo)!=null  ) 
                {
                    var Qty = parseInt(document.getElementById('hdnQty'+ControlNo).value);


                    var MedicineName = document.getElementById('txtMedicine'+ControlNo).value;
                    var InputQty     = Number(document.getElementById('txtQuantity'+ControlNo).value);
                    
                document.getElementById('hdnQty'+ControlNo).value = InputQty;

                    if (  (MedicineName!="") && (InputQty!= ""))
                    { 
                        if (document.getElementById('hdnDetailID'+ControlNo).value == "")
                        {



                            //----------- * Case Of Insert *----------//
                            if(InputQty > Qty)
                            {
                                
                                $("#txtQuantity"+ControlNo).addClass("warning");

                                $("#txtQuantity"+ControlNo).attr('type','text');
                               
                                $("#txtQuantity"+ControlNo).css({'color':' #ffad99'});

                                //$("#txtQuantity"+ControlNo).attr("placeholder", 'Must be < '+Qty);

                                $("#txtQuantity"+ControlNo).val('Must be < '+Qty);

                                //$("#txtQuantity"+ControlNo).val('Please enter a value below '+Qty);
                                
                                //alert("Please enter a value below "+Qty);
                            }

                            else{
                                $("#txtQuantity"+ControlNo).removeClass("warning");
                                $("#txtQuantity"+ControlNo).css({'color':'black'});
                                $("#txtQuantity"+ControlNo).attr('type','number');


                            }
                        }

                        else
                        {
                            //----------- * Case Of Update *----------//     
           

var QtyInStock = parseInt(document.getElementById('txtQuantity'+ControlNo).getAttribute("placeholder").replace(" Out Of: ", "") );
                           



                            if(InputQty > QtyInStock)
                            {
                               
                                $("#txtQuantity"+ControlNo).addClass("warning");

                                $("#txtQuantity"+ControlNo).attr('type','text');
                               
                                $("#txtQuantity"+ControlNo).css({'color':' #ffad99'});
                               
                                
                                $("#txtQuantity"+ControlNo).val('Must be < '+QtyInStock);


                                //$("#txtQuantity"+ControlNo).val('Please enter a value below '+QtyInStock);

                                //alert("Please enter a value below "+QtyInStock);
                            }
              
                            else{
                                $("#txtQuantity"+ControlNo).removeClass("warning");
                                $("#txtQuantity"+ControlNo).css({'color':'black'});
                                $("#txtQuantity"+ControlNo).attr('type','number');
                            }
                         
                        }


                    }
                }

            }

 

            function RefillTextboxesWithXmlData(Medicines)
            {
              
//----------------------------------- * Function to rebind medicine textboxes -- refills controls by retrieving data from xml *-----------------------
                var XmlDataFromHF =   document.getElementById('<%=hdnXmlData.ClientID%>').value;
            var xmlDoc = $.parseXML(XmlDataFromHF);
            var xml = $(xmlDoc);
            var Medicines = xml.find("Medicines");
            var i=1;
           
            if (Medicines.length > 0)
            {

                document.getElementById('<%=txtIssueNO.ClientID %>').readOnly = true;

               

            $.each(Medicines, function () {
                   
                   debugger;                     
                var MedicineName      =   $(this).find("MedicineName").text() ;
                var MedicineCode      =   $(this).find("MedCode").text();
                var MedicineUnit      =   $(this).find("Unit").text();
                var MedicineCategory  =   $(this).find("CategoryName").text();
                var MedicineQuantity  =   $(this).find("QTY").text();
                var UniqueID          =   $(this).find("UniqueID").text();
                var QtyInStock        =   $(this).find("QtyInStock").text();

                document.getElementById('txtMedicine'+i).value      =   MedicineName;
                document.getElementById('txtCode'+i).value          =   MedicineCode;
                document.getElementById('txtUnit'+i).value          =   MedicineUnit;
                document.getElementById('txtCategory'+i).value      =   MedicineCategory;
                document.getElementById('txtQuantity'+i).value      =   MedicineQuantity;

document.getElementById('hdnQty'+i).value      =   MedicineQuantity;

                document.getElementById('hdnDetailID'+i).value =  UniqueID;

                document.getElementById('txtQuantity'+i).placeholder = " Out Of: " +QtyInStock;

                document.getElementById('txtMedicine'+i).readOnly = true; // --------* medicine name set to non-editable after saving *--------//

               
               
                PageMethods.GetQtyInStock(MedicineName, OnSuccess, onError);

                function OnSuccess(response, userContext, methodName) {

debugger;

                QtyInStock = parseInt(response);



                  
                  
                }
                function onError(response, userContext, methodName) {

                }
var oldQty =   parseInt(MedicineQuantity);


                           
var total = parseInt(oldQty + parseInt(QtyInStock));


             document.getElementById('txtQuantity'+i).placeholder = " Out Of: " +total;

                i=i+1;
                    
            });
                    
        }


    }


 //----------------------------------------------------------  * END MEDICINES  * --------------------------------------------------------------------------------------------------

    $(document).ready(function () {
              
        //debugger;
        //-------------*  images that represents IssueNo duplication hide and show * -------------//

        var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
            LnameImage.style.display = "none";
            var errLname = document.getElementById('<%=errorLnames.ClientID %>');
                errLname.style.display = "none";


                var XmlDataFromHF =   document.getElementById('<%=hdnXmlData.ClientID%>').value;
                var xmlDoc = $.parseXML(XmlDataFromHF);
                var xml = $(xmlDoc);
                var Medicines = xml.find("Medicines");
                var i=1;
           
                if (Medicines.length > 0)
                {
                    document.getElementById('<%=hdnRowCount.ClientID%>').value = Medicines.length;
                }

               
            AddRow();
               

     <%--     if (document.getElementById('<%=hdnXmlData.ClientID%>').value != null) {--%>
            RefillTextboxesWithXmlData();
            //}



        });            

       

        function CheckIssueNoDuplication(IssueNo) {

 //---------------* Function to check Issue Number duplication *-----------------// 
            
            var IssueNo = document.getElementById('<%=txtIssueNO.ClientID %>').value;
                IssueNo = IssueNo.replace(/\s/g, '');

                PageMethods.CheckIssueNoDuplication(IssueNo, OnSuccess, onError);

                function OnSuccess(response, userContext, methodName) {

                    var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
                    var errLname = document.getElementById('<%=errorLnames.ClientID %>');
                    if (response == false) {

                        LnameImage.style.display = "block";
                        errLname.style.display = "none";

                    }
                    if (response == true) {
                        errLname.style.display = "block";
                        errLname.style.color = "Red";
                        errLname.innerHTML = "Name Alreay Exists"
                        LnameImage.style.display = "none";

                    }
                }
                function onError(response, userContext, methodName) {

                }
            }


    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table>

        <tr>
            <td>Issue No </td>
            <td>
                <asp:TextBox ID="txtIssueNO" runat="server" onchange="CheckIssueNoDuplication(this)"></asp:TextBox></td>
        </tr>

        <asp:Image ID="imgWebLnames" runat="server" ToolTip="Login Name is Available" ImageUrl="~/Images/Check.png" Width="4%" Height="3%" />

        <asp:Image ID="errorLnames" runat="server" ToolTip="Login Name is Unavailable" ImageUrl="~/Images/newClose.png" />

        <tr>
            <td>Issued To </td>
            <td>
                <asp:TextBox ID="txtIssuedTo" runat="server" EnableViewState="false"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td>Date </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>

        </tr>


    </table>

    <br />
    <br />
    <br />

    <div id="main">
    </div>


    <br />
    <br />



    <br />
    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click" OnClientClick="GetTextBoxValues()" />
    <%--<asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />--%>


    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server" EnableCdn="true"></asp:ScriptManager>


    <asp:HiddenField ID="hdnManageGridBind" runat="server" Value="False" />


    <asp:HiddenField ID="hdnXmlData" runat="server" />
    <asp:HiddenField ID="hdnRowCount" runat="server" Value="0" />
    <asp:HiddenField ID="hdnTextboxValues" runat="server" />


    <asp:HiddenField ID="hdnHdrInserted" runat="server" />
    <asp:HiddenField ID="hdnRemovedIDs" runat="server" />
   
     

</asp:Content>
