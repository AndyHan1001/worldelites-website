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
                    <p>What WE Do</p>
                  
                </div>
                <div class="dplMain">
                    <ul>
                    <c:forEach items="${aboutlist}" var="item">
                         <c:choose>
	                    	<c:when test="${item.id==classid}">
	                    		<li style="float:left;background-color:#FFF; background-image:url(<%=path2 %>/resources/web/images/arrow_y.png); background-repeat:no-repeat;"><a href="about.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    	<c:when test="${item.id!=classid}">
	                    		<li><a href="about.html?id=${item.id}">${item.title }</a></li>
	                    	</c:when>
	                    </c:choose>
                    </c:forEach>     
                                       
                    </ul>
                </div>
            </div>
            
            <div class="clearDiv2"></div>
            
            <div class="AboutMail">
            <p>More Questions?</p><br>
			<img src="<%= path2 %>/resources/web/images/aboutMail.png" /><br>
			Shoot us an email and we will get back to you as soon as possible. 
            </div>
            
            <div class="AboutTime">
            <p>Office Hour</p><br>
			<img src="<%= path2 %>/resources/web/images/aboutTime.png" /><br>
            Monday – Friday <br>
            9:30 am – 5:30 pm<br>
            Weekends Closed
            </div>
            
        </div>
        <div class="MainRight">                           
        	${aboutonecontent[0].content}
        </div>
    </div>
</div>

<%@include file="../footer.jsp" %>