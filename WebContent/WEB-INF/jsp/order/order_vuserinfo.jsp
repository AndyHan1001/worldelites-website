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

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order" style="width:100%">
    		<div id="">
    		 
    		 <%
            	if("abcd".equals(request.getParameter("abcd"))){
            %>
            <div class="order_percent">
                <img src="<%= path2 %>/resources/web/images/jindu4.jpg" />
            </div>
             <%
            	}
            %>
            <div class="order_title">
                Review & Confirm
            </div>
            <%
            	if("abcd".equals(request.getParameter("abcd"))){
            %>
          <form action="orderjump.html?roomid=${roomid}&apartmentid=${apartmentid}&enterlong=${enterlong}" method="post" name="form1">
          <%
            	}
            %>
            <div class="order_content2">
            	<table width="100%" border="0" align="center" cellpadding="5">
                <!-- 公寓信息 -->
                <tr>
                  <td colspan="4" align="left" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;">Apartment Infomation</td>
                </tr>
                <tr>
                  <td colspan="4" align="left">
	                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	                    <tr>
	               				<td width="100"><img src="<%= path2 %>/fileupload/images/${oneapartment.logo}" width="200" height="100"/></td>
	                             <td align="left" width="190">
	                         			${(oneapartment.name==null||oneapartment.name=='')?"":oneapartment.name}<br><br>
	                         			${(oneapartment.addr==null||oneapartment.addr=='')?"":oneapartment.addr}<br>
	                             </td>
	                             <td align="left" width="190" colspan="2">
	                                	 ${(oneapartment.hignlight==null||oneapartment.hignlight=='')?"":oneapartment.hignlight}
	                             </td>
	                             <%-- <td align="left">
	                             		${(oneapartment.introduction==null||oneapartment.introduction=='')?"N/A":oneapartment.introduction}
	                             </td> --%>
	                    </tr>
	                  </table>
                  </td>
                </tr>
              </table>
              
              
              <table width="100%" border="0" align="center" cellpadding="5">
                <!-- 个人信息 -->
                <tr>
                  <td colspan="4" align="left" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;">Room Infomation</td>
                </tr>
                <tr>
                  <td colspan="4" align="left">
	                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	                    <tr>
	               				<td width="100"><img src="<%= path2 %>/fileupload/images/${oneroom.logo}" width="200" height="100"/></td>
	                             <td align="left" width="300">
	                         			${(oneroom.name==null||oneroom.name=='')?"":oneroom.name}<br>
	                            		 Floor Plan Size (sq. ft.)：${(oneroom.area==null||oneroom.area=='')?"":oneroom.area}
	                             </td>
	                             <td align="left" width="190">
	                                	 ${(oneroom.info==null||oneroom.info=='')?"N/A":oneroom.info}
	                             </td>
	                             <td align="left" colspan="2">
	                             		Monthly Rent:<c:if test="${oneapartment.discounttype=='1'}"> <del>&nbsp;$${(oneroom.price==null||oneroom.price=='')?"":oneroom.price}</del></c:if>&nbsp;&nbsp;&nbsp;
	                             		$${(oneroom.discountprice==null||oneroom.discountprice=='')?"":oneroom.discountprice}<br><br>
	                        		      Leasing Term:12 Months<br>
	                             </td>
	                    </tr>
	                  </table>
                  </td>
                </tr>
                <!-- 学校信息 -->
                <!-- 联系方式  -->
                <!-- 紧急情况联系人 -->
              </table>
              <table width="100%" border="0" align="center" cellpadding="5">
	                <!-- 个人信息 -->
	                <input type="hidden" value="${sessionScope.fuser.id}" name="id3" />
	                <tr>
	                  <td colspan="4" align="left" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;">Estimated Cost</td>
	                </tr>
	                <tr>
	                  <td colspan="4">
	                  <div class="order_content3">
	                  <table border="0" align="center" cellpadding="0" cellspacing="5" class="TableInit">
	                    <tr >
	                  <td width="300" style="border:none">&nbsp;</td>
	                  <td width="300" style="border:none">&nbsp;</td>
	                </tr>
	                <tr>
	                  <td align="right">Monthly Rent：</td>
	                  <td align="left">
	                  <%-- 	<del><c:if test="${oneroom.price!=''||oneroom.price!=null}">$${oneroom.price}</c:if></del>&nbsp;&nbsp;&nbsp; --%>
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
	                  			<c:when test="${oneapartment.applicationfee==null||oneapartment.applicationfee=='0'||oneapartment.applicationfee==''}">$0</c:when>
	                  			<c:otherwise>$${oneapartment.applicationfee}</c:otherwise>
	                  		</c:choose><!-- 一个公寓的申请费 -->
	                </tr>
	                <tr>
	                  <td align="right">Activity Fee：</td><!-- 一个公寓的活动费 -->
	                  <td align="left">
	                  		<c:choose>
	                  			<c:when test="${oneapartment.activityfee==null||oneapartment.activityfee=='0'||oneapartment.activityfee==''}">$0</c:when>
	                  			<c:otherwise>$${oneapartment.activityfee}</c:otherwise>
	                  		</c:choose>
	                  </td>
	                </tr>
	                <tr>
	                  <td align="right">Management Fee：</td><!-- 一个公寓的管理费 -->
	                  <td align="left">
	                  		<c:choose>
	                  			<c:when test="${oneapartment.managementfee==null||oneapartment.managementfee=='0'||oneapartment.managementfee==''}">$0</c:when>
	                  			<c:otherwise>$${oneapartment.managementfee}</c:otherwise>
	                  		</c:choose>
	                  </td>
	                </tr>	
                  </table>
                  </div>
                    <span class="order_content"><br>
                    </span></td>
                </tr>
                <!-- 学校信息 -->
                <!-- 联系方式  -->
                <!-- 紧急情况联系人 -->
              </table>
              <table width="100%" border="0" cellpadding="5" align="center">
                <!-- 个人信息 -->
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00"><p style="color:#F5AA00">Personal&nbsp;Information</p></td>
                </tr>
                
                <tr>
                	 <td><p >*First Name:</p></td>
                  <td>${userinfo.name}</td>
                  <td><p >*Last Name:</p></td>
                  <td>${userinfo.lastname}</td>
                </tr>
                <tr>
                  <td><p >*Gender:</p></td>
                  <td>
                  	<c:choose>
                  		<c:when test="${userinfo.sex==1}">Male</c:when>
                  		<c:when test="${userinfo.sex==2}">Female</c:when>
                  	</c:choose>
                  </td>
                  <td><p >*Date of Birth: </p></td>
                  <td>${birthday}</td>
                </tr>
                <tr>
                   <td><p >*Passport No:</p></td>
                  <td>${userinfo.passportNo}</td>
                  <td></td>
                  <td></td>
                </tr>
                <!-- 学校信息 -->
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;"><p style="color:#F5AA00">University Infomation</p></td>
                </tr>
                <tr>
                  <td><p >* University:</p></td>
                  <td>${userinfo.newschool}</td>
                  <td><p >* Degree:</p></td>
                  <td>${userinfo.grade}</td>
                </tr>
                <!-- 联系方式  -->
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;"><p style="color:#F5AA00">Contact&nbsp;Information</p></td>
                </tr>
                <tr>
                  <td><p >*Permanent Address:</p></td>
                  <td>${userinfo.addr}</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><p >*City/County:</p></td>
                  <td>${userinfo.county}</td>
                  <td><p >*State/Province:</p></td>
                  <td>${userinfo.city}</td>
                </tr>
                <tr>
                  <td><p >*Zip Code:</p></td>
                  <td>${userinfo.zip}</td>
                  <td><p >*Country:</p></td>
                  <td>${userinfo.countries}</td>
                </tr>
                <tr>
                  <td><p >*Phone:</p></td>
                  <td>${userinfo.phone}</td>
                  <td></td>
                  <td></td>
                </tr>
                <!-- 紧急情况联系人 -->
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00;"><p style="color:#F5AA00">Emergency&nbsp;Contact&nbsp;Information</p></td>
                </tr>
                <tr>
                  <td><p >*Full Name:</p></td>
                  <td>${userinfo.relativesname}</td>
                  <td><p >*Relationship with you:</p></td>
                  <td>${userinfo.relatives}</td>
                </tr>
                <tr>
                  <td><p >*Emergency Contact Address:</p></td>
                  <td>${userinfo.relativesaddr}</td>
                  <td><p >*City/County:</p></td>
                  <td>${userinfo.relativescity}</td>
                </tr>
                <tr>
                  <td><p >*State/Province:</p></td>
                  <td>${userinfo.relativesprvc}</td>
                  <td><p >*Zip Code:</p></td>
                  <td>${userinfo.relativeszip}</td>
                </tr>
                <tr>
                  <td><p >*Country:</p></td>
                  <td>${userinfo.relativescountries}</td>
                  <td><p >*Emergency Contact Phone:</p></td>
                  <td>${userinfo.relativesphone}</td>
                </tr>
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa" style="color:#F5AA00;border-bottom:2px solid #F5AA00;"><p style="color:#F5AA00">Roommate Information, If Any</p></td>
                </tr>
                <tr>
                  <td><p >Roommate 1 Full Name:</p></td>
                  <td>${userinfo.roommate1}</td>
                  <td><p >Roommate 1 Email:</p></td>
                  <td>${userinfo.roommatemail1}</td>
                </tr>
                <tr>
                  <td><p >Roommate 2 Full Name:</p></td>
                  <td>${userinfo.roommate2}</td>
                  <td><p >Roommate 2 Email:</p></td>
                  <td>${userinfo.roommatemail2}</td>
                </tr>
                <tr>
                  <td><p >Roommate 3 Full Name:</p></td>
                  <td>${userinfo.roommate3}</td>
                  <td><p >Roommate 3 Email:</p></td>
                  <td>${userinfo.roommatemail3}</td>
                </tr>
                <tr>
                  <td colspan="4" align="center" bgcolor="#fafafa"  style="border-bottom:2px solid #F5AA00;color:#F5AA00"><p style="color:#F5AA00">Document Upload</p></td>
                </tr>
                 <tr>
                  <td><p >*WE Coupon Upload:</p></td>
                  <td colspan="3">${userinfo.file5}</td>
                </tr>
                <tr>
                  <td><p >*Passport Upload:</p></td>
                  <td colspan="3">${userinfo.file1}</td>
                </tr>
                <tr>
                  <td><p >I20/DS2109 Upload:</p></td>
                  <td colspan="3">${userinfo.file2}</td>
                </tr>
                <tr>
                  <td><p >VISA Upload:</p></td>
                  <td colspan="3">${userinfo.file3}</td>
                </tr>
                <tr>
                  <td><p >Others:</p></td>
                  <td colspan="3">${userinfo.file4}</td>
                </tr>
              </table>
            </div>
           <!--  <div class="order_title"><span left-pos="0|12" right-pos="0|12" space="">Read the terms</span></div>
            <div class="order_content2">
                <table width="100%" border="0" cellpadding="5" align="center">
                  <tr>
                    <td><input type="checkbox" name="checkbox" id="checkbox" />
                    I have read and agree to the terms</td>
                  </tr>
                  <tr>
                    <td><div style="float:left; width:400px; height:100px; line-height:1.5; padding:5px; border:1px solid #dddddd; font-size:12px; color:#555555;overflow-y:scroll"> 1<br />
                      2<br />
                      3<br />
                      4<br />
                      5<br />
                      6<br />
                      7<br />
                      8<br />
                      </div></td>
                  </tr>

    </table>
            </div> -->
            <%
            	if("abcd".equals(request.getParameter("abcd"))){
            %>
            <div class="order_title">
                Electronic signature
            </div>
            <div class="order_content2">
                <table width="100%" border="0" cellpadding="5" align="center">
                    <tr>
                        <td>
                           First Name:
                    <input  name="firstname" id="firstname">&nbsp;
                        Last Name:
                        <input  name="lastname" id="lastname">
                        	&nbsp;&nbsp;&nbsp;<span style="color:#AAA">*Please sign your official name as on your passport</span>
                        </td>
                        <td></td>
                        <td>&nbsp;</td>
                        <td></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                
          </div>
          </form>
            <div class="order_submit">
                    <div class="s_submit">
                        <%-- <p><a href="<%=path %>/order/order_userinfo.html?roomid=${oneroom.id}&apartmentid=${oneapartment.id}&enterlong="  class="sbt">Prev</a></p> --%>
                        <p><a href="javascript:history.back()"  class="sbt">Prev</a></p>
                        <p><a href="javascript:sub()"  class="sbt">Submit</a></p>
                    </div>
            </div>
           <%
            	}
            %>
        </div>
    
    </div>
    
	<script type="text/javascript">
		function sub(){
			if($('#firstname').val()=="" ){
				alert("FirstName Error");
			}else if($("#lastname").val()=="" ){
				alert("LastName Error");
			}else{
				$("[name='form1']").submit();
			}
			
		}
		/* else if($("#checkbox").is(":checked")==false){
		alert("Please read the terms first");
	} */
	</script>
                
    </div>

</div>

<%@include file="../footer.jsp" %>