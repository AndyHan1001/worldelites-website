<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="head.jsp" %>




<script src="<%=path2 %>/resources/web/formvalidator413/demo/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/DateTimeMask.js" type="text/javascript"></script>

<!-- <script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({theme:"126",submitOnce:true,formID:"form1",
		onError:function(msg){alert(msg);},
		submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
	});
		
	$("#name_first").formValidator({onShowFixText:"请输入您的姓氏",onShow:"请输入姓氏",onFocus:"姓氏的长度不能大于20位",onCorrect:"姓氏输入正确"})
	.inputValidator({min:1,max:20,onError:"姓氏长度必须小于20位,请确认"})
	
	$("#name_last").formValidator({onShowFixText:"请输入您的名字",onShow:"请输入名字",onFocus:"名字的长度不能大于20位",onCorrect:"名字输入正确"})
	.inputValidator({min:1,max:20,onError:"名字长度必须小于20位,请确认"})
	
	$("#newschool").formValidator({onShowFixText:"请选择您将要就读的大学，及所在州"});
	
	$("#mail").formValidator({onShowFixText:"6~18个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾",onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",onCorrect:"恭喜你,你输对了"})
	.inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"})
	.regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"})
	.ajaxValidator({
		dataType : "text",
		async : true,
		url : "validateRegMail.html",
		success : function(data){
            	if( data == "" || data==null ) return "该邮箱已被注册，请更换";
			return true;
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该用户名不可用，请更换用户名",
		onWait : "正在进行合法性校验，请稍候..."
	});
	
	$("#mail2").formValidator({onShowFixText:"6~18个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾",onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",onCorrect:"恭喜你,你输对了"})
	.compareValidator({desID:"mail",operateor:"=",onError:"2次邮箱不一致,请确认"});
	
	
	$("#password1").formValidator({onShowFixText:"6~16个字符，包括字母、数字、特殊符号，区分大小写",onShow:"请输入密码",onFocus:"至少1个长度",onCorrect:"密码合法"})
	.inputValidator({min:6,max:16,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码长度错误,请确认"})
	.passwordValidator({compareID:"us"});
	
	$("#password2").formValidator({onShowFixText:"请再次输入密码",onShow:"输再次输入密码",onFocus:"至少1个长度",onCorrect:"密码一致"})
	.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"})
	.compareValidator({desID:"password1",operateor:"=",onError:"2次密码不一致,请确认"});
	
	$("#phone").formValidator({onShowFixText:"输入您的手机以便我们与您及时联系",onShow:"请输入手机号码",onFocus:"手机的长度必须是11位",onCorrect:"手机合法"})
	.inputValidator({min:11,max:11,onError:"手机号码必须为11位,请确认"})
	.regexValidator({regExp:"mobile",dataType:"enum",onError:"手机的格式不正确"});
	
	$("#addr").formValidator({onShowFixText:"输入您的地址",onShow:"请输入地址",onFocus:"地址的长度不能大于255位,不可为空",onCorrect:"地址输入正确"})
	.inputValidator({min:1,max:255,onError:"地址长度不能大于255位,请确认"});
	
	$("#nowstate").formValidator({onShowFixText:"请选择您现在的状态"});
	
	$("#countyies").formValidator({onShowFixText:"请选择您的国家"});
	
	$("#credit").formValidator({onShowFixText:"请选择您的信用卡类型"});
	
	$("#knowweby").formValidator({onShowFixText:"请选择您知道我们通过什么途径"});
	
    $("#content").formValidator({onShowFixText:"赶快输入您的自我描述吧",onShowText:"这家伙很懒，什么都没有留下。",ajax:true,onShow:"请输入你的描述",onFocus:"描述至少要输入10个汉字或20个字符,最多输入1000个汉字，2000个字符",onCorrect:"恭喜你,你输对了",defaultValue:"这家伙很懒，什么都没有留下。"})
	//.inputValidator({min:20,max:1000,onError:"你输入的描述长度不正确,请确认"});
});
</script> -->

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({theme:"126",submitOnce:true,formID:"form1",
		onError:function(msg){alert(msg);},
		submitAfterAjaxPrompt : ''
	});
		
	$("#name_first").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:1,max:20,onError:""})
	
	$("#name_last").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:1,max:20,onError:""})
	
	$("#newschool").formValidator({onShowFixText:""});
	
	$("#mail").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:6,max:100,onError:""})
	.regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:""})
	.ajaxValidator({
		dataType : "text",
		async : true,
		url : "validateRegMail.html",
		success : function(data){
            	if( data == "" || data==null ) return "";
			return true;
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert(""+errorThrown);},
		onError : "",
		onWait : ""
	});
	
	$("#mail2").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.compareValidator({desID:"mail",operateor:"=",onError:""});
	
	
	$("#password1").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:6,max:16,empty:{leftEmpty:false,rightEmpty:false,emptyError:""},onError:""})
	.passwordValidator({compareID:"us"});
	
	$("#password2").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:""},onError:""})
	.compareValidator({desID:"password1",operateor:"=",onError:""});
	
	$("#phone").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:11,max:11,onError:""})
	.regexValidator({regExp:"mobile",dataType:"enum",onError:""});
	
	$("#addr").formValidator({onShowFixText:"",onShow:"",onFocus:"",onCorrect:""})
	.inputValidator({min:1,max:255,onError:""});
	
	$("#nowstate").inputValidator({ min: 1, onerror: "" });
	
	$("#countyies").inputValidator({ min: 1, onerror: "" });
	
	$("#credit").inputValidator({ min: 1, onerror: "" });
	
	$("#newschool_s").inputValidator({ min: 1, onerror: "" });
	
	$("#knowweby_s").inputValidator({ min: 1, onerror: "" });
	
});
</script>


<style type="text/css">
tr{height:30px; font-size:14px;}
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
tr{height:40px; border:1px solid #eeeeee;}
.noTr{border-top:0px solid #eeeeee; border-bottom:0px solid #eeeeee;}
</style>
</head>

<body>
<div class="FrameAbout">
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div id="regDiv1" class="reg">
	<form action="userReg.html" method="post" name="reg" id="form1">
    <table width="900" border="0" align="center" cellpadding="2" cellspacing="2">
          
    <tr>
        <td colspan="3" height="78" style="line-height:1.8; color:#900"><p>&nbsp;&nbsp;&nbsp;&nbsp;注册新账号：：</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#F6AB00">1：填写注册信息</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#000">2：邮件激活</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#000">3：欢迎来到WE</span></p><hr /></td>
        </tr>
    <tr>
       <td width="230" rowspan="1" align="right">* First Name:&nbsp;&nbsp;&nbsp;</td>
      <td style="width:"><input type="text" id="name_first" name="name" placeholder="  First Name (same name as on your passport)" /></td>
      <td style="width:"><div id="name_firstTip" style="width:280px"></div></td>
    </tr>

    <tr class="noTr">
     <td width="230" rowspan="1" align="right">* Last Name:&nbsp;&nbsp;&nbsp;</td>
      <td><input type="text" id="name_last" name="lastname" placeholder="  Last Name (same name as on your passport)" /></td>
      <td><div id="name_lastTip" style="width:280px"></div></td>
    </tr>

    <tr>
      <td width="230" rowspan="2" align="right">* Email:&nbsp;&nbsp;&nbsp;</td>
      <td><input type="text" id="mail" name="mail" placeholder="  Email Address" /></td>
      <td><div id="mailTip" style="width:280px"></div></td>
    </tr>

    <tr class="noTr">
      <td><input type="text" id="mail2" placeholder="  Confirm your Email Address" /></td>
      <td><div id="mail2Tip" style="width:280px"></div></td>
    </tr>

    <tr>
      <td width="230" rowspan="2" align="right">* Password: &nbsp;&nbsp;</td>
      <td><input type="password" id="password1" name="password1" placeholder="  Password" /></td>
      <td><!-- <div id="password1Tip" style="width:280px"></div> --></td>
    </tr>

    <tr class="noTr">
      <td><input type="password" id="password2" name="password" placeholder="  Confirm Password" /></td>
      <td><div id="password2Tip" style="width:280px"></div></td>
    </tr>

     <tr>
      <td width="230" align="right">* Status:&nbsp;&nbsp;&nbsp;</td>
      <td><select name="nowstate" class="g-slt" id="nowstate" style="width:303px">
        <option value="none" >Please select</option>
         <option value="Undergraduate" >Undergraduate</option>
        <option value="Graduate" >Graduate</option>
        <option value="PhD/Post Doc" >PhD/Post Doc</option>
        <option value="Faculty" >Faculty</option>
        <option value="Alumni" >Alumni</option>
      </select></td>
      <td><div id="nowstateTip" style="width:280px"></div></td>
    </tr>

    <tr>
       <td width="230" align="right">* Citizenship:&nbsp;&nbsp;&nbsp;</td>
      	 <td>
	      <select name="countries" class="g-slt" id="countyies" style="width:303px"></select>
        </td>
         <td >
         		<div id="countyiesTip" style="width:280px"></div>
		</td>
    </tr>
      <tr>
      <td width="230" align="right">* VISA Type:&nbsp;&nbsp;&nbsp;</td>
      <td><select name="credit" class="g-slt" id="credit" style="width:303px">
      <option value="none" >Please select</option>
        <option value="F1/F2" >F1/F2</option>
        <option value="B1/B2" >B1/B2</option>
        <option value="J1/J2" >J1/J2</option>
        <option value="H1B/H4" >H1B/H4</option>
        <option value="Permanent residents" >Permanent residents (green card)</option>
        <option value="Not applicable" >Not applicable</option>
      </select></td>
      <td><div id="creditTip" style="width:280px"></div></td>
    </tr>
    <tr>
       <td width="230" align="right">* University:&nbsp;&nbsp;&nbsp;</td>
      	 <td>
      	<input name="newschool"  id="newschool" type="text" style="display:none; width:300px;">
        <select name="newschool_s" class="g-slt" id="newschool_s" onChange="show_other_newschool()" style="width:303px" >
		</select>
        <script language="javascript">
	  	function show_other_newschool()
		{
			document.getElementById("newschool").value=document.getElementById("newschool_s").value;
			if(document.getElementById("newschool_s").value=="Others")
			{
			document.getElementById("newschool_s").style.display="none";
			document.getElementById("newschool").style.display="block";
			}
			
			
		}
	  </script>

        </td>
         <td>
         	<div id="newschool_sTip" style="width:280px"></div>
		</td>
    </tr>
    <tr>
      <td width="230" align="right">* How do you hear about us?:&nbsp;&nbsp;&nbsp;</td>
      <td>
      	<input name="knowweby"  id="knowweby" type="text" style="display:none; width:300px;">
        <select name="knowweby_s" class="g-slt" id="knowweby_s" onChange="show_other_knowweby()" style="width:303px" >
        <option value="none" >Please select</option>
        <option value="WorldElites.com" >WorldElites.com</option>
        <option value="Student organization" >Student organization</option>
        <option value="Facebook" >Facebook</option>
        <option value="Renren" >Renren</option>
        <option value="Sina Weibo" >Sina Weibo</option>
        <option value="WeChat" >WeChat</option>
        <option value="QQ" >QQ</option>
        <option value="iWoJu" >iWoJu</option>
        <option value="ICON Union" >ICON Union</option>
        <option value="Friend referral" >Friend referral</option>
        <option value="Others" >Others</option>
      </select>
      <script language="javascript">
	  	function show_other_knowweby()
		{
			document.getElementById("knowweby").value=document.getElementById("knowweby_s").value;
			if(document.getElementById("knowweby_s").value=="Others")
			{
			document.getElementById("knowweby_s").style.display="none";
			document.getElementById("knowweby").style.display="block";
			}
			
			
			
		}
	  </script>
      
      </td>
      <td><div id="knowweby_sTip" style="width:280px"></div></td>
    </tr>
</table>


	<table width="900" border="0px" align="center" cellpadding="2" cellspacing="2" style="font-size:12px">
	  <tr>
	    <td width="230" align="right">&nbsp;</td>
	    <td><input type="submit" class="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;
	      <input type="reset" class="reset" value="Reset" /></td>
	  </tr>
			   
	      </table>
</form>      
    </div>
</div>

</body>

<script type="text/javascript">
	window.onload=function(){
		var text="";
		$.get("getAllSchool.html",{},function(data){
			text="";
			document.getElementById("newschool").value=data[0].name;
			for(i=0;i<data.length;i++){
				text+="<option value='"+data[i].id+"@"+data[i].name+"''>"+data[i].name+"</option>";
			}
			text+="<option value='Others'>Others</option>";
			text="<option value='none'>Please select</option>"+text;
			$("#newschool_s").html(text);
		},"json");
		
		$.get("getAllCountyies.html",{},function(data){
			text="";
			for(i=0;i<data.length;i++){
				text+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
			}
			text="<option value='none'>Please select</option>"+text;
			$("#countyies").html(text);
		},"json");
		
	}
	
	

</script>

<%@include file="footer.jsp" %>