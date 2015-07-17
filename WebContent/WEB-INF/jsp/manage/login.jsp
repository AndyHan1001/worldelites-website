<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/demo/demo.css">
<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.easyui.min.js"></script>
 <link href="<%=path %>/resources/web/back/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/resources/web/back/css/login.css" rel="stylesheet" type="text/css">
    
<script type="text/javascript" language="javascript" >
	$(function(){
	$("#sub").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
		$.post("check.html",{"mail":username,"password":password},function(data,state){
			if(data=='err'){
				alert("账号或密码有误！");
			}
			if(data!="")
			$("#message").css("display","block");
			else
				window.open("index.html","_self");
		});
	});
});
</script>
</head>
<body>

<div class="login">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input class="text_value" value="" name="username" type="text" id="username">
            <input class="text_value" value="" name="password" type="password" id="password">
        </div>
        <button class="button" id="sub" type="type">登录</button>
    </div>
    
    <div id="tip"></div>
    <div class="foot">
	Copyright &copy; 2015.Company ZhongQiDongLi All rights reserved.
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
    </div>
</div>
<script src="<%=path %>/resources/web/back/ui/do.js"></script>
<script src="<%=path %>/resources/web/back/ui/config.js"></script>

</body>
</html>