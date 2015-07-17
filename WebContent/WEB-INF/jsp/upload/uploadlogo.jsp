<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome</title>

</head>
<body style="margin: 0px">

<div style="height:50px;width:100px;">

</div>
<c:if test="${sessionScope.logo!=null}">

 
	<div class="picUpafter">
    	<div class="picUpImg"><img src="<%=path %>/fileupload/images/${sessionScope.logo}" width="75" height="75" /></div>
     </div>


	
</c:if>
<form action="uploadonepic.html" method="post" name="form1"  enctype="multipart/form-data">
	<input name="act" id="act" value="${act}" type="hidden" />
    <input name="uploadFile" id="uploadFile" type="file" style="width:150px" value="浏览">
    <input name="uploadPicName" id="uploadPicName" type="hidden" value="">
    <input type="button" name="Submit" onclick="saveok()" value="上传" style="width:50px;font:9pt">
</form>

<script type="text/javascript">
function saveok(){
	if(document.getElementById("uploadFile").value==""){
		alert("请选择文件!");
		return false;
	}else{
		document.form1.submit();
		return false;
	}

}

var d=new Date();
var s=d.getYear()+d.getMonth()+d.getDay()+d.getTime()+Math.floor(Math.random()*1000)+".jpg";
document.getElementById("uploadPicName").value=s;


var upic=document.getElementById("uploadPicName").value;




</script>
</body>
</html>