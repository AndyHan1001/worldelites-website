<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>

<body>
<script type="text/javascript">
	function formatterstate(target, container, frozen){
		if(target == 0)
			return "禁用 ";
		else
			return "激活";
	}
	var two="";
	
	function testUserName(v){
		$.post("testPassport.html?passport="+v,{},function(data){
			if(data==false){
				$("#showPassportFalse").show();
				$("#showPassportTure").hide();
				$("#isSubmit").val("0");
			}else{
				$("#showPassportFalse").hide();
				$("#showPassportTure").show();
				$("#isSubmit").val("1");
			}
		},"json")
	}
	function getCitySsidByName(name){
		var returnString="";
		$.post("getCitySsidByName.html?name="+name,{},function(data){
			returnString=data;
		},"text");
		return returnString;
	}
</script>
	
	<h2>用户管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="id" >id</option>
                        		<option value="passport" >账号</option>
								<option value="name" >firstname</option>
								<option value="lastname" >lastname</option>
								<option value="sex" >性别</option>
								<option value="nationality" >国籍</option>
								<option value="passportNo" >护照号</option>
								<option value="newschool" >将要就读的学校</option>
								<option value="knowweby" >知道我们通过</optiond>
								<option value="phone" >手机</option>
								<option value="mail" >用户邮箱</option>
								<option value="typecode" >渠道编码</option>
								<option value="state" formatter="formatterstate">用户账号状态</option>
                       	    </select>
                            	关键字<input class="textbox" name="" id="searchKeyword">
                        </td>
                        <td><input type="button" onClick="searchClick()" value="检索"></td>
                    </tr>
                </table>
                </form>
                <script type="text/javascript">
					function searchClick(){
						var searchType=$("#searchType").val();//搜索分类
						var searchKeyword=$("#searchKeyword").val();//关键字
						$.post("searchsystem.html",{table:"User",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="用户列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getUserList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<th field="mail" >用户邮箱</th>
			<th field="password" >密码</th>
			<th field="name" >firstname</th>
			<th field="lastname" >lastname</th>
			<th field="countries" >国家</th>
			<th field="newschoolid" >学校ID</th>
			<th field="newschool" >将要就读的学校</th>
			<th field="knowweby" >知道我们通过</th>
			<th field="nowstate" >现状</th>
			<th field="credit" >信用卡类型</th>
			<th field="typecode" >渠道编码</th>
			<th field="nationality" >国籍</th>
			
			
			<th field="addr" >联系地址</th>
			<th field="prvc" >省/州</th>
			<th field="city" >市/县</th>
			<th field="zip" >邮编</th>
			<th field="sex" >性别</th>
			<th field="nick" >称呼</th>
			<th field="birthday" formatter="formatterdate">生日</th>
			<th field="passportNo" >护照号</th>
			<th field="grade" >年级</th>
			<th field="fulltime" formatter="formatterisdel">全日制</th>
			<th field="professional" >专业</th>
			<th field="oldschool" >以前的学校</th>
			<th field="phone" >手机</th>
			<th field="relativesname" >亲属全名</th>
			<th field="relatives" >亲属与用户关系</th>
			<th field="relativesaddr" >联系地址</th>
			<th field="relativesprvc" >省/州</th>
			<th field="relativescity" >市/县</th>
			<th field="relativeszip" >邮编</th>
			<th field="relativescountries" >国家</th>
			<th field="relativestel" >亲属座机</th>
			<th field="relativesphone" >手机</th>
			<th field="relativesmail" >用户邮箱</th>
			
			<th field="file1" >附件1</th>
			<th field="file2" >附件2</th>
			<th field="file3" >附件3</th>
			<th field="file4" >附件4</th>
			
			<!-- 未要求 -->
			<th field="logo" >用户头像</th>
			<th field="hobbies" >个人爱好</th>
			<th field="type" >用户类型</th>
			<th field="memo" >个人备注</th>
			<th field="content" >个人详细介绍</th>
			<!-- <th field="money" >用户账户余额</th>
			<th field="integral" >用户积分</th>
			<th field="numarticle" >发表文章数</th>
			<th field="numatlas" >发表图集数</th>
			<th field="numthread" >发表帖子数</th>
			<th field="numpicture" >发表图片数</th>
			<th field="sumpay" >订单总数</th>
			<th field="visit" >我的访问量</th> -->
			<th field="state" formatter="formatterstate">用户账号状态</th>
			<th field="ctime"  formatter="formatterdate">注册时间</th>
			<!-- <th field="btime" formatter="formatterdate" >开始时间</th>
			<th field="etime" formatter="formatterdate" >结束时间</th> -->
			<th field="logtime"  formatter="formatterdate">登陆时间</th>
			<th field="loginip" >登陆IP</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除</th> -->
		</thead>

	</table>

    <!--添加用户窗口--> 
    <div id="useradd" class="easyui-window" title="添加新用户" data-options="modal:true,collapsible:false,maximizable:false,top:30,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveUser.html" method="post" name="userAS">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="id" ></input></td>
                    <td style="width:100px">用户ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="ssid" ></input></td>
	    		</tr>
	    		<tr>
	    			<!-- <td>账号:</td>
	    			<td><input  class="easyui-validatebox" onchange="testUserName(this.value)" required="true" validType="passport" name="passport" ></input>
	    				<div id="showPassportTure" style="display:none;color:lime;">账号可用</div>
	    				<div id="showPassportFalse" style="display:none;color:red;">账号不可用</div>
	    			</td> -->
                    <td>密码:</td>
	    			<td><input  name="password" class="easyui-validatebox" required="true"  validType="safepass"></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<!-- 个人信息 -->
	    		<tr><td colspan="4" align="center">个人信息</td></tr>
                <tr>
	    			<td>称呼:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="nick" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>lastname:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="lastname" ></input></td>
                    <td>firstname:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="name"></input></td>
	    		</tr>
                <tr>
	    			<td>性别:</td>
	    			<td>
				                        男：<input type="radio" name="sex" value="1" >
				                        女：<input type="radio" name="sex" value="2">
                    </td>
                    <td>生日：</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="birthday_as" name="birthday_as"></input> 
	    		</tr>
	    		<tr>
	    			<td>国籍:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="nationality" ></input></td>
                    <td>护照号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="passportNo"></input></td>
	    		</tr>
	    		<!-- 学校信息 -->
	    		<tr><td colspan="4" align="center">学校信息</td></tr>
	    		<tr>
	    			<td>将要就读的学校:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="newschool" ></input></td>
                    <td>年级:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="grade"></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否全日制:</td>
	    			<td>
				                        是：<input type="radio" name="fulltime" value="1" checked>
				                        否：<input type="radio" name="fulltime" value="0">
                    </td>
                    <td>专业:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="professional"></input> </td>
	    		</tr>
	    		<tr>
	    			<td>学校:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="oldschool"></input></td>
	    			<td></td>
	    			<td></td>
	    		<!-- 其他信息 -->
	    		<tr><td colspan="4" align="center">其他信息</td></tr>
	    		<tr>
                    <td>知道我们通过:</td>
	    			<td>
						途径1：<input type="radio" name="knowweby" value="途径1" checked>
						途径2：<input type="radio" name="knowweby" value="途径2">
						途径3：<input type="radio" name="knowweby" value="途径3">
                    </td>
                    <td></td>
                    <td></td>
	    		</tr>
	    		<!-- 联系方式  -->
	    		<tr><td colspan="4" align="center">联系方式 </td></tr>
	    		<tr>
	    			<td>联系地址:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="addr"></input></td>	
               		<td></td>
               		<td></td>
                </tr>
                <tr>
	    			<td>省/州:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="prvc"></input></select>
	    			</td>
                    <td>市/县:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="city"></input></select>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>邮编:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,32]" name="zip"></input></select>
	    			</td>
                    <td>国家:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="countries"></input></select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>现状:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="nowstate"></input></select>
	    			</td>
                    <td>信用卡类型:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="credit"></input></select>
	    			</td>
	    		</tr>
                <tr>
	    			<td>用户邮箱：</td>
	    			<td><input class="easyui-validatebox" validType="email" validType="length[0,32]" invalidMessage="请填写正确的邮件格式"  name="mail" ></input></td>
                    <td>手机:</td>
	    			<td><input  class="easyui-validatebox" validType="length[0,32]" name="phone"></input></td>
	    		</tr>
	    		<!-- 紧急情况联系人 -->
	    		<tr><td colspan="4" align="center">紧急情况联系人</td></tr>
	    		<tr>
	    			<td>亲属全名:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativesname" ></input></td>
                    <td>与用户关系:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relatives"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属联系地址:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="relativesaddr" ></input></td>
                    <td>亲属  省/州:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativesprvc"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  市/县:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativescity" ></input></td>
                    <td>亲属  邮编:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,32]" name="relativeszip"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  国家:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativescountries" ></input></td>
                    <td>亲属  座机:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativestel"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  手机:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativestel"></input></td>
                   <td>用户邮箱：</td>
	    			<td><input class="easyui-validatebox" validType="email" validType="length[0,32]" invalidMessage="请填写正确的邮件格式"  name="relativesmail" ></input></td>
	    		</tr>
	    		
                <tr>
	    			<td>用户头像:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
	    		</tr>
                
                <tr>
	    			
                    <td>个人爱好:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="hobbies"></input></td>
	    		</tr>
                <tr>
	    			<td>用户类型:</td>
	    			<td><select  name="type"><option value="0">普通用户</option><option value="-1">管理员</option></select></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>个人备注:</td>
	    			<td><textarea name="memo" rows="3" cols="15" style="background:#FFF"></textarea></td>
                    <!-- <td>用户账户余额:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="money" ></input></td>
	    		</tr> 
                <tr>
	    			<td>用户积分:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="integral" ></input></td>
	    			<td>发表文章数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numarticle" ></input></td>
	    		</tr>
                <tr>
	    			<td>发表图集数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numatlas" ></input></td>

	    			<td>发表帖子数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numthread" ></input></td>
	    		</tr>
                <tr>
	    			<td>发表图片数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numpicture" ></input></td>

	    			<td>订单总数:</td>
	    			<td><input confocus="this.blur()"  readonly="readonly" style="background:#CCC" name="sumpay" ></input></td>
	    		</tr>
                <tr>
	    			<td>我的访问量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="visit" ></input></td> -->

	    			<td>用户账号状态:</td>
	    			<td>
                    	<select name="state">
                        	<option value="0">禁用</option>
                        	<option value="1">激活</option>
                        </select>
                    </td>
	    		</tr>
                <tr>
	    			<td>注册时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as" ></input></td>

	    			<td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"  ></input></td>
	    		</tr>
               <!--  <tr>
	    			<td>开始时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="btime_as" id="btime_as"></input></td>

	    			<td>结束时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="etime_as" id="etime_as"
	    			 validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间"></input></td>
	    		</tr> -->
                <tr>
	    			<td>登陆时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="logtime_as" id="logtime_as" ></input></td>

	    			<td>登陆IP:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="loginip" ></input></td>
	    		</tr>
               <!--  <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td></td><td></td>
	    		</tr> -->              
                <tr>
	    			<td>个人详细介绍:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content"]', {
                                	cssPath : "<%=request.getContextPath()+"/resources/kindeditor41/plugins/code/prettify.css"%>",
                    				uploadJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/upload_json.jsp"%>",
                    				fileManagerJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/file_manager_json.jsp"%>",
                                    resizeType : 1,
                                    allowPreviewEmoticons : true,
                                    allowImageUpload : true,
                                    afterBlur:function(){this.sync();},
                                    items : [
                                        'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                        'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                                });
                            });
                        </script>
                        <textarea name="content" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
                
                
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="hidden" id="isSubmit" value="0"> 
                    	<input type="button" class="easyui-button" onClick="userA()" value="提交">&nbsp;&nbsp;
                        <script>
							function userA(){
								if($('[name="userAS"]').form('validate'))
									if($("#isSubmit").val()==1)
										$('[name="userAS"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加用户窗口--结束-->
    
     <!--修改用户窗口-->
    <div id="useredit" class="easyui-window" title="修改用户" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateUser.html"  method="post" name="userES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="id" ></input></td>
                    <td style="width:100px">用户ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="ssid" id="ssid_es" ></input></td>
	    		</tr>
	    		<!-- <tr>
	    			<td>账号:</td>
	    			<td><input  onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="passport" ></input></td>
                    <td></td>
	    			<td><input  name="password" type="hidden"></input></td>
	    		</tr> -->
                <!-- 个人信息 -->
	    		<tr><td colspan="4" align="center">个人信息</td></tr>
                <tr>
	    			<td>称呼:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="nick" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>lastname:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="lastname" ></input></td>
                    <td>firstname:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="name"></input></td>
	    		</tr>
                <tr>
	    			<td>性别:</td>
	    			<td>
				                        男：<input type="radio" name="sex" value="1" >
				                        女：<input type="radio" name="sex" value="2">
                    </td>
                    <td>生日：</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="birthday_es" name="birthday_es"></input> 
	    		</tr>
	    		<tr>
	    			<td>国籍:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="nationality" ></input></td>
                    <td>护照号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="passportNo"></input></td>
	    		</tr>
	    		<!-- 学校信息 -->
	    		<tr><td colspan="4" align="center">学校信息</td></tr>
	    		<tr>
	    			<td>将要就读的学校:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="newschool" ></input></td>
                    <td>年级:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="grade"></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否全日制:</td>
	    			<td>
				                        是：<input type="radio" name="fulltime" value="1" checked>
				                        否：<input type="radio" name="fulltime" value="0">
                    </td>
                    <td>专业:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="professional"></input> </td>
	    		</tr>
	    		<tr>
	    			<td>学校:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="oldschool"></input></td>
	    			<td></td>
	    			<td></td>
	    		<!-- 其他信息 -->
	    		<tr><td colspan="4" align="center">其他信息</td></tr>
	    		<tr>
                    <td>知道我们通过:</td>
	    			<td>
						途径1：<input type="radio" name="knowweby" value="途径1" checked>
						途径2：<input type="radio" name="knowweby" value="途径2">
						途径3：<input type="radio" name="knowweby" value="途径3">
                    </td>
                    <td></td>
                    <td></td>
	    		</tr>
	    		<!-- 联系方式  -->
	    		<tr><td colspan="4" align="center">联系方式 </td></tr>
	    		<tr>
	    			<td>联系地址:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="addr"></input></td>	
               		<td></td>
               		<td></td>
                </tr>
                <tr>
	    			<td>省/州:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="prvc"></input></select>
	    			</td>
                    <td>市/县:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="city"></input></select>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>邮编:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,32]" name="zip"></input></select>
	    			</td>
                    <td>国家:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,32]" name="countries"></input></select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>现状:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="nowstate"></input></select>
	    			</td>
                    <td>信用卡类型:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="credit"></input></select>
	    			</td>
	    		</tr>
                <tr>
	    			<td>用户邮箱：</td>
	    			<td><input class="easyui-validatebox" validType="email" validType="length[0,32]" invalidMessage="请填写正确的邮件格式"  name="mail" ></input></td>
                    <td>手机:</td>
	    			<td><input  class="easyui-validatebox" validType="length[0,32]" name="phone"></input></td>
	    		</tr>
	    		<!-- 紧急情况联系人 -->
	    		<tr><td colspan="4" align="center">紧急情况联系人</td></tr>
	    		<tr>
	    			<td>亲属全名:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativesname" ></input></td>
                    <td>与用户关系:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relatives"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属联系地址:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="relativesaddr" ></input></td>
                    <td>亲属  省/州:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativesprvc"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  市/县:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativescity" ></input></td>
                    <td>亲属  邮编:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,32]" name="relativeszip"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  国家:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativescountries" ></input></td>
                    <td>亲属  座机:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativestel"></input></td>
	    		</tr>
	    		<tr>
	    			<td>亲属  手机:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,32]" name="relativestel"></input></td>
                   <td>用户邮箱：</td>
	    			<td><input class="easyui-validatebox" validType="email" validType="length[0,32]" invalidMessage="请填写正确的邮件格式"  name="relativesmail" ></input></td>
	    		</tr>
	    		
                <tr>
	    			<td>用户头像:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
	    		</tr>
                
                <tr>
	    			
                    <td>个人爱好:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="hobbies"></input></td>
	    		</tr>
                <tr>
	    			<td>用户类型:</td>
	    			<td><select  name="type"><option value="0">普通用户</option><option value="-1">管理员</option></select></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>个人备注:</td>
	    			<td><textarea name="memo" rows="3" cols="15" style="background:#FFF"></textarea></td>
                    <!-- <td>用户账户余额:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="money" ></input></td>
	    		</tr> 
                <tr>
	    			<td>用户积分:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="integral" ></input></td>
	    			<td>发表文章数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numarticle" ></input></td>
	    		</tr>
                <tr>
	    			<td>发表图集数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numatlas" ></input></td>

	    			<td>发表帖子数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numthread" ></input></td>
	    		</tr>
                <tr>
	    			<td>发表图片数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="numpicture" ></input></td>

	    			<td>订单总数:</td>
	    			<td><input confocus="this.blur()"  readonly="readonly" style="background:#CCC" name="sumpay" ></input></td>
	    		</tr>
                <tr>
	    			<td>我的访问量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="visit" ></input></td>
 -->
	    			<td>用户账号状态:</td>
	    			<td>
                    	<select name="state">
                        	<option value="0">禁用</option>
                        	<option value="1">激活</option>
                        </select>
                    </td>
	    		</tr>
                <tr>
	    			<td>注册时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es" ></input></td>

	    			<td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"  ></input></td>
	    		</tr>
                <!-- <tr>
	    			<td>开始时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="btime_es" id="btime_es"></input></td>

	    			<td>结束时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="etime_es" id="etime_es"
	    			 validType="TimeCheck['btime_es']" invalidMessage="结束时间必须大于开始时间"></input></td>
	    		</tr> -->
                <tr>
	    			<td>登陆时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="logtime_es" id="logtime_es" ></input></td>

	    			<td>登陆IP:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="loginip" ></input></td>
	    		</tr>
               <!--  <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td></td><td></td>
	    		</tr> -->              
                <tr>
	    			<td>个人详细介绍:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content"]', {
                                	cssPath : "<%=request.getContextPath()+"/resources/kindeditor41/plugins/code/prettify.css"%>",
                    				uploadJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/upload_json.jsp"%>",
                    				fileManagerJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/file_manager_json.jsp"%>",
                                    resizeType : 1,
                                    allowPreviewEmoticons : true,
                                    allowImageUpload : true,
                                    afterBlur:function(){this.sync();},
                                    items : [
                                        'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                        'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                                });
                            });
                        </script>
                        <textarea name="content" id="content" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
                
                
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><input name="password" type="hidden"></input></td>
                    <td align="right">
                    	<input type="button" onClick="userE()" value="提交">&nbsp;&nbsp;
                        <script>
							function userE(){
								if($('[name="userES"]').form('validate'))
									$('[name="userES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
    <!--修改用户窗口--结束-->   

<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-search',
					handler:function(){
						if($('#search').css('display')=='block'){
							$('#search').slideUp();
						}else{
							$('#search').slideDown();	
						}
					}
				},{
					iconCls:'icon-add',
					handler:function(){
						
						$('#useradd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						debugger;
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#useredit').form('load', 'getUserById.html?id='+row.id);
						$.post("getUserById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							$('#useredit #ctime_es').datetimebox('setValue',data.ctime);
							$('#useredit #utime_es').datetimebox('setValue',data.utime);
							$('#useredit #btime_es').datetimebox('setValue',data.btime);
							$('#useredit #etime_es').datetimebox('setValue',data.etime);
							$('#useredit #logtime_es').datetimebox('setValue',data.logtime);
							$('#useredit #birthday_es').datebox('setValue',data.birthday);
						},"json"); 
						
						$('#useredit').window('open');
					}
				},{
					iconCls:'icon-remove',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){ 
						    	var row = $('#dg').datagrid('getSelected');
						    	$.ajax({
								    url: 'delUserById.html?id='+row.id,
								    type: "GET",
								    dataType: "text",
								    success: function (date) {
								    	if(date > 0)
								    		$.messager.alert("提示","删除成功!");
								    	else
								    		$.messager.alert("提示","删除失败!");
								    	
								    	$('#dg').datagrid('reload');
								    }
								});     
						    }
						    
						});
					}
				},{
					iconCls:'icon-sum',//导出
					handler:function(){
						location.href="outExcelForUser.html";
					}
				}]
			});			
		})
	</script>
</body>
</html>