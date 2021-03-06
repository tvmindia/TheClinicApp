﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="AddNewReceipt.aspx.cs" Inherits="TheClinicApp.Stock.AddNewReceipt" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />

    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/mui.min.js"></script>
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>

    <script>   
        $(document).ready(function () {         

            //To Check the Reloading Condition
            var hidCount=   document.getElementById('<%=HiddenFieldCount.ClientID%>').value;
          
            if (hidCount== "0")
            {
                var iCnt = 0;
                // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
                var container = $(document.createElement('div')).css({
                    width:'100%',
                    borderTopColor: '#999', borderBottomColor: '#999',
                    borderLeftColor: '#999', borderRightColor: '#999'
                });


                if (iCnt==0)
                {
                    dynamiccontol();
                }
            
                function dynamiccontol()
                {
                    iCnt=1;

                    //  debugger;
                    $(container).append('<table style="width:80%"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine"  onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Quantity" /></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr> </table>');
                   
                    // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.                    
                
                    $('#main').after(container);

                  <%--  var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtMedicine"+iCnt).autocomplete({
                        source: ac
                    });--%>
               
                    $('body').on('click', '.bt', function () 
                    {
                        debugger;
                      
                        if (iCnt <= 19)
                        {
                            iCnt = iCnt + 1;
                       
                            // ADDING  TEXTBOX CONTROLS
                       
                            $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');

                            // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                    
                            $('#main').after(container);                            
                           
                            

                           <%-- var ac=null;
                            ac = <%=listFilter %>;
                            var i=1;
                            while(i<iCnt)
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
                                    var item=  document.getElementById('txtMedicine'+i).value 
                                    //var a =  ac.indexOf(item);                               
                                    //  delete ac[a];                                 

                                    result = result.filter(function(elem){
                                        return elem != item; 
                                    }); 
                                }
                                i++;
                            }

                            
                            $( "#txtMedicine"+iCnt).autocomplete({
                                source: result
                            });--%>


                        }                                  
                            // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                            // (20 IS THE LIMIT WE HAVE SET)
                        else
                        {
                            $(container).append('<label>Reached the limit</label>');
                            $('.bt').attr('class', 'bt-disable');
                            $('.bt').attr('disabled', 'disabled');
                        }

                        //to find how many rows are currrently inserted.
                        document.getElementById('<%=HiddenFieldCount.ClientID%>').value=iCnt;
 
                    });

                    //Removing Div on btRemove button click
                    $('body').on('click', '#btRemove'+iCnt, function () {
                        debugger;


                        alert(iCnt);
                        if (iCnt > 1) 
                        {
                            $(this).closest("div").remove();

                            if ($('#btAdd'+iCnt).css('visibility') == 'visible')
                            {
                         
                                alert(0010);

                            }
                            else 
                            {
                                
                                $('#btAdd'+(iCnt-1)).css('visibility', 'visible')
                                
                            }
                            iCnt = iCnt - 1;
                        }

                    }); 

                }
          
            }
            else
            {                
                // debugger;
                for(iCnt=1;iCnt<=hidCount;iCnt++)
                {
                    //debugger;
                              
                    var container = $(document.createElement('div')).css({
                        width:'100%',
                        borderTopColor: '#999', borderBottomColor: '#999',
                        borderLeftColor: '#999', borderRightColor: '#999'
                    });
                
                    if(iCnt==1)
                    {
                        $(container).append('<table style="width:80%"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                    }
                    else  if (iCnt==hidCount-1)
                    {
                       
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                    }

                    else 
                    {
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;"  class="bt" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                        
                    }         

                    $('#main').before(container);

                  <%--  var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtMedicine"+iCnt).autocomplete({
                        source: ac
                    });    --%>
                    
                }
                iCnt = iCnt - 1;

                $('body').on('click', '.bt', function () 
                {
                    //debugger;
                      
                    if (iCnt <= 19)
                    {
                        iCnt = iCnt + 1;
                       
                        // ADDING  TEXTBOX CONTROLS
                       
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'"  style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" onfocus="autocompleteonfocus('+iCnt+')"  placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btRemove'+iCnt+'" class="bt1" value="-"  /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');

                        // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                    
                        $('#main').after(container);                            
                       <%-- var ac=null;
                        ac = <%=listFilter %>;
                        $( "#txtMedicine"+iCnt).autocomplete({
                            source: ac
                        });--%>

                    }
                                  
                        // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                        // (20 IS THE LIMIT WE HAVE SET)
                    else
                    {
                        $(container).append('<label>Reached the limit</label>');
                        $('.bt').attr('class', 'bt-disable');
                        $('.bt').attr('disabled', 'disabled');
                    }

                    //to find how many rows are currrently inserted.
                    document.getElementById('<%=HiddenFieldCount.ClientID%>').value=iCnt;
 
                });


                //Removing Div on btRemove button click
                $('body').on('click', '.bt1', function () {
                   
                    debugger;
                    
                    var RemoveBtnId = $(this).closest('.bt1').attr('id')                    

                    var Id = RemoveBtnId.substring(8,20);                    

                    var RemovedIDs ;
                    
                    RemovedIDs += document.getElementById('hdnDetailID'+Id).value+',';
                    
                    document.getElementById('<%=hdnRemovedIDs.ClientID%>').value = RemovedIDs;  
                    
                    alert(iCnt);



                    if (iCnt > 1) 
                    {
                        $(this).closest("div").remove();
                    }

                    //    if ($('#btAdd' + (iCnt) + '').css('visibility') == 'visible') {
                    //        debugger;
                    //        alert(0010);
                    //        //Nothing doing
                    //    }
                    //    else {

                    //        $('#btAdd' + (iCnt - 1) + '').css('visibility', 'visible')


                    //    }
                    //    iCnt = iCnt - 1;
                    //}

                }); 



            }


            BindDataFromXml();


        });            

        // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
        var divValue, values = '';

        function GetTextValue()
        {
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
                datas.value = values;
                    
            });
        }
    </script>


    <script>

        function BindDataFromXml()
        {
            debugger;
            
            var XmlDataFromHF =   document.getElementById('<%=HiddenFieldXmlData.ClientID%>').value;
            var xmlDoc = $.parseXML(XmlDataFromHF);
            var xml = $(xmlDoc);
            var Medicines = xml.find("Medicines");
            var i=1;
           
            if (Medicines.length > 0)
            {
                $.each(Medicines, function () {                   
                                        
                    var MedicineName =   $(this).find("MedicineName").text() ;
                    var MedicineCode = $(this).find("MedCode").text();
                    var MedicineUnit = $(this).find("Unit").text();
                    var MedicineCategory = $(this).find("CategoryName").text();
                    var MedicineQuantity= $(this).find("QTY").text();
                    var UniqueID=$(this).find("UniqueID").text();    

                    document.getElementById('txtMedicine'+i).value=   MedicineName;
                    document.getElementById('txtCode'+i).value=   MedicineCode;
                    document.getElementById('txtUnit'+i).value=   MedicineUnit;
                    document.getElementById('txtCategory'+i).value=   MedicineCategory;
                    document.getElementById('txtQuantity'+i).value=   MedicineQuantity;
                    document.getElementById('HiddenReceiptID'+i).value=   UniqueID;
                   
                    i=i+1;
                    
                });
       
            }

        }

    </script>
    <%-- BindControlsByMedicneName&autocompleteonfocus  functions definition --%>
    <script>
        
        function autocompleteonfocus(controlID)
        {
            //debugger;
            var topcount =document.getElementById('<%=HiddenFieldCount.ClientID%>').value;
 
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
                        var item=  document.getElementById('txtMedicine'+i).value 
                        //var a =  ac.indexOf(item);                               
                        //  delete ac[a];                                 

                        result = result.filter(function(elem){
                            return elem != item; 
                        }); 
                    }
                    i++;
                }
            
                            
                $( "#txtMedicine"+controlID).autocomplete({
                    source: result
                });

            }

        } 

        function BindControlsByMedicneName(ControlNo) 
        {        
 
            
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
                    
                    debugger;         
                    var string1 = new Array();
                    string1 = response.split('|');                     
                   
                    document.getElementById('txtUnit'+ControlNo).value=string1[0];
                    document.getElementById('txtCode'+ControlNo).value=string1[1];
                    document.getElementById('txtCategory'+ControlNo).value=string1[2];
                    
                }
              
            }          
            function onError(response, userContext, methodName)
            {      
             
            }    


        }
        
      
    </script>
    <%-- Date Picker,autocomplete style --%>
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
    </style>
    <%-- Date Picker --%>
    <script>

        $(function () {
            $("[id$=txtDate]").datepicker({ dateFormat: 'dd-m-yy' ,
                showOn: 'button',
               
                buttonImageOnly: true,
                buttonImage: '../Images/calendar4.png'
            });
        });
    </script>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- function BindControlsByMedicneName --%>
    <asp:ScriptManager ID="ScriptManager2" EnablePageMethods="true" runat="server" EnableCdn="true"></asp:ScriptManager>



    <div class="container-fluid bodyDiv">

        <label class="headingLabel">Stocks-Add Receipt</label>

        <div class="col-sm-12">
            <div class="col-sm-8">
                <table class="col-phar-patiedet">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-xs-12 regFormLabels">Bill Number:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBillNo" TabIndex="1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-xs-12 regFormLabels">Date:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" TabIndex="2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-xs-12 regFormLabels">Reference No:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRefNo2" TabIndex="3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>

                            <div class="col-lg-12">

                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenFieldXmlData" runat="server" />
                                <asp:HiddenField ID="HiddenFieldCount" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnRemovedIDs" runat="server" />
                                <div id="main">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>




            </div>
            <div class="col-sm-4">

                <asp:Button ID="Button1" runat="server" Text="Add Receipt" OnClientClick="GetTextValue()" OnClick="btnReceipt_Click" />

            </div>
        </div>


    </div>

</asp:Content>
