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

                
                <div class="col-md-12">
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br />
                                <label class="control-label col-xs-12 regFormLabels">Bill Number:</label>
                                
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
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-12">
                            <br />
                               <asp:Label ID="lblRefNo2" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

              
             

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
