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

<script language="javascript">
window.onload=function(){
   $(".UniversityList dt").each(function(){
	$(this).click(function(){
		$(this).next("dd").toggleClass("expanded");
	});
})
   
   $("#G"+$("#showSchool").val()).next("dd").toggleClass("expanded");//显示指定id的dd
   $('html,body').animate({scrollTop:$("#G"+$("#showSchool").val()).offset().top},1000);//滚动到此处
   
	
};
</script>
<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>关于WE</p>
                  
                </div>
                <div class="dplMain">
                    <ul>
                    <c:forEach items="${aboutlist}" var="item">
                         <c:choose>
	                    	<c:when test="${item.id==classid}">
	                    		<li style="float:left;background-color:#FFF; background-image:url(<%=path2 %>/resources/web/images/arrow_y.png); background-repeat:no-repeat;"><a href="about.html?id=${item.id}">${item.title_cn }</a></li>
	                    	</c:when>
	                    	<c:when test="${item.id!=classid}">
	                    		<li><a href="about.html?id=${item.id}">${item.title_cn }</a></li>
	                    	</c:when>
	                    </c:choose>
                    </c:forEach>     
                                       
                    </ul>
                </div>
            </div>
            
            <div class="clearDiv2"></div>
            
            <div class="AboutMail">
            <p>更多问题？</p><br>
			<img src="<%= path2 %>/resources/web/images/aboutMail.png" /><br>
			发送邮件至 <a href="mailto:contact@worldelites.com"><span style="color:#03F">contact@worldelites.com</span></a> <br>我们会尽快回复您。 </div>
            
            <div class="AboutTime">
            <p>工作时间</p>
			<img src="<%= path2 %>/resources/web/images/aboutTime.png" /><br>
            周一 至 周五 <br>
            上午9:30am – 下午5:30pm<br>（太平洋时间）<br>
            周末休息
            </div>
            
        </div>
        <div class="MainRight">                           
        	${aboutonecontent[0].content_cn}
        </div>
    </div>
</div>

<%@include file="../others/footer.jsp" %>