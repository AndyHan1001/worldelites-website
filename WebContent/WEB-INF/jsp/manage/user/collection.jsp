<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>用户收藏管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                    	<td style="font-size:16px;color:red;font-weight:600">关键字检索：</td>
                        <td>类型
                        	<select class="easyui-combobox" name="" id="searchType">
                        		<option value="000">000</option>
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
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="收藏列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getcollectionList.html',method:'get'">
	 <thead>
	 		<th data-options="field:'ck',checkbox:true"></th>
            <th field="id" >编号</th>
            <th field="userid" >收藏用户编号</th>
            <th field="username" >用户名</th>
            <th field="productid" >商品编号</th>
            <th field="productname" >商品名称</th>
            <th field="memo" >附录</th>
           <!--  <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th>  -->
     </thead>   

	</table>

    <!--添加窗口--> 
    <div id="collectionadd" class="easyui-window" title="添加收藏" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:680px;height:330px;padding:10px;">
	    <form action="savecollection.html" method="post" name="collectionAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加收藏
                </caption>
	    		<tr>
	    			<td style="width:100px">收藏编号:</td>
	    			<td style="width:200px"><input name="id" onfocus="this.blur()"  readonly="readonly"></input></td>
	    			 <td style="width:100px">附录:</td>
	    			<td style="width:200px"><input validType="length[0,255]"  class="easyui-validatebox" name="memo"></input></td>
	    		</tr>
	    		<tr>
                    <td style="width:100px">收藏用户编号:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="userid"></input></td>
	    			 <td style="width:100px">收藏用户名称:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,255]"  class="easyui-validatebox" name="username"></input></td>
	    		</tr>
	    		<tr>
                    <td style="width:100px">收藏商品编号:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="productid"></input></td>
	    			 <td style="width:100px">收藏商品名称:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,255]"  class="easyui-validatebox" name="productname"></input></td>
	    		</tr>
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="hidden" name="isdel" value="0">
                    	<input type="button" onClick="collectionA()" value="提交">&nbsp;&nbsp;
                        <script>
							function collectionA(){
								if($('[name="collectionAS"]').form('validate'))
									$('[name="collectionAS"]').submit();
							}
						</script>                     
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加窗口--结束-->
    
    <!--修改窗口--> 
<div id="collectionedit" class="easyui-window" title="修改收藏" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:680px;height:330px;padding:10px;">
	    <form action="updatecollection.html" method="post" name="collectionES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改收藏
                </caption>
	    		<tr>
	    			<td style="width:100px">收藏编号:</td>
	    			<td style="width:200px"><input name="id" onfocus="this.blur()"  readonly="readonly"></input></td>
	    			 <td style="width:100px">附录:</td>
	    			<td style="width:200px"><input validType="length[0,255]"  class="easyui-validatebox" name="memo"></input></td>
	    		</tr>
	    		<tr>
                    <td style="width:100px">收藏用户编号:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="userid"></input></td>
	    			 <td style="width:100px">收藏用户名称:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,255]"  class="easyui-validatebox" name="username"></input></td>
	    		</tr>
	    		<tr>
                    <td style="width:100px">收藏商品编号:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,30]"  class="easyui-validatebox" name="productid"></input></td>
	    			 <td style="width:100px">收藏商品名称:</td>
	    			<td style="width:200px"><input required="required" validType="length[0,255]"  class="easyui-validatebox" name="productname"></input></td>
	    		</tr>           
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">
                    	<input type="hidden" name="isdel" value="0">
                    	<input type="button" onClick="collectionE()" value="提交">&nbsp;&nbsp;
                        <script>
							function collectionE(){
								if($('[name="collectionES"]').form('validate'))
									$('[name="collectionES"]').submit();								
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
						$('#collectionadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#collectionedit').form('load', 'getcollectionById.html?id='+row.id);
						$('#collectionedit').window('open');
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
								    url: 'delCollectionById.html?id='+row.id,
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