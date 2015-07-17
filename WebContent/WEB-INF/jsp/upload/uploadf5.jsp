<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="font-size:13px;">

<script type="text/javascript">
	function shuaxin(){
		parent.document.getElementById("ff5").src=parent.document.getElementById("ff5").src;
		parent.document.getElementById("f5").value="";
	}
</script>

<script type="text/javascript">
	if("${fileName}"=="long"){
		alert("The file is too large!");
		shuaxin();
	}else if("${fileName}"=="type"){
		alert("Format not supported!");
		shuaxin();
	}
	parent.document.getElementById("f5").value="${fileName}";
</script>
<span style="float:left">
<c:if test="${fn:length(fileOldName)>13}">
	<c:set value="${fn:split(fileOldName,'.')}" var="exp"></c:set>
	<c:forEach items="${exp}" var="item">
		<c:set value="${item}" var="expt"></c:set>
	</c:forEach>
	${fn:substring(fileOldName,0,13)}.. .${expt}
</c:if>
<c:if test="${fn:length(fileOldName)<=13}">${fileOldName}</c:if>
&nbsp;
</span>
<input type="button" onclick="shuaxin()"  style="float:left;width:60px;height:20px;border:1px double rgb(88,88,88);font:9pt;background:;margin-top:-2px;text-align:center;color:#111" value="Delete" />
</body>


</html>