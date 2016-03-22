<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="AddNewReceipt.aspx.cs" Inherits="TheClinicApp.Stock.AddNewReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <link href="../Content/Input.css" rel="stylesheet" />
    <link href="../Content/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/mui.min.js"></script>

    <script>   
        $(document).ready(function () {

            debugger;
            var hidCount=   document.getElementById('<%=HiddenFieldCount.ClientID%>').value;
            alert(hidCount);
            if (hidCount== "0")
            {
                var iCnt = 0;
                // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
                var container = $(document.createElement('div')).css({
                    width:'100%',
                    borderTopColor: '#999', borderBottomColor: '#999',
                    borderLeftColor: '#999', borderRightColor: '#999'
                });


                $('body').on('click', '#btAdd', function () 
                {
                      
                    if (iCnt <= 19)
                    {
                        iCnt = iCnt + 1;
                       
                        // ADDING  TEXTBOX CONTROLS

                       
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+iCnt+'" style="width:100%" type="text" class="input" onblur="change('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');

                        // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                    
                        $('#main').after(container);

                        var ac=null;
                        ac = <%=listFilter %>;
                        $( "#txtMedname"+iCnt).autocomplete({
                            source: ac
                        });

                    }
                                  
                        // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
                        // (20 IS THE LIMIT WE HAVE SET)
                    else
                    {
                        $(container).append('<label>Reached the limit</label>');
                        $('#btAdd').attr('class', 'bt-disable');
                        $('#btAdd').attr('disabled', 'disabled');
                    }

                    //TO SAVE THE TOP iCnt VALUE
                    debugger;
                    document.getElementById('<%=HiddenFieldCount.ClientID%>').value=iCnt;

             
                });
            

            }
            else
            {
                debugger;


                for(i=1;i<=hidCount;i++)
                {
                    var container = $(document.createElement('div')).css({
                        width:'100%',
                        borderTopColor: '#999', borderBottomColor: '#999',
                        borderLeftColor: '#999', borderRightColor: '#999'
                    });

                    if (i<hidCount)
                    {
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+i+'" style="width:100%" type="text" class="input" onblur="change('+i+')" placeholder="Medicine"/></td><td><input id="txtUnit'+i+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+i+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');
                        
                    }
                    else
                    {
                        $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+i+'" style="width:100%" type="text" class="input" onblur="change('+i+')" placeholder="Medicine"/></td><td><input id="txtUnit'+i+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+i+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+i+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');
                    }




                    $('#main').after(container);

                    var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtMedname"+i).autocomplete({
                        source: ac
                    });


                }

               



            }

          




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

    <script>

        $(function () {
            $("[id$=txtDate]").datepicker({ dateFormat: 'dd-m-yy' ,
                showOn: 'button',
               
                buttonImageOnly: true,
                buttonImage: '../Images/calendar4.png'
            });
        });
    </script>

    <script>
        $(document).ready(function () {
             
            var ac=null;
            ac = <%=listFilter %>;
            $( "#txtSearch" ).autocomplete({
                source: ac
            });
        });
        
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- function onchange --%>
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server" EnableCdn="true"></asp:ScriptManager>

    <%-- on change function call --%>
    <script>
        
        function change(val) 
        {        
            x=val;
            if (val>=1)
            {
                var MedicineName = document.getElementById('txtMedname'+val).value;   
            }
            else
            {
                var MedicineName = document.getElementById('txtSearch').value;   
            }
            

            if (MedicineName!="")
            { 
              
                PageMethods.MedDetails(MedicineName,  OnSuccess, onError);  
            }

            function OnSuccess(response, userContext, methodName) 
            {      
                if (val>=1)
                {              
                    var string1 = new Array();
                    string1 = response.split('|');                 
                    document.getElementById('txtUnit'+val).value=string1[0];
                    document.getElementById('txtMedcode'+val).value=string1[1];
                    document.getElementById('txtCategory'+val).value=string1[2];
                    
                }
                else
                {
                    var string1 = new Array(); 
                    string1 = response.split('|');                 
                    document.getElementById('txtUnit').value=string1[0];
                    document.getElementById('txtCode').value=string1[1];
                    document.getElementById('txtCategory').value=string1[2];
                   
                }
            }          
            function onError(response, userContext, methodName)
            {      
             
            }    


        }

    </script>





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
                                <table style="width: 80%">
                                    <tr>
                                        <td style="text-align: center;">
                                            <asp:Label ID="Label5" runat="server" Text="Medicine"></asp:Label>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:Label ID="Label1" runat="server" Text="Unit"></asp:Label>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:Label ID="Label7" runat="server" Text="Medicine Code"></asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="Label8" runat="server" Text="Category"></asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="Label6" runat="server" Text="Quantity"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="txtSearch" tabindex="4" style="width: 100%" type="text" placeholder="Medicine" class="input" onblur="change()" />
                                        </td>
                                        <td>
                                            <input id="txtUnit" readonly="true" style="width: 100%" class="input " type="text" placeholder="Unit" />
                                        </td>
                                        <td>
                                            <input id="txtCode" readonly="true" style="width: 100%" class="input " type="text" placeholder="Med Code" />
                                        </td>
                                        <td>
                                            <input id="txtCategory" readonly="true" style="width: 100%" class="input " type="text" placeholder="Category" />
                                        </td>
                                        <td>
                                            <input id="txtQuantity" tabindex="5" class="input" style="width: 100%" type="text" placeholder="Quantity" />
                                        </td>

                                        <td>
                                            <span class="auto-style4">
                                                <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
                                            </span>
                                        </td>
                                    </tr>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldCount" runat="server" Value="0" />
                                </table>

                                <div id="main">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>




            </div>
            <div class="col-sm-4">

                <asp:Button ID="btnReceipt" runat="server" Text="Add Receipt" OnClientClick="GetTextValue()" OnClick="btnReceipt_Click" />

            </div>
        </div>


    </div>








</asp:Content>
