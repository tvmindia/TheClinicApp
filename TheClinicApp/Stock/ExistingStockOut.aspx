<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="ExistingStockOut.aspx.cs" Inherits="TheClinicApp.Stock.ExistingStockOut" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/DeletionConfirmation.js"></script>

    
 <script src="../Scripts/jquery-1.12.0.min.js"></script>
 <link href="../Content/bootstrap.min.css" rel="stylesheet" />
 <script src="../Scripts/jquery-ui.js"></script>
 <link href="../Content/jquery-ui.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        $(document).ready(function () {


           var ac=null;
           ac = <%=listFilter %>;
           $( "#txtSearch" ).autocomplete({
               source: ac
           });
       
        
   

 // ----- * Manages hiddenfield inorder to bind the medicine gridview of parent page * ------//

        if ($('#<%=hdnManageGridBind.ClientID %>').val() == "True"  ) {
            parent.GetMedicines(1);
            $('#<%=hdnManageGridBind.ClientID %>').val('False');
        }

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
                    $(container).append('<table style="width:80%"><tr><td><input id="txtMedname'+iCnt+'" style="width:100%" type="text" class="input" onblur="PopulateTextboxesByMedicineName('+iCnt+')" placeholder="Medicine"/></td><td><input id="txtUnit'+iCnt+'" readonly="true" style="width:100%" class="input " type="text" placeholder="Unit" /></td> <td><input id="txtMedcode'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="MedCOde"/></td><td><input id="txtCategory'+iCnt+'" readonly="true" style="width:100%" type="text" class="input" placeholder="Category"/></td> <td><input id="txtQuantity'+iCnt+'" style="width:100%" type="text" class="input" placeholder="Quantity"/></td><td><input type="button" id="btAdd" value="+" onclick=this.style="visibility:hidden;" class="bt" /></td></tr></table>');

                    // SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
                    //if (iCnt == 1) {
                    //    var divSubmit = $(document.createElement('div'));
                    //    $(divSubmit).append('<input type=button class="bt" ' + 'id=btSubmit value=Submit />');
                    //}
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
                else {
                    $(container).append('<label>Reached the limit</label>');
                    $('#btAdd').attr('class', 'bt-disable');
                    $('#btAdd').attr('disabled', 'disabled');
                }
             
            });
        });


        // PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
        var divValue, values = '';

        function GetTextBoxValues() {
            $(divValue)
                .empty()
                .remove();

            values = '';

            $('.input').each(function () {
                divValue = $(document.createElement('div')).css({
                    padding: '5px', width: '200px'
                });

                var datas = document.getElementById('<%=hdnTextboxValues.ClientID%>');

                values += this.value + '|';
              
                datas.value = values;
               
            });
        }



    </script>
 
    
   


    Issue No :
    <asp:Label ID="lblIssueNo" runat="server" Text=""></asp:Label>
    <br />

    Issued To :
    <asp:Label ID="lblIssuedTo" runat="server" Text=""></asp:Label>
    <br />

    Date :
    <asp:Label ID="lblIssueDate" runat="server" Text=""></asp:Label>
    <br />

     <br />
     <br />
       <table>
        <tr>
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
                                            <input id="txtSearch" tabindex="4" style="width: 100%" type="text" placeholder="Medicine" class="input"  onblur="PopulateTextboxesByMedicineName()" />
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
                                    <asp:HiddenField ID="hdnTextboxValues" runat="server" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </table>

                                <div id="main">
                                </div>
                            </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
    

 <%--<asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />--%>


     <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server" EnableCdn="true"></asp:ScriptManager>

    <script>
        
        function PopulateTextboxesByMedicineName(val) 
        {        
            debugger;
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
                debugger;
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



    <%--<asp:GridView ID="dtgExistingIssueByIssueNo" runat="server" AutoGenerateColumns="False" Style="text-align: center; width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px">
                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                            <Columns>

                                <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImgBtnUpdate" runat="server" ImageUrl="~/Images/Pencil-01.png" CommandName="Comment" CommandArgument='<%# Eval("UniqueID")+"|"+ Eval("IssueID")+"|"+Eval("MedicineID")+"|"+Eval("IssuedTo")+"|"+Eval("IssueNO")+"|"+Eval("Date")+"|"+Eval("Qty")+"|"+Eval("MedCode")+"|"+Eval("MedicineName")+"|"+Eval("CategoryName")%>' OnCommand="ImgBtnUpdate_Command" />


                                </ItemTemplate>

                            </asp:TemplateField>


                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBtnDelete" runat="server" ImageUrl="~/Images/Cancel.png" CommandName="CommentDelete" CommandArgument='<%# Eval("UniqueID")+"|"+Eval("MedicineID")%>' OnClientClick="return ConfirmDelete();"  OnCommand="ImgBtnDelete_Command" />


                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                                 <asp:BoundField DataField="Unit" HeaderText="Unit">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="Qty" HeaderText="Qty">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:BoundField>
                                
                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" BackColor="#0080AA"></EditRowStyle>

                            <FooterStyle BackColor="#0080AA" ForeColor="White" Font-Bold="True"></FooterStyle>

                          
                            <HeaderStyle BackColor="#009933" Font-Bold="True" ForeColor="White"></HeaderStyle>

                            <PagerStyle HorizontalAlign="Center" ForeColor="White" BackColor="#2461BF"></PagerStyle>

                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                        </asp:GridView>--%>

    <asp:HiddenField ID="hdnIssueID" runat="server" />
      <asp:HiddenField ID="hdnManageGridBind" runat="server"  Value="False"/>
   



</asp:Content>
