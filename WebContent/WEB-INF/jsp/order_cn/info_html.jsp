<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- <style>
	*{margin:;padding:0;}
	body{}
	h3{height:35px;border-bottom:3px solid #F60;padding-left:10px; line-height:35px;color:#F60;background:#CCC;width:100%}
	h2{text-align:center}
	div{width:1000px;margin:0 auto;}
	table{width:100%;}
	tr{width:100%;}
	td{width:25%;padding:5px;border:1px solid #CCC;}
	
</style> -->
</head>
<body>
<div>
	<b><h2>Booking Info</h2></b>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<u><b><h3>Estimated Cost</h3></b></u>
	<table cellspacing="0" cellpadding="0">
    		                <tr>
	                  <td>Floor Plan:</td>
	                  <td>&nbsp;</td>
	                  <td>${oneroom.name}</td>
	                  <td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>Monthly Rent:</td>
	                  <td>&nbsp;</td>
	                  <td>
                        	<c:if test="${oneroom.discountprice==''||oneroom.discountprice==null}">&nbsp;</c:if><c:if test="${oneroom.discountprice!=''&&oneroom.discountprice!=null}">$${oneroom.discountprice}</c:if>
	                  </td>
	                  <td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>WE saving:</td>
	                  <td>&nbsp;</td>
	                  <td>${oneroom.discount}</td>
	                  <td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>Leasing Term:</td>
	                  <td>&nbsp;</td>
	                  <td>12 Months</td>
	                  <td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>Application Fee:</td>
	                  <td>&nbsp;</td>
	                  <td>
	                  			<c:if test="${oneapartment.applicationfee==null||oneapartment.applicationfee=='0'||oneapartment.applicationfee==''}">$0</c:if><c:if test="${oneapartment.applicationfee!=null&&oneapartment.applicationfee!='0'&&oneapartment.applicationfee!=''}">$${oneapartment.applicationfee}</c:if>
	                  		</td>
	                  		<td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>Activity Fee:</td><!-- 一个公寓的活动费 -->
	                  <td>&nbsp;</td>
	                  <td>
	                  			<c:if test="${oneapartment.activityfee==null||oneapartment.activityfee=='0'||oneapartment.activityfee==''}">$0</c:if><c:if test="${oneapartment.activityfee!=null&&oneapartment.activityfee!='0'&&oneapartment.activityfee!=''}">$${oneapartment.activityfee}</c:if>
	                  </td>
	                  <td>&nbsp;</td>
	                </tr>
	                <tr>
	                  <td>Management Fee:</td><!-- 一个公寓的管理费 -->
	                  <td>&nbsp;</td>
	                  <td>
	                  			<c:if test="${oneapartment.managementfee==null||oneapartment.managementfee=='0'||oneapartment.managementfee==''}">$0</c:if><c:if test="${oneapartment.managementfee!=null&&oneapartment.managementfee!='0'&&oneapartment.managementfee!=''}">$${oneapartment.managementfee}</c:if>
	                  </td>
	                  <td>&nbsp;</td>
	                </tr>	
        
    </table>
  <u><b> <h3>Personal&nbsp;Information</h3></b></u>
    <table cellspacing="0" cellpadding="0">
    	<tr>
          <td>First Name:</td>
          <td>${userinfo.name}</td>
          <td>Last Name:</td>
          <td>${userinfo.lastname}</td>
        </tr>
        <tr>
          <td>Gender:</td>
          <td>
                <c:if test="${userinfo.sex==1}">Male</c:if><c:if test="${userinfo.sex==2}">Female</c:if>
          </td>
          <td>Date of Birth: </td>
          <td>${birthday}</td>
        </tr>
        <tr>
          <td>Passport No:</td>
          <td>${userinfo.passportNo}</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
    </table>
    <u><b><h3>University Infomation</h3></b></u>
    <table cellspacing="0" cellpadding="0">
    	<tr>
          <td> University:</td>
          <td>${userinfo.newschool}</td>
          <td> Degree:</td>
          <td>${userinfo.grade}</td>
        </tr>
    </table>
  <u><b>  <h3>Contact&nbsp;Information</h3></b></u>
    <table cellspacing="0" cellpadding="0">
        <tr>
          <td>Permanent Address:</td>
          <td>${userinfo.addr}</td>
          <td>Phone:</td>
          <td>${userinfo.phone}</td>
        </tr>
        <tr>
          <td>City/County:</td>
          <td>${userinfo.county}</td>
          <td>State/Province:</td>
          <td>${userinfo.city}</td>
        </tr>
        <tr>
          <td>Zip Code:</td>
          <td>${userinfo.zip}</td>
          <td>Country:</td>
          <td>${userinfo.countries}</td>
        </tr>
    </table>
     <u><b><h3>Emergency&nbsp;Contact&nbsp;Information</h3></b></u>
    <table cellspacing="0" cellpadding="0">
    	<tr>
          <td>Full Name:</td>
          <td>${userinfo.relativesname}</td>
          <td>Relationship with you:</td>
          <td>${userinfo.relatives}</td>
        </tr>
        <tr>
          <td>Emergency Contact Address:</td>
          <td>${userinfo.relativesaddr}</td>
          <td>City/County:</td>
          <td>${userinfo.relativescity}</td>
        </tr>
        <tr>
          <td>State/Province:</td>
          <td>${userinfo.relativesprvc}</td>
          <td>Zip Code:</td>
          <td>${userinfo.relativeszip}</td>
        </tr>
        <tr>
          <td>Country:</td>
          <td>${userinfo.relativescountries}</td>
          <td>Emergency Contact Phone:</td>
          <td>${userinfo.relativesphone}</td>
        </tr>
    </table>
   <u><b>  <h3>Roommate Information, If Any</h3></b></u>
    <table cellspacing="0" cellpadding="0">
    	 <tr>
          <td><p >Roommate 1 Full Name:</td>
          <td>${userinfo.roommate1}</td>
          <td><p >Roommate 1 Email:</td>
          <td>${userinfo.roommatemail1}</td>
        </tr>
        <tr>
          <td><p >Roommate 2 Full Name:</td>
          <td>${userinfo.roommate2}</td>
          <td><p >Roommate 2 Email:</td>
          <td>${userinfo.roommatemail2}</td>
        </tr>
        <tr>
          <td><p >Roommate 3 Full Name:</td>
          <td>${userinfo.roommate3}</td>
          <td><p >Roommate 3 Email:</td>
          <td>${userinfo.roommatemail3}</td>
        </tr>
    </table>
    <h3>&nbsp;</h3>
    <h3>&nbsp;</h3>
</div>  
</body>
</html>