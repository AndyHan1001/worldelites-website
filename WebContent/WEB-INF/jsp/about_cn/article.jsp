<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>

<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>
    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>关于WE</p>
                  
                </div>
                <div class="dplMain">
                    <ul>
                    <c:forEach items="${articlelist}" var="item">
                         <c:choose>
	                    	<c:when test="${item.id==classid}">
	                    		<li style="float:left;background-color:#FFF; background-image:url(<%=path2 %>/resources/web/images/arrow_y.png); background-repeat:no-repeat;"><a href="article.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    	<c:when test="${item.id!=classid}">
	                    		<li><a href="article.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    </c:choose>
                    </c:forEach>                        
                    </ul>
                </div>
            </div>
            
            <div class="clearDiv"></div>
            
        </div>
        <div class="MainRight">
        	${articleonecontent[0].content}
        </div>
    </div>
</div>

<%@include file="../others/footer.jsp" %>