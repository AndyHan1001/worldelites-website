<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
	String code=request.getParameter("code");
	int k=code.indexOf("|");
	String strmail=code.substring(0, k);
	String strtoken=code.substring(k+1);
	
%>
<%@include file="head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="<%= path2 %>/resources-cn/web/js/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="<%= path2 %>/resources-cn/web/css/about.css" type="text/css" />
<form action="<%=path2 %>/others/newpassworddo.html" method="post" name="from1" id="form1" target="_parent">
  <table width="540" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px;">
    <tr>
      <td height="280" align="center" bgcolor="#FFFFFF">
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <table align="center" width="250" style="font-size:12px;">
                <tr>
                  <td height="35" colspan="2" align="left">邮件验证通过，请设置您的新密码：</td>
                </tr>
                <tr>
                  <td width="60" height="35" align="left">密码</td>
                  <td align="left"><input name="password" /></td>
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left"><input name="mail" type="hidden" id="mail" value="<%=strmail%>" />
                  		<input name="token" type="hidden" id="token" value="<%=strtoken %>" />
                  </td>
                </tr>
                
                <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left"><input type="submit" class="submit" value="设置新密码" />
                    </td>
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>
                  <td align="left" style="font-size:12px;">&nbsp;</td>
                </tr>
              </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
      <td bgcolor="#FFFFFF">
      <img src="<%= path2 %>/resources/web/images/loginLogo.jpg" width="160"  />
      </td>
   </tr>
</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>