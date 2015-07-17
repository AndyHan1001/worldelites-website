<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>帖子管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="id" >数据库ID</option>
								<option value="channel" >帖子类型</option>
								<option value="keyword" >帖子分类</option>
								<option value="typecode" >学校代码</option>
								<option value="title" >帖子标题</option>
								<option value="authorid" >帖子作者ID</option>
								<option value="isenable" formatter="formatterisdel">帖子是否通过审核(1为通过,0为不通过)</option>
								<option value="stick" formatter="formatterisdel">帖子首页显示（首页左侧）</option>
								<option value="good" formatter="formatterisdel">帖子首页显示（首页右侧）</option>
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
						$.post("searchsystem.html",{table:"Thread",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="帖子列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getThreadList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<th field="channel" >帖子类型</th>
			<th field="keyword" >帖子分类</th>
			<!-- <th field="parentid" >父级ID</th> -->
			<!-- <th field="type" >归属板块(学校)</th> -->
			<th field="type" >学校代码</th>
			<th field="ctime" formatter="formatterdate">帖子发表时间</th>
			<!-- <th field="utime" formatter="formatterdate">更新时间</th> -->
			<!-- <th field="btime" formatter="formatterdate">开始时间</th>
			<th field="etime" formatter="formatterdate">结束时间</th> -->
			<th field="title" >帖子标题</th>
			<th field="authorid" >帖子作者ID</th>
			<th field="authorname" >帖子作者</th>
			<!-- <th field="keyword" >关键词</th>
			<th field="note" >备注</th>
			<th field="source" >帖子来源</th> -->
			<th field="memo" >摘要</th>
			<!-- <th field="content" >帖子内容</th> -->
			<th field="logo" >帖子缩略图</th>
			<!-- <th field="atlas" >帖子图集ID</th> -->
			<th field="isenable" formatter="formatterisdel">帖子是否通过审核</th>
			<th field="stick" formatter="formatterisdel">帖子是否首页显示（首页左侧）</th>
			<th field="good" formatter="formatterisdel">帖子是否首页显示（首页右侧）</th>
			<th field="comment" >排序</th>
			<!-- <th field="visit" >帖子浏览次数</th> -->
			<!-- <th field="comment" >回复数量</th>
			<th field="vote" >点赞数量</th>
			<th field="replayuserid" >最后回复会员ID</th>
			<th field="replayusername" >最后回复会员名称</th>
			<th field="replaytime" formatter="formatterdate">最后回复时间</th> -->
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否.1是</th> -->
		</thead>
		<tbody>
			
		</tbody>
	</table>

    <!--添加窗口--> 
    <div id="threadadd" class="easyui-window" title="添加帖子" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveThread.html" method="post" name="threadAS">
	    	<table cellpadding="5" border="0">
	    		
               <tr>
	    			<td style="width:200px">帖子类型:</td>
	    			<td><select style="width:135px" name="channel">
	    					<option value="thread">用户帖</option>
	    					<option value="notice">官方贴</option>
	    					<option value="resource">资源帖</option>
	    					<option value="activity">线下活动贴</option>
	    					<option value="sponsor">赞助帖</option>
	    				</select>
	    			</td>
                    <td>帖子分类:</td>
	    			<td><select class="easyui-combobox"  name="keyword" data-options=" valueField: 'id',
	    			textField: 'name',width:135,url:'getAllThreadTagList.html'">
	    			</select>
	    			</td>
	    		</tr>
                <tr>
	    			<td>帖子板块(学校):</td>
	    			<td><select class="easyui-combobox"  name="type" data-options=" valueField: 'id',
	    			textField: 'name',width:135,url:'getAllSchoolList.html'"></select>
                    <td><!-- 学校代码: --></td>
	    			<td><%-- <input name="typecode" id="typecode_as" required="required" class="easyui-validatebox" missingMessage="无法获取帖子类型编号<br>请查看帖子类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input> --%></td>
	    		</tr>
                <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
                   <!--  <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"></input></td>
	    		</tr>
                
                <tr> -->
	    			<td>帖子标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
	    		</tr>
                 <tr>
                    <td>作者邮箱:</td>
	    			<td><select class="easyui-combobox"  name="authorname" required="required" data-options=" valueField: 'id',
	    			textField: 'mail',width:135,url:'getAllUserJson.html',onChange:function(){$('#authorid_as').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>作者编号:</td>
	    			<td><input name="authorid" id="authorid_as" required="required" class="easyui-validatebox" missingMessage="无法获取作者编号<br>请查作者是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
  				
                 <tr>
                    <td>帖子摘要:</td>
	    			<td><textarea name="memo" rows="1" cols="15" style="background:#FFF"></textarea></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                 <tr>
	    			<td>帖子内容:</td>
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
                	 <td>帖子缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; ">
 						</iframe>
	    			</td>
                </tr>
                <tr>
                	<td>帖子是否推荐(左):</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
	    			<td>帖子是否推荐(右):</td>
	    			<td><select name="good"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr> 
	    		<tr>
	    			<td>帖子是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0">否</option></select></td>
                    <td>帖子排序:</td>
	    			<td><input class="easyui-numberbox" name="comment" validType="length[0,8]"></input></td>
	    		</tr>
 <!--                <tr>
	    			<td>评论数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="comment" ></input></td>
                    <td>点赞数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="vote" ></input></td>
                </tr>
                <tr>
	    			<td>最后回复会员ID:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="replayuserid" ></input></td>
                    <td>最后回复会员名称:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="replayusername" ></input></td>
                </tr>   -->  
                <!-- <tr>
                	<td>最后回复时间:</td>
	    			<td colspan="3"><input class="easyui-datetimebox" required="required" editable="false" name="replaytime_as" id="replaytime_as"></input></td>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    		</tr>   -->                            
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="threadA()" value="提交">&nbsp;&nbsp;
                        <script>
							function threadA(){
								if($('[name="threadAS"]').form('validate')){
									$('[name="threadAS"]').submit();

							}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加帖子窗口--结束-->
    
   <!--修改窗口--> 
    <div id="threadedit" class="easyui-window" title="修改帖子" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateThread.html" method="post" name="threadES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">帖子ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
               <tr>
	    			<td style="width:200px">帖子类型:</td>
	    			<td><select style="width:135px" name="channel">
	    					<option value="thread">用户帖</option>
	    					<option value="notice">官方贴</option>
	    					<option value="resource">资源帖</option>
	    					<option value="activity">线下活动贴</option>
	    					<option value="sponsor">赞助帖</option>
	    				</select>
	    			</td>
                     <td>帖子分类:</td>
	    			<td><select class="easyui-combobox"  name="keyword" data-options=" valueField: 'id',
	    			textField: 'name',width:135,url:'getAllThreadTagList.html'">
	    			</select>
	    			</td>
	    		</tr>
                <tr>
	    			<td>帖子板块(学校):</td>
	    			<td><select class="easyui-combobox"  name="type" data-options=" valueField: 'id',
	    			textField: 'name',width:135,url:'getAllSchoolList.html'"></select></td>
                    <td><!-- 学校代码: --></td>
	    			<td><%-- <input name="typecode" id="typecode_es" required="required" class="easyui-validatebox" missingMessage="无法获取帖子类型编号<br>请查看帖子类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input> --%></td>
	    		</tr>
                <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
                    <!-- <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"></input></td>
	    		</tr>
              
                <tr> -->
	    			<td>帖子标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
	    		</tr>
                 <tr>
                    <td>作者邮箱:</td>
	    			<td><select class="easyui-combobox"  name="authorname" required="required" data-options=" valueField: 'id',
	    			textField: 'mail',width:135,url:'getAllUserJson.html',onChange:function(){$('#authorid_es').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>作者编号:</td>
	    			<td><input name="authorid" id="authorid_es" required="required" class="easyui-validatebox" missingMessage="无法获取作者编号<br>请查作者是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
  				
                 <tr>
                    <td>帖子摘要:</td>
	    			<td><textarea name="memo" rows="1" cols="15" style="background:#FFF"></textarea></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                 <tr>
	    			<td>帖子内容:</td>
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
                        <textarea name="content" id="content" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>
                <tr>
                	 <td>帖子缩略图:</td>
	    			<td>
	    				<input  name="logo" type="hidden" id="logo_es" />
	    				<div id="logoView">
	    					原图片:<img src='<%=path %>/fileupload/images/' width='80' height='40' id="imgg"/>
	    				</div>
	    				<script>
	    					function loadLogo(){
	    						$("#logoView img").attr("src","<%=path %>/fileupload/images/"+$("#logo_es").val());
	    					}
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
	    			<td></td>
	    			<td></td>
                </tr>
                <tr>
                    <td>帖子是否推荐(左):</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   <td>帖子是否推荐(右):</td>
	    			<td><select name="good"><option value="1">是</option><option value="0" selected>否</option></select></td>
	    		</tr>
                <tr>
	    			<td>帖子是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <!-- <td>帖子浏览次数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="visit" ></input></td> -->
	    			 <td>帖子排序:</td>
	    			<td><input class="easyui-numberbox" name="comment" validType="length[0,8]"></input></td>
	    		</tr> 
                <!-- <tr>
	    			<td>评论数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="comment" ></input></td>
                    <td>点赞数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="vote" ></input></td>
                </tr>
                <tr>
	    			<td>最后回复会员ID:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="replayuserid" ></input></td>
                    <td>最后回复会员名称:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="replayusername" ></input></td>
                </tr> -->    
               <!--  <tr>
                	<td>最后回复时间:</td>
	    			<td colspan="3"><input class="easyui-datetimebox" required="required" editable="false" name="replaytime_es" id="replaytime_es"></input></td>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    		</tr>    -->                           
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="threadE()" value="提交">&nbsp;&nbsp;
                        <script>
							function threadE(){
								if($('[name="threadES"]').form('validate')){
									$('[name="threadES"]').submit();

							}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
    <!--修改帖子窗口--结束-->    


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
						$('#threadadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#threadedit').form('load', 'getThreadById.html?id='+row.id);
						$.post("getThreadById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							
							$('#threadedit #ctime_es').datetimebox('setValue',data.ctime);
							$('#threadedit #utime_es').datetimebox('setValue',data.utime);
							$('#threadedit #replaytime_es').datetimebox('setValue',data.replaytime);
						},"json")
						$('#threadedit').window('open');
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
								    url: 'delThreadById.html?id='+row.id,
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