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

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order" style="width:100%">
    		<div id="">
            <div class="order_percent">
                <img src="<%= path2 %>/resources/web/images/jindu2.jpg" />
            </div>
            <div class="order_title">
                2：Estimated Cost
            </div>
            <form action="order_userinfo.html?roomid=${roomid}&apartmentid=${apartmentid}&enterlong=${enterlong}" method="post" name="form1">
            	
            	
            </form>
            <div class="order_content3">
              <table border="0" align="center" cellpadding="0" cellspacing="5" class="TableInit">
                <tr >
                  <td width="300" style="border:none">&nbsp;</td>
                  <td width="300" style="border:none">&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">Monthly Rent：</td>
                  <td align="left">
                  	<c:if test="${oneapartment.discounttype=='1'}"> <del> <c:if test="${oneroom.price!=''&&oneroom.price!=null}">$${oneroom.price}</c:if></del></c:if>&nbsp;&nbsp;&nbsp;
                  	<b ><c:if test="${oneroom.discountprice==''||oneroom.discountprice==null}">&nbsp;</c:if>
                  				<c:if test="${oneroom.discountprice!=''&&oneroom.discountprice!=null}">$${oneroom.discountprice}</c:if></b>
                  </td><!-- 一个房间的折扣  租金 -->
                </tr>
                <tr>
                  <td align="right">WE saving：</td>
                  <td align="left">${oneroom.discount}</td><!-- 一个房间的折扣描述 -->
                </tr>
                <tr>
                  <td align="right">Leasing Term：</td>
                  <td align="left">12 Months</td><!-- 一个房间的租期 -->
                </tr>
                <tr>
                  <td align="right">Application Fee：</td>
                  <td align="left">
						<c:choose>
                  			<c:when test="${oneapartment.applicationfee==null||oneapartment.applicationfee==''}">$0</c:when>
                  			<c:otherwise>$${oneapartment.applicationfee}</c:otherwise>
                  		</c:choose>
				</td><!-- 一个公寓的申请费 -->
                </tr>
                <tr>
                  <td align="right">Activity Fee：</td><!-- 一个公寓的活动费 -->
                  <td align="left">
                  		<c:choose>
                  			<c:when test="${oneapartment.activityfee==null||oneapartment.activityfee==''}">$0</c:when>
                  			<c:otherwise>$${oneapartment.activityfee}</c:otherwise>
                  		</c:choose>
                  </td>
                </tr>
                <tr>
                  <td align="right">Management Fee：</td><!-- 一个公寓的管理费 -->
                  <td align="left">
                  		<c:choose>
                  			<c:when test="${oneapartment.managementfee==null||oneapartment.managementfee==''}">$0</c:when>
                  			<c:otherwise>$${oneapartment.managementfee}</c:otherwise>
                  		</c:choose>
                  </td>
                </tr>
              </table>
            </div>
            <div class="order_submit">
                    <div class="s_submit">
                        <p><a href="order.html?roomid=${roomid}&apartmentid=${apartmentid}"  class="sbt">Prev</a></p>
                        <p><a href="javascript:javascript:sub()"  class="sbt">Next</a></p>
                    </div>
            </div>
    
        </div>
    </div>
	<script type="text/javascript">
		function sub(){
			$("[name='form1']").submit();
		}
	</script>      
    
    </div>

</div>

<div style="clear:both;height:100px;"></div>
<%@include file="../others/footer.jsp" %>