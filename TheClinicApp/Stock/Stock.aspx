<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="TheClinicApp.Stock.Stock" %>
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


  
    <div class="container-fluid bodyDiv" >
        <label class="headingLabel">Stocks</label>
        <div class="col-sm-12 Span-One ">

            <%-- center Block --%>
            <div class="col-xs-7">              
            
                 <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>

                 <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                          &nbsp
                  
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                     &nbsp
                                </div>
                            </div>
                        </div>
                
                <%--  --%>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Unit:</label>
                                                        
                            <div class="col-xs-8">
                                <asp:TextBox ID="txtUnit" class="form-control textBoxborder" required runat="server" ValidationGroup="Submit" >

                                </asp:TextBox>

                            </div>
                        </div>
                     </div>
                     <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                     </div>
                   

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Quantity:</label>

                            
                            <div class="col-xs-8">
                                <asp:TextBox ID="txtQty" class="form-control textBoxborder" required runat="server"  ValidationGroup="Submit">

                                </asp:TextBox>

                            </div>
                        </div>
                      </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                   

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Reference/Bill No:</label>





                            <div class="col-xs-8">
                             
                                <asp:TextBox ID="txtReference" class="form-control textBoxborder numberTypeTextBox" runat="server" required  ValidationGroup="Submit"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                    

                </div>

                <%--  --%>

               <label  class="subheadingLabel " >Existing Details</label>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Unit:</label>
                            
                            <div class="col-xs-8">
                                 

                            </div>
                             </div>

                        </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                       
                    </div>

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Quantity:</label>

                            
                            <div class="col-xs-8">
                             

                            </div>
                        </div>
                    </div>
                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                   

                </div>

                <div class="col-xs-12 Span-One">
                    <div class="col-xs-11">
                        <div class="form-group">
                            <label class="control-label col-xs-4 regFormLabels">Last Updated:</label>

                            <div class="col-xs-8">
                             
                               
                            </div>
                        </div>
                       </div>

                        <div class="col-xs-1">
                            <div class="col-xs-12">
                                &nbsp
                            </div>
                        </div>
                   
                </div>
           


                 </div>
           

            <%--OUT OF STOCK/LESS STOCK LIST Block --%>

            <div class="col-xs-5" style="height:350px;width:30%;" >
                <div >
                     <label  class="subheadingLabel " >OUT OF STOCK/LESS STOCK LIST </label>

                   <div class="rounded_corners"  style="width: 400px">

                       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                           <ContentTemplate>
                               <asp:GridView ID="GridViewOutofStock" runat="server" AutoGenerateColumns="False">

                                   <Columns>
                                       <asp:BoundField DataField="MedicineID" HeaderText="MedicineID" />
                                       <asp:BoundField DataField="Name" HeaderText="Medicine Name" />
                                       <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                       <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                                       <asp:BoundField DataField="ReOrderQty" HeaderText="ReOrder Quantity" />
                                   </Columns>

                               </asp:GridView>

                           </ContentTemplate>
                       </asp:UpdatePanel>

                   </div> 
                    
                </div>               
                 <div >

                     <div>  <a href="#" >External Iusse </a> </div>
                     <div><a href="#" >View All Items </a> </div>
                     <div><a href="#" >Usage (Receive/Issue Detail) </a></div>
                          
                     
                 </div>    
            </div>
       


        </div>
       
    </div>    

    <%-- Footer Region --%>
     <footer  class="footerDiv">
         

                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td class="footerMessagesColumn" style="width:50%; ">
                            <div id="Errorbox"  style="height:100%;  display:none;"  runat="server" >
                               <a class="close" data-dismiss="alert">×</a>  

                            <div>
                            <strong> <asp:Label ID="lblErrorCaption" runat="server" Text=""></asp:Label> </strong>      <asp:Label ID="lblMsgges" runat="server" Text=""></asp:Label>

</div>
       </div>                     

                        </td>
                        <td style="height: 100%;   width:20%;">

                        </td>
                        <td style="height: 100%;   width:30%;" >
                            <table class="footerTable" style="width:100%; margin-left:0px;padding-left:0px;padding-top:80%; margin-top:3%;  ">
                                <tr>
                                    <td style="width:30%;">
                                         <div class="form-group">
                                        <%--<asp:Button ID="btnSave" runat="server" Text="ADD STOCK"  type="submit" CssClass="button  " OnClick="" ValidationGroup="Submit" />--%>

                                         </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>

                        </td>

                    </tr>
                </table>


            
        </footer>




    
</asp:Content>
