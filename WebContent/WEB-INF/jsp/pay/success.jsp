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
    
    <div class="order">
        
        <div id="">
            <div class="order_percent">
                <img src="<%=path2 %>/resources/web/images/jindu5.jpg" />
            </div>
            <div class="order_content">
            		<c:if test="${payState=='ok'}">
     					<br><br><br><br><center>Pay Success!</center>
     				</c:if>
     				<c:if test="${payState=='error'}">
     				<br><br><br><br><center>Pay Fail!</center>
     				</c:if>
            </div>
        </div>
        
    </div>


    <div class="su_rt fixed" id="sidebar">

               
                  <div class="s_btn">
                    
                </div>
                
                </div>
                
    
    </div>

</div>

<%@include file="../footer.jsp" %>