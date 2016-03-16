<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="InventoryOut.aspx.cs" Inherits="TheClinicApp.Stock.InventoryOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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


    <script type="text/javascript">
        $(document).ready(function () {

            var iCnt = 1;
            // CREATE A "DIV" ELEMENT AND DESIGN IT USING JQUERY ".css()" CLASS.
            var container = $(document.createElement('div')).css({
                width: '100%',
                borderTopColor: '#999', borderBottomColor: '#999',
                borderLeftColor: '#999', borderRightColor: '#999'
            });

         


            $('body').on('click', '#btAdd', function () {
                debugger;

                if (iCnt <= 20) {
                    iCnt = iCnt + 1;
                  <%--int count = document.getElementById('<%=HiddenField2.ClientID%>');
                          count.value=iCnt;--%>
                    // ADD TEXTBOX.
                    $(container).append('<table style="width:80%"><tr><td ><input id="txtSearch'+iCnt+'" style="width:100%" type="text" placeholder="Medicine"   class="dynamicTd"/></td><td><input id="txtQuantity'+iCnt+'" class="dynamicTd" style="width:100%" type="text"  placeholder="Quantity"/></td> <td> <input id="txtCode'+iCnt+'" name="txtcode1" style="width: 100%" class="dynamicTd " type="text" placeholder="Med Code" /></td><td><input id="txtCategory'+iCnt+'" style="width: 100%" class="dynamicTd " type="text" placeholder="Category" /></td>       <td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td> </tr></table>');


                          

                    // SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
                    if (iCnt ==2)
                    {
                        var divSubmit = $(document.createElement('div'));
                        $(divSubmit).append('<input type=button class="bt" onclick="GetTextValue()"' + 'id=btSubmit value=Submit />');


 
                    }
                    // ADD BOTH THE DIV ELEMENTS TO THE "main" CONTAINER.

                    $('#main').after(container, divSubmit);

                    var ac=null;
                    ac = <%=listFilter %>;
                    $( "#txtSearch"+iCnt ).autocomplete({
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

            });



          
            // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
            var divValue, values = '';
            debugger;
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
                      



            });




        } 


        });
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
            $( "#txtSearch1,#txtSearch2,#txtSearch3,#txtSearch4" ).autocomplete({
                source: ac
            });
        });
        
    </script>





    <div class="container-fluid bodyDiv">

        <label class="headingLabel">Inventory Out</label>


        <div class="col-sm-12">
            <div class="col-sm-8">


                <table class="col-phar-patiedet">
                    <tr>
                        <td>&nbsp;
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-sm-6 regFormLabels">Issued No:</label>

                        </td>
                        <td>
                            <asp:TextBox ID="txtIssueNo" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-sm-6 regFormLabels">Issued To:</label>

                        </td>
                        <td>
                            <asp:TextBox ID="txtIussedTo" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label col-xs-6 regFormLabels">Date:</label>

                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" class="form-control textBoxborder col-sm-6" required runat="server" ValidationGroup="Submit">
                            </asp:TextBox>

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
                                            <asp:Label ID="Label1" runat="server" Text="Medicine"></asp:Label>

                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="Label2" runat="server" Text="Quantity"></asp:Label>

                                        </td>
                                         <td style="text-align: center;">
                                            <asp:Label ID="Label3" runat="server" Text="Medicine Code"></asp:Label>

                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>

                                        </td>


                                    </tr>
                                    
                                    

                                    <tr>
                                        <td >
                                            <input id="txtSearch1" style="width:100%" type="text" placeholder="Medicine"   class="dynamicTd"/>

                                        </td>
                                        <td>
                                            <input id="txtQuantity1" class="dynamicTd" style="width:100%" type="text"  placeholder="Quantity"/>

                                             </td> 
                                        <td> 
                                            <input id="txtCode1"  style="width: 100%" class="dynamicTd " type="text" placeholder="Med Code" />

                                        </td>
                                        <td>
                                            <input id="txtCategory1" style="width: 100%" class="dynamicTd " type="text" placeholder="Category" />

                                             </td>    
                                        
                                        
                                         <td>

                                            <span class="auto-style4">
                                                <input type="button" id="btAdd" onclick="this.style.visibility = 'hidden';" value="+" class="bt" />
                                            </span>

                                        </td> 
                                    </tr>



                                </table>

                                <div id="main">
                                </div>
                            </div>

                        </td>
                    </tr>

                </table>




                <%-- Primary Keys Issue Header and Details --%>
                <asp:HiddenField ID="HiddenFieldIssueID" runat="server" />
                <asp:HiddenField ID="HiddenFieldUniqueID" runat="server" />

                <%-- ClinicID,PrescID Foreign Keys --%>

                <%--  <asp:HiddenField ID="HiddenFieldPrescID" runat="server" />--%>

                <%--<asp:HiddenField ID="HiddenField3" runat="server" />--%>
            </div>
            <div class="col-sm-4">
            </div>
        </div>


    </div>


    <%--Footer Region--%>
    <footer class="footerDiv">


        <table style="width: 100%; height: 100%;">
            <tr>
                <td class="footerMessagesColumn" style="width: 50%;">
                    <div id="Errorbox" style="height: 100%; display: none;" runat="server">
                        <a class="close" data-dismiss="alert">×</a>

                        <div>
                            <strong>
                                <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label>
                            </strong>
                            <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

                        </div>
                    </div>

                </td>
                <td style="height: 100%; width: 20%;"></td>
                <td style="height: 100%; width: 30%;">
                    <table class="footerTable" style="width: 100%; margin-left: 0px; padding-left: 0px; padding-top: 80%; margin-top: 3%;">
                        <tr>
                            <td style="width: 30%;">
                                <div class="form-group">
                                    <asp:Button ID="btnIssue" runat="server" Text="Issue" type="submit" CssClass="button" OnClick="btnIssue_Click" ValidationGroup="Submit" />


                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </table>

                </td>

            </tr>
        </table>



    </footer>




</asp:Content>
