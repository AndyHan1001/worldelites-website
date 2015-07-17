<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<style>
.hiddenBG{background:white;border:none;border-bottom:2px solid #CCC;}
</style>
<body>
	<h2>订单管理</h2>       
      <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="orderid" >订单编号</option>
								<option value="roomid" >户型ID</option>
								<option value="roomname" >户型名称</option>
								<option value="schoolid" >大学ID</option>
								<option value="schoolname" >大学名称</option>
								<option value="apartmentid" >公寓ID</option>
								<option value="apartmentname" >公寓名称</option>
								<option value="userid" >用户的id</option>
								<option value="userlastname" >用户姓</option>
								<option value="username" >用户名</option>
								<option value="userpassportno" >用户护照</option>
								<option value="userphone" >用户电话</option>
								<option value="usermail" >用户邮箱</option>
								<option value="price" >价格结算</option>
								<option value="pricenote" >结算描述</option>
								<option value="state" >订单状态</option>
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
						$.post("searchsystem.html",{table:"Order",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="订单列表"  
	data-options="rownumbers:true,singleSelect:false,pagination:true,url:'getOrderList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<th field="orderid" >订单编号</th>
			<!-- <th field="type" >订单类型</th> -->
			
			<th field="roomid" >户型ID</th>
			<th field="roomname" >户型名称</th>
			<th field="logo">户型缩略图</th>
			<th field="schoolid" >大学ID</th>
			<th field="schoolname" >大学名称</th>
			<th field="apartmentid" >公寓ID</th>
			<th field="apartmentname" >公寓名称</th>
			
			<th field="userid" >用户的id</th>
			<th field="userlastname" >用户姓</th>
			<th field="username" >用户名</th>
			<th field="userpassportno" >用户护照</th>
			<th field="userphone" >用户电话</th>
			<th field="usermail" >用户邮箱</th>
			
			<th field="price" >价格结算</th>
			<th field="pricenote" >结算描述</th>
			
			<th field="entertime" >入住时间</th>
			<th field="leavetime" >搬出时间</th>
			<th field="endtime" >签约截止时间</th>
			<th field="submittime" >提交申请时间</th>
			<th field="confirmtime" >确认申请时间</th>
			<th field="signtime" >签租时间</th>
			<th field="paytime" >支付时间</th>
			<th field="finishtime" >完成代订时间</th>
			<th field="isPay" >是否已支付</th>
			<th field="state" >订单状态</th>
			<th field="statenote" >订单描述</th>
			<th field="title" >邮件标题</th>
			<th field="content" >邮件内容</th>
			

			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		</thead>
		<tbody>
			
		</tbody>
	</table>

    <!--添加窗口--> 
    <div id="orderadd" class="easyui-window" title="添加新订单" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveOrder.html" method="post" name="orderAS">
	    	<table cellpadding="5" border="0">
                 <tr>
	    			<td>户型ID</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="roomid"></input></td>
					<td>户型名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="roomname"></input></td>
	    		</tr>
	    		<tr>
                	 <td>户型缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    				
	    			</td>
                    <td></td>
                    <td></td>
                </tr>
	    		<tr>
	    			<td>大学ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name=schoolid></input></td>
					<td>大学名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="schoolname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="apartmentid"></input></td>
					<td>公寓名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="apartmentname"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>用户ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="userid"></input></td>
					<td>用户姓:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userlastname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="username"></input></td>
                    <td>用户护照:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userpassportno"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户电话:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userphone"></input></td>
                    <td>用户邮箱:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="usermail"></input></td>
	    		</tr>
	    		
	    		
	    		<tr>
	    			<td>价格结算:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="price"></input></td>
                    <td>结算描述:</td>
	    			<td><textarea name="pricenote"></textarea></td>
	    		</tr>
                 
                
                <tr>
	    			<td>入住时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="entertime"></input></td>
                    <td>搬出时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="leavetime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>签约截止时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="endtime"></input></td>
                    <td>提交申请时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="submittime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>确认申请时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="confirmtime"></input></td>
                    <td>签租时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="signtime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>支付时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="paytime"></input></td>
                    <td>完成代订时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="finishtime"></input></td>
	    		</tr>
                
                <tr>
	    			<td>订单状态:</td>
	    			<td>
	    				<select name="state">
	    					<option value="Application Request Submitted">Application Request Submitted</option>
	    					<option value="Application Processing">Application Processing</option>
	    					<option value="Online Payment">Online Payment</option>
	    					<option value="Sign Lease">Sign Lease</option>
	    					<option value="Complete">Complete</option>
	    				</select>
	    			</td>
                    <td>状态描述:</td>
	    			<td><textarea name="statenote"></textarea> </td>
	    		</tr>
	    		                         
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="orderA()" value="提交">&nbsp;&nbsp;
                        <script>
							function orderA(){
								if($('[name="orderAS"]').form('validate')){		
										$('[name="orderAS"]').submit();
								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加订单窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="orderedit" class="easyui-window" title="修改订单" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:600px;height:600px;padding:10px;">
	    <form action="updateOrder.html" method="post" name="orderES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">数据库ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly"  name="id" ></input></td>
                    <td style="width:100px">订单ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly"  name="orderid" ></input></td>
	    		</tr>
               <tr>
	    			<td>户型ID</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="roomid"></input></td>
					<td>户型名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="roomname"></input></td>
	    		</tr>
	    		<input type="hidden" name="logo" />
	    		<%-- <tr>
                	 <td>户型缩略图:</td>
	    			<td>
	    				<input  name="logo" type="hidden" id="logo_es" />
	    				<div id="logoView">
	    					原图片:<img src='<%=path %>/fileupload/images/' width='80' height='40' id="imgg"/>
	    				</div>
	    				<script>
	    					function loadLogo(){
	    						$("#logoView img").attr("src","/worldelites/fileupload/images/"+$("#logo_es").val());
	    					}
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
                    <td></td>
                    <td></td>
                </tr> --%>
	    		<tr>
	    			<td>大学ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name=schoolid></input></td>
					<td>大学名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="schoolname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="apartmentid"></input></td>
					<td>公寓名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="apartmentname"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>用户ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="userid"></input></td>
					<td>用户姓:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userlastname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="username"></input></td>
                    <td>用户护照:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userpassportno"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户电话:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="userphone"></input></td>
                    <td>用户邮箱:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="usermail" id="usermail"></input></td>
	    		</tr>
                <tr>
	    			<td>入住时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="entertime"></input></td>
                    <td>搬出时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="leavetime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>签约截止时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="endtime"></input></td>
                    <td>提交申请时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="submittime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>确认申请时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="confirmtime"></input></td>
                    <td>签租时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="signtime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>支付时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="paytime"></input></td>
                    <td>完成代订时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="finishtime"></input></td>
	    		</tr>
                <tr>
	    			<td>价格结算:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="price" id="rexPrice"></input></td>
                    <td>结算描述:</td>
	    			<td><textarea name="pricenote"></textarea></td>
	    		</tr>
                <tr>
	    			<td>订单状态:</td>
	    			<td>
	    				<select name="state" id="rexState">
	    					<option value="Application Submitted">Application Submitted</option>
	    					<option value="Application Processing">Application Processing</option>
	    					<option value="Online Payment">Online Payment</option>
	    					<option value="Sign Lease">Sign Lease</option>
	    					<option value="Complete">Complete</option>
	    				</select>
	    			</td>
                    <td>状态描述:</td>
	    			<td><textarea name="statenote"></textarea> </td>
	    		</tr>                            
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right"></td>
                    <td align="right">
                    	<input type="button" onClick="orderE()" value="提交">&nbsp;&nbsp;
                        <script>
							function orderE(){
								if($('[name="orderES"]').form('validate')){		
										if($("#rexState").val()=="Online Payment"){
											 if(!/^[0-9]+$/.test($("#rexPrice").val())){
											        alert("由于涉及银行支付，请在‘价格结算’输入框内，输入纯价格数字,否则无法完成支付流程!");
											        return false;
											    }
										}
										$('[name="orderES"]').submit();	    	
								}
							}
							
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	
    <!--修改订单窗口--结束--> 
    
    
    <!--发送窗口--> 
    <div id="ordersend" class="easyui-window" title="发送邮件" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    	<table cellpadding="5" border="0">
	    		<tr>
	    			<td style="width:200px">数据库ID:</td>
	    			<td style="width:200px"><input  disabled="disabled" class="hiddenBG" name="id" ></input></td>
                    <td style="width:100px">订单ID:</td>
	    			<td style="width:200px"><input disabled="disabled" class="hiddenBG" name="orderid" ></input></td>
	    		</tr>
               <tr>
	    			<td>户型ID</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="roomid"></input></td>
					<td>户型名称:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="roomname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>大学ID:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name=schoolid></input></td>
					<td>大学名称:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="schoolname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓ID:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="apartmentid"></input></td>
					<td>公寓名称:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="apartmentname"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>用户ID:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="userid" id="userid_id"></input></td>
					<td>用户姓:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="userlastname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="username"></input></td>
                    <td>用户护照:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="userpassportno"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户电话:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="userphone"></input></td>
                    <td>用户邮箱:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="usermail" id="usermail"></input></td>
	    		</tr>
	    		<tr>
	    			<td>价格结算:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="price"></input></td>
                    <td>结算描述:</td>
	    			<td><textarea disabled="disabled" class="hiddenBG" name="pricenote"></textarea></td>
	    		</tr>
                 
                
                <tr>
	    			<td>入住时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="entertime"></input></td>
                    <td>搬出时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="leavetime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>签约截止时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="endtime"></input></td>
                    <td>提交申请时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="submittime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>确认申请时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="confirmtime"></input></td>
                    <td>签租时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="signtime"></input></td>
	    		</tr>
	    		<tr>
	    			<td>支付时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="paytime"></input></td>
                    <td>完成代订时间:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="finishtime"></input></td>
	    		</tr>
                
	    		<tr>
	    			<td colspan="4" align="center">邮件模块</td>
	    		</tr>
	    		<tr>
	    			<td>订单状态:</td>
	    			<td><input disabled="disabled" class="hiddenBG" name="state"></input></td>
                    <td>状态描述:</td>
	    			<td><textarea name="statenote"></textarea> </td>
	    		</tr>
	    		<tr>
	    			<td>邮件标题:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="title" id="mail_title"></input></td>
                    <td>邮件模板</td>
	    			<td>
	    				<select id="mail_model">
	    					<option value="">---Choose Mail Model---</option>
	    					<option value="orderTemplate1">Application Submitted</option>
	    					<option value="orderTemplate2">Application Processing</option>
	    					<option value="orderTemplate3">Online Payment</option>
	    					<option value="orderTemplate4">Sign Lease</option>
	    					<option value="orderTemplate5">Complete</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			 <td>邮件内容:</td>
	    			<td colspan="3">
                    		<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content22"]', {
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
                                        'insertunorderedlist', '|', 'emoticons', 'image', 'link','template','about']
                                });
                            });
                        </script>
                        <textarea name="content22" id="content22" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>                              
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right"></td>
                    <td align="right">
                    	<input type="button" onClick="orderSend()" value="发送邮件">&nbsp;&nbsp;
                        <script>
							//发送邮件模版
							function orderSend(){
								if($("#mail_title").val()==''||$("#mail_title").val()==null){
									alert("邮件标题啊，亲");
									return false;
								}
								
								editor.sync(); 
								$.ajax({
									url:"sendordermail.html",
									type:"post",
									dataType:"text",
									data:{
										userid:$("#userid_id").val(),
										title:$("#mail_title").val(),
										type:$("#mail_state").val(),
										content:$("#content22").val()
									},
									beforeSend:function(){
										alert("邮件正在发送中，请稍后");
									},
									success:function(data){
										if(data=="1")
											alert("邮件发送成功");
										else
											alert("邮件发送失败");
									},
									error:function(){
										alert("网络错误!");
									}
								});
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	
    <!--发送订单窗口--结束-->    

<script type="text/javascript">
		$(function(){//调取邮件模板
			$("#mail_model").change(function(){
				var mo=$(this).val();
				$.post("getMailTemplate.html",{type:mo},function(data){
					KindEditor.html('#content22',data);
				},"text");
			});
		});



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
				},/* {
					iconCls:'icon-add',
					handler:function(){
						$('#orderadd').window('open');
					}
				}, */{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#orderedit').form('load', 'getOrderById.html?id='+row.id);
						$.post("getOrderById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
						},"json");
						$('#orderedit').window('open');
						//setTimeout(loadLogo,1000);
					}
				},{
					iconCls:'icon-tip',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#ordersend').form('load', 'getOrderById.html?id='+row.id);
						$.post("getOrderById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
						},"json");
						$('#ordersend').window('open');
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
								    url: 'delOrderById.html?id='+row.id,
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
						var selectedRows=$('#dg').datagrid('getSelections');
						var idObj="-";
				    	for(var i=0;i<selectedRows.length;i++){
				    		idObj+=selectedRows[i].id+"-";
				    	}
						
						location.href="outExcelForOrder.html?id="+idObj;
					}
				}]
			});			
		});
		
/* 		
		
		
		
		if(selectedRows.length<1){ $.messager.alert("提示","请选择一条记录！"); return; }
		var row = $('#dg').datagrid('getSelected');
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){ 
		    	var row = $('#dg').datagrid('getSelected');
		    	var idObj="";
		    	for(var i=0;i<selectedRows.length;i++){
		    		idObj+=selectedRows[i].id+"-";
		    	}
		    	$.ajax({
				    url: 'delArticleById.do?idObj='+idObj,
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
		    
		}); */
	</script>
</body>
</html>