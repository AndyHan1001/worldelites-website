<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>图片管理</h2>       
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
  
	<table width="100%" style="height:450px;" id="dg" title="文章列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getPictureList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >流水号</th>
			<th field="ssid" >图片id</th>
			<th field="channel" >所属主体</th>
			<th field="parentid" >所属主体ID</th>
			<th field="type" >图片类型</th>
			<th field="typecode" >类型代码</th>
			<th field="ctime" formatter="formatterdate">发表时间</th>
			<th field="utime" formatter="formatterdate">更新时间</th>
			<th field="btime" formatter="formatterdate">开始时间</th>
			<th field="etime" formatter="formatterdate">结束时间</th>
			<th field="title" >图片标题</th>
			<th field="author" >图片作者</th>
			<th field="keyword" >关键词</th>
			<th field="note" >附记</th>
			<th field="source" >图片来源</th>
			<th field="memo" >摘要</th>
			<th field="content" >图片内容</th>
			<th field="logo" >图片缩略图</th>
			<th field="url" >图片地址</th>
			<th field="isenable" formatter="formatterisdel">图片是否通过审核</th>
			<th field="stick" formatter="formatterisdel" >图片是否置顶</th>
			<th field="visit" >图片浏览次数</th>
			<th field="comment" >评论数量</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否。1是</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="pictureadd" class="easyui-window" title="添加新图片" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="savePicture.html" method="post" name="pictureAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加图片
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">图片ID:</td>
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
	    			<td>图片类型:</td>
	    			<td><select class="easyui-combobox"  name="type" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'../init/getAllTypeJson.html',onChange:function(){$('#typecode_as').val($(this).combobox('getValue'))}"></select>
                    <td>类型代码:</td>
	    			<td><input name="typecode" id="typecode_as" required="required" class="easyui-validatebox" missingMessage="无法获取评论类型编号<br>请查看评论类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
	    			<td>图片发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
                    <td>图片更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"></input></td>
	    		</tr>
                <tr>
	    			<td>图片开始时间:</td>
	    			<td><input name="btime_as" id="btime_as" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>图片结束时间:</td>
	    			<td><input name="etime_as" id="etime_as" class="easyui-datetimebox" required="required"
	    			validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>图片标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
                    <td>图片作者:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,20]" name="author"></input></td>
	    		</tr>
  				 <tr>
	    			<td>图片关键字:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>图片附记:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>图片来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="source" style="background:#FFF"></input></tds>
                    <td>图片摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="18" style="background:#FFF"></textarea></td>
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
                	 <td>图片缩略图:</td>
	    			<td>
						<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
					</td>
                     <td>图片URL:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,200]" name="url"></input></td>
                </tr>
                <tr>
	    			<td>图片是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <td>图片是否置顶:</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr>
                
                <tr>
                    <td>图片浏览次数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="visit" ></input></td>
	    			<td>图片数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="comment" ></input></td>                    
	    		</tr> 
                <!-- <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
	    		</tr>  -->                             
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="pictureA()" value="提交">&nbsp;&nbsp;
                        <script>
							function pictureA(){
								if($('[name="pictureAS"]').form('validate')){
										$('[name="pictureAS"]').submit();

								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加图片窗口--结束-->
    <!--修改窗口--> 
    <div id="pictureedit" class="easyui-window" title="修改图片" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updatePicture.html" method="post" name="pictureES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改图片
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">图片ID:</td>
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
	    			<td>图片类型:</td>
	    			<td><select class="easyui-combobox"  name="type" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'../init/getAllTypeJson.html',onChange:function(){$('#typecode_es').val($(this).combobox('getValue'))}"></select>
                    <td>类型代码:</td>
	    			<td><input name="typecode" id="typecode_es" required="required" class="easyui-validatebox" missingMessage="无法获取评论类型编号<br>请查看评论类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                <tr>
	    			<td>图片发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
                    <td>图片更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"></input></td>
	    		</tr>
                <tr>
	    			<td>图片开始时间:</td>
	    			<td><input name="btime_es" id="btime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>图片结束时间:</td>
	    			<td><input name="etime_es" id="etime_es" class="easyui-datetimebox"
	    			 validType="TimeCheck['btime_es']" invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>图片标题:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
                    <td>图片作者:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,20]" name="author"></input></td>
	    		</tr>
  				 <tr>
	    			<td>图片关键字:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>图片附记:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
	    			<td>图片来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" name="source" style="background:#FFF"></input></tds>
                    <td>图片摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="18" style="background:#FFF"></textarea></td>
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
                	 <td>图片缩略图:</td>
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
                     <td>图片URL:</td>
	    			<td><input class="easyui-validatebox" required="true"  validType="length[0,200]" name="url"></input></td>
                </tr>
                <tr>
	    			<td>图片是否通过审核:</td>
	    			<td><select name="isenable"><option value="1">是</option><option value="0" selected>否</option></select></td>
                    <td>图片是否置顶:</td>
	    			<td><select name="stick"><option value="1">是</option><option value="0" selected>否</option></select></td>
                   
	    		</tr>
                
                <tr>
                    <td>图片浏览次数:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="visit" ></input></td>
	    			<td>图片数量:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="comment" ></input></td>                    
	    		</tr> 
                <!-- <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
	    		</tr>  -->                             
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="pictureE()" value="提交">&nbsp;&nbsp;
                        <script>
							function pictureE(){
								if($('[name="pictureES"]').form('validate')){
										$('[name="pictureES"]').submit();

								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>   
    <!--修改图片窗口--结束-->    

    
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
						//document.getElementById("add_parentid").value=pid;  */
						$('#pictureadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#pictureedit').form('load', 'getPictureById.html?id='+row.id);
						$.post("getPictureById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							
							$('#pictureedit #ctime_es').datetimebox('setValue',data.ctime);
							$('#pictureedit #utime_es').datetimebox('setValue',data.utime);
							$('#pictureedit #btime_es').datetimebox('setValue',data.btime);
							$('#pictureedit #etime_es').datetimebox('setValue',data.etime);							
						},"json")
						$('#pictureedit').window('open');
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
								    url: 'delPictureById.html?id='+row.id,
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