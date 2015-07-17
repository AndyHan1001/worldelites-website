<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>
<%
	Date date=new Date();
%>
<style type="text/css">
	.clocr0CC td{color:#30849B};
	 td a{color:#30849B};
	 .eee{position: relative;}
	.eee div{border:1px solid #000;cursor:pointer;text-align:center;line-height:20px;height:20px;}
</style>
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
                        <li  id="hoverNew"><a href="usercoupon.html" >我的WE Coupon</a></li>                        
                        <li class="nowHover"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><p>我的WE Coupon</p></h4>
				<c:forEach var="item" items="${mycouponlist}">
				<table width="800" style="border-bottom:4px solid #AAC22C; margin-bottom:15px;">
				  <tr>
				    <td colspan="5">Coupon : i${item.coupon.id}u${item.coupon.userid}a${item.coupon.apartmentid}</td>
				  </tr>
				  <tr class="clocr0CC">
				    <td height="85" rowspan="2"><a href="<%=path %>/university_cn/${item.coupon.schoolname}/${fn:replace(item.coupon.apartmentname,' ','_')}">
				    	<img src="<%=path %>/fileupload/images/${item.coupon.logo}" width="120" height="80"></a> </td>
				    <td height="40"><span left-pos="0|12" right-pos="0|12" space="">Application Time</span></td>
				    <td>${fn:substring(item.coupon.ctime,0,10)}</td>
				    <td>Apartment Name</td>
				    <td><a href="<%=path %>/university_cn/${item.coupon.schoolname}/${fn:replace(item.coupon.apartmentname,' ','_')}">${item.coupon.apartmentname}</a></td>
			      </tr>
				  <tr height="10" >
				    <td height="40">Status</td>
				    <td><span style="color:#00AFEF">
				      <c:if test="${item.flag==true}">active</c:if>
                      <c:if test="${item.flag==false}">expired</c:if>
				    </span></td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
			      </tr>
				  <c:set var="timee" value="<%=date%>"></c:set>
				  </table>
				<div style="height:10px;"></div>
            	</c:forEach>
        </div>
    </div>
</div>

<%@include file="../others/footer.jsp" %>