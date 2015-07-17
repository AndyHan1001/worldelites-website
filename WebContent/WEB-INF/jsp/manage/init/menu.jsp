<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>外加项管理</h2>       
     <!--搜索菜单窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" 
  			style="width:800px;height:50px;padding:10px;overflow:hidden" 
  			data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="post">
            	<table>
                	<tr>
                    	<td>关键字检索：</td>
                        <td>类型：
                        	<select class="easyui-combobox" name="">
                        		<option value="0">全文</option>
                        		<option value="1">.</option>
                       	    </select>
                            <input class="textbox" name="">
                        </td>
                        <td><input type="button" value="检索"></td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
    <!--搜索菜单窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="外加项列表" 
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getMenuList.html',method:'post'">
		<thead>
		 <tr>  
		 	<th data-options="field:'ck',checkbox:true"></th>
            <th field="id" >数据库ID</th>  
            <!-- <th field="ssid">栏目ID</th> -->  
            <th field="name" >项目名称</th>  
            <th field="memo" >项目名称(cn)</th>  
            <th field="parentid">项目类型</th>  
            <!-- <th field="parentname">上级栏目名称</th>  -->
           <!--  <th field="url">栏目地址</th>
            <th field="logo" >栏目图标</th>  --> 
            <th field="paixu" >项目排序</th>  
            <th field="isenable" >是否启用</th>  
            <!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th>  --> 
        </tr>  
		</thead>
	</table>
	
    <!--添加菜单窗口--> 
    <div id="menuadd" class="easyui-window" title="添加项目" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" 
     style="width:500px;height:230px;padding:10px;">
	    <form action="saveMenu.html" method="post" name="menuAS">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:100px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id"></input></td>
                    <td style="width:100px">栏目编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid"></input></td>
	    		</tr>
	    		<tr>
	    			<td>项目名称:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" required="true" name="name" ></input></td>
                    <td>项目名称(cn):</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" required="true" name="memo" ></input></td>
	    		</tr>
                <tr style="display:none">
	    			<td>栏目地址:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]" style="background:#FFF;width:130px;border:#A5ACB2 1px solid" name="url"></input></td>
                    <td>栏目图标:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; ">
 						</iframe>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>项目类型:</td>
	    			<td>
						<select name="parentid" style="width:130px">
							<option value="1">房产公司</option>
							<option value="2">公寓配置</option>
							<option value="3">社区设施</option>
							<option value="4">杂费项目</option>
							<option value="5">包含杂费项目</option>
							<option value="6">公寓标签</option>
							<option value="7">帖子标签</option>
							
						</select>
					</td>
                    <td>项目排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,2]" name="paixu"></input></td>
	    		</tr>
                
                <tr> 
                	<td>是否启用:</td>
                    <td colspan="3">
                    	<select   name="isenable">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    			<!-- <td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
                   
	    		</tr>               
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="submit" value="提交">&nbsp;&nbsp;
                        <script>
							function menuA(){
								if($('[name="menuAS"]').form('validate'))
									$('[name="menuAS"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加菜单窗口--结束-->
    
    <!--修改菜单窗口--> 
    <div id="menuedit" class="easyui-window" title="修改项目" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" 
    style="width:500px;height:230px;padding:10px;">
	    <form action="updateMenu.html" method="post" name="menuES">
	    	<table cellpadding="5" border="0">
            	
	    		<tr style="display:none">
	    			<td style="width:100px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">栏目ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>项目名称:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" required="true" name="name" ></input></td>
                    <td>项目名称(cn):</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" required="true" name="memo" ></input></td>
	    		</tr>
	    		
                <tr style="display:none">
	    			<td>栏目地址:</td>
	    			<td><input  class="easyui-validatebox" validType="length[0,30]" style="background:#FFF;width:130px;border:#A5ACB2 1px solid" name="url" name="url"></input></td>
                    <td>栏目图标:</td>
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
	    		</tr>
                 <tr>
	    			<td>项目类型:</td>
	    			<td>
						<select name="parentid" style="width:130px">
							<option value="1">房产公司</option>
							<option value="2">公寓配置</option>
							<option value="3">社区设施</option>
							<option value="4">杂费项目</option>
							<option value="5">包含杂费项目</option>
							<option value="6">公寓标签</option>
							<option value="7">帖子标签</option>
						</select>
					</td>
                    <td>项目排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,2]" name="paixu"></input></td>
	    		</tr>
                
                <tr> 
                	<td>是否启用:</td>
                    <td colspan="3">
                    	<select  name="isenable">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    			<!-- <td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
                   
	    		</tr>               
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="button" onClick="menuE()" value="提交">&nbsp;&nbsp;
                        <script>
							function menuE(){
								if($('[name="menuES"]').form('validate'))
									$('[name="menuES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--编辑菜单窗口--结束-->
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
				document.getElementById("menu_add_parentid").value=pid; */
				$('#menuadd').window('open');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
				var row = $('#dg').datagrid('getSelected');
				$('#menuedit').form('load', 'getMenuById.html?id='+row.id);
				$('#menuedit').window('open'); 
				
				//setTimeout(loadLogo,1000);
				
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
						    url: 'delMenuById.html?id='+row.id,
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