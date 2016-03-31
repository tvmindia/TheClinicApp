<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="NewIssue.aspx.cs" Inherits="TheClinicApp.Stock.NewIssue" %>

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
    </style>

    <%--Date picker scripts--%>

    <script>

        $(function () {
            $("[id$=txtDate]").datepicker({
                dateFormat: 'dd-m-yy',
                showOn: 'button',

                buttonImageOnly: true,
                buttonImage: '../Images/calendar4.png',
                readonly:true
            });
        });
    </script>


    <script>  
            
        //----------------------------------------------------------  * MEDICINES  * --------------------------------------------------------------------------------------------------


        //----------- * Function to add row -- it creates a row if rowcont is zero , othewise create a row and append it to the existing rows *----------//

        function AddRow()
        {
                
            //To Check the Reloading Condition
            var hidCount=   document.getElementById('<%=hdnRowCount.ClientID%>').value;
          
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
                    CreateDynamicContols();
                }
            



                function CreateDynamicContols()
                {  
                    iCnt=1;

                 
                    $(container).append('<table style="width:80%"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Medicine" onblur="BindControlsByMedicneName('+iCnt+')" /></td><td><input id="txtUnit'+iCnt+'" readonly="true" class="input "  style="width:100%" type="text" placeholder="Unit" /></td><td><input id="txtCode'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Med Code"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" class="input " style="width:100%" type="text" placeholder="Category"/></td><td><input id="txtQuantity'+iCnt+'" style="width:100%" class="input" type="text" placeholder="Quantity" /></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility = hidden;"  value="+" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td></tr> </table>');
                   
                    // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                    
                
                    $('#main').after(container);

                    //$('<%=hdnRowCount.ClientID%>').after(container);

                    var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtMedicine"+iCnt).autocomplete({
                        source: ac
                    });
               
                    $('body').on('click', '#btAdd'+iCnt, function () 
                    {
                        //debugger;
                      
                        if (iCnt <= 19)
                        {
                            iCnt = iCnt + 1;
                       
                            // ADDING  TEXTBOX CONTROLS
                       
                            $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td></tr></table>');

                            // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                    
                            $('#main').after(container);                            
                            var ac=null;
                            ac = <%=listFilter %>;
                            $( "#txtMedicine"+iCnt).autocomplete({
                                source: ac
                            });

                        }
                                  
                            // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                            // (20 IS THE LIMIT WE HAVE SET)
                        else
                        {
                            $(container).append('<label>Reached the limit</label>');
                            $('#btAdd'+iCnt).attr('class', 'bt-disable');
                            $('#btAdd'+iCnt).attr('disabled', 'disabled');
                        }

                        //to find how many rows are currrently inserted.
                        document.getElementById('<%=hdnRowCount.ClientID%>').value=iCnt;
                          
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
                    debugger;

                    var container = $(document.createElement('div')).css({
                        width:'100%',
                        borderTopColor: '#999', borderBottomColor: '#999',
                        borderLeftColor: '#999', borderRightColor: '#999'
                    });

                    if (iCnt<hidCount)
                    {
                        // $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+i+'" style="width:100%" type="text" class="input" onblur="change('+i+')" placeholder="Medicine"/></td><td><input id="txtUnit'+i+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+i+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td></tr></table>');
                         

                    }
                    else
                    {
                        // $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+i+'" style="width:100%" type="text" class="input" onblur="change('+i+')" placeholder="Medicine"/></td><td><input id="txtUnit'+i+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+i+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td><td><input id="hdnDetailID'+iCnt+'" type="hidden" /></td></tr></table>');
                    }

                    $('#main').before(container);

                    debugger;

                    var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtMedname"+iCnt).autocomplete({
                        source: ac
                    });
                }  
                
                RefillTextboxesWithXmlData();

            }

           
        }


        //------------ *   Function to get textbox values -- stores textbox values into hidden field when data is submitted *-----------//

        // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
        var divValue, values = '';

        function GetTextBoxValues()
        {
            debugger;
               

            $(divValue)
                .empty()
                .remove();
            values = '';
            var i=1;
            var HiddenfieldCount = 0;

            $('.input').each(function () {
                divValue = $(document.createElement('div')).css({
                    padding: '5px', width: '200px'
                });

                var datas = document.getElementById('<%=hdnTextboxValues.ClientID%>');
                  
                    
                if(i % 5 == 0)
                {
                      
                    HiddenfieldCount= HiddenfieldCount+1;
                    values += this.value +'|'+document.getElementById('hdnDetailID'+HiddenfieldCount).value+'$';
                }

                else
                {
                    values += this.value +'|'; 
                }

                //values += this.value +'|'; 
                   
                i++;

         
                datas.value = values;
                    
            });

                


        }



        //-----------------------* Function to bind textboxes by medicine name -- fills textboxes when focus is lost from medicine textbox  *-----------------//


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


        //----------------------------------- * Function to rebind medicine textboxes -- refills controls by retrieving data from xml *-----------------------

        function RefillTextboxesWithXmlData()
        {
            debugger;

            var XmlDataFromHF =   document.getElementById('<%=hdnXmlData.ClientID%>').value;
                var xmlDoc = $.parseXML(XmlDataFromHF);
                var xml = $(xmlDoc);
                var Medicines = xml.find("Medicines");
                var i=1;
           
                if (Medicines.length > 0)
                {
                    $.each(Medicines, function () {
                   
                                        
                        var MedicineName      =   $(this).find("MedicineName").text() ;
                        var MedicineCode      =   $(this).find("MedCode").text();
                        var MedicineUnit      =   $(this).find("Unit").text();
                        var MedicineCategory  =   $(this).find("CategoryName").text();
                        var MedicineQuantity  =   $(this).find("QTY").text();
                        var UniqueID          =   $(this).find("UniqueID").text();
                    

                        document.getElementById('txtMedicine'+i).value      =   MedicineName;
                        document.getElementById('txtCode'+i).value          =   MedicineCode;
                        document.getElementById('txtUnit'+i).value          =   MedicineUnit;
                        document.getElementById('txtCategory'+i).value      =   MedicineCategory;
                        document.getElementById('txtQuantity'+i).value      =   MedicineQuantity;

                        document.getElementById('hdnDetailID'+i).value =  UniqueID;

                        i=i+1;
                    
                    });
                  
                }


            }


            //----------------------------------------------------------  * END MEDICINES  * --------------------------------------------------------------------------------------------------

            $(document).ready(function () {
              
                
                //-------------*  images that represents IssueNo duplication hide and show * -------------//

                var LnameImage = document.getElementById('<%=imgWebLnames.ClientID %>');
                LnameImage.style.display = "none";
                var errLname = document.getElementById('<%=errorLnames.ClientID %>');
                errLname.style.display = "none";

                AddRow();

               <%-- if (document.getElementById('<%=hdnXmlData.ClientID%>').value != null) {
                    RefillTextboxesWithXmlData();
                }--%>


            });            

       


        //---------------* Function to check Issue Number duplication *-----------------//

        function CheckIssueNoDuplication(IssueNo) {
            
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
                <asp:TextBox ID="txtIssuedTo" runat="server"></asp:TextBox>

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

</asp:Content>
