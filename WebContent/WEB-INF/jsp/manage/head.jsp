<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1">
    <title>后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/demo/demo.css">
	<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/easyui136/locale/easyui-lang-zh_CN.js"></script>  

    <link rel="stylesheet" href="<%=path %>/resources/kindeditor41/themes/default/default.css" />
    <link rel="stylesheet" href="<%=path %>/resources/kindeditor41/plugins/code/prettify.css" />
    <script type="text/javascript" charset="utf-8" src="<%=path %>/resources/kindeditor41/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/resources/kindeditor41/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/resources/kindeditor41/plugins/code/prettify.js"></script>
<script type="text/javascript">

function formatterisdel(target, container, frozen){
	if(target == 0)
		return "否";
	else
		return "是";
}
function formatterstate(target, container, frozen){
	if(target == 0)
		return "未阅读";
	else
		return "已阅读";
}

//格式化日期,
function formatterdate(target, container, frozen){
	var year = target.year + 1900;
	var month = target.month + 1;
	var day = target.date;
	return year+"年"+month+"月"+day+"日";
} 

function formatterHeight(target, container, frozen){
	 if (container > 100){
         return 'height:300px;color:red;';
     } 
} 

$.extend($.fn.validatebox.defaults.rules,{
	   TimeCheck:{
	    validator:function(value,param){    
	     var s = $("input[name="+param[0]+"]").val();
	     //因为日期是统一格式的所以可以直接比较字符串 否则需要Date.parse(_date)转换
	     return value>=s;
	    },
	    message:'非法数据'
	   },
	   passport: {
	        validator: function (value, param) {
	        	
	            return /^[\u0391-\uFFE5\w]+$/.test(value)&&value.length<21;
	        },
	        message: '登录名称只允许汉字、英文字母、<br>数字及下划线且长度小于20。'
	    },
	    safepass: {
	        validator: function (value, param) {
	            return safePassword(value)&&value.length<21;
	        },
	        message: '密码由字母和数字组成，至少6位'
	    }
	   
});
var safePassword = function (value) {
    return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
}

</script>
</head>