<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="head.jsp" %>

<div class="FrameAbout">
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
		<div id="regDiv3">
         <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                 <td colspan="3"  height="78" style="line-height:1.8; color:#900"><p>&nbsp;&nbsp;&nbsp;&nbsp;注册新账号：：</p>
                 <p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#000">1：填写注册信息</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#000">2：邮件激活</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#F6AB00">3：欢迎来到WE</span></p><hr /></td>
             </tr>
               <tr>
                 <td style="padding:15px;"><p><br>
                   Hi, Welcome to WE Housing!：</p>
                 <p>Now that you’ve set up WE Housing account, 
you can tour around and find out the best housing option.！</p>
                 <br>
                 <p><input type="button" class="submit" value="Log in to my account" onClick="showPopWin('<%= path %>/others/login.html', 550, 290, null);"></p>
                 </td>
               </tr>
             </table>
             <br>
             <div style="width:100px; height:300px;">&nbsp;</div>
  </div>
</div>

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