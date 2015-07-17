<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>消息管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>类型
                        	<select name="" id="searchType">
                        		<option value="kong">&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        		<option value="类型">类型</option>
                       	    </select>
                            关键字(不填写为所选类型下所有数据)<input class="textbox" name="" id="searchKeyword">
                        </td>
                        <td><input type="button" onClick="searchClick()" value="检索"></td>
                    </tr>
                </table>
                </form>
                <script type="text/javascript">
					function searchClick(){
						var searchType=$("#searchType").val();//搜索分类
						var searchKeyword=$("#searchKeyword").val();//关键字
						$.post();//Ajax--Post
					}
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="消息列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getMessageList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >流水号</th>
			<th field="ssid" >消息编号</th>
			<th field="fromuserid" >发出信息用户编号</th>
			<th field="fromusername" >用户名</th>
			<th field="touserid" >接收用户编号</th>
			<th field="tousername" >接收用户名</th>
			<th field="content" >具体内容</th>
			<th field="ctime" formatter="formatterdate">发表时间</th>
			<th field="utime" formatter="formatterdate">修改时间</th>
			<th field="btime" formatter="formatterdate">消息开始显示时间</th>
			<th field="etime" formatter="formatterdate">消息结束显示时间</th>
			<th field="state" formatter="formatterstate">消息状态</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
<div id="messageadd" class="easyui-window" title="添加新消息" 
data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveMessage.html" method="post" name="messageAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;font-weight:600;margin-bottom:10px;padding-bottom:5px;text-align:left;border-bottom:2px #ccc solid">添加消息
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input name="id" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td style="width:100px">消息编号:</td>
	    			<td style="width:200px"><input name="ssid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                <tr>
	    			<td>发出用户编号:</td>
	    			<td><input name="fromuserid" id="fromuserid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>发出用户:</td>
	    			<td><select class="easyui-combobox"  name="fromusername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'getAllUserJson.html',onChange:function(){$('#fromuserid_as').val($(this).combobox('getValue'))}"></select>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>接收用户编号:</td>
	    			<td><input name="touserid" id="touserid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看接收用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>接收用户:</td>
	    			<td><select class="easyui-combobox"  name="tousername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'getAllUserJson.html',onChange:function(){$('#touserid_as').val($(this).combobox('getValue'))}" ></select></td>
	    		</tr>   
                  <tr>
	    			<td>消息内容:</td>
	    			<td colspan="3" style="width:400px">
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
                        <textarea name="content" style="width:450px;height:250px;visibility:hidden;background:red">输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>         
                <tr>
	    			<td>消息发表时间:</td>
	    			<td><input  name="ctime_as" editable="false"  class="easyui-datetimebox" required="required"></input></td>
                    <td>消息更新时间:</td>
	    			<td><input  name="utime_as" editable="false"  class="easyui-datetimebox" required="required"></input></td>
	    		</tr>
                <tr>
	    			<td>消息开始时间:</td>
	    			<td><input  name="btime_as" id="btime_as" editable="false" class="easyui-datetimebox" required="required"></input> </td>
                    <td>消息结束时间:</td>
	    			<td><input  name="etime_as" id="etime_as" editable="false" class="easyui-datetimebox"
	    			 validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间" required="true"></input> </td>
	    		</tr>
                <tr>
	    			<td>消息状态:</td>
	    			<td colspan="3"><select class="easyui-combobox" editable="false" name="state" data-options="panelHeight:'auto',width:135" >
	    								<option value="0">未阅读</option>
	    								<option value="1">已阅读</option>
	    							</select>
	    			</td>
	    		</tr>
	    		<tr>	
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="hidden" name="isdel" value="0">
                    	<input type="button" onClick="messageA()" value="提交">&nbsp;&nbsp;
                        <script>                 
							function messageA(){									
								if($('[name="messageAS"]').form('validate'))
									if($('#fromuserid_as').val()==$('#touserid_as').val()){
										$.messager.alert("提示","不能自己给自己发信息，请修改发出用户或接收用户！");
										
									}else{
											$('[name="messageAS"]').submit();
									}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	
	</div>	    
    <!--添加消息窗口--结束-->
    
    
   <!--修改窗口--> 
<div id="messageedit" class="easyui-window" title="修改消息" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateMessage.html" method="post" name="messageES" id="messageedit1">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改消息
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" id="id" name="id" ></input></td>
                    <td style="width:100px">消息ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" id="ssid" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>消息来自哪个用户ID:</td>
	    			<td><input name="fromuserid" id="fromuserid" onfocus="this.blur()"  readonly="readonly"  data-options="required:true" ></input></td>
                    <td>消息来自哪个用户名称:</td>
	    			<td><input name="fromusername" id="fromusername" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
	    			<td>接受用户ID:</td>
	    			<td><input name="touserid" id="touserid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>接受用户名:</td>
	    			<td><input name="tousername" id="tousername" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>   
                  <tr>
	    			<td>消息内容:</td>
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
                        </script>s
                        <textarea name="content" id="content" style="width:350px;height:250px;visibility:hidden;">1</textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>         
                <tr>
	    			<td>消息发表时间:</td>
	    			<td><input name="ctime_es" id="ctime_es" editable="false"  class="easyui-datetimebox" required="required"></input></td>
                    <td>消息更新时间:</td>
	    			<td><input name="utime_es" id="utime_es" editable="false"  class="easyui-datetimebox" required="required"></input></td>
	    		</tr>
                <tr>
	    			<td>消息开始时间:</td>
	    			<td><input type="text" name="btime_es" id="btime_es" editable="false"   class="easyui-datetimebox" required="required"></input> </td>
                    <td>消息结束时间:</td>
	    			<td><input type="text" name="etime_es" id="etime_es" editable="false"  class="easyui-datetimebox" 
	    			validType="TimeCheck['btime_es']" invalidMessage="结束时间必须大于开始时间" required="required"></input> </td>
	    		</tr>
                <tr>
	    			<td>消息状态:</td>
	    			<td><select class="easyui-combobox" id="state" editable="false" name="state" data-options="panelHeight:'auto',width:135" >
	    								<option value="0">未阅读</option>
	    								<option value="1">已阅读</option>
	    							</select>
	    			</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="hidden" id="isdel" name="isdel" />
                    	<input type="button" onClick="messageE()" value="提交">&nbsp;&nbsp;
                        <script>
							function messageE(){
								if($('[name="messageES"]').form('validate')){
	
										$('[name="messageES"]').submit();

								}	
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	
    <!--修改消息窗口--结束-->    

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
						$('#messageadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');													
						 $.post("getMessageById.html?id="+row.id,{},function(data){
								$('#messageedit #id').val(data.id);
								$('#messageedit #ssid').val(data.ssid);
								
								$('#messageedit #fromuserid').val(data.fromuserid);
								$('#messageedit #fromusername').val(data.fromusername);
								$('#messageedit #touserid').val(data.touserid);
								$('#messageedit #tousername').val(data.tousername);
								
								$('#messageedit #isdel').val(0);//解决修改操作后，isel为null
								$('#messageedit #state').combobox('setValue',data.state);
								KindEditor.html('#content',data.content);
								
								$('#messageedit #ctime_es').datetimebox('setValue',data.ctime);
								$('#messageedit #utime_es').datetimebox('setValue',data.utime);
								$('#messageedit #btime_es').datetimebox('setValue',data.btime);
								$('#messageedit #etime_es').datetimebox('setValue',data.etime);								
							},"json") 						
						$('#messageedit').window('open');
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
								    url: 'delMessageById.html?id='+row.id,
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
				}]
			});			
		})
	</script>
</body>
</html>