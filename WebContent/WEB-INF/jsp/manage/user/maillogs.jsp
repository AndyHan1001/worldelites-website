<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>邮件日志管理</h2>       
      <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="passport" >账号</option>
								<option value="id" >数据库编号</option>
								<option value="type" >邮件类型</option>
								<option value="touserid" >收件人编号</option>
								<option value="toaddres" >收件人名称</option>
								<option value="fromaddres" >发件人地址</option>
								<option value="title" >标题</option>
								<option value="token" >标识</option>
								<option value="url" >URL</option>
								<option value="senddate" formatter="formatterdate">发送时间</option>
								<option value="validdate" formatter="formatterdate">截止时间</option>
								<option value="clicked" >是否点击</option>
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
						$.post("searchsystem.html",{table:"EmailLog",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="邮件日志列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getAllMailLogs.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库编号</th>
			<th field="type" >邮件类型</th>
			<th field="touserid" >收件人编号</th>
			<th field="toaddres" >收件人名称</th>
			<th field="fromaddres" >发件人地址</th>
			<th field="title" >标题</th>
			<!-- <th field="content" >具体内容</th> -->
			<th field="token" >标识</th>
			<th field="url" >URL</th>
			<th field="senddate" formatter="formatterdate">发送时间</th>
			<th field="validdate" formatter="formatterdate">截止时间</th>
			<th field="clicked" >是否点击</th>
		</thead>

	</table>
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
					iconCls:'icon-remove',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){ 
						    	var row = $('#dg').datagrid('getSelected');
						    	$.ajax({
								    url: 'delEmailLogById.html?id='+row.id,
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