<%@page import="util.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>
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
                        <li class="nowHover"><a href="usercoupon.html" >我的WE Coupon</a></li>                        
                        <li id="hoverNew"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><p>我的订单</p></h4>
			<div class="myThreads">
				<c:forEach var="item" items="${orderlist}">
				  <table width="800" style="border:4px solid #AAC22C; margin-bottom:15px;">
				  	<tr><td colspan="5" height="8"></td></tr>
				    <tr>
				      <td colspan="3">&nbsp;&nbsp;Order : <a href="javascript:void(0)">${item.orderid}</a></td>
				      <td colspan="2">Application Time : <a href="javascript:void(0)">${fn:substring(item.submittime,0,10)}</a></td>
			        </tr>
			        <tr>
			        	<td colspan="5" style="height:5px;">&nbsp;</td>
			        </tr>
				    <tr class="clocr0CC">
				      <td height="85" rowspan="3">&nbsp;<a target="_blank" href="<%=path %>/university_cn/${item.schoolname}/${fn:replace(item.apartmentname,' ','_')}"> 
				      																	<img src="<%=path %>/fileupload/images/${item.logo}" width="120" height="80" /></a></td>
				      <td>Apartment Name</td>
				      <td colspan="3" ><a href="<%=path %>/university_cn/${item.schoolname}/${fn:replace(item.apartmentname,' ','_')}"  target="_blank">${item.apartmentname}</a></td>
			        </tr>
				    <tr class="clocr0CC">
				      <td>Room Name</td>
				      <td colspan="3"><a href="<%=path %>/university_cn/${item.schoolname}/${fn:replace(item.apartmentname,' ','_')}" target="_blank">${item.roomname}</a></td>
			        </tr>
				    <tr class="clocr0CC ak47" style="border-bottom:2px solid #AAC22C;">
				      <td>Booking Status</td>
				      <td class="clocr0CC"><a href="#" >${item.state}</a></td>
				      <td>&nbsp;</td>
				        <td align="right">
				        <a style="display:block;width:100px;background:#AAC22C;padding:5px;border-radius:5px;-moz-border-radius:5px;color:white;cursor:pointer;margin-right:15px; " 
				        href="<%=path %>/order/order_vuserinfo.html?roomid=${item.roomid}&apartmentid=${item.apartmentid}&enterlomg=">View Details</a></td>
			        </tr>
			        <tr  class="" id="">
			        	<td colspan="5"  style="width:750px;padding:10px;word-break:break-all;font-family: '微软雅黑'">
			        		
			        		<b style="color:#F5AB00;word-break:break-word">${item.statenote}</b>
			        		<c:if test="${item.state=='Online Payment'}">
			        			<a href="<%=path %>/pay/payOrder.html?orderId=${item.id}&url=<%= Constants.PAY_URL %>" 
			        			style="background:orange;border:none;border-radius:3px;width:104px;text-align:center;line-height:19px;height:19px;padding:3px;color:#FFF;cursor:pointer;float:right;margin-right:5px;"><b>Pay Now</b></a> 
			        		</c:if>
			        		<br />
			        		<c:if test="${item.state=='Online Payment'}">
			        			${item.pricenote}<br />
			        		</c:if>
			        	</td>
			        </tr>
			        <tr>
			        	<td colspan="5"  style="" height="3"></td>
			        </tr>
			      </table>
				  <div style="height:8px;"></div>
   		    </c:forEach>
         		
         		<script type="text/javascript">
         		
         			function deleteOrder(v){
         				$.get("deleteoneorder.html",{id:v},function(data){
         					if(data=='1'){
         						alert('success')
         					}else{
         						alert('error');
         					}		
         				},"text");			
      				};
      				
      				function goToPay(orderId){
      					$.ajax({
						    url: '<%=path %>/pay/payOrder.html',
						    data:{orderId:orderId},
						    type: "POST",
						    dataType: "text",
						    success: function (date) {
						    },
						    error:function(){
						    	alert("error");
						    }
						});     
      				}
         		</script>
            </div>
			
        </div>
    </div>
</div>


<%@include file="../others/footer.jsp" %>