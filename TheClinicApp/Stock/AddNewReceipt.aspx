<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="AddNewReceipt.aspx.cs" Inherits="TheClinicApp.Stock.AddNewReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
                     $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Medicine"/></td><td><input id="txtUNit'+iCnt+'" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+iCnt+'" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');

                    // SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
                    if (iCnt == 1) {
                        var divSubmit = $(document.createElement('div'));
                        $(divSubmit).append('<input type=button class="bt" onclick="GetTextValue()"' + 'id=btSubmit value=Submit />');
                    }
                    // ADD BOTH THE DIV ELEMENTS TO THE "Prescription" CONTAINER.
                          
                    $('#main').after(container, divSubmit);

                    var ac=null;
                    ac = <%=listFilter %>;
                     $( "#txtMedname"+iCnt).autocomplete({
                        source: ac
                    });
                          
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

                values += this.value + '|';
               // alert(values);
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
                            <asp:TextBox ID="txtBillNo" runat="server"></asp:TextBox>
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
                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
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
                            <asp:TextBox ID="txtRefNo2" runat="server"></asp:TextBox>
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
                                            <input id="txtSearch" style="width: 100%" type="text" placeholder="Medicine" class="input" />
                                        </td>
                                        <td>
                                            <input id="txtUNit" style="width: 100%" class="input " type="text" placeholder="Unit" />
                                        </td>
                                         <td>
                                            <input id="txtCode" style="width: 100%" class="input " type="text" placeholder="Med Code" />
                                        </td>
                                        <td>
                                            <input id="txtCategory" style="width: 100%" class="input " type="text" placeholder="Category" />
                                        </td>
                                        <td>
                                            <input id="txtQuantity" class="input" style="width: 100%" type="text" placeholder="Quantity" />
                                        </td>
                                       
                                        <td>
                                            <span class="auto-style4">
                                                <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
                                            </span>
                                        </td>
                                    </tr>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </table>

                                <div id="main">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>



 
            </div>
            <div class="col-sm-4">

                <asp:Button ID="btnReceipt" runat="server" Text="Add Receipt" OnClick="btnReceipt_Click" />

            </div>
        </div>


    </div>








</asp:Content>
