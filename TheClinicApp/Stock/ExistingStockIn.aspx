<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="ExistingStockIn.aspx.cs" Inherits="TheClinicApp.Stock.ExistingStockIn" %>

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

             
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            
    <div class="container-fluid bodyDiv">
        <label class="headingLabel">Stocks-Existing Details</label>
        <div class="col-sm-12 Span-One ">

          


                              
            <div class="col-xs-6  ">

                
                if(iCnt==1)
                {
                    $(container).append('<table style="width:80%"><tr><td><label >Medicine Name</label></td><td ><label >Unit</label></td><td ><label >Medicine Code</label></td><td ><label >Cateorgy</label></td><td ><label >Quantity</label></td></tr> </table>');
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" style="visibility:hidden;" class="bt" /></td><td> <input type="button" id="btRemove" class="bt1" value="-" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                }
                else  if (iCnt==hidCount)
                {
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td><td> <input type="button" id="btRemove" class="bt1" value="-" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                }
                <div class="col-md-12">
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br />
                                <label class="control-label col-xs-12 regFormLabels">Bill Number:</label>

                else 
                {
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'" value="+" onclick=this.style="visibility:hidden;" style="visibility:hidden;" class="bt" /></td><td> <input type="button" id="btRemove" class="bt1" value="-" /></td><td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-12">
                            <br />
                  
                              <asp:Label ID="lblBillNo" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
             
                   <div class="col-md-12">
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br />
                                <label class="control-label col-xs-12 regFormLabels">Date:</label>

                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-12">
                            <br />
                               <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>


                   <div class="col-md-12">
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br />
                                <label class="control-label col-xs-12 regFormLabels">Reference No:</label>

            }

            //icnt value will be reset by reducing 1 after for loop 
            iCnt=iCnt-1;

            BindDataFromXml();

            //remove click
            //Removing Div on btRemove button click
            $("body").on("click", "#btRemove", function () {
                debugger;


                if (iCnt > 1) 
                {
                    var ID=$(this).closest("hidden").value;
                    $(this).closest("div").remove();

                    if ($('#btAdd' + (iCnt) + '').css('visibility') == 'visible')
                    {
                        debugger;
                        alert(0010);
                        //Nothing doing
                    }
                    else 
                    {

                        $('#btAdd' + (iCnt - 1) + '').css('visibility', 'visible')


                        //iCnt = iCnt - 1;

                    }
                   
                }

            });




           
            //button click

            $('body').on('click', '.bt', function () 
            {
                //debugger;
                      
                if (iCnt <= 19)
                {
                    iCnt = iCnt + 1;
                       
                    // ADDING  TEXTBOX CONTROLS
                       
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedicine'+iCnt+'" style="width:100%" type="text" class="input" onblur="BindControlsByMedicneName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtCode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd'+iCnt+'"  onclick=this.style="visibility:hidden;"  value="+" class="bt" /><td><td> <input type="button" id="btRemove" class="bt1" value="-" /></td><input id="HiddenReceiptID'+iCnt+'" type="hidden" /></td></tr></table>');

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
                        $('.bt').attr('class', 'bt-disable');
                        $('.bt').attr('disabled', 'disabled');
                    }

 
        
              
            </div>

            <div class="col-xs-6  ">
            </div>

        </div>


        <div class="col-sm-12 Span-One ">
            <br />
        </div>
            
        <div class="col-sm-12 Span-One ">


            <asp:GridView ID="GridViewReceiptDT" runat="server" AutoGenerateColumns="False">
                <Columns>

                    <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                    <asp:BoundField DataField="Unit" HeaderText="Unit" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity"  />

    


                </Columns>
            </asp:GridView>
            
            </div>
        </div>



</asp:Content>
