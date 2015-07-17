<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>
<link href="<%= path2 %>/resources/web/albmList/albmList.css" rel="stylesheet" type="text/css" />
<script src="<%= path2 %>/resources/web/albmList/jquery.min.js"  type="text/javascript"></script>
<script src="<%= path2 %>/resources/web/albmList/jquery.jqzoom.js"  type="text/javascript"></script>
<script src="<%= path2 %>/resources/web/albmList/albmList.js"  type="text/javascript"></script>

<link  type="text/css" rel="stylesheet"  href="<%= path2 %>/resources/web/subDiv2/submodal.css" />
<script type="text/javascript" src="<%= path2 %>/resources/web/subDiv2/submodal.js"></script>
<script type="text/javascript" src="<%= path2 %>/resources/web/subDiv2/submodalsource.js"></script>

<link href="/resources/web/albmList/albmList.css" rel="stylesheet" type="text/css" />
<script src="/resources/web/albmList/jquery.jqzoom.js"  type="text/javascript"></script>
<script src="/resources/web/albmList/albmList.js"  type="text/javascript"></script>

<style>

#directionsItinerary{border:1px solid #eeeeee; margin-top:10px; margin-bottom:10px;}
#directionsItinerary div{float:left; width:100%; text-align:left;}
.dd_routeSummary{float:left; text-align:left; font-size:14px; color:#336699}
.dd_tripSummary{float:left; text-align:left; font-size:12px;}

</style>
<div class="FrameAbout">
	<div class="BigTT">${oneapartment.name}</div>
</div>

<div class="FrameApt">
	<div class="divApt">
    	<div class="details">
            <div class="details_h">
                <div class="aptHeadLeft">
                    <span>${oneapartment.parentname}</span>
                    <span>${oneapartment.addr}</span>
                    <span class="mylink"><a href="${oneapartment.website}" target="_blank">${oneapartment.website}</a></span>
                </div>
                <div class="aptHeadRight">
                	  <c:if test="${oneapartment.discounttype!='2'}">
                	  		<c:if test="${oneapartment.marketprice==null||oneapartment.marketprice==''}">
                      			&nbsp;&nbsp;
                      		</c:if>
                      		<c:if test="${oneapartment.marketprice!=null&&oneapartment.marketprice!=''}">
                      			<del>$${oneapartment.marketprice}</del>&nbsp;&nbsp;
                      		</c:if>
                      </c:if>
                   <span>&nbsp;&nbsp;From</span><dd style="font-size:28px">$${oneapartment.discount}</dd>
                        <!-- 对三种优惠类型进行输出 -->
                </div>	        
            </div>
            <div class="summary">
                    
                    <div class="s_m">
                                <div class="s_m_nav">
                                        <ul>
                                            <li id="one1" onClick="setTab('one',1,5)"  class="hover">Photo</li>
                                            <li id="one2" onClick="setTab('one',2,5)" >Map</li>
                                            <li id="one3" onClick="setTab('one',3,5)" >Video</li>
                                            <li id="one4" style="width:120px; float:right;" ><a href="<%=path  %>/university/${oneapartment.memo}"><img src="<%= path2 %>/resources/web/images/back.jpg"></a></li>
                                            
                                        </ul>
                                </div>
                                <div class="s_m_main">
                                        <div class="s_m_pic hover" id="con_one_1">
                                        <div class="bigAlbmList">
                                                <!-- 大图begin -->
                                                <div id="preview" class="spec-preview"> 
                                                    <span class="jqzoom"><img jqimg="<%= path2 %>/fileupload/images/${firstapartmentatlas}" src="<%= path2 %>/fileupload/images/${firstapartmentatlas}" /></span> 
                                                </div>
                                                <!-- 大图end -->
                                                <!-- 缩略图begin -->
                                                <div class="spec-scroll"> <a class="prev">&lt;</a> <a class="next">&gt;</a>
                                                  <div class="items">
                                                    <ul>
                                                     <c:forEach items="${oneapartmentatlas}" var="item">
                                                      <li><img bimg="<%= path2 %>/fileupload/images/${item}" src="<%= path2 %>/fileupload/images/${item}" onclick="preview(this);"></li>
                                                      </c:forEach>
                                                    </ul>
                                                  </div>
                                                </div>
                                                <!-- 缩略图end -->
                                         </div>
                                        </div>
                                        <div class="s_m_map" id="con_one_2" style="display:none">
                                            <iframe style="float:left; width:900px; height:650px;" frameborder="0" scrolling="no" src="<%=path  %>/apartment/map_apartment.html?id=${oneapartment.id }"></iframe>
    
                                        </div>
                                        <div class="s_m_map" id="con_one_3" style="display:none">
                                            ${oneapartment.video}
                                        </div>                                    
                                </div>
                    </div>
                    <div id='directionsItinerary' style="display:none;"> </div> 
                    <div class="hours">
                            <h1>Select Your Room</h1>
                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td align="left" bgcolor="#fafafa">Floorplan</td>
                                    <td align="left" bgcolor="#fafafa">Room Type</td>
                                    <td align="left" bgcolor="#fafafa">Current special</td>
                                    <td align="left" bgcolor="#fafafa">Monthly Rent</td>
                                    <td align="left" bgcolor="#fafafa">&nbsp;</td>
                              </tr>                        
                            <c:forEach items="${allroomlist}" var="item">
                                  <tr>
                                    <td width="100">
                                    <a href="javascript:showPopWin('<%=path %>/apartment/roomshow.html?id=${item.room.id}', 820, 520, null);">
                                        <img src="<%=path2 %>/fileupload/images/${item.room.logo}" width="100" height="70" />
                                    </a>                                
                                    </td>
                                    <td align="left" width="230">
                                        <span style="font-size:14px; font-weight:bold;">${item.room.name}</span><br>
                                        <c:if test="${item.room.area!=null && item.room.area!=''}">
                                        ${item.room.area} Sq.Ft.<br>
                                        </c:if>
                                        <c:if test="${item.room.enterlong!=null && item.room.enterlong!=''}">
                                        ${item.room.enterlong} Months<br>
                                        </c:if>
                                       <c:if test="${item.enterDate!=null && item.enterDate!=''}">
                                        ${item.enterDate} - ${item.outDate}
                                        </c:if>
                                        <div class="mylink_down" onClick="showthisInfo(this)"><a>[show room information]</a></div>
                                    </td>
                                    <td align="left" width="200">
                                        <c:forEach items="${item.roomDiscount}" var="item2">
                                            <div style="float:left;min-height:15px; margin-right:5px;width:100%; font-size:12px; color:#284198">
                                                   <img src="/resources/web/images/checked.jpg" align="absmiddle">&nbsp;${item2}
                                            </div>
                                        </c:forEach>
                                    </td>
                                    <td align="left" style="font-size:18px; line-height:1.5">
                                        <c:if test="${fn:length(item.room.price)>0}">
                                            <del>$${item.room.price}</del><br>
                                        </c:if>

                                        <c:if test="${fn:length(item.room.discountprice)>0}">
                                            $${item.room.discountprice}<br>
                                        </c:if>
                                        <!--Leasing Term:${item.room.enterlong}<br>-->
                                    </td>
                                    <td width="100" align="center">
	                                    <div class="s_book" style="width:100px">
		                                    <c:choose>
		                                    	<c:when test="${sessionScope.fuser!=null}">
		                                    		<c:choose>
		                                    			<c:when test="${item.iscoupon==1&&item.isbook==1}">
		                                    				<p><a href=" javascript:ifCoupon(${oneapartment.id})" class="yd">Get Coupon</a></p>
		                                    				<p><a href="<%=path %>/order/order.html?apartmentid=${oneapartment.id}&roomid=${item.room.id}" class="yd">Book</a></p>
		                                    			</c:when>
		                                    			<c:when test="${item.iscoupon==1&&item.isbook==0}">
		                                    				<p><a href=" javascript:ifCoupon(${oneapartment.id})" class="yd">Get Coupon</a></p>
		                                    				<p><a href="#" class="yd" style="background:#CCC">Book</a></p>
		                                    			</c:when>
		                                    			<c:when test="${item.iscoupon==0&&item.isbook==1}">
		                                    				<p><a href="#" class="yd" style="background:#CCC">Get Coupon</a></p>
		                                    				<p><a href="<%=path %>/order/order.html?apartmentid=${oneapartment.id}&roomid=${item.room.id}" class="yd">Book</a></p>
		                                    			</c:when>
		                                    			<c:otherwise>
		                                    				<p><a class="yd" style="background:#CCC" href="#">Fully Booked</a></p>
		                                    			</c:otherwise>
		                                    		</c:choose>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    			<c:choose>
			                                    			<c:when test="${item.iscoupon==1&&item.isbook==1}">
			                                    				<p><a href=" javascript:showPopWin('<%= path %>/login.html', 550, 290, null);" class="yd">Get Coupon</a></p>
			                                    				<p><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);" class="yd">Book</a></p>
			                                    			</c:when>
			                                    			<c:when test="${item.iscoupon==1&&item.isbook==0}">
			                                    				<p><a href=" javascript:showPopWin('<%= path %>/login.html', 550, 290, null);" class="yd">Get Coupon</a></p>
			                                    				<p><a href="#" class="yd" style="background:#CCC">Book</a></p>
			                                    			</c:when>
			                                    			<c:when test="${item.iscoupon==0&&item.isbook==1}">
			                                    				<p><a href="#" class="yd" style="background:#CCC">Get Coupon</a></p>
			                                    				<p><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);" class="yd">Book</a></p>
			                                    			</c:when>
			                                    			<c:otherwise>
			                                    				<p><a class="yd" style="background:#CCC" href="#">Fully Booked</a></p>
			                                    			</c:otherwise>
		                                    		</c:choose>
		                                    	</c:otherwise>
		                                    </c:choose>     
		                                                           
	                                    </div>
                                    </td>
                                  </tr>
        						  <tr class="showss">
	                                  <td colspan="5">
                                      ${item.room.info}
                                      
    	                              </td>
                                  </tr>
                            </c:forEach>
                        </table>
    					<script language="javascript">
    						$(".showss").hide();
							function showthisInfo(v){	
								if($(v).parents("tr").next().is(":hidden"))
									{
										$(v).parents("tr").next().show();
										$(v).addClass("mylink_up");
									}
								else
									{
									$(v).parents("tr").next().hide();
									$(v).addClass("mylink_down");
									}
							}
						
						</script>
    
                    </div>
                     <div class="s_about">
                        <div class="s_about_left">
                            <h1>Apartment Highlight</h1>
                            <div class="s_ifos">
                                ${oneapartment.hignlight}
                            </div>
                            <h1>Neighborhood</h1>
                            <div class="s_ifos">
                                ${oneapartment.introduction}
                            </div>
                            <h1>Leasing Information</h1>
                            <div class="s_ifos">
    
                  				<table border="0" align="left" cellpadding="0" cellspacing="5" class="TableInit">
                    
                     <tr>
                      <td width="170" align="right" valign="top">Leasing Type：</td>
                      <td width="250" align="left" valign="top">${oneapartment.leasingtype}</td>
                    </tr>
<!--                    <tr>
                      <td align="right">Leasing Term：</td>
                      <td align="left">${oneroom.enterlong}</td>
                    </tr>
-->                    <tr>
                      <td width="170" align="right" valign="top">Roommate Match Service：</td>
                    <td width="250" align="left" valign="top">${oneapartment.matching}</td>
                    </tr>
<!--                    <tr>
                      <td align="right">MOVE-in Date：</td>
                      <td align="left">${oneroom.entertime}</td>
                    </tr>
                    <tr>
                      <td align="right">MOVE-in Date：</td>
                      <td align="left">${oneroom.outtime}</td>
                    </tr>
-->                    <tr>
                      <td width="170" align="right" valign="top">If Early Move-in Available：</td>
                    <td width="250" align="left" valign="top">${oneapartment.enterearly}</td>
                    </tr>
                    
                    <tr>
                      <td width="170" align="right" valign="top">Pet Friendly：</td>
                      <td width="250" align="left" valign="top">${oneapartment.petpolicy}</td>
                    </tr>
                    <tr>
                      <td width="170" align="right" valign="top">Application Fee：</td>
                      <td width="250" align="left" valign="top">
                      <c:choose>
                        <c:when test="${oneapartment.applicationfee==null||oneapartment.applicationfee==''}">$0</c:when>
                        <c:otherwise>$${oneapartment.applicationfee}</c:otherwise>
                      </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td width="170" align="right" valign="top">Deposit：</td>
                      <td width="250" align="left" valign="top">${oneapartment.deposit}</td>
                    </tr>
                    
                    <!-- <tr>
                      <td align="right">Apartment Discount：</td>
                      <td align="left">$${oneapartment.discount}</td>
                    </tr> -->
                    <tr>
                      <td width="170" align="right" valign="top">Management Fee：</td>
                      <td width="250" align="left" valign="top">
                      <c:choose>
                        <c:when test="${oneapartment.managementfee==null||oneapartment.managementfee==''}">$0</c:when>
                        <c:otherwise>$${oneapartment.managementfee}</c:otherwise>
                      </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td width="170" align="right" valign="top">Activity Fee：</td>
                      <td width="250" align="left" valign="top">
                      <c:choose>
                        <c:when test="${oneapartment.activityfee==null||oneapartment.activityfee==''}">$0</c:when>
                        <c:otherwise>$${oneapartment.activityfee}</c:otherwise>
                      </c:choose>
                     </td>
                    </tr>
                    <tr>
                      <td width="170" align="right" valign="top">Parking：</td>
                      <td width="250" align="left" valign="top"><c:choose>
                        <c:when test="${oneapartment.parking==null||oneapartment.parking==''}">$0</c:when>
                        <c:otherwise>${oneapartment.parking}</c:otherwise>
                      </c:choose></td>
                    </tr>
                    <tr>
                      <td width="170" align="right" valign="top">Other Fee：</td>
                      <td width="250" align="left" valign="top">
                      	${oneapartment.otherfee}
                      </td>
                    </tr>
                  </table>

                                    
                          </div>                          
                        </div>
                        

                        <div class="s_about_right">
                            <h1>Apartment Features</h1>
                            <div class="s_ifos">
                                <c:forEach items="${oneapartmentfeature}" var="item">
                                    <div style="float:left;margin-bottom:5px; min-height:20px; width:205px;">
                                         <div style="float:left; width:20px; margin-top:3px;">
                                             <img src="<%= path2 %>/resources/web/images/checked2.jpg" />
                                         </div>
                                         <div style=" margin-left:3px;">
                                            ${item}
                                         </div>                                	
                                    </div>
                                </c:forEach>
                            </div>


                                         
                            <h1>Community Amenities</h1>
                            <div class="s_ifos">
                                <c:forEach items="${oneapartmentamenities}" var="item">
                                    <div style="float:left;margin-bottom:5px; min-height:20px; width:205px;">
                                        
                                         <div style="float:left; width:20px; margin-top:3px;">
                                             <img src="<%= path2 %>/resources/web/images/checked2.jpg" />
                                         </div>
                                         <div style=" margin-left:3px;">
                                            ${item}
                                         </div>  
                                                                        
                                    </div>
                                </c:forEach>
                            </div>       



                            <h1>Utilities Included</h1>
                            <div class="s_ifos">
                                <c:forEach items="${oneapartmentutilities}" var="item">
                                    <div style="float:left;margin-bottom:5px; min-height:20px; width:205px;">
                                        
                                         <div style="float:left; width:20px; margin-top:3px;">
                                             <img src="<%= path2 %>/resources/web/images/checked2.jpg" />
                                         </div>
                                         <div style=" margin-left:3px;">
                                            ${item}
                                         </div>  
                                                                        
                                    </div>
                                </c:forEach>
                            </div>       


                        </div>

                    </div>
                    <div class="clearDiv"></div>
            </div>

            	 <div class="aptHeadRight2">
                        <c:if test="${oneapartment.discounttype=='1'}">
                            <div class="vovo1">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>
                        <c:if test="${oneapartment.discounttype=='2'}">
                            <div class="vovo2">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>
                         <c:if test="${oneapartment.discounttype!='1'&&oneapartment.discounttype!='2'}">
                            <div class="vovo3">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>     
                    </div>          

            <div class="su_rt fixed" id="sidebar">
                    <div class="su_rt_1">
                            <div class="su_main">
                               ${oneapartment.news}
                            </div>
                    </div>
    
                   
                      <div class="s_btn">
                      	<c:if test="${sessionScope.fuser==null}">
                      		<p><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);"  class="sc">Add to Favorite</a></p>
                      	</c:if>
                      	<c:if test="${sessionScope.fuser!=null}">
                      		<p><a href="javascript:addfvrt(${oneapartment.id})"  class="sc">Add to Favorite</a></p>
                      	</c:if>
                        <c:choose>
                        	<c:when test="${sessionScope.fuser!=null}">
                        		<c:choose>
		                        	<c:when test="${oneapartment.iscoupon==1}">
		                        		<p><a href="javascript:ifCoupon(${oneapartment.id})"  class="hq">Get Coupon</a></p>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<p><a href="#"  class="hq" style="background:#CCC">Get Coupon</a></p>
		                        	</c:otherwise>
		                        </c:choose>
		                   </c:when>
	                        <c:otherwise>
	                        	<c:choose>
		                        	<c:when test="${oneapartment.iscoupon==1}">
		                        		<p><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);"  class="hq">Get Coupon</a></p>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<p><a href="#"  class="hq" style="background:#CCC">Get Coupon</a></p>
		                        	</c:otherwise>
		                        </c:choose>
	                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${sessionScope.fuser!=null}">
                        		<c:if test="${oneapartment.isbook==1}">
									<p><a href="<%= path %>/order/order.html?apartmentid=${oneapartment.id}" class="yd">Book a Room</a></p>                        			
                        		</c:if>
                        		<c:if test="${oneapartment.isbook!=1}">
									<p><a href="#" class="yd" style="background:#CCC">Book a Room</a></p>                        			
                        		</c:if>
                        	</c:when>
                        	<c:otherwise>
                        		<c:if test="${oneapartment.isbook==1}">
									<p><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);" class="yd">Book a Room</a></p>                      			
                        		</c:if>
                        		<c:if test="${oneapartment.isbook!=1}">
									<p><a href="#" class="yd" style="background: #CCC">Book a Room</a></p>                    			
                        		</c:if>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                   <%--  <c:if test="${othersapartmentlist!=null&&othersapartmentlist!=''}"> --%>
                    <div class="su_rt_1">
                            <div class="tit">
                                <strong>Recently Viewed</strong>
                            </div>
                            <div class="su_main">
                                <c:forEach var="item" items="${othersapartmentlist}">
                                <li>
                                    <dl>
                                        <dd class="pic"><a href="<%=path  %>/university/${item.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></dd>
                                        <dd class="info">
                                            <h1><a href="<%=path  %>/university/${item.memo}/${fn:replace(item.name,' ','_')}">${item.name}"</a></h1>
                                            <p><a href="<%=path  %>/university/${item.memo}/${fn:replace(item.name,' ','_')}">${item.memo}"</a></p>
                                        </dd>
                                        <dd class="price">From $${item.marketprice}</dd>
                                    </dl>
                                </li>
                                </c:forEach>
                            </div>
                    </div> 
                    <%-- </c:if> --%>
                    </div>
    </div>
	</div>
</div>



<script language="javascript">
function addfvrt(id)
{
	$.post("<%= path %>/apartment/addcollection.html",{id:id},function(data){
		if(data==null||data==""){
			//
		}else{
			//
		}
		alert(data);
	},"text");
}
function ifCoupon(id)
{
	$.post("<%= path %>/apartment/ifCoupon.html",{id:id},function(data){
		if(data!="yes"){
			showPopWin('<%= path %>/login.html', 550, 290, null);
		}else{
			window.location.href="<%= path %>/apartment/coupon.html?id="+id;
		}
		
	},"text");
}
</script>

<%@include file="../footer.jsp" %>