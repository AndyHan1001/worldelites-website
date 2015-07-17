<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>地理位置管理</h2>       
          <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="mark" >内部编号</option>
								<option value="name" >地理名称</option>
								<option value="memo" >缩写</option>
								<option value="isenable">是否启用</option>
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
						$.post("searchsystem.html",{table:"Geography",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%"  style="height:450px;" id="dg" title="地理位置列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getGeographyList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<!-- <th field="ssid" >地理编号</th> -->
			<th field="mark" >内部编号</th>
			<th field="name" >地理名称</th>
			<!-- <th field="parentid" >地理名称父级ID</th> -->
			<!-- <th field="logo" >地理图片</th> -->
			<th field="memo" >缩写</th>
			<th field="paixu" >地理排序</th>
			<th field="isenable"  formatter="formatterisdel">是否启用</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="geographyadd" class="easyui-window" title="添加新地理位置" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
	    <form action="saveGeography.html" method="post" name="geographyAS">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">地理编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>地理名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,30]"  name="name" data-options="required:true" ></input></td>
	    		<%-- 	<td>地理名称父级ID:</td>
	    			<td><input id="add_parentid" onfocus="this.blur()"  readonly="readonly" name="parentid"></input></td>
	    		</tr> 
                 <tr>
	    			<td>地理缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>	    			
	    			</td> --%>
                	<td>缩写:</td>
	    			<td><textarea name="memo" rows="1" cols="18"></textarea></td> 
                </tr>
                 <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,5]" name="paixu"></input></td>
                   
	    			<td>是否启用:</td>
	    			<td><select name="isenable" style="width:130px">
                    		<option value="1">是</option>
                            <option value="0">否</option>
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
                    	<input type="button" onClick="geographyA()" value="提交">&nbsp;&nbsp;
                        <script>
							function geographyA(){
								if($('[name="geographyAS"]').form('validate'))
									$('[name="geographyAS"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加评论窗口--结束-->
   <!--修改窗口--> 
    <div id="geographyedit" class="easyui-window" title="修改地理位置" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
	    <form action="updateGeography.html" method="post" name="geographyES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">地理编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>地理名称:</td>
	    			<td><input class="easyui-validatebox" name="name" validType="length[0,30]"  data-options="required:true" ></input></td>
                   <%--  <td>地理名称父级ID:</td>
	    			<td><input onfocus="this.blur()"  readonly="readonly" name="parentid"></input></td>
	    		</tr> 
                 <tr>
	    			<td>地理缩略图:</td>
	    			<td>
							<input type="hidden" name="logo" id="logo_es" />
	    				<div id="logoView"></div>
	    				<script >
	    					document.getElementById("logoView").innerHTML=
	    						"<img src='/MOVIE/fileupload/images/"+document.getElementById('logo_es').value+"' />";
	    				</script>
	    				
 						
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
					</td> --%>
                	<td>缩写:</td>
	    			<td><textarea name="memo" rows="1" cols="18"></textarea></td> 
                </tr>
                 <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,5]"  name="paixu"></input></td>
                    
	    			<td>是否启用:</td>
	    			<td><select name="isenable" style="width:130px;">
                    		<option value="1">是</option>
                            <option value="0" selected>否</option>
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
                    	<input type="button" onClick="geographyE()" value="提交">&nbsp;&nbsp;
                        <script>
							function geographyE(){
								if($('[name="geographyES"]').form('validate'))
									$('[name="geographyES"]').submit();
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
				//$('#add_parentid').val(nowParentid);
				$('#geographyadd').window('open');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
				var row = $('#dg').datagrid('getSelected');
				$('#geographyedit').form('load', 'getGeographyById.html?id='+row.id);
				$('#geographyedit').window('open'); 
			}
		}/* ,{
			iconCls:'icon-redo',
			handler:function(){//查看下级的地理位置
				var row = $('#dg').datagrid('getSelected');
				var pssid = 0;
				if(row != null)
					nowParentid = row.ssid;
				//$('#geographyadd').form('load', 'getGeographyList.html?parentid='+row.ssid);
				$('#dg').datagrid('reload',{parentid:nowParentid});
			}
		} */,{
			iconCls:'icon-remove',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
				var row = $('#dg').datagrid('getSelected');
				$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
				    if (r){ 
				    	var row = $('#dg').datagrid('getSelected');
				    	$.ajax({
						    url: 'delGeography.html?id='+row.id,
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