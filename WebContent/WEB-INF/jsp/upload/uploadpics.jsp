<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome</title>
</head>
<body style="margin: 0px">
<span style="display:none">
<img src="<%=path %>/resources/images/picUpbefor.png" />
<img src="<%=path %>/resources/images/picUping.png" />
<img src="<%=path %>/resources/images/picUpDel.png" />
</span>
<style type="text/css">
body{background-color:#ffffff; margin:0; padding:0}

/*================发图=======================*/
.picUpbefor{float:left; width:75px; height:75px; background-image:url(<%=path %>/resources/images/picUpbefor.png);}
.picUping{float:left; width:75px; height:75px; background-image:url(<%=path %>/resources/images/picUping.png);}
.picUpafter{float:left; width:100px; height:85px;}
.picUpImg{float:left; width:80px; height:75px;}
.picUpDel{float:left; width:18px; height:75px;}

</style>
<script language="javascript">
	var sessionScopeLength=0;
</script>

	<script language="javascript">

		 parent.document.getElementById("defpicList").value="";
		 parent.document.getElementById("defpicList_es").value="";
	
	
	</script>
	
	
<c:if test="${sessionScope.ufn!=null}">

    <c:forEach var="u" items="${sessionScope.ufn}">

	<div class="picUpafter">
    	<div class="picUpImg"><img src="<%=path %>/fileupload/images/${u}" width="75" height="75" /></div>
        <div class="picUpDel" onclick="delPic('${u}')"><img src="<%=path %>/resources/images/picUpDel.png" /></div>
    </div>

	<script language="javascript">
        sessionScopeLength+=1;
    </script>
    </c:forEach>
	<script language="javascript">

	if(sessionScopeLength>0)
	{
		parent.document.getElementById("defpic").value="${sessionScope.ufn[0]}";
		var defStr="";
		var defStr2="";
		<c:forEach var="u" items="${sessionScope.ufn}">
			
			defStr=defStr+'${u},';
			
		</c:forEach>
<%-- 		var arDef=defStr.split(",");
		for(var i=0;i<arDef.length;i++)
			{
			if(arDef[i]!="<%=path %>/fileupload/images/")
				defStr2=defStr2+arDef[i]+",";
			}
		defStr=defStr2; --%>
		parent.document.getElementById("defpicList").value=defStr;
		parent.document.getElementById("defpicList_es").value=defStr;
	}
	
	</script>
</c:if>

<div class="picUpafter">
<form action="uploadp.html" method="post" name="form1" id="form1"  enctype="multipart/form-data">
    <input name="uploadPicName" id="uploadPicName" value="" type="hidden">
    <input name="act" id="act" value="add" type="hidden">
	<div id="maskUpload" class="picUpbefor">
	<input name="uploadFile" type="file" id="uploadFile" style="z-index:200; 
	width:75px; height:75px;opacity:0;filter:alpha(opacity=0);-ms-filter:'alpha(opacity=0)';"
	 accept="image/*" single onchange="upMypic()" />
	</div>
</form>
</div>

</body>
</html>
<script language="javascript">
function delPic(u)
{
	document.getElementById("uploadPicName").value=u;
	document.getElementById("act").value="del"
	document.getElementById('form1').submit();
}
function upMypic()
{
	document.getElementById("maskUpload").className="picUping";
	var d=new Date();
	var s=d.getYear()+d.getMonth()+d.getDay()+d.getTime()+Math.floor(Math.random()*1000)+".jpg";
	document.getElementById("uploadPicName").value=s;
	document.getElementById('form1').submit();
}
</script>
