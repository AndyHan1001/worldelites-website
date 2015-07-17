
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<img alt="" src="<%= path %>/fileupload/images/<%= request.getAttribute("logo") %>" width="80" height="40"/>
</div>
<script type="text/javascript">
<%
if("es".equals(request.getAttribute("act")))
{
	%>
	parent.document.getElementById("logo_es").value="<%= request.getAttribute("logo") %>";
	<%
}
else
{
	%>
	parent.document.getElementById("logo").value="<%= request.getAttribute("logo") %>";
	<%
}
%>

</script>

<form action="uploadonepic.html" method="post" name="form1"  enctype="multipart/form-data">
    <input name="uploadFile" id="uploadFile" type="file" style="width:150px" value="浏览">
    <input name="uploadPicName" id="uploadPicName" type="hidden" value="<%= request.getAttribute("logo") %>">
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
</script>

</body>
</html>