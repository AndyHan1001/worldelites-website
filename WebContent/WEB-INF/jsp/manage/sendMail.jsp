<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#b").click(function(){
			$.post("sendMailDo.html",{},function(data){
				
			},"text");
			
		});
		
	});
</script>
<button id="b">
	
</button>
