<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>


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
                        <li class="nowHover"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><span style="color:blue;font-size:16px">Welcome,  ${sessionScope.fuser.name} ${sessionScope.fuser.lastname}</span></h4>
			<div class="myThreads">
				${others.content}
            </div>
			
        </div>
    </div>
</div>


<%@include file="../others/footer.jsp" %>