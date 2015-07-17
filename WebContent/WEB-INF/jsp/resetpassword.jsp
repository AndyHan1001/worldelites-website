<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<script type="text/javascript" src="<%= path2 %>/resources/web/js/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="<%= path2 %>/resources/web/css/about.css" type="text/css" />


  <table width="540" border="0" align="left" cellpadding="0" cellspacing="0" style="font-size:12px;">
    <tr>
      <td height="280" align="center" bgcolor="#FFFFFF">
<table align="center" width="280" style="font-size:12px;">
                <tr>
                  <td height="35" colspan="2">Forgot Password?</td>
                </tr>
                <tr>
                  <td height="35">Email：</td>
                  <td><input name="mail" id="mail" /></td>
                </tr>
                
                <tr>
                <td>validate code：</td>
              	<td><input type="text" id="entercode" style="width:60px;" />
               <script type="text/javascript">
				    function refresh(obj) {
				        obj.src = "getValidateImage.html?"+Math.random();
	    			}
    			</script>
              	<img title="点击更换" id="validateCode" onclick="javascript:refresh(this);" src="getValidateImage.html?"+Math.random()><br/>
            	</td>
            	</tr>
                
                
                
                
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><input type="button" class="submit" id="sub" value="Next" />
                    </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td style="font-size:12px;">&nbsp;</td>
                </tr>
              </table>
      </td>
      <td valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" align="right" valign="top"><a onclick="parent.hidePopWin(false);"><span style="color:#F60; cursor:pointer">[x]</span></a></td>
        </tr>
      </table>
      <img src="<%= path2 %>/resources/web/images/loginLogo.jpg" width="160"  />
      </td>
   </tr>
</table>

<script type="text/javascript">
	$(function(){
		$("#sub").click(function(){
			$.get("resetpassworddo.html",{mail:$("#mail").val(),code:$("#entercode").val()},function(data){
				if(data=="1"){
					alert("邮件已发送到您的邮箱,请尽快进行修改操作!");
					parent.location="/index.html";
				}else if(data=="-1"){
					alert("邮箱不存在,请确认!");
					$("#validateCode").attr("src",$("#validateCode").attr("src"));
				}else{
					alert("validate error!");
					$("#validateCode").attr("src",$("#validateCode").attr("src"));
				}
			},"text");
		});
	});
</script>