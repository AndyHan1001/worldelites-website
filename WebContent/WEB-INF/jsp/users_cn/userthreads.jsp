<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>


<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

</div>

<div class="clearDiv2"></div>


<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>我的账户</p>
                </div>
                <div class="dplMain">
                    <ul>
                        <li class="nowHover"><a href="userinfo.html" >我的信息</a></li>
                        <!--<li class="nowHover"><a href="userthreads.html" >My Blog</a></li>-->
                        <li class="nowHover"><a href="userapartments.html" >我收藏的公寓</a></li>
                        <li class="nowHover"><a href="usercoupon.html" >我的WE Coupon</a></li>                        
                        <li class="nowHover_no"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><p>My Blog</p></h4>
            <div class="myThreads">
            			<c:forEach var="item" items="${threadlist}">
                        <dl>
                            <dd class="logo"><a href="../bbs/bbsshow.html?id=${item.id}"><img src="images/t.jpg"  /></a></d>
                            <dd class="title"><a href="../bbs/bbsshow.html?id=${item.id}">${item.title}</a></dd>
                            <dd class="control">${item.comment}/${item.visit}</dd>
                        </dl>
                        </c:forEach>
                 <div class="bbsPage">
           		 <c:out value="${pageindex}"></c:out>/<c:out value="${countpageno }">
           		 </c:out>   &nbsp;&nbsp;&nbsp; <a href="userthreads.html?act=prev&pageindex=${pageindex}">Prev</a>
           		 &nbsp;&nbsp;&nbsp; <a href="userthreads.html?act=next&pageindex=${pageindex}">Next</a>
            </div>
            </div>            
			
        </div>
    </div>
</div>


<%@include file="../footer.jsp" %>