<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>文章管理</h2>       
          <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="title" >文章标题</option>
								<option value="author" >文章作者</option>
								<option value="content" >文章内容</option>
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
						$.post("searchsystem.html",{table:"Article",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="文章列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getArticleList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<th field="type" >文章类型</th>
			<th field="utime" formatter="formatterdate" >文章更新时间</th>
			<th field="title" >文章标题</th>
			<th field="author" >文章作者</th>
			<th field="keyword" >关键字</th>
			<th field="logo" >文章缩略图</th>
			<th field="isenable" formatter="formatterisdel">文章是否通过审核</th>
			<th field="visit" >文章排序</th>
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="articleadd" class="easyui-window" title="添加新文章" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveArticle.html" method="post" name="articleAS">
	    	<table cellpadding="5" border="0">
	    		
                <tr>
	    			<td>文章类型:</td>
	    			<td>
						<select name="type">
	    					<option value="history">会员故事</option>
	    					<option value="usercase1">左下文章</option>
	    					<option value="usercase2">右下文章</option>
	    					<option value="join_article">加入WE文章</option>
	    				</select>
					</td>
					<td>文章关键字:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="keyword"></input></td>
	    		</tr>
                <tr>
	    			<td>文章标题:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="title"></input></td>
                    <td>文章作者:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="author"></input></td>      
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
                	 <td>文章缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; ">
 						</iframe>
	    			</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
	    			<td>文章是否通过审核:</td>
	    			<td><select name="isenable"><option value="1" selected>是</option><option value="0">否</option></select></td>
                    <td>文章排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="visit"></input></td>
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
    <div id="articleedit" class="easyui-window" title="修改文章" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateArticle.html" method="post" name="articleES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" id="id"></input></td>
                    <td style="width:100px">文章ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" id="ssid"></input></td>
	    		</tr>
                <tr>
	    			<td>文章类型:</td>
	    			<td>
						<select name="type">
	    					<option value="history">会员故事</option>
	    					<option value="usercase1">左下文章</option>
	    					<option value="usercase2">右下文章</option>
	    					<option value="join_article">加入WE文章</option>
	    				</select>
					</td>
					<td>文章关键字:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="keyword"></input></td>
	    		</tr>
                <tr>
	    			<td>文章标题:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="title" ></input></td>
                    <td>文章作者:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="author"></input></td>      
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
                	 <td>文章缩略图:</td>
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
	    			<td>文章是否通过审核:</td>
	    			<td><select name="isenable" id="isenable"><option value="1"  selected>是</option><option value="0">否</option></select></td>
	    			<td>文章排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="visit"></input></td>
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
						$('#articleadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#articleedit').form('load', 'getArticleById.html?id='+row.id);
						 $.post("getArticleById.html?id="+row.id,{},function(data){
								KindEditor.html('#content',data.content);
							},"json");
						
						$('#articleedit').window('open');
						 
						 setTimeout(loadLogo,1000);
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