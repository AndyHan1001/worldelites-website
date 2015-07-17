<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="head.jsp" %>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');


  ga('create', 'UA-61349272-1', 'auto');
  ga('send', 'pageview');


</script>


<div class="FrameBanner">
		<div id="banner">
            <div id="slide" class="slide_wrap">
                <ul class="slide_imglist conbox">
                	<c:forEach var="item" items="${piclist}"><!-- banner的轮播图，bg背景，img图片 -->
                    <li class="i1">
                        <a ><img src="<%= path2 %>/fileupload/images/${item.logo}"></a>
                    </li>
                    </c:forEach>
             	</ul>
                <div class="switcher">
                    <a  class="cur"></a>
                    <a ></a>
                    <a ></a>
                </div>
            </div>
          	<script src="<%= path2 %>/resources-cn/web/js/jquery-1.10.1.min.js"></script>
            <script src="<%= path2 %>/resources-cn/web/js/jquery.Xslider.js"></script>
            <script>
            
            // 焦点图片淡隐淡现
            $("#slide").Xslider({
                affect:'fade',
                ctag: 'li', //内容标签 默认为<a>
                speed: 800, //动画速度
                space: 2000, //时间间隔
                auto: true, //自动滚动
                trigger: 'mouseover', //触发事件 注意用mouseover代替hover
                conbox: '.conbox', //内容容器id或class
                switcher: '.switcher', //切换触发器id或class
                stag: 'a', //切换器标签 默认为a
                current:'cur', //当前切换器样式名称
                rand:false //是否随机指定默认幻灯图片
            });
            
            
            //统计代码
            $(document).delegate('a', 'click', function(ev) {
            
                var target = ev.target, $target = $(target);
                var action, info, url;
            
                info = encodeURIComponent($target.attr('title'));
                url = encodeURIComponent($target.attr('href'));
            
            });
        </script> 
  </div>
        <div class="bannerSearch">
		<div class="SearchForm">
			<form action="../apartment_cn/university.html" method="post">
			  <div class="divSearchWords"><input type="text" name="SearchWords"  id="SearchWords"  class="SearchWords"  placeholder="Please type in an university name" /></div>

			  <div class="divSearchSubmit">
              <!--<input type="image"  class="inputSearch" src="<%= path2 %>/resources_cn/web/images/SearchButton.jpg" />-->
              <select name="SearchType" id="SearchType" onChange="setPHL()" class="SearchType" style="margin-top:5px;">
              	<option value="0">University</option>
                <option value="1">Apartment</option>
              </select>
              </div>
			</form>
            <script language="javascript">
				function setPHL(){
					var uc=document.getElementById("SearchType").value;
					if(uc==1)
					document.getElementById("SearchWords").placeholder="Please type in an apartment name";
					else
					document.getElementById("SearchWords").placeholder="Please type in an university name";
				}
			</script>
            
			  		<!-- 搜索定位 -->
			  		<div class="searchResult">
						
					</div>
			  		<!-- end -->
                    </div>
	</div> 
</div>

<div class="clearDiv"></div>

<div class="FrameProcess">
    <div class="divProcessBody">
		<img src="<%= path2 %>/resources-cn/web/images/channel.jpg">
    </div>
</div>

<div class="clearDiv2"></div>

<div class="FrameProduct">
	<div class="divProduct">
    	<div class="divProductLeft">
        	<div class="dplHead">
            	WE本月推荐
                <p><a href="../apartment_cn/university.html"></a></p>
            </div>
            <div class="dplMain">
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
<style type="text/css">
.scroll{width:820px;overflow:hidden;height:265px; float:left;}
.prev,.next{font-size:20px; font-weight:400;cursor:pointer;}
.butt{float:left; width:810px;height:30px; line-height:30px; text-align:center; background-color:#F0F0F0; font-size:22px; font-family:Verdana, Geneva, sans-serif; color:#aaa; font-weight:bold; margin-top:10px;}
</style>
	<div class="img-scroll">
		<div class="scroll img-list" id="content_content">
			<ul id="pic_url"  class="list_main_big" style="margin-left: 0px;">
                    <c:forEach var="item" items="${votelist}">
                    <li>
                    <div class="pic"><a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></div>
                    <div class="bg"></div>
                    <div class="text">
                      <div class="PrdtJg"  style="margin-left:5px;">
                      <c:if test="${item.discounttype!='2'}">
                      	<del style="color:#FFF">$${item.marketprice}</del>&nbsp;&nbsp;
                      </c:if>
                      
                      <a href="#">$${item.discount}</a></div>
                      <div class="PrdtMc"  style="margin-left:5px;"><a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}">${item.name}</a></div>
                      <div class="PrdtDx"  style="margin-left:5px;"><a href="<%=path  %>/university_cn/${item.memo}">${item.parentname}</a></div>
                    </div>
                    
                    <!-- 对三种优惠类型进行输出 -->
                    <c:if test="${item.discounttype=='1'}">
                    	<div class="vovo1">
                    	${item.uniquediscount_cn}
                    </div>	
                    </c:if>
                    <c:if test="${item.discounttype=='2'}">
                    	<div class="vovo2">
                    	${item.uniquediscount_cn}
                    </div>	
                    </c:if>
                     <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                    	<div class="vovo3">
                    	${item.uniquediscount_cn}
                    </div>	
                    </c:if>
                    
                  </li>
                  </c:forEach>
			</ul>
		</div>
        <div class="butt">
            <span class="prev">&lt;</span>
            <span class="next">&gt;</span>
        </div>
	</div>
	<script type="text/javascript">
    
    
     function DY_scroll(wraper,prev,next,img,speed,or)
     { 
      var wraper = $(wraper);
      var prev = $(prev);
      var next = $(next);
      var img = $(img).find('ul');
      var w = img.find('li').outerWidth(true);
      var s = speed;
      next.click(function()
           {
            img.animate({'margin-left':-w},function()
                      {
                       img.find('li').eq(0).appendTo(img);
                       img.css({'margin-left':0});
                       });
            });
      prev.click(function()
           {
            img.find('li:last').prependTo(img);
            img.css({'margin-left':-w});
            img.animate({'margin-left':0});
            });
      if (or == true)
      {
       ad = setInterval(function() { next.click();},s*2000);
       wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() { next.click();},s*2000);});
    
      }
     }
     DY_scroll('.img-scroll','.prev','.next','.img-list',2,true);// true为自动播放，不加此参数或false就默认不自动
    </script>
            </div>
        </div>
    	<div class="divProductRight">
        	<div class="dplHead">
            	最新公寓
                
            </div>
          <div class="dplMain">
            <script type="text/javascript" src="<%=path  %>/resources-cn/web/js/common.js"></script>
			<ul id="srool">
			<c:forEach var="item" items="${newlist}"><!--公寓动态-->
            <li>
            	<dl>
                	<dd class="pic"><a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></dd>
                    <dd class="info">
                        <a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}"><c:out value="${item.name}"></c:out></a>
                    </dd>
                    <dd class="price">From $<c:out value="${item.discount}"></c:out></dd>
                </dl>
            </li>
            </c:forEach>
                                               
        </ul>
            </div>
            <div class="rightMore">
	            <a href="<%=path  %>/university_cn">更多...</a>
            </div>
        </div>        
    </div>
</div>
<div class="clearDiv"></div>

<div class="FrameMap">
    <div class="divMapHead">
    	<img src="<%= path2 %>/resources-cn/web/images/tit_map.jpg">
    </div>

	<div class="divMapShow">
        <div class="divMapLeft">
            	${map_cn.content}
        </div>
        <div class="divMapRight">
           <div class="divMapRight">
              <iframe style="float:right; width:800px; height:500px;" allowtransparency="true" frameborder="0" scrolling="no" src="<%= path%>/resources-cn/MapDiv.html"></iframe>
        </div>
        </div>
	</div>
</div>


<div class="FrameCases">
    <div class="divCasesHead">
    	<img src="<%= path2 %>/resources-cn/web/images/tit_blog.jpg">
    </div>
    <div class="divCasesList">
    	<div class="divCaseListDot2">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[0].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[0].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[0].id}"><c:out value="${allthread15[0].title}"></c:out></a></div>
        </div>

        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[1].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[1].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[1].id}"><c:out value="${allthread15[1].title}"></c:out></a></div>
        </div>
        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[2].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[2].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[2].id}"><c:out value="${allthread15[2].title}"></c:out></a></div>
        </div>

        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[3].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[3].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[3].id}"><c:out value="${allthread15[3].title}"></c:out></a></div>
        </div>

        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[4].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[4].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[4].id}"><c:out value="${allthread15[4].title}"></c:out></a></div>
        </div>

        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[5].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[5].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[5].id}"><c:out value="${allthread15[5].title}"></c:out></a></div>
        </div>

        <div class="divCaseListDot">
	        <div class="CaseTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[6].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[6].logo}" /></a></div>
            <div class="CaseMc"></div>
            <div class="CaseJg"><a href="../bbs_cn/bbsshow.html?id=${allthread15[6].id}"><c:out value="${allthread15[6].title}"></c:out></a></div>
        </div>

    </div>
</div>


<div class="FrameBbs">
    <div class="divCasesList">
    	<div class="community1">
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[7].logo}" width="90" height="65" /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[7].id}">${allthread15[7].title}</a></dd>
                <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[7].memo}</dd>
            </dl>
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[8].logo}" width="90" height="65" /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[8].id}">${allthread15[8].title}</a></dd>
                <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[8].memo}</dd>
            </dl>
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[9].logo}" width="90" height="65" /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[9].id}">${allthread15[9].title}</a></dd>
                <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[9].memo}</dd>
            </dl>
            <div>
                <h3>Find your next home here </h3>
                <p>Reserve Online</p>
            </div>

        </div>
    	<div class="community2">
	        <div class="BbsTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[10].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[10].logo}" /></a></div>
            <div class="BbsMc"><a href="../bbs_cn/bbsshow.html?id=${allthread15[10].id}"><c:out value="${allthread15[10].title}"></c:out></a></div>
        </div>
    	<div class="community3">
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[11].logo}" width="90" height="65"  /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[11].id}"><c:out value="${allthread15[11].title}"></c:out></a></dd>
                 <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[11].memo}</dd>
            </dl>
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[12].logo}" width="90" height="65"  /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[12].id}"><c:out value="${allthread15[12].title}"></c:out></a></dd>
                 <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[12].memo}</dd>
            </dl>
            <dl>
                <dt><img src="<%= path2 %>/fileupload/images/${allthread15[13].logo}" width="90" height="65"  /></dt>
                <dd><a href="../bbs_cn/bbsshow.html?id=${allthread15[13].id}"><c:out value="${allthread15[13].title}"></c:out></a></dd>
                 <dd class="community1_small" style="height:40px;width:130px;overflow:hidden; display:none">${allthread15[13].memo}</dd>
            </dl>
            <div>
                <h3>WE know you need more.</h3>
                <p>Guidance & Tips</p>
            </div>

        </div>
    	<div class="community4">
	        <div class="BbsTp"><a href="../bbs_cn/bbsshow.html?id=${allthread15[14].id}"><img src="<%= path2 %>/fileupload/images/${allthread15[14].logo}" /></a></div>
            <div class="BbsMc"><a href="../bbs_cn/bbsshow.html?id=${allthread15[14].id}"><c:out value="${allthread15[14].title}"></c:out></a></div>
        </div>
	</div>	
</div>

<c:if test="${act=='reset'}">
<script language="javascript">
	window.onload=function(){
	showPopWin('<%= path %>/others/resetpassword.html', 550, 290, null);
			}
</script>
</c:if>
<c:if test="${act=='login'}">
<script language="javascript">
	window.onload=function(){
	showPopWin('<%= path %>/others/login.html', 550, 290, null);
			}
</script>
</c:if>

<%
	String path1 = request.getContextPath();
%>
<div class="clearDiv"></div>

<div class="FrameFoot">
	<div class="FootMenu">
        <div class="about">
            	<h1>About Us</h1>
                ${aboutme.content}
        </div>

       <%--  <div class="partner">
	        	<h1>Partnership</h1>
	        	<c:forEach var="item" items="${footerpartnershiplist}">
	        		<a href="<%=path1 %>/about/partnership.html?id=${item.id}">${item.title}</a><br/>
	        	</c:forEach>
	            
        </div> --%>
        
        <div class="contact">
            <h1>Contact Us</h1>
       		 ${tact.content}
        </div>
        
        <div class="wechat">
             ${ewm.content}
        </div>    	
    </div>

</div>
 <A id="StranLink" href="#" style="display:none">繁體中文</A>
  <input type="hidden" id="WebLanguageVersion" value="${WebLanguageVersion}">
<div class="FrameCopyright">

    <div class="FootCopyright">
    	<div class="CopyRight">
        	 ${copyright.content}
        </div>
        <div class="Shares" style="display:none">
        	<a href=""><img src="<%= path1 %>/resources/web/images/share_1.jpg" /></a>&nbsp;
            <a href=""><img src="<%= path1 %>/resources/web/images/share_2.jpg" /></a>&nbsp;
            <a href=""><img src="<%= path1 %>/resources/web/images/share_3.jpg" /></a>&nbsp;
            <a href=""><img src="<%= path1 %>/resources/web/images/share_4.jpg" /></a>&nbsp;
            <a href=""><img src="<%= path1 %>/resources/web/images/share_5.jpg" /></a>&nbsp;
        </div>
    </div>
</div>


<div class="siteQQ">
	<ul>
	  <li>
      		<img src="/resources/web/images/qqLogo.jpg">
      </li>
	  <li>
      		<div class="siteQQbox">
            <div style="float:left;"><img src="/resources/web/images/qqTel.jpg"></div>
            <div style="float:left; width:155px; text-align:center;">+1 (510) 761-8000</div>
            </div>
      </li>
	  <li>
      		<div class="siteQQbox">
            <div style="float:left;"><img src="/resources/web/images/qqSkype.jpg"></div>
            <div style="float:left; margin-top:15px; margin-left:20px;"><a target="blank" href="skype:mengsajewel?call"><img src=http://mystatus.skype.com/smallclassic/worldeliteswe style="border: none;" alt="Call me!" /></a></div>
          </div>
      </li>
	  <li>
      <div class="siteQQbox">
      <div style="float:left;"><img src="/resources/web/images/qqQQ.jpg"></div>
      <div class="qqqqqq">
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=978104985&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=1:978104985:6" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>

        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1446499921&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=1:1446499921:6" alt="点击这里给我发消息"  title="点击这里给我发消息"/></a>
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=568447097&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=1:568447097:6" alt="点击这里给我发消息"  title="点击这里给我发消息"/></a>
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=565291764&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=1:565291764:6" alt="点击这里给我发消息"  title="点击这里给我发消息"/></a>
      </div>
      </div>
      </li>
	  <li>
     <div class="siteQQbox">
    	 <div style="text-align:center"><img src="/resources/web/images/qqEmail.jpg"></div>
	     <div style="float:left; width:155px; text-align:center;"><a href="mailto:contact@worldelites.com">contact@worldelites.com</a></div>
     </div>
      </li>
	  <li>
      		<div class="siteQQbox">
            <div style="float:left;"><img src="/resources/web/images/qqShare.jpg"></div>
            <div style="float:left; text-align:center; margin-top:12px;">
            
            <div class="bshare-custom icon-medium-plus"><a title="分享到" href="http://www.bShare.cn/" id="bshare-shareto" class="bshare-more"></a><a title="分享到Facebook" class="bshare-facebook"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到微信" class="bshare-weixin"></a><a title="分享到人人" class="bshare-renren"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
            
    
            </div>
          </div>
      </li>
	  <li>
      	<a href="javascript:goTop();" class="siteQQtop"><img src="/resources/web/images/qqTop.jpg"></a>
      </li>
  </ul>
</div>
<script type="text/javascript">
$(function(){
	$(".siteQQ ul li").hover(function(){
		$(this).find(".siteQQbox").stop().animate({"width":"240px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#E0E0E0","padding":"1px"})	
	},function(){
		$(this).find(".siteQQbox").stop().animate({"width":"65px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#E0E0E0","padding":"1px"})	
	});
});
//回到顶部函数
function goTop(){
	$('html,body').animate({'scrollTop':0},300);
}
</script>

<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F2c6c890a57405d155bcc37a4ba16d476' type='text/javascript'%3E%3C/script%3E"));
</script>

</body>
<script type="text/javascript" src="<%= path1 %>/resources/web/js/big52gb.js"></script>