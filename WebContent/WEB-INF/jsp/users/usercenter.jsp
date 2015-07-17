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
                    <p>My Account</p>
                </div>
                <div class="dplMain">
                    <ul>
                        <li class="nowHover"><a href="userinfo.html" >My Profile</a></li>
                        <li class="nowHover"><a href="userapartments.html" >My Favorite</a></li>
                        <li class="nowHover"><a href="usercoupon.html" >My Coupon</a></li>                        
                        <li class="nowHover"><a href="userorder.html" >My Bookings</a></li>
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


<%@include file="../footer.jsp" %>