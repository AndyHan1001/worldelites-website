<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	<c:if test="${sessionScope.chl=='coupon'}">
	parent.document.getElementById("coupon").value="${fileName }";
	</c:if>
	<c:if test="${sessionScope.chl=='f1'}">
	parent.document.getElementById("f1").value="${fileName }";
	</c:if>
	<c:if test="${sessionScope.chl=='f2'}">
	parent.document.getElementById("f2").value="${fileName }";
	</c:if>
	<c:if test="${sessionScope.chl=='f3'}">
	parent.document.getElementById("f3").value="${fileName }";
	</c:if>
	<c:if test="${sessionScope.chl=='f4'}">
	parent.document.getElementById("f4").value="${fileName }";
	</c:if>
	<c:if test="${sessionScope.chl=='f5'}">
	parent.document.getElementById("f5").value="${fileName }";
	</c:if>
	<%session.setAttribute("chl", ""); %>
</script>
${fileName}
</body>
</html>