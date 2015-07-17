<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>

<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>
    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft_joinus">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>Join WE Team</p>
                    
                </div>
                <div class="dplMain">
                    <ul>
                    <c:forEach items="${joinuslist}" var="item">
	                    <c:choose>
	                    	<c:when test="${item.id==classid}">
	                    		<li style="float:left;background-color:#FFF; background-image:url(<%=path2 %>/resources/web/images/arrow_y.png); background-repeat:no-repeat;"><a href="joinus.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    	<c:when test="${item.id!=classid}">
	                    		<li><a href="joinus.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    </c:choose>
                        
                    </c:forEach>
                    
                    </ul>
                </div>
            </div>
            
            <div class="clearDiv"></div>
            
        </div>
        <div class="MainRight_joinus">
        	${joinusonecontent[0].content}
        	<c:forEach var="item5" items="${othersarticle}">
        		<c:if test="${joinusonecontent[0].title=='Job/Apply'}">
        		<p class="vv1"><a href="<%=path %>/about/joinsshow.html?id=${joinusonecontent[0].id}&articleid=${item5.id}">${item5.title}</a></p>
        		<p class="vv2">${item5.author}</p>
        		</c:if>
        	</c:forEach>
        	
        </div>
    </div>
</div>

<%@include file="../footer.jsp" %>