<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Input.Master" AutoEventWireup="true" CodeBehind="Tokens.aspx.cs" Inherits="TheClinicApp.Token.Tokens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
   
    <link href="../Content/Input.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <div class="container bodyBackground" style="width:100%;">

        <div class="col-md-12 Span-One">
                    <div class="col-md-9" >
                        <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                 
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

                                        <asp:TextBox ID="TextBox1" placeholder="search patient" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="TextBox2" placeholder="select doctor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-4">           
                                <div class="col-md-12">                 
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/search-64.png" />
                                </div>
                            </div>
                        </div>

                          <div class="col-md-12 Span-One">
                            <div class="col-md-8">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                 
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
                            <div class="col-md-10">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                       
                                        <label class="control-label col-md-8" >Patient Details</label>
                 
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-2">           
                                <div class="col-md-12">                 
                                      
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >File:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> #3598</label>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Name:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label > name</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Age:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> 23</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Phone:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label>5936434</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 Span-One">
                            <div class="col-md-4">
                                <div class="form-group">
                   
                                    <div class="col-md-12">
                                                                                                
                                          <label class="control-label col-md-1 regFormLabels"  >Gender:</label>
                                                                                                
                                    </div>
                                </div>
                           
                            </div>
                             <div class="col-md-8">           
                                <div class="col-md-12">                 
                                     <label> Male</label>
                                </div>
                            </div>
                        </div>


                    </div>
                    
                    <div class="col-md-3">
                         <div  > 

                             <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                      


                         </div>
                    </div>

      </div>

    </div>
</asp:Content>
