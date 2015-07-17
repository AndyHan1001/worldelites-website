<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>

<div class="FrameAbout">
	<div class="BigTT" style="font-family:'微软雅黑','Times New Roman', Times, serif;">${fn:substring(threadonebbs.title,0,40)}</div>

    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div style="width:100%; clear:both; margin:0 auto; background-color:#f8f8f8; height:30px; margin-top:1px;">
	<div style="width:1120px; margin:0 auto; margin-top:5px;  font-size:14px; color:#999;">
    	<div style="float:left; width:100px;"><p onClick="javascript:window.location.href='bbs.html';" style="cursor:pointer;">  <img src="<%= path2 %>/resources/web/images/back.jpg" align="absmiddle">[BACK]</p></div>

        <div style="float:left">
        					<c:if test="${schoolTag!=null}">
                            <div class="bbstag"><a title="${schoolTag.name}" href="bbs.html?universityid=${schoolTag.id}&amp;tagid=${threadTag.id}">${schoolTag.name}</a></div>
                            </c:if>
        					<c:if test="${threadTag!=null}">
                            <div class="bbstag"><a title="${threadTag.name}" href="bbs.html?universityid=${schoolTag.id}&amp;tagid=${threadTag.id}">${threadTag.name}</a></div>
                            </c:if>
        </div>
    </div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain" style="word-wrap:break-word; word-break:normal; min-height:300px; line-height:1.5">
        	${threadonebbs.content}
    </div>
</div>

<%@include file="../others/footer.jsp" %>