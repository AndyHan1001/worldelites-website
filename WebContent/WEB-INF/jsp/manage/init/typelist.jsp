<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>类型管理</h2>       
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
  
	<table width="100%" style="height:450px;" id="dg" title="类型列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getTypeList.html',method:'get'">
		<thead>
		 <tr>  
		 	<th data-options="field:'ck',checkbox:true"></th>
            <th field="id" >数据库ID</th>  
            <th field="channel">类型主体名称</th>
            <th field="code">类型代码</th> 
            <!-- <th field="ssid" >类型ID</th>   -->
            <th field="name">类型实际名称</th>  
            <!-- <th field="parentid">上级栏目名称</th> 
            <th field="logo">附加图片</th> -->
            <th field="memo" >备忘</th>  
            <th field="paixu" >排序值</th>  
            <th field="isenable" formatter="formatterisdel" >是否启用</th>  
           <!--  <th field="isdel" formatter="formatterisdel">是否删除/th>   -->
        </tr>
		</thead>
	</table>
	
    <!--添加窗口--> 
    <div id="typeadd" class="easyui-window" title="添加新类型" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'"
     style="width:800px;height:600px;padding:10px;">
	    <form action="saveType.html" method="post" name="typeAS">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id"></input></td>
	    	    </tr>
	    	    <tr >
	    	    	<td>主体类型:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" required="true" name="channel"></td>
	    	    	<td>主体编号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,3]" required="true" name="code"></td>
	    		</tr>
                <tr>
                	<td style="display:none">类型ID:</td>
	    			<td  style="display:none"><input onfocus="this.blur()"  readonly="readonly" name="ssid"></input></td>			
                    <td>类型实际名称:</td>
	    			<td colspan="3"><input class="easyui-validatebox"  validType="length[0,50]" required="true" name="name" ></input></td>
	    			
	    		</tr>
                
                 <tr style="display:none">
	    			<td>父级ID:</td>
	    			<td><input  onfocus="this.blur()"  readonly="readonly" id="type_add_parentid" name="parentid" ></input></td>
                    <td>附加图片:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
					</td>
	    		</tr>   
                <tr>
	    			<td>备忘:</td>
	    			<td colspan="3">
	    				<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="memo"]', {
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
                        <textarea name="memo" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END--></td>
                </tr>
                <tr>
                    <td>排序值:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,2]" name="paixu" ></input></td>
	    			
                 	<td>是否启用:</td>
	    			<td colspan="3">
                    	<select  name="isenable">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
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
                    	<input type="button" onClick="typeA()" value="提交">&nbsp;&nbsp;
                        <script>
							function typeA(){
								if($('[name="typeAS"]').form('validate'))
									$('[name="typeAS"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加类型窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="typeedit" class="easyui-window" title="修改类型" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateType.html" method="post" name="typeES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改类型
                  </caption>
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id"></input></td>
				</tr>
				<tr>
					<td>主体类型:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" required="true" name="channel"></td>
	    	    	<td>主体编号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,3]" required="true" name="code"></td>
				</tr>
                <tr>
                	<td style="display:none">类型ID:</td>
	    			<td style="display:none"><input onfocus="this.blur()"  readonly="readonly" name="ssid"></input></td>			
                    <td>类型实际名称:</td>
	    			<td colspan="3"><input  class="easyui-validatebox"  validType="length[0,50]" required="true" name="name" ></input></td>
	    		</tr>
                
                 <tr style="display:none">
	    			<td>父级ID:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="parentid" ></input></td>
                    <td>附加图片:</td>
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
	    		</tr>   
                <tr>
                	<td>备忘:</td>
	    			<td colspan="3"><script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="memo"]', {
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
                        <textarea name="memo" id="memo" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
                    </td>
                </tr>
                <tr>
                    <td>排序值:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,2]" name="paixu" ></input></td>
	    			
                 	<td>是否启用:</td>
	    			<td colspan="3">
                    	<select  name="isenable">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
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
                    	<input type="button" onClick="typeE()" value="提交">&nbsp;&nbsp;
                        <script>
							function typeE(){
								if($('[name="typeES"]').form('validate'))
									$('[name="typeES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	 
    <!--修改类型窗口--结束-->    
<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[/* {
					iconCls:'icon-search',
					handler:function(){
						if($('#search').css('display')=='block'){
							$('#search').slideUp();
						}else{
							$('#search').slideDown();	
						}
					}
				}, */{
					iconCls:'icon-add',
					handler:function(){
						var row = $('#dg').datagrid('getSelected');
						var pid = 0;
						if(row != null)
							pid = row.id;
						
						//$('#menu_add_parentid').value = pid;
						document.getElementById("type_add_parentid").value=pid;
						$('#typeadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#typeedit').form('load', 'getTypeById.html?id='+row.id);
						$.post("getTypeById.html?id="+row.id,{},function(data){
							KindEditor.html('#memo',data.memo);		
							document.getElementById("logoView").innerHTML="<img src='/fileupload/images/"+data.logo+"' width='100'>";
						},"json")
						$('#typeedit').window('open');
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
								    url: 'delTypeById.html?id='+row.id,
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