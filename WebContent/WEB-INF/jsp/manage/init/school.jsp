<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>学校管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="mark" >内部编号</option>
								<option value="name" >学校名称</option>
								<option value="memo" >学校缩写</option>
								<option value="parentid" >所在州编号</option>
								<option value="isenable" >是否启用</option>
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
						$.post("searchsystem.html",{table:"School",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%"  style="height:450px;" id="dg" title="学校列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getSchoolList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<!-- <th field="ssid" >学校编号</th> -->
			<th field="mark" >内部编号</th>
			<th field="name" >学校名称</th>
			<th field="memo" >学校缩写</th>
			<th field="info" >学校介绍</th>
			<th field="info_cn" >学校介绍(cn)</th>
			<th field="parentname" >所在州名称</th>
			<th field="parentid" >所在州编号</th>
			<th field="logo" >学校图片路径</th>
			<th field="atlas" >学校图集路径</th>
			<th field="location" >学校地理位置</th>
			<th field="sort" >学校排序</th>
			<th field="isenable"  formatter="formatterisdel">是否启用</th>
			
			<th field="meta_title" >SEO 标题</th>
			<th field="meta_description" >SEO 描述</th>
			<th field="meta_keywords" >SEO 关键字</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="schooladd" class="easyui-window" title="添加新学校" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveSchool.html" method="post" name="schoolAS">
	    	<table cellpadding="5" border="0">
	    		<tr  style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">学校编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td style="width:250px" >学校名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>学校缩写:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="memo" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>学校介绍:</td>
	    			<td colspan="3">
						<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="info"]', {
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
                        <textarea name="info" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
					</td>
	    		</tr> 
	    		 <tr>
	    			<td>学校介绍(cn):</td>
	    			<td colspan="3">
						<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="info_cn"]', {
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
                        <textarea name="info_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
					</td>
	    		</tr> 
	    		
	    		 <tr>
	    			<td>学校所在州名称:</td>
	    			<td>
	    			
	    			
	    			<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getPrvcListByWordKey.html',
	    			onChange:function(){$('#parentid_as').val($(this).combobox('getValue'))}" >
	    			</select>
	    			</td>
	    			<td>州编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_as" data-options="required:true"></input></td>
	    		</tr> 
	    		<tr>
		           <td colspan="4"></td>
                </tr>
                 <tr>
	    			<td>学校缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>	    			
	    			</td>
					<td></td>
					<td></td>
                	
                </tr>
				<tr>
	    			<td vlign="top">学校图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="atlas" id="defpicList" />
  						<iframe id="ifmupdo" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
               	
                </tr>
				<tr>
	    			<td vlign="top">学校位置:</td>
	    			<td colspan="3">
	    				<input style="width:600px;border:1px red solid;" type="text" name="location" id="location" />
  						<iframe id="ifmlocationdo" name="ifmlocationdo"  src="<%=request.getContextPath()+"/resources/MapSet.html"%>" frameborder="0" scrolling="no" width="610" height="355" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
                	
                </tr> 
                <tr>
					<td>SEO标题:</td>
	    			<td><input class="easyui-validatebox" name="meta_title"  validType="length[0,512]"></input></td>
	    			<td>SEO关键字:</td>
	    			<td><input class="easyui-validatebox" name="meta_keywords"  validType="length[0,512]"></input></td>
				</tr>        
				<tr>
					<td>SEO描述:</td>
	    			<td colspan="3"><input class="easyui-validatebox" style="width:600px" name="meta_description"  validType="length[0,512]"></input></td>
				</tr>                
                <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否启用:</td>
	    			<td clospan="3"><select name="isenable">
                    		<option value="1">是</option>
                            <option value="0" selected>否</option>
                         </select>
                    </td>
	    		</tr>   
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="schoolA()" value="提交">&nbsp;&nbsp;
                        <script>
							function schoolA(){
								if($('[name="schoolAS"]').form('validate'))
									$('[name="schoolAS"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加--结束-->
    
    
   <!--修改窗口--> 
    <div id="schooledit" class="easyui-window" title="修改学校" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateSchool.html" method="post" name="schoolES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" id="id" ></input></td>
                    <td style="width:100px">学校编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                 <tr>
	    			<td style="width:250px">学校名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>学校缩写:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="memo" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>学校介绍:</td>
	    			<td colspan="3">
						<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="info"]', {
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
                        <textarea name="info" id="info" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
					</td>
	    		</tr> 
	    		 <tr>
	    			<td>学校介绍(cn):</td>
	    			<td colspan="3">
						<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="info_cn"]', {
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
                        <textarea name="info_cn" id="info_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
					</td>
	    		</tr> 
	    		 <tr>
	    			<td>学校所在州名称:</td>
	    			<td>
						<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getPrvcListByWordKey.html',
	    			onChange:function(){$('#parentid_es').val($(this).combobox('getValue'))}" >
	    			</select>
					</td>
	    			
	    			<td>州编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_es" data-options="required:true"></input></td>
	    		</tr> 
                 <tr>
	    			<td>学校缩略图:</td>
	    			<td>
	    				<input  name="logo" type="hidden" id="logo_es" />
	    				<div id="logoView">
	    					原图片:<img src='<%=path %>/fileupload/images/' width='80' height='40' id="imgg"/>
	    				</div>
	    				<script>
	    					function loadLogo(){
	    						$("#logoView img").attr("src","/fileupload/images/"+$("#logo_es").val());
	    					}
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
					<td></td>
	    			<td></td>
                	
                </tr>
                <tr>
		           <td colspan="4"></td>
                </tr>
                <tr>
	    			<td vlign="top">学校图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="atlas" id="defpicList_es" />
  						<iframe id="ifmupdo_es" name="ifmupdo_es"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
                </tr>
				<tr>
	    			<td vlign="top">学校位置:</td>
	    			<td colspan="3">
	    				<input style="width:600px;border:1px red solid;" type="text" name="location" id="location_es" />
  						<iframe id="ifmlocationdo" name="ifmlocationdo"  src="<%=request.getContextPath()+"/resources/MapSet.html"%>" frameborder="0" scrolling="no" width="610" height="355" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>               	
                </tr>    
                <tr>
					<td>SEO标题:</td>
	    			<td><input class="easyui-validatebox" name="meta_title"  validType="length[0,512]"></input></td>
	    			<td>SEO关键字:</td>
	    			<td><input class="easyui-validatebox" name="meta_keywords"  validType="length[0,512]"></input></td>
				</tr>        
				<tr>
					<td>SEO描述:</td>
	    			<td colspan="3"><input class="easyui-validatebox" style="width:600px" name="meta_description"  validType="length[0,512]"></input></td>
				</tr> 
                 <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否启用:</td>
	    			<td><select name="isenable">
                    		<option value="1">是</option>
                            <option value="0" selected>否</option>
	    		</tr>                              
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="schoolE()" value="提交">&nbsp;&nbsp;
                        <script>
							function schoolE(){
								if($('[name="schoolES"]').form('validate'))
									$('[name="schoolES"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	   
    <!--修改评论窗口--结束-->    
 
<script type="text/javascript">
var nowParentid=0;
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
					pid = row.id; */
				$.get("setAtlasSessionClear.html",{},function(data){},"text");
				document.getElementById("ifmupdo").src=document.getElementById("ifmupdo").src+"?rnd="+Math.random()*100000;
				$('#schooladd').window('open');
				setTimeout(function(){
					$('#ifmupdo').attr('src',$('#ifmupdo').attr('src'));
				},1000);
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return;}
				var row = $('#dg').datagrid('getSelected');
				
				$.get("setAtlasSession.html",{atlas:row.atlas},function(data){},"text");
				
				$('#schooledit').form('load', 'getSchoolById.html?id='+row.id);
				 $.post("getSchoolById.html?id="+row.id,{},function(data){
					 KindEditor.html('#info',data.info);
					 KindEditor.html('#info_cn',data.info_cn);
				 },"json");
				//$('#ifmupdo_es').reload();
				//document.getElementById("ifmupdo_es").src=document.getElementById("ifmupdo_es").src+"?rnd="+Math.random()*1000;		
				$('#schooledit').window('open');
				$('#ifmupdo_es').attr('src',$('#ifmupdo_es').attr('src'));
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
						    url: 'delSchoolById.html?id='+row.id,
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
				location.href="outExcelForSchool.html";
			}
		}]
	});			
})
</script>
</body>
</html>