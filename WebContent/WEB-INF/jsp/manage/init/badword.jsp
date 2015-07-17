<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>违禁词管理</h2>       
     <!--搜索违禁词窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                    	<td style="font-size:16px;color:red;font-weight:600">关键字检索：</td>
                        <td>类型
                        	<select class="easyui-combobox" name="" id="searchType">
                        		<option value="违禁词">违禁词</option>
                       	    </select>
                            相关文字(不填写为所选类型下所有数据)<input class="textbox" name="" id="searchKeyword">
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
    <!--搜索违禁词窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="违禁词列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getBadWordList.html',method:'get'">
	 <thead>
	 		<th data-options="field:'ck',checkbox:true"></th>
            <th field="id" >流水号</th>
            <th field="word" >违禁词</th>
           <!--  <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th>  -->
     </thead>   

	</table>

    <!--添加窗口--> 
    <div id="badwordadd" class="easyui-window" title="添加违禁词" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:680px;height:330px;padding:10px;">
	    <form action="saveBadWord.html" method="post" name="badwordAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加违禁词
                </caption>
	    		<tr>
	    			<td style="width:100px">违禁词编号:</td>
	    			<td style="width:200px"><input name="id" onfocus="this.blur()"  readonly="readonly"></input></td>
                    <td style="width:100px">违禁词:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="word"></input></td>
	    		</tr>
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="hidden" name="isdel" value="0">
                    	<input type="button" onClick="badwordA()" value="提交">&nbsp;&nbsp;
                        <script>
							function badwordA(){
								if($('[name="badwordAS"]').form('validate'))
									$('[name="badwordAS"]').submit();
							}
						</script>                     
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加窗口--结束-->
    
    <!--修改窗口--> 
<div id="badwordedit" class="easyui-window" title="添加违禁词" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:680px;height:330px;padding:10px;">
	    <form action="updateBadWord.html" method="post" name="badwordES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改违禁词
                </caption>
	    		<tr>
	    			<td style="width:100px">违禁词编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id"></input></td>
                    <td style="width:100px">违禁词:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="word"></input></td>
	    		</tr>           
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="hidden" name="isdel" value="0">
                    	<input type="button" onClick="badwordE()" value="提交">&nbsp;&nbsp;
                        <script>
							function badwordE(){
								if($('[name="badwordES"]').form('validate'))
									$('[name="badwordES"]').submit();								
							}
						</script>                        
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
    <!--编辑窗口--结束-->

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
						$('#badwordadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#badwordedit').form('load', 'getBadWordById.html?id='+row.id);
						$('#badwordedit').window('open');
					}
				},{
					iconCls:'icon-remove',
					handler:function(){						
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }						
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){ 
						    	var row = $('#dg').datagrid('getSelected');
						    	$.ajax({
								    url: 'delBadWordById.html?id='+row.id,
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