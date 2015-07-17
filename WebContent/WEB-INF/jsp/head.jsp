<%@page import="com.zq.worldelites.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>World Elites</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta name="description" content="WE">
<meta name="keywords" content="WE">
<link rel="shortcut icon" href="<%= path %>/resources/logo_ico.ico"/>
<link rel="bookmark" href="<%= path %>/resources/logo_ico.ico"/>

<link rel="stylesheet" href="<%= path %>/resources/web/css/common.css" type="text/css" />
<link rel="stylesheet" href="<%= path %>/resources/web/css/about.css" type="text/css" />
<link rel="stylesheet" href="<%= path %>/resources/web/css/bbs.css" type="text/css" />
<link rel="stylesheet" href="<%= path %>/resources/web/css/search.css" type="text/css" />

<script type="text/javascript" src="<%= path %>/resources/web/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<%= path %>/resources/web/js/jquery.Xslider.js"></script>
<script type="text/javascript" src="<%= path %>/resources/web/js/common.js"></script>
<script type="text/javascript" src="<%= path %>/resources/web/js/search.js"></script>

<script type="text/javascript" src="<%= path %>/resources/web/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%= path %>/resources/web/js/jquery.DB_gallery.js"></script>		

<link  type="text/css" rel="stylesheet"  href="<%= path %>/resources/web/subDiv2/submodal.css" />
<script type="text/javascript" src="<%= path %>/resources/web/subDiv2/submodal.js"></script>
<script type="text/javascript" src="<%= path %>/resources/web/subDiv2/submodalsource.js"></script>


<script>
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}

function exitUser(){
	$.ajax({
		url:"<%= path %>/exit.html",
		type:"get",
		dataType:"text",
		success:function(data){
			location.reload();
		},
		error:function(){
			
		}
		
	});
}
</script>

</head>
<body>
<div class="FrameTop">
	<div class="divTop">
    	<div class="topContact">
        <img src="<%= path %>/resources/web/images/ico_call.jpg" align="absmiddle" /> Call Us : +1 (510) 761-8000 
        <img src="<%= path %>/resources/web/images/ico_mail.jpg" align="absmiddle" /> Email : contact@worldelites.com
        <img src="<%= path %>/resources/web/images/aboutTime.png" align="absmiddle" width="20" height="20" style="margin-top:-2px;"/> 9:30 am -5:30 pm Monday - Friday
        </div>
		<div class="topLang">
            <a href="<%= path %>/setwebstate.html?state=cn">简</a>
            <a href="<%= path %>/setwebstate.html?state=fa">繁</a>
            <a class="Sel" href="<%= path %>/setwebstate.html?state=en">En</a>
        </div>
		<c:choose>
			<c:when test="${sessionScope.fuser==null}">
			<div class="topLogin"><a href="javascript:showPopWin('<%= path %>/login.html', 550, 290, null);">Sign in</a></div>
			<div class="topReg"><a href="<%= path %>/reg.html?act=regdo">Sign up</a></div>
			</c:when>
			<c:when test="${sessionScope.fuser!=null}">
			<div class="topLogin"><a href="javascript:exitUser()">Sign out</a></div>
			<div class="topLogin"><a href="<%= path %>/users/usercenter.html">My Account</a></div>
			<div class="topReg2" style="color:#626262">${sessionScope.fuser.mail}</div>
			</c:when>
		</c:choose>
	</div>
</div>

<div class="FrameHead">
	<div class="divHead">
		<div id="logo" class="logo"><a href="<%= path %>/index.html"><img src="<%= path %>/resources/web/images/logo.jpg" /></a></div>
		<div id="menu" class="menu">
			<ul>
				<li class="m1"><a href="<%= path %>/index.html">Home</a></li>
				<li class="m2" onMouseOver="OnShowMunLeft(this,0,'lanmu_about','about');" onMouseOut="OnShowMunLeft(this,1,'lanmu_about','about');"><a href="<%= path %>/about/about.html">What WE Do</a></li>
				<li  class="m3" onMouseOver="OnShowMunLeft(this,0,'lanmu_university','university');" onMouseOut="OnShowMunLeft(this,1,'lanmu_university','university');"><a href="<%= path %>/university">Apartments</a></li>
				<li class="m4"><a href="<%= path %>/bbs/bbs.html">Blog</a></li>
				
				<%-- <c:if test="${communitylist!=null}">
				<li class="m5" onMouseOver="OnShowMunLeft(this,0,'lanmu_community','community');" onMouseOut="OnShowMunLeft(this,1,'lanmu_community','community');"><a href="<%= path %>/bbs/community.html?type=${communitylist[0].title}&id=${communitylist[0].id}">WE Community</a></li>
				</c:if>
				<c:if test="${communitylist==null}">
				<li class="m5" onMouseOver="OnShowMunLeft(this,0,'lanmu_community','community');" onMouseOut="OnShowMunLeft(this,1,'lanmu_community','community');"><a href="<%= path %>/bbs/community.html?type=${communitylist[0].title}&id=${communitylist[0].id}">WE Community</a></li>
				</c:if> --%>
				<li class="m6" onMouseOver="OnShowMunLeft(this,0,'lanmu_joinus','joinus');" onMouseOut="OnShowMunLeft(this,1,'lanmu_joinus','joinus');"><a href="<%= path %>/about/joinus.html">Join WE Team</a></li>
			</ul>

		</div>
	</div>
</div>

	<div class="DivMenuList">
    	<div id="lanmu_about" onMouseOver="OnShowMunLeft('',0,this.id)" onMouseOut="OnShowMunLeft('',1,this.id)" class="DivMenuListOne" style="visibility:hidden;left:534px">
        	<ul>
        	<c:forEach var="item" items="${headaboutlist}">
        	<li><a href="<%= path %>/about/about.html?id=${item.id}">${item.title}</a></li>
            </c:forEach>
            </ul>
        </div>
    	<div id="lanmu_university" onMouseOver="OnShowMunLeft('',0,this.id)" onMouseOut="OnShowMunLeft('',1,this.id)" class="DivMenuListTow" style="visibility:hidden;left:666px">
        	<ul>
        	<c:forEach var="item" items="${headschoollist}">
            <li><a href="<%= path %>/university/${item.memo}">${item.name}</a></li>
			</c:forEach>
            <li><a href="<%= path %>/university">&nbsp;More....</a></li>
            </ul>
        </div>

    	<%-- <div id="lanmu_community" onMouseOver="OnShowMunLeft('',0,this.id)" onMouseOut="OnShowMunLeft('',1,this.id)" class="DivMenuListOne" style="visibility:hidden">
        	<ul>
        	<c:forEach var="item" items="${headcommunitylist}">
        		<li><a href="<%= path %>/bbs/community.html?type=${item.title}&id=${item.id}">${item.title}</a></li>
        	</c:forEach>
            </ul>
        </div> --%>
    	<div id="lanmu_joinus" onMouseOver="OnShowMunLeft('',0,this.id)" onMouseOut="OnShowMunLeft('',1,this.id)" class="DivMenuListOne" style="visibility:hidden; width:150px; text-align:left;">
        	<ul>
        	<c:forEach var="item" items="${headjoinuslist}">
            <li><a href="<%= path %>/about/joinus.html?id=${item.id}">${item.title}</a></li>
            </c:forEach>
            </ul>
        </div>
        
		<script language="javascript">
        function OnShowMunLeft(v,o,Wei,t)
            {
                if(document.getElementById(Wei))
                {
                    if(o == 0)
                    {
                        document.getElementById(Wei).style.visibility="visible";
                    }
                    else
                    {
                        document.getElementById(Wei).style.visibility="hidden";
                    }	
                        
                }		
            }
            
        </script>   
        <script language="javascript">
			var url=window.location.href;
			if(url.indexOf("about/about")>0)
				$('.m2').css("background-color","#F6AB00");
			if(url.indexOf("apart")>0)
				$('.m3').css("background-color","#F6AB00");
			if(url.indexOf("bbs/bbs")>0)
				$('.m4').css("background-color","#F6AB00");
			if(url.indexOf("bbs/comm")>0)
				$('.m5').css("background-color","#F6AB00");				
			if(url.indexOf("about/join")>0)
				$('.m6').css("background-color","#F6AB00");				
		</script>
    </div>


