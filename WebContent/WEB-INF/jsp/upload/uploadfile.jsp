<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome</title>
<script type="text/javascript">
function saveok(){
	if(document.getElementById("uploadFile").value==""){
		alert("Please Select Some File To Upload!");
		return false;
	}
}
</script>
</head>
<body style="margin: 0px">
<form action="uploadf.html" method="post" name="form1"  enctype="multipart/form-data" onSubmit="return saveok()">
    <input name="uploadFile" id="uploadFile" type="file" style="width:150px" value="浏览">
    <input name="chl" id="chl" value="${chl}" />
    <input type="submit" name="Submit" value="上传" style="border:1px double rgb(88,88,88);font:9pt">
</form>
</body>
</html>