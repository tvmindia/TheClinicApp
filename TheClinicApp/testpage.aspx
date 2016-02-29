<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="TheClinicApp.testpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <style>
        #custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}
    </style>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
    
<body>
    <form id="form1" runat="server">
    <div>
   <%-- <asp:dropdownlist runat="server" DataSourceID="SqlDataSource1"  ID="dp1"></asp:dropdownlist>--%>

        <div class="container">
	<div class="row">
        <div class="col-md-6">
    		<h2>Custom search field</h2>
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="Buscar" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                           <img src="Images/Search-Find.png" />
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
</div>
    </div>
    </form>
</body>
</html>
