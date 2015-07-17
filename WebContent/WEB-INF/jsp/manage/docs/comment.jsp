<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>评论管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="fromusername" >发起评论用户名称</option>
								<option value="title" >评论标题</option>
								<option value="keyword" >关键词</option>
								<option value="content" >评论内容</option>
								<option value="isenable" >评论是否通过审核</option>
								<option value="stick">评论是否置顶</option>
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
						$.post("searchsystem.html",{table:"Comment",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="评论列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getCommentList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >流水号</th>
			<th field="ssid" >评论id</th>
			<th field="channel" >品论主体</th>
			<th field="parentid" >主体id</th>
			<th field="fromuserid" >发起评论用户的id</th>
			<th field="fromusername" >发起评论用户名称</th>
			<th field="ctime" formatter="formatterdate">评论发表时间</th>
			<th field="utime" formatter="formatterdate">更新时间</th>
			<th field="btime" formatter="formatterdate">开始时间</th>
			<th field="etime" formatter="formatterdate">结束时间</th>
			<th field="title" >评论标题</th>
			<th field="keyword" >关键词</th>
			<th field="note" >附记</th>
			<th field="source" >评论来源</th>
			<th field="memo" >摘要</th>
			<th field="content" >评论内容</th>
			<th field="logo" >评论缩略图</th>
			<th field="isenable"  formatter="formatterisdel">评论是否通过审核</th>
			<th field="stick"  formatter="formatterisdel">评论是否置顶</th>
			<th field="visit" >评论浏览次数</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="commentadd" class="easyui-window" title="添加新评论" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveComment.html" method="post" name="commentAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加评论
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">评论ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>评论主体（类型）:</td>
	    			<td><select class="easyui-combobox"  name="channel" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'../init/getAllTypeJson.html',onChange:function(){$('#parentid_es').val($(this).combobox('getValue'))}"></select>
                    <td>主体ID:</td>
	    			<td><input name="parentid" id="parentid_es" required="required" class="easyui-validatebox" missingMessage="无法获取评论类型编号<br>请查看评论类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
              	    <td>发出用户:</td>
	    			<td><select class="easyui-combobox"  name="fromusername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#fromuserid_es').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>发出用户编号:</td>
	    			<td><input name="fromuserid" id="fromuserid_es" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>

	    		</tr>             
                <tr>
	    			<td>评论发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
                    <td>评论更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"></input></td>
	    		</tr>
                <tr>
	    			<td>评论开始时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="btime_as" id="btime_as"></input> </td>
                    <td>评论结束时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="etime_as" 
	    			validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间" id="etime_as"></input> </td>
	    		</tr>
                <tr>
	    			<td>评论标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
  				 <tr>
	    			<td>评论关键字:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>评论附记:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>评论来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="source" style="background:#FFF"></input></td>
                    <td>评论摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>评论内容:</td>
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
                	 <td>评论缩略图:</td>
	    			<td>
						<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
					</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
	    			<td>评论是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <td>评论是否置顶:</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr>
                
                <tr>
                    <td>评论浏览次数:</td>
	    			<td  colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="visit" ></input></td>
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
                    	<input type="button" onClick="commentA()" value="提交">&nbsp;&nbsp;
                        <script>
							function commentA(){
								if($('[name="commentAS"]').form('validate')){
	
										$('[name="commentAS"]').submit();

								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加评论窗口--结束-->
   <!--修改窗口--> 
    <div id="commentedit" class="easyui-window" title="修改评论" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateComment.html" method="post" name="commentES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改评论
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">评论ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>评论主体（类型）:</td>
	    			<td><select class="easyui-combobox"  name="channel" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'../init/getAllTypeJson.html',onChange:function(){$('#parentid_as').val($(this).combobox('getValue'))}"></select>
                    <td>主体ID:</td>
	    			<td><input name="parentid" id="parentid_as" required="required" class="easyui-validatebox" missingMessage="无法获取评论类型编号<br>请查看评论类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
              	    <td>发出用户:</td>
	    			<td><select class="easyui-combobox"  name="fromusername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#fromuserid_as').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>发出用户编号:</td>
	    			<td><input name="fromuserid" id="fromuserid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>

	    		</tr>             
                <tr>
	    			<td>评论发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
                    <td>评论更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"></input></td>
	    		</tr>
                <tr>
	    			<td>评论开始时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="btime_es" id="btime_es"></input> </td>
                    <td>评论结束时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false"
	    			validType="TimeCheck['btime_es']" invalidMessage="结束时间必须大于开始时间" name="etime_es" id="etime_es"></input> </td>
	    		</tr>
                <tr>
	    			<td>评论标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
  				 <tr>
	    			<td>评论关键字:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>评论附记:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>评论来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="source" style="background:#FFF"></input></td>
                    <td>评论摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>评论内容:</td>
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
                	 <td>评论缩略图:</td>
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
	    			<td>评论是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <td>评论是否置顶:</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr>
                
                <tr>
                    <td>评论浏览次数:</td>
	    			<td  colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="visit" ></input></td>
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
                    	<input type="button" onClick="commentE()" value="提交">&nbsp;&nbsp;
                        <script>
							function commentE(){
								if($('[name="commentES"]').form('validate')){

										$('[name="commentES"]').submit();
								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	   
    <!--修改评论窗口--结束-->    
    
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
						/* var row = $('#dg').datagrid('getSelected');
						var pid = 0;
						if(row != null)
							pid = row.id;
						
						//$('#menu_add_parentid').value = pid;
						document.getElementById("type_add_parentid").value=pid; */
						$('#commentadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#commentedit').form('load', 'getCommentById.html?id='+row.id);
						 $.post("getCommentById.html?id="+row.id,{},function(data){
								KindEditor.html('#content',data.content);		
								$('#commentedit #ctime_es').datetimebox('setValue',data.ctime);
								$('#commentedit #utime_es').datetimebox('setValue',data.utime);
								$('#commentedit #btime_es').datetimebox('setValue',data.btime);
								$('#commentedit #etime_es').datetimebox('setValue',data.etime);								
							},"json"); 						
						$('#commentedit').window('open');
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
								    url: 'delCommentById.html?id='+row.id,
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