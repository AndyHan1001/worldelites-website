<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>网站栏目管理</h2>       
         <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="title" >栏目标题</option>
								<option value="title_cn" >栏目标题(cn)</option>
								<option value="content" >栏目内容</option>
								<option value="content_cn" >栏目内容(cn)</option>
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
						$.post("searchsystem.html",{table:"Column",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="栏目文章列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getColumnList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<!-- <th field="ssid" >栏目文章编号</th> -->
			<!-- <th field="utime" formatter="formatterdate" >更新时间</th> -->
			<th field="type" >栏目类型</th>
			<!-- <th field="typecode" >类型代码</th> -->
			<!--<th field="ctime" formatter="formatterdate">文章发表时间</th> -->
			
			<!-- <th field="btime" formatter="formatterdate">开始时间</th>
			<th field="etime" formatter="formatterdate">结束时间</th> -->
			<th field="title" >栏目标题</th>
			<th field="title_cn" >栏目标题(cn)</th>
			<!-- <th field="author" >文章作者</th> -->
			<!-- <th field="userid" >文章发布者ID</th>
			<th field="username" >文章发布者名称</th>
			 -->
			<!-- <th field="keyword" >关键词</th> -->
			<th field="note" >附记</th>
			<!-- <th field="source" >文章来源</th> -->
			<!-- <th field="memo" >摘要</th> -->
			<!-- <th field="content" >文章内容</th>
			<th field="content_cn" >文章内容(cn)</th> -->
			<th field="comment" >栏目排序</th>
			<!--<th field="logo" >文章缩略图</th>
			 <th field="isenable" formatter="formatterisdel">文章是否通过审核</th>
			<th field="stick" formatter="formatterisdel">文章是否置顶</th>
			<th field="good" formatter="formatterisdel">是否加精</th>
			<th field="visit" >文章浏览次数</th>
			
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：1是；0否</th> -->
		</thead>

	</table>
   
    
   <!--添加窗口--> 
    <div id="articleadd" class="easyui-window" title="添加栏目文章" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveColumn.html" method="post" name="articleAS">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" id="id"></input></td>
                    <td style="width:100px">文章ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" id="ssid"></input></td>
	    		</tr>
                <tr>
                	<td>栏目类型：</td>
                	<td>
                		<select name="type" style="width:135px">
                			<option value="about">about</option>
                			<option value="joinus">joinus</option>
                			<option value="community">community</option>
                			<option value="partnership">partnership</option>
                		</select>
                	</td>
                	<td></td>
                	<td></td>
                </tr> 
                <tr>
                	<td>文章标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,255]" name="title" id="title"></input></td>
	    			<td>文章标题(cn):</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,255]" name="title_cn"></input></td>
                </tr>
                <tr>
                    <td>文章附记:</td>
	    			<td><textarea name="note" id="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    			<td></td>
	    			<td></td>
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
                        <textarea name="content" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>
	    		 <tr>
	    			<td>文章内容(cn):</td>
	    			<td colspan="3">
                    		<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content_cn"]', {
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
                        <textarea name="content_cn" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>                              
                <tr>
	    			<td>栏目排序：</td>
                    <td><input name="comment" class="easyui-numberbox" validType="length[0,2]" ></td>
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
 <div id="articleedit" class="easyui-window" title="修改栏目文章" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateColumn.html" method="post" name="articleES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" id="id"></input></td>
                    <td style="width:100px">文章ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" id="ssid"></input></td>
	    		</tr>
                <tr>
                	<td>栏目类型：</td>
                	<td>
                		<select name="type" style="width:135px">
                			<option value="about">about</option>
                			<option value="joinus">joinus</option>
                			<option value="community">community</option>
                			<option value="partnership">partnership</option>
                		</select>
                	</td>
                	<td></td>
                	<td></td>
                </tr> 
               <tr>
                	<td>文章标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,255]" name="title"></input></td>
	    			<td>文章标题(cn):</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,255]" name="title_cn"></input></td>
                </tr>
                <tr>
                    <td>文章附记:</td>
	    			<td><textarea name="note" id="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    			<td></td>
	    			<td></td>
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
	    			<td>文章内容:</td>
	    			<td colspan="3">
                    		<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content_cn"]', {
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
                        <textarea name="content_cn" id="content_cn" style="width:450px;height:250px;visibility:hidden;">快点输入你的详细信息吧...</textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>                            
                <tr>
	    			<td>栏目排序：</td>
                    <td><input name="comment" class="easyui-numberbox" validType="length[0,2]" ></td>
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
						
						$('#articleedit').form('load', 'getColumnById.html?id='+row.id);
						 $.post("getColumnById.html?id="+row.id,{},function(data){
								KindEditor.html('#content',data.content);
								KindEditor.html('#content_cn',data.content_cn);
							},"json");
						
						$('#articleedit').window('open');
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
								    url: 'delArticleById.html?id='+row.id,
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