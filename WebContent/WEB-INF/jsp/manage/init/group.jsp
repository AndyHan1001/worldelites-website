<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>群组管理</h2>       
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
  
	<table width="100%" style="height:450px;" id="dg" title="群组列表"
	  data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getGroupList.html',method:'get'">
		<thead>
		 <tr>  
		 	<th data-options="field:'ck',checkbox:true"></th>
            <th field="id" >流水号</th>
            <th field="ssid" >群组编号</th>
            <th field="channel" >群组主体</th>
            <th field="parentid" >群组父级ID</th>
            <th field="type" >群组类型</th>
            <th field="typecode" >群组类型代码</th>
            <th field="ctime" formatter="formatterdate">群组发表时间</th>
            <th field="utime" formatter="formatterdate">更新时间</th>
            <th field="btime" formatter="formatterdate">开始时间</th>
            <th field="etime" formatter="formatterdate">结束时间</th>
            <th field="title" >群组标题</th>
            <th field="userid" >群组作者ID</th>
            <th field="username" >群组作者</th>
            <th field="keyword" >关键词</th>
            <th field="note" >备注</th>
            <th field="source" >群组来源</th>
            <th field="memo" >摘要</th>
            <th field="content" >群组内容</th>
            <th field="logo" >群组缩略图</th>
            <th field="atlas" >群组图集ID</th>
            <th field="isenable" formatter="formatterisdel">群组是否通过审核</th>
            <th field="stick" formatter="formatterisdel">群组是否置顶</th>
            <th field="good" formatter="formatterisdel">是否加精</th>
            <th field="visit" >群组浏览次数</th>
            <th field="comment" >群组数量</th>
           <!--  <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th>  -->
        </tr>  
		</thead>
	</table>

    <!--添加窗口--> 
    <div id="groupadd" class="easyui-window" title="添加新群组" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveGroup.html" method="post" name="groupAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加群组
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">群组编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                 <tr>
	    			<td>群组主体:</td>
	    			<td>
						<select name="channel">
							<option value="用户">用户</option>
							<option value="帖子">帖子</option>
						</select>	
					</td>
                    <td>群组父级编号:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="parentid" id="add_parentid"></input></td>
	    		</tr>
                  <tr>
	    			
	    			<td>群组类型:</td>
	    			<td><select class="easyui-combobox"  name="typecode" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJson.html',onChange:function(){$('#type_as').val($(this).combobox('getValue'))}" ></select></td>
	    			<td>类型代码:</td>
	    			<td><input name="type" id="type_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看接收用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td> 
	    		</tr>            
                <tr>
	    			<td>群组发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="true" id="ctime_as" name="ctime_as" editable="false"></input></td>
                    <td>群组更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="true" id="utime_as" name="utime_as" editable="false"></input></td>
	    		</tr>
                <tr>
	    			<td>群组开始时间:</td>
	    			<td><input name="btime_as" class="easyui-datetimebox" id="btime_as" required="required" editable="false"></input> </td>
                    <td>群组结束时间:</td>
	    			<td><input name="etime_as" class="easyui-datetimebox" id="etime_as" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>群组标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
                    <td></td>
                    <td></td>
	    		</tr>
                 <tr>
                    <td>群组作者</td>
	    			<td><select class="easyui-combobox"  name="username" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#userid_as').val($(this).combobox('getValue'))}" ></select></td>
	    			<td>群组作者编号</td>
	    			<td><input name="userid" id="userid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看作者是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>               
  				 <tr>
	    			<td>群组关键字:</td>
	    			<td><input class="easyui-validatebox" style="background:white" validType="length[0,30]" name="keyword"></input></td>
                    <td>群组备注:</td>
	    			<td><textarea name="note" rows="3" cols="15" style="background:white"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>群组来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,50]" name="source" style="background:white"></input></td>
                    <td>群组摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="15" style="background:white"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>群组内容:</td>
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
                        <textarea name="content" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>
                <tr>
                	 <td>群组缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    					
	    			</td>
                    <td>群组图集编号</td>
                    <td><input onfocus="this.blur()"  readonly="readonly" name="atlas"></input></td>
                </tr>
                <tr>
	    			<td>群组是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <td>群组是否置顶:</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr>
                 <tr>
                    <td>是否加精:</td>
	    			<td>
                    	<select  name="good">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>

                    <td>群组浏览次数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="visit" value="0"></input></td>
                 </tr>
                 <tr>
                 	<td>群组用户数量:</td>
	    			<td colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="comment" value="0"></input></td>
	    			<!-- <td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
	    		</tr>                              
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="groupA()" value="提交">&nbsp;&nbsp;
                        <script>
							function groupA(){
								if($('[name="groupAS"]').form('validate'))
									if($('#btime_as').combobox("getValue")>$('#etime_as').combobox("getValue")){
										$.messager.alert("提示","结束时间在开始时间之前，请您修改！");
									}else{										
										$('[name="groupAS"]').submit();
									}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加群组窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="groupedit" class="easyui-window" title="修改群组" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateGroup.html" method="post" name="groupES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改群组
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" id="id"></input></td>
                    <td style="width:100px">群组编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" id="ssid"></input></td>
	    		</tr>
                 <tr>
	    			<td>群组主体:</td>
	    			<td>
						<select name="channel" id="channel">
							<option value="用户">用户</option>
							<option value="帖子">帖子</option>
						</select>	
					</td>
                    <td>群组父级编号:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="parentid" id="parentid_es"></input></td>
	    		</tr>
                  <tr>
	    			
	    			<td>群组类型:</td>
	    			<td><select class="easyui-combobox" id="type_es" name="type" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJson.html',onChange:function(){$('#type_ess').val($(this).combobox('getValue'))}" ></select></td>
	    			<td>类型代码:</td>
	    			<td><input name="typecode" id="typecode_es" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看接收用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td> 
	    		</tr>             
                <tr>
	    			<td>群组发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" name="ctime_es" id="ctime_es" editable="false"></input></td>
                    <td>群组更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" name="utime_es" id="utime_es" editable="false"></input></td>
	    		</tr>
                <tr>
	    			<td>群组开始时间:</td>
	    			<td><input name="btime_es" id="btime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>群组结束时间:</td>
	    			<td><input name="etime_es" id="etime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>群组标题:</td>
	    			<td><input class="easyui-validatebox" required="required" validType="length[0,30]" id="title" name="title"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                  <tr>
                    <td>群组作者</td>
	    			<td><select class="easyui-combobox"  name="username" id="username_es" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#userid_es').val($(this).combobox('getValue'))}" ></select></td>
	    			<td>群组作者编号</td>
	    			<td><input name="userid" id="userid_es" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看作者是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>               
  				 <tr>
	    			<td>群组关键字:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,50]" id="keyword" name="keyword" style="background:white"></input></td>
                    <td>群组备注:</td>
	    			<td><textarea name="note" id="note" rows="3" cols="15" style="background:white"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>群组来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,50]" id="source" name="source" style="background:white"></input></td>
                    <td>群组摘要:</td>
	    			<td><textarea name="memo" id="memo" rows="3" cols="15" style="background:white"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>群组内容:</td>
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
                	 <td>群组缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo_es" />
	    				<div id="logoView"></div>
	    				<script >
	    					document.getElementById("logoView").innerHTML=
	    						"<img src='/MOVIE/fileupload/images/"+document.getElementById('logo_es').value+"' />";
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
                    <td>群组图集ID</td>
                    <td><input onfocus="this.blur()"  readonly="readonly" name="atlas" id="atlas"></input></td>
                </tr>
                <tr>
	    			<td>群组是否通过审核:</td>
	    			<td><select name="isenable" id="isenable"><option value="1">是</option><option value="0">否</option></select></td>
                    <td>群组是否置顶:</td>
	    			<td><select name="stick" id="stick"><option value="1">是</option><option value="0">否</option></select></td>
                   
	    		</tr>
                 <tr>
                    <td>是否加精:</td>
	    			<td>
                    	<select  name="good" id="good">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>

                    <td>群组浏览次数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="visit" id="visit"></input></td>
                 </tr>
                 <tr>
                 	<td>群组数量:</td>
	    			<td colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="comment" id="comment"></input></td>
	    			<!-- <td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
	    		</tr>                              
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="groupE()" value="提交">&nbsp;&nbsp;
                        <script>
	                        function groupE(){
								if($('[name="groupES"]').form('validate'))
									if($('#btime_es').combobox("getValue")>$('#etime_es').combobox("getValue")){
										$.messager.alert("提示","结束时间在开始时间之前，请您修改！");
									}else{										
										$('[name="groupES"]').submit();
									}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--修改群组窗口--结束-->    

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
				var row = $('#dg').datagrid('getSelected');
				var pid = 0;
				if(row != null)
					pid = row.id;
				
				//$('#menu_add_parentid').value = pid;
				document.getElementById("add_parentid").value=pid;
				$('#groupadd').window('open');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
				var row = $('#dg').datagrid('getSelected');
				$.post("getGroupById.html?id="+row.id,{},function(data){
					$('#groupedit #id').val(data.id);
					$('#groupedit #ssid').val(data.ssid);
					$('#groupedit #channel').val(data.channel);
					$('#groupedit #parentid_es').val(data.parentid);
					$('#groupedit #type_es').combobox("setValue",data.type);
					$('#groupedit #typecode_es').val(data.typecode);
					$('#groupedit #title').val(data.title);					
					$('#groupedit #username_es').combobox("setValue",data.username);
					//$('#groupedit #userid_es').combobox("setValue",data.userid);
					$('#groupedit #keyword').val(data.keyword);
					$('#groupedit #memo').val(data.memo);
					$('#groupedit #note').val(data.note);
					$('#groupedit #source').val(data.source);
					KindEditor.html('#content',data.content);
					//$('#groupedit #logo').val(data.logo);
					$('#groupedit #atlas').val(data.atlas);
					$('#groupedit #isenable').val(data.isenable);
					$('#groupedit #stick').val(data.stick);
					$('#groupedit #good').val(data.good);
					$('#groupedit #visit').val(data.visit);					
					$('#groupedit #comment').val(data.comment);
					
					$('#groupedit #ctime_es').datetimebox('setValue',data.ctime);
					$('#groupedit #utime_es').datetimebox('setValue',data.utime);
					$('#groupedit #btime_es').datetimebox('setValue',data.btime);
					$('#groupedit #etime_es').datetimebox('setValue',data.etime);	
					
				},"json")
				$('#groupedit').window('open'); 
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
						    url: 'delGroupById.html?id='+row.id,
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