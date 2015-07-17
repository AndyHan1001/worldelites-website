<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<script type="text/javascript" src="<%= path2 %>/resources/web/js/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="<%= path2 %>/resources/web/css/about.css" type="text/css" />
<form action="<%=path2 %>/loginSuccess.html" method="get" name="from1" id="form1" target="_parent">
  <table width="540" border="0" align="left" cellpadding="0" cellspacing="0" style="font-size:12px;">
    <tr>
      <td height="280" align="center" bgcolor="#FFFFFF">
      <table align="center" width="280">
        <tr>
          <td width="60" height="35" style="font-size:13px; ">Email </td>
          <td><input name="mail" id="mail" style="width:150px;"/></td>
        </tr>
        <tr>
          <td height="35" style="font-size:13px; ">Password </td>
          <td><input name="password" type="password" id="user_pw"  style="width:150px;"/></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
          	<input type="button" class="submit" onclick="login()" value="Login" />
          	<script>
          		function login(){
          			$.post("validateLogin.html",{mail:$("#mail").val(),password:$("#user_pw").val()},function(data){
          				if(data!="loginSuccess"){
          					alert(data);
          				}else{
          					parent.hidePopWin(false);
          					parent.location.reload();
          				}
          			},"text");
          		}
          	</script>
            <input type="reset" class="reset" value="Reset" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td style="font-size:12px;"><a href="reg.html?act=regdo" target="_parent">Sign up</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="resetpassword.html" target="_self">Forgot Password？</a></td>
        </tr>
      </table>
      </td>
      <td valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" align="right" valign="top"><a onclick="parent.hidePopWin(false);"><span style="color:#666; cursor:pointer">[x]</span></a></td>
        </tr>
      </table>
      <img src="<%= path2 %>/resources/web/images/loginLogo.jpg" width="160"  />
      </td>
   </tr>
</table>
</form>