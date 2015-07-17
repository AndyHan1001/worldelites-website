<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="head.jsp" %>




<script src="<%=path2 %>/resources/web/formvalidator413/demo/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path2 %>/resources/web/formvalidator413/demo/DateTimeMask.js" type="text/javascript"></script>


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
	
    $("#content").formValidator({onShowFixText:"",onShowText:"",ajax:true,onShow:"",onFocus:"",onCorrect:"",defaultValue:""})
	//.inputValidator({min:20,max:1000,onError:"你输入的描述长度不正确,请确认"});
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
        <td colspan="3" height="78" style="line-height:1.8; color:#900"><p>&nbsp;&nbsp;&nbsp;&nbsp;New Account：</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#F6AB00">1：Account Information</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#000">2：Account Activation</span>&nbsp;&nbsp;->&nbsp;&nbsp;<span style="color:#000">3：Welcome to WE</span></p><hr /></td>
        </tr>
    <tr>
       <td width="230" rowspan="1" align="right">* First Name:&nbsp;&nbsp;&nbsp;</td>
      <td style="width:"><input type="text" id="name_first" name="name" placeholder="  First Name (same name as on your passport)" /></td>
      <td style="width:"><div id="name_firstTip" style="width:280px"></div></td>
    </tr>

    <tr class="noTr">
     <td width="230" rowspan="1" align="right">*Last Name:&nbsp;&nbsp;&nbsp;</td>
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