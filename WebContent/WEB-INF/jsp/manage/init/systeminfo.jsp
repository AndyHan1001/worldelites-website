<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<div id="tt" class="easyui-tabs" style="width:1300px;height:650px;">   
           
        <div title="内容板块设置" data-options="closable:false" style="overflow:auto;padding:20px;display:;">   
        	
       <!-------------------------------------------------------------------------------------------- --> 	
        	<table width="100%" style="height:450px;" id="dg" title="内容列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getOthersList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>	
			<th field="type" >文章类型</th>		
			<th field="title" >文章标题</th>			
			<!-- <th field="content" >文章内容</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="articleadd" class="easyui-window" title="添加新内容" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:450px;padding:10px;">
	    <form action="saveOthers.html" method="post" name="articleAS">
	    	<table cellpadding="5" border="0">
                <tr>
	    			<td>文章类型代码:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="type"></input></td>
					
	    			<td>文章标题:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="title"></input></td>
	    		</tr>
                
                 <tr>
	    			<td>文章内容:</td>
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
                                        'insertunorderedlist', '|', 'emoticons', 'image', 'link','fullscreen']
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
                    	<input type="button" onClick="articleA()" value="提交">&nbsp;&nbsp;
                        <script>
							function articleA(){
								if($('[name="articleAS"]').form('validate'))	
										$('[name="articleAS"]').submit();
		
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加文章窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="articleedit" class="easyui-window" title="修改内容" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:450px;padding:10px;">
	    <form action="updateOthers.html" method="post" name="articleES">
	    	<table cellpadding="5" border="0">
	    		 <input type="hidden" name="id">
                <tr>
	    			<td>文章类型:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="type"></input></td>
	    			<td>文章标题:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="title" id="title"></input></td>
	    		</tr>
                
                 <tr>
	    			<td>文章内容:</td>
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
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="articleE()" value="提交">&nbsp;&nbsp;
                        <script>
							function articleE(){
								if($('[name="articleES"]').form('validate'))	
										$('[name="articleES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--修改文章窗口--结束-->    

<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-add',
					handler:function(){
						
						$('#articleadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#articleedit').form('load', 'getOthersById.html?id='+row.id);
						$.post("getOthersById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);		
														
						},"json");
						$('#articleedit').window('open');
					}
				}/* ,{
					iconCls:'icon-remove',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){ 
						    	var row = $('#dg').datagrid('getSelected');
						    	$.ajax({
								    url: 'delOthersById.html?id='+row.id,
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
				} */]
			});			
		})
	</script>
       <!-------------------------------------------------------------------------------------------- --> 	
        
		</div>  
		<div title="系统信息" style="padding:20px;display:;">   
            		系统信息    <br />
            		<a href="<%=path %>/maker_html.html">生成首页</a>
        </div>
	</div>

</body>
</html>