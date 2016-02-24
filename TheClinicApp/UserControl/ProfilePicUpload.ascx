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
<%--<div class="fileinputs">
	<input type="file" class="file" runat="server"/>
	<div class="fakefile">		
		<img src="../Images/UploadPic.png" style="width:30%;height:30%" />
	</div>
</div>
<div class="fileinputs" >
 <input type="file" id="fileupload" class="file"/>
 <div class="fakefile">  
  <img src="../Images/UploadPic.png" style="width:60%;height:60%" OnClick="document.getElementById('fileupload').click()" />
 </div>
</div>--%>
<div id="avaterContainer">
		<div class="fileinput-button sprites avatar-placeholder-large enabled" id="AvatarUploader" data-bind="cssClass: { enabled: enable }">
			<div class="Avatar medium upload-preview" data-bind="visible: avatarSelectedForUpload"><canvas width="58" height="58"></canvas></div>
			<img class="Avatar medium" style="display: none;" data-bind="invisible: avatarSelectedForUpload, image: { src: currentAvatarUrl }">
			<input name="avatarFile" title="Change your profile picture" type="file" accept="image/gif,image/png,image/jpeg" data-bind="visible: enable">
		</div>
	</div>
