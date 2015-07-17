<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>关系管理</h2>       
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
  
	<table width="100%" style="height:450px;" id="dg" title="关系列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getRelationList.html',method:'get'">
		<thead>
		<th data-options="field:'ck',checkbox:true"></th>
		<th field="id" >流水号</th>
		<th field="ssid" >关系编号</th>
		<th field="fromuserid" >发出人编号</th>
		<th field="fromusername" >发出人用户名</th>
		<th field="obttype" >目标类型</th>
		<th field="obtid" >目标ID</th>
		<th field="obtname">目标名称</th>
		<th field="ctime" formatter="formatterdate">创建时间</th>
		<th field="utime" formatter="formatterdate">修改时间</th>
		<th field="btime" formatter="formatterdate">开始时间</th>
		<th field="etime" formatter="formatterdate">结束时间</th>
		<th field="state" formatter="formatterisdel">状态:是否通过 </th>
		<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="relationadd" class="easyui-window" title="添加新关系" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveRelation.html" method="post" name="relationAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加关系
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">关系编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>发出用户编号:</td>
	    			<td><input name="fromuserid" id="fromuserid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>发出用户:</td>
	    			<td><select class="easyui-combobox"  name="fromusername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#fromuserid_as').val($(this).combobox('getValue'))}"></select>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>目标编号:</td>
	    			<td><input name="obtid" id="obtid_as" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>目标类型:</td>
	    			<td><select class="easyui-combobox"  name="obttype" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJson.html',onChange:function(){$('#obtid_as').val($(this).combobox('getValue'))}"></select>
	    		</tr>   
                <tr>
	    			<td>目标名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" required="true" name="obtname"  data-options="required:true" ></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>           
                <tr>
	    			<td>关系发表时间:</td>
	    			<td><input name="ctime_as"  class="easyui-datetimebox" required="required" editable="false"></input></td>
                    <td>关系更新时间:</td>
	    			<td><input name="utime_as"  class="easyui-datetimebox" required="required" editable="false"></input></td>
	    		</tr>
                <tr>
	    			<td>关系开始时间:</td>
	    			<td><input name="btime_as" id="btime_as" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>关系结束时间:</td>
	    			<td><input name="etime_as" id="etime_as" class="easyui-datetimebox" validType="TimeCheck['btime_as']"
	    			 invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                 <tr>
                 	<td>状态:</td>
	    			<td colspan="3">
                    	<select  name="state">
                        	<option value="0" selected>未通过</option>
                        	<option value="1">通过</option>
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
                    	<input type="button" onClick="relationA()" value="提交">&nbsp;&nbsp;
                        <script>
							function relationA(){
								if($('[name="relationAS"]').form('validate'))	
										$('[name="relationAS"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加关系窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="relationedit" class="easyui-window" title="修改关系" 
    data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateRelation.html" method="post" name="relationES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改关系
                  </caption>
                  <tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">关系编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>发出用户编号:</td>
	    			<td><input name="fromuserid" id="fromuserid_es" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>发出用户:</td>
	    			<td><select class="easyui-combobox"  name="fromusername" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#fromuserid_es').val($(this).combobox('getValue'))}"></select>
	    			</td>
	    		</tr>
                 <tr>
	    			<td>目标编号:</td>
	    			<td><input name="obtid" id="obtid_es" required="required" class="easyui-validatebox" missingMessage="无法获取用户编号<br>请查看发出用户<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td>目标类型:</td>
	    			<td><select class="easyui-combobox"  name="obttype" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJson.html',onChange:function(){$('#obtid_es').val($(this).combobox('getValue'))}"></select>
	    		</tr>   
                <tr>
	    			<td>目标名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" required="true" name="obtname" id="obtname_id" data-options="required:true" ></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>           
                <tr>
	    			<td>关系发表时间:</td>
	    			<td><input id="ctime_es" name="ctime_es" class="easyui-datetimebox" required="required" editable="false"></input></td>
                    <td>关系更新时间:</td>
	    			<td><input id="utime_es" name="utime_es" class="easyui-datetimebox" required="required" editable="false"></input></td>
	    		</tr>
                <tr>
	    			<td>关系开始时间:</td>
	    			<td><input id="btime_es" name="btime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>关系结束时间:</td>
	    			<td><input id="etime_es" name="etime_es" class="easyui-datetimebox" validType="TimeCheck['btime_es']" 
	    			invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                 <tr>
                 	<td>状态:</td>
	    			<td colspan="3">
                    	<select  name="state">
                        	<option value="0" selected>未通过</option>
                        	<option value="1">通过</option>
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
                    	<input type="button" onClick="relationE()" value="提交">&nbsp;&nbsp;
                        <script>
							function relationE(){
								if($('[name="relationES"]').form('validate'))
										$('[name="relationES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
    <!--修改关系窗口--结束-->    
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

				$('#relationadd').window('open');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
				var row = $('#dg').datagrid('getSelected');
				$('#relationedit').form('load', 'getRelationById.html?id='+row.id);
				 $.post("getRelationById.html?id="+row.id,{},function(data){
						$('#relationedit #ctime_es').datetimebox('setValue',data.ctime);
						$('#relationedit #utime_es').datetimebox('setValue',data.utime);
						$('#relationedit #btime_es').datetimebox('setValue',data.btime);
						$('#relationedit #etime_es').datetimebox('setValue',data.etime);								
					},"json") 						
				$('#relationedit').window('open'); 
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
						    url: 'delRelationById.html?id='+row.id,
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