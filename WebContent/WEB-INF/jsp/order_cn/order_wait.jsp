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

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order" style="width:100%">
    	<div id="">
            <div class="order_percent">
                <img src="<%= path2 %>/resources/web/images/jindu5.jpg" />
            </div>
            
           <div style="width:680px;margin:0 auto;margin-top:10px;">
					<div style="width:100px;height:100px;float:left;margin-top:30px;">
						<img  src="<%=path %>/resources/web/images/order_logo.jpg" width="100" height="100" />
					</div>
					<div style="width:550px;float:right;margin-top:30px;" align="left">
						<h1 style="color:#ABC138;line-height:40px;;" align="left">Submitted!</h1>
						<br />
						<p>*Please note you have NOT YET completed the application. It takes us 1-2 </p>
						<p>business days to verify your information. You will be contacted by our</p>
					    <p>Customer Service Manager or the Apartment Leasing Manager regarding</p> 
					    <p>the next step.</p>
						<p>For any question, please feel free to call us at <b>+1 (510) 761-8000</b> or email</p>
						<p>to <b>contact@worldelites.com</b></p>
					</div>
            </div>

        </div>
    
    </div>
    </div>

</div>

<div style="clear:both;height:100px;"></div>
<%@include file="../others/footer.jsp" %>