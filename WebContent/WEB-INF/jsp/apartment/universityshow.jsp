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
<link rel="shortcut icon" href="<%= path %>/resources/logo_ico.ico"/>
<link rel="bookmark" href="<%= path %>/resources/logo_ico.ico"/>
<meta name="title" content="${oneschool.meta_title}">
<meta name="description" content="${oneschool.meta_description}">
<meta name="keywords" content="${oneschool.meta_keywords}">
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

</script>

</head>
<body>
<div class="FrameTop">
	<div class="divTop">
    	<div class="topContact">
        <img src="<%= path %>/resources/web/images/ico_call.jpg" align="absmiddle" /> Call Us : +1 (510) 761-8000 
        <img src="<%= path %>/resources/web/images/ico_mail.jpg" align="absmiddle" /> Email : contact@worldelites.com
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
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%
	String path2 = request.getContextPath();
%>
<%-- <%@include file="../head.jsp" %> --%>
<%-- <jsp:include page="../head.jsp"></jsp:include> --%>
<%--  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<link rel='stylesheet' href='<%=path %>/resources/web/publiu/style.css' media='screen' />
<style>
	p{word-wrap:break-word; word-break:normal}
</style>
<c:forEach items="${oneschoollist}" var="school">
<div class="FrameAbout">
	<div class="BigTT">${school.name}</div>
</div>
<div class="clearDiv2"></div>
<div class="details">
      <div class="Rw">
        <div id="Filter"> <i class="Ib">租金</i>
          <select name="startPrice">
            <option value="0" >最低价</option>
            <option value="1000" >1000</option>
            <option value="2000" >2000</option>
            <option value="3000" >3000</option>
            <option value="4000" >4000</option>
            <option value="5000" >5000</option>
            <option value="6000" >6000</option>
            <option value="8000" >8000</option>
            <option value="10000" >10000</option>
          </select>
          <select name="endPrice">
            <option value="0" selected >最高价</option>
            <option value="3000" >3000</option>
            <option value="4000"  >4000</option>
            <option value="5000" >5000</option>
            <option value="6000" >6000</option>
            <option value="8000" >8000</option>
            <option value="10000" >10000</option>
            <option value="12000" >12000</option>
            <option value="14000" >14000</option>
            <option value="16000" >16000</option>
            <option value="20000" >20000</option>
          </select>
          <i class="Ib">卧室</i>
          <select name="roomNum">
            <option value="0"  selected >不限</option>
            <option value="1" >一室</option>
            <option value="2" >二室</option>
            <option value="3" >三室</option>
            <option value="4" >四室+</option>
          </select>
          <i class="Ib">入住时间</i>
          <input type="text" name="rentFreeDate" placeholder="年 -月 -日" class="DateTime" value="">
          <div class="search">
            <input type="text" />
            <a href="javascript:" target="_blank" class="Sb"> 搜索</a></div>
        </div>
      </div>
<div class="FrameUntPics">
      <div class="list_img">
        <div id="full-screen-slider">
          <ul id="slides">
            <c:forEach items="${schoolatlaslist}" var="item">
	            <li style="background:url('<%= path2 %>/fileupload/images/${item}');background-size:1120px 550px"><a>${school.name}</a></li>
			</c:forEach>
          </ul>

        </div>
        <div class="list_img_w">
          <p>${school.info}</p>
        </div>
      </div>
</div>
<div class="clearDiv2"></div>
<script type="text/javascript">
	$(function(){
		$(".list_menu li").each(function(i){
			$(this).click(function(){
				$(this).addClass("hover").siblings().removeClass("hover");
				$(".list_main>div").eq(i).css("display","block").siblings().css("display","none");
					
			});
		})
		
	});
</script>
<div class="FrameUntList">
      <div class="list_body">
        <div class="list_menu">
          <ul>
            <li id="one1"  class="hover">Picture View</li>
            <li id="one2"  >List View</li>
            <li id="one3" >Map View</li>
          </ul>
        </div>
        <div class="list_main">
          <div class="list_main_big_2 hover" id="con_one_1">
			  <script>
                $(function () {
                $(".jiaoyou_rqdj_list").hover(
                    function () {
                        $(this).find(".bg").stop().delay(50).animate({"right":0,opacity:1},200)
                     },
                    function () {
                        $(this).find(".bg").stop().animate({"right":-125,opacity:0.5},200)
                    }
                    
                )
                })
            </script>
            <ul>
                <c:forEach items="${allapartmentlist}" var="item">
                  <li class="jiaoyou_rqdj_list">
                    <div class="pic"><a href="<%=path  %>/university/${oneschool.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></div>
                    <div class="bg"></div>
                    <div class="text">
                      <div class="PrdtJg"  style="margin-left:5px;">
                      <c:if test="${item.discounttype!='2'}">
                      		<c:if test="${item.marketprice==null||item.marketprice==''}">
                      			&nbsp;&nbsp;
                      		</c:if>
                      		<c:if test="${item.marketprice!=null&&item.marketprice!=''}">
                      			<del>$${item.marketprice}</del>&nbsp;&nbsp;
                      		</c:if>
                      </c:if>
                      <a href="apartment.html?id=${item.id}">$${item.discount}</a></div>
                      <div class="PrdtMc"  style="margin-left:5px;"><a href="<%=path  %>/university/${oneschool.memo}/${fn:replace(item.name,' ','_')}">${item.name}</a></div>
                      <div class="PrdtDx"  style="margin-left:5px;"><a href="<%=path  %>/university/${oneschool.memo}">${item.parentname}</a></div>
                    </div>
					 <!-- 对三种优惠类型进行输出 -->
                    <c:if test="${item.discounttype=='1'}">
                    	<div class="vovo1">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                    <c:if test="${item.discounttype=='2'}">
                    	<div class="vovo2">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                     <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                    	<div class="vovo3">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>     
                  </li>
                </c:forEach>
            </ul>
          </div>
          <div class="list_main_smeil" id="con_one_2" style="display:none">
            <ul>
                <c:forEach items="${allapartmentlist}" var="item">
 	             <li>
                <div class="pic"><a href="<%=path  %>/university/${oneschool.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></div>
                <div class="text">
                  <h2>
                  <a href="<%=path  %>/university/${oneschool.memo}/${fn:replace(item.name,' ','_')}">${item.name}</a>
                    <c:if test="${item.discounttype=='1'}">
                    	<div class="vovo1">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                    <c:if test="${item.discounttype=='2'}">
                    	<div class="vovo2">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                     <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                    	<div class="vovo3">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>  
                  </h2>
                  <div style="float:left; width:100%; font-size:12px; line-height:1.5; margin-top:8px;">
                  ${item.hignlight}
                  </div>
                </div>
                <div class="text2">
                <c:if test="${item.discounttype=='1'||item.discounttype=='2'}">
                  <p><del>$${item.marketprice}</del> $${item.discount}</p>
                </c:if>
                <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                  <p>From $${item.discount}</p>
                </c:if>
                
                  <p class="url"><a href="<%=path  %>/university/${oneschool.memo}/${item.name}">Detail..</a></p>
                </div>
              </li>
                </c:forEach>

            </ul>
          </div>
          <div class="list_main_map" id="con_one_3" style="display:none"> 
          	<iframe style="float:left; width:1120px; height:500px;" frameborder="0" scrolling="no" src="<%=path %>/apartment/map_university.html?id=${schoolid}"></iframe>
          </div>
        </div>
      </div>
</div>
      
<div class="clearDiv2"></div>
      
<div class="FrameUntBlog">
    <div class="divUntBlogHead">
    	Guidance & Tips
    </div>
    <div class="divUntBlogBody">
      <div class="xggl">
                   <style type="text/css">
                  		/* clearfix */
						.clearfix{clear:both;}
						
						/* wrapper */
						#wrapper{margin-top:20px;width:100%;}
						#container{position:relative;width:1100px;margin:0 auto 25px;padding-bottom:10px;}
						.grid{width:188px;min-height:100px;padding:15px;background:#fff;margin:8px;font-size:12px;float:left;box-shadow:0 1px 3px rgba(34,25,25,0.4);-moz-box-shadow:0 1px 3px rgba(34,25,25,0.4);-webkit-box-shadow:0 1px 3px rgba(34,25,25,0.4);-webkit-transition:top 1s ease, left 1s ease;-moz-transition:top 1s ease, left 1s ease;-o-transition:top 1s ease, left 1s ease;-ms-transition:top 1s ease, left 1s ease;}
						.grid strong{height:36px;ling-height:35px;overflow:hidden;}
						.grid p{ word-wrap:break-word; word-break:normal;height:108px;overflow:hidden}
						.grid strong{border-bottom:1px solid #ccc;margin:10px 0;display:block;padding:0 0 5px;font-size:17px;}
						.grid .meta{text-align:right;color:#777;font-style:italic;}
						.grid .imgholder img{max-width:100%;background:#ccc;display:block;background:url(/resources/web/publiu/images/loding.gif) no-repeat center;width:220px;height:150px;}
                  
				  </style> 
				<script type="text/javascript" src="<%=path %>/resources/web/publiu/js/jquery.lazyload.min.js"></script>
                <script type="text/javascript" src="<%=path %>/resources/web/publiu/js/blocksit.min.js"></script>



                <div id="wrapper">
                
                    <div id="container">
                    </div>
                    <div id="nothread" style="clear:both;margin:0 auto;margin-top:20px;background:#AAA;border:1px dotted #EEE;color:#FFF;width:;height:30px;text-align:center;line-height:30px"><b>No More..</b></div>
                
                <input type="hidden" id="schoolid" value="${schoolid}">
                <script type="text/javascript">
                var size=0;
                //onload---------
                $(function(){
                	 $("#nothread").hide();	
                    $.post("../bbs/refreshBbs.html",{start:size,schoolId:$("#schoolid").val()},function(data){
                        
                    	if(data.length==0){
                            $("#nothread").show();	
                            return false;
                            
                        }else{
                            var text="";
                            for(var i=0;i<data.length;i++){
                            	
                                 text+="<div class='grid'>"+
                                    "<div class='imgholder'>"+
                                    " <a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>"+
                                    "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='220' /></a></div>"+
                                    "<strong>"+data[i].title+"</strong>"+
                                    "<p>"+
                                    data[i].memo.substr(0,40)+
                                    "</p>"+
                                    "<div class='meta'><a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>Detail>>></a></div>"+
                                "</div>";
                            }
                            
                            $('#container').append(text);
                            $('#container').BlocksIt({
                                numOfCol:4,
                                offsetX: 8,
                                offsetY: 8
                            });
                            $("img.lazy").lazyload();
                        }
                        
                    },"json");
                });
                
                
                
                    $(window).scroll(function(){
                            // 当滚动到最底部以上50像素时， 加载新内容
                        if ($(document).height() - $(this).scrollTop() - $(this).height()<250){
                        	size+=10;
                        	 $.post("../bbs/refreshBbs.html",{start:size,schoolId:$("#schoolid").val()},function(data){
                                 
                             	if(data.length==0){
                                     $("#nothread").show();	
                                     return false;
                                     
                                 }else{
                                     var text="";
                                     for(var i=0;i<data.length;i++){
                                     	
                                          text+="<div class='grid'>"+
                                             "<div class='imgholder'>"+
                                             " <a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>"+
                                             "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='220' /></a></div>"+
                                             "<strong>"+data[i].title+"</strong>"+
                                             "<p>"+
                                             data[i].memo.substr(0,40)+
                                             "</p>"+
                                             "<div class='meta'><a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>Detail>>></a></div>"+
                                         "</div>";
                                     }
                                     
                                     $('#container').append(text);
                                     $('#container').BlocksIt({
                                         numOfCol:4,
                                         offsetX: 8,
                                         offsetY: 8
                                     });
                                     $("img.lazy").lazyload();
                                 }
                                 
                             },"json");
                            
                        }
                    });
                    
                    //window resize
                    var currentWidth = 1100;
                    $(window).resize(function() {
                        var winWidth = $(window).width();
                        var conWidth;
                        if(winWidth < 660) {
                            conWidth = 440;
                            col = 2
                        } else if(winWidth < 880) {
                            conWidth = 660;
                            col = 3
                        } else if(winWidth < 1100) {
                            conWidth = 880;
                            col = 4;
                        } else {
                            conWidth = 1100;
                            col = 5;
                        }
                        
                        if(conWidth != currentWidth) {
                            currentWidth = conWidth;
                            $('#container').width(conWidth);
                            $('#container').BlocksIt({
                                numOfCol: col,
                                offsetX: 8,
                                offsetY: 8
                            });
                        }
                    });
                
                </script>
                                
                                
                                
                                
                
                      </div>
    </div>
    </div>
</div>
</div>

</c:forEach>
</body>

<%@include file="../footer.jsp" %>