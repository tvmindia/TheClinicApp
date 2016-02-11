<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfilePicUpload.ascx.cs" Inherits="TheClinicApp.UserControl.ProfilePicUpload" %>
<style>
div.fileinputs {
 position: relative;
}

div.fakefile {
 position: absolute;
 top: 0px;
 left: 0px;
 z-index: 1;
}

input.file {
 position: relative;
 text-align: right;
 -moz-opacity:0 ;
 filter:alpha(opacity: 0);
 opacity: 0;
 z-index: 2;
    
}
    </style>



<div class="fileinputs" >
 <input type="file" id="fileupload" class="file" />
 <div class="fakefile">  
  <img src="../Images/icon-user-default.jpg" style="width:60%;height:60%" onclick="document.getElementById('fileupload').click()" />
 </div>
</div>
