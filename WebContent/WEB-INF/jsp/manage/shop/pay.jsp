<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
<script type="text/javascript">
function formatterpay(target, container, frozen){
	if(target == 0)
		return "未完成";
	else
		return "已完成";
}
</script>
<h2>支付管理</h2>       
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
  
	<table width="100%" style="height:450px;" id="dg" title="支付列表"
	  data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getPayList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >流水号</th>
			<th field="ssid" >支付id</th>
			<th field="mdid" >支付-用户-标记</th>
			<th field="userid" >买家用户的id</th>
			<th field="username" >买家用户名称</th>
			<th field="ordermdid" >支付用户的订单的MDID</th>
			<th field="ordermemo" >支付对应的订单摘要</th>
			<th field="ctime"  formatter="formatterdate">支付发表时间</th>
			<th field="utime"  formatter="formatterdate">更新时间</th>
			<th field="btime"  formatter="formatterdate">开始时间</th>
			<th field="etime"  formatter="formatterdate">结束时间</th>
			<th field="interface" >支付接口</th>
			<th field="need" >应付金额</th>
			<th field="money" >实付金额</th>
			<th field="state" formatter="formatterpay">实付结果状态</th>
			<th field="note" >附记</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除</th> -->
		</thead>
	</table>

    <!--添加窗口--> 
    <div id="payadd" class="easyui-window" title="添加新支付" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="savePay.html" method="post" name="payAS">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加支付
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="id" ></input></td>
                    <td style="width:100px">支付ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>支付-用户-标记:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="mdid"></input></td>
                    <td></td>
                    <td></td>
	    		</tr>
                 <tr>
	    			 <td>买家用户名称:</td>
	    			<td><select class="easyui-combobox"  name="username" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#userid_as').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>买家用户的编号:</td>
	    			<td><input name="userid" id="userid_as" required="required" class="easyui-validatebox" missingMessage="无法获取买家编号<br>请查看买家<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
                    <td>支付用户的订单的MDID:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="ordermdid" ></input></td>
	    		</tr>
                  <tr>
	    			<td>支付对应的订单摘要:</td>
	    			<td colspan="3"><textarea name="ordermemo" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>            
               <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
                    <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"></input></td>
	    		</tr>
                <tr>
	    			<td>开始时间:</td>
	    			<td><input name="btime_as" id="btime_as" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>结束时间:</td>
	    			<td><input name="etime_as" id="etime_as" class="easyui-datetimebox" validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>支付接口:</td>
	    			<td><input class="textbox" name="payInterface"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                 <tr>
                    <td>应付金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="need"></input></td>
                    <td>实付金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="money"></input></td>
	    		</tr>               
  				 <tr>
	    			<td>实付结果状态:</td>
	    			<td>
	    				<select name="state">
	    					<option value="0" selected>未完成</option>
	    					<option value="1">已完成</option>
	    				</select>
	    			</td>
                    <td>附记:</td>
	    			<td><textarea name="note" rows="3" cols="15" style="background:#FFF"></textarea></td>
	    		</tr>
                <!--  <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
	    		</tr>  -->                             
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="payA()" value="提交">&nbsp;&nbsp;
                        <script>
							function payA(){
								if($('[name="payAS"]').form('validate'))
									$('[name="payAS"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加支付窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="payedit" class="easyui-window" title="修改支付" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updatePay.html" method="post" name="payES">
	    	<table cellpadding="5" border="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改支付
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="id" ></input></td>
                    <td style="width:100px">支付ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" style="background:#CCC" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>支付-用户-标记:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="mdid"></input></td>
                    <td></td>
                    <td></td>
	    		</tr>
                 <tr>
	    			 <td>买家用户名称:</td>
	    			<td><select class="easyui-combobox"  name="username" required="required" data-options=" valueField: 'id',
	    			textField: 'passport',width:135,panelHeight:'auto',url:'../user/getAllUserJson.html',onChange:function(){$('#userid_es').val($(this).combobox('getValue'))}"></select>
	    			</td>
                 	<td>买家用户的编号:</td>
	    			<td><input name="userid" id="userid_es" required="required" class="easyui-validatebox" missingMessage="无法获取买家编号<br>请查看买家<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                 <tr>
                    <td>支付用户的订单的MDID:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,20]" name="ordermdid" ></input></td>
	    		</tr>
                  <tr>
	    			<td>支付对应的订单摘要:</td>
	    			<td colspan="3"><textarea name="ordermemo" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>            
               <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
                    <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"></input></td>
	    		</tr>
                <tr>
	    			<td>开始时间:</td>
	    			<td><input name="btime_es" id="btime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>结束时间:</td>
	    			<td><input name="etime_es" id="etime_es" class="easyui-datetimebox" validType="TimeCheck['btime_es']" invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>支付接口:</td>
	    			<td><input class="textbox" name="payInterface"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                 <tr>
                    <td>应付金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="need"></input></td>
                    <td>实付金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="money"></input></td>
	    		</tr>               
  				 <tr>
	    			<td>实付结果状态:</td>
	    			<td>
	    				<select name="state">
	    					<option value="0" selected>未完成</option>
	    					<option value="1">已完成</option>
	    				</select>
	    			</td>
                    <td>附记:</td>
	    			<td><textarea name="note" rows="3" cols="15" style="background:#FFF"></textarea></td>
	    		</tr>
                <!--  <tr>
	    			<td>是否删除:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
	    		</tr>  -->                             
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="payE()" value="提交">&nbsp;&nbsp;
                        <script>
							function payE(){
								if($('[name="payES"]').form('validate'))
									$('[name="payES"]').submit();
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	
    <!--修改支付窗口--结束-->    

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
						$('#payadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#payedit').form('load', 'getPayById.html?id='+row.id);
						$.post("getPayById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							
							$('#payedit #ctime_es').datetimebox('setValue',data.ctime);
							$('#payedit #utime_es').datetimebox('setValue',data.utime);
							$('#payedit #btime_es').datetimebox('setValue',data.btime);
							$('#payedit #etime_es').datetimebox('setValue',data.etime);							
						},"json");
						$('#payedit').window('open');
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
								    url: 'delPayById.html?id='+row.id,
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
						location.href="outExcelForPay.html";
					}
				}]
			});			
		})
	</script>
</body>
</html>