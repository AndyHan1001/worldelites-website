<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html manifest="/misc/wei_cache.manifest" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form action="uploadFile.html" method="post" name="form1" id="form1"  enctype="multipart/form-data">
    <input name="uploadPicName" id="uploadPicName" value="" type="hidden">
    <input name="act" id="act" value="add" type="hidden">
	<div id="maskUpload" class="picUpbefor">
	<input name="uploadFile" type="file" id="uploadFile" style="z-index:200; width:75px; height:75px;opacity:0;filter:alpha(opacity=0);-ms-filter:'alpha(opacity=0)';" accept="image/*" single onchange="upMypic()" />
	</div>
</form>
</div>


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
</body>
</html>