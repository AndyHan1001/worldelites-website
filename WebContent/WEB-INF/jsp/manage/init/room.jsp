<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>户型管理</h2>       
         <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="mark" >内部编号</option>
								<option value="name" >户型名称</option>
								<option value="enterlong" >租期</option>
								<option value="price" >市场租金</option>
								<option value="parentid" >所在公寓ID</option>
								<option value="state" >是否显示</option>
								<option value="isbook" >是否可被预订</option>
								<option value="iscoupon" >是否可下载Coupon</option>
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
						$.post("searchsystem.html",{table:"Room",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%"  style="height:450px;" id="dg" title="户型列表" 
	 data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getRoomList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<!-- <th field="ssid" >户型编号</th> -->
			<th field="mark" >内部编号</th>
			<th field="name" >户型名称</th>
			<th field="area" >户型面积</th>
			<th field="info" >户型描述</th>
			<th field="info_cn" >户型描述(cn)</th>
			<th field="entertime" formatter="formatterdate">入住时间</th>
			<th field="outtime" formatter="formatterdate">搬出时间</th>
			<th field="endtime" formatter="formatterdate">搬出时间</th>
			<th field="enterlong" >租期</th>
			<th field="enterlong_cn" >租期(cn)</th>
			<th field="price" >市场租金</th>
			<th field="discountprice" >折扣价格</th>
			<th field="discountmethod" >优惠项目及政策</th>
			<th field="discountmethod_cn" >优惠项目及政策(cn)</th>
			<th field="discount" >WE折扣描述</th>
			<th field="discount_cn" >WE折扣描述(cn)</th>
			<th field="deposit" >押金</th>
			<th field="parentname" >所在公寓名称</th>
			<th field="parentid" >所在公寓编号</th>
			<th field="logo" >户型缩略图路径</th>
			<!-- <th field="expand1" >户型剩余</th> -->
			<th field="expand2" >户型图集</th>
			<th field="sort" >户型排序</th>
			<th field="state"  formatter="formatterisdel">是否显示</th>
			<th field="isbook"  formatter="formatterisdel">是否可被预订</th>
			<th field="iscoupon"  formatter="formatterisdel">是否可下载Coupon</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="roomadd" class="easyui-window" title="添加新户型" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveRoom.html" method="post" name="roomAS">
	    	<table cellpadding="5" border="0">
	    		<tr  style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">户型编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>户型名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    		</tr> 
				<tr>
					<td>户型描述:</td>
	    			<td><textarea name="info"></textarea></td>
	    			<td>户型描述(cn):</td>
	    			<td><textarea name="info_cn"></textarea></td>
				</tr>
	    		<tr>
	    			<td>户型面积</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="area"></td>
	    			<td>市场租金</td>
	    			<td><input class="easyui-numberbox" name="price" validType="length[0,8]"></td>
	    		</tr>
	    		<tr>
	    			<td>入住时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="entertime_as" name="entertime_as"></td>
	    			<td>入住期长:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]"  name="enterlong" ></input>天</td>
	    		</tr>
	    		<tr>
	    			<td>搬出时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="outtime_as" name="outtime_as"></td>
	    			<td>截止时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="endtime_as" name="endtime_as"></td>
	    		</tr>
	    		<tr>
	    			<td>优惠价格</td>
	    			<td><input class="easyui-numberbox" name="discountprice" validType="length[0,8]"></td>
	    			<td>押金</td>
	    			<td><input class="easyui-numberbox" name="deposit" validType="length[0,8]"></td>
	    		</tr>
	    		<tr>
	    			<td>WE折扣描述:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="discount"></input></td>
	    			<td>WE折扣描述(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="discount_cn" ></input></td>
	    		</tr> 
	    		<tr>
	    			<td>优惠价格及政策:</td>
	    			<td>
	    				<select class="easyui-combobox"  name="discountmethod"  data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllRoomList.html',multiple:true" > </select>   				
	    			</td>
	    			<td>优惠价格及政策(cn):</td>
	    			<td>
	    				<select class="easyui-combobox"  name="discountmethod_cn"  data-options=" valueField: 'memo',
	    			textField: 'memo',width:135,panelHeight:'135',url:'getAllRoomList.html',multiple:true" > </select>   				
	    			</td>
	    		</tr>
	    		 <tr>
	    			<td>户型所在公寓名称:</td>
	    			<td>
	    				<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getApartmentListByWordKey.html',
	    			onChange:function(){$('#parentid_as').val($(this).combobox('getValue'))}" >
	    			</select>
	    			<td>公寓编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_as" data-options="required:true"></input></td>
	    		</tr> 
                 <tr>
	    			<td>户型缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>	    			
	    			</td>
	    			<td></td>
	    			<td></td>
					<!-- <td>户型剩余数:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="expand1" ></input></td> -->
                </tr>
                <tr>
	    			<td vlign="top">户型图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="expand2" id="defpicList" />
  						<iframe id="ifmupdo" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
               	
                </tr>
                <tr>
                	<td>户型排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否显示:</td>
	    			<td>
	    				<select name="state">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>    
	    		<tr>
	    			<td>是否可预订:</td>
	    			<td>
	    				<select name="isbook">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
                    <td>是否可下载Coupon:</td>
	    			<td>
	    				<select name="iscoupon">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>                          
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="roomA()" value="提交">&nbsp;&nbsp;
                        <script>
							function roomA(){
								if($('[name="roomAS"]').form('validate'))
									$('[name="roomAS"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加结束-->
    
    
   <!--修改窗口--> 
    <div id="roomedit" class="easyui-window" title="修改户型" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateRoom.html" method="post" name="roomES">
	    	<table cellpadding="5" border="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">户型编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>户型名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>内部编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    		</tr> 
				<tr>
					<td>户型描述:</td>
	    			<td><textarea name="info"></textarea></td>
	    			<td>户型描述(cn):</td>
	    			<td><textarea name="info_cn"></textarea></td>
				</tr>
	    		<tr>
	    			<td>户型面积</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="area"></td>
	    			<td>市场租金</td>
	    			<td><input class="easyui-numberbox" name="price" validType="length[0,8]"></td>
	    		</tr>
	    		<tr>
	    			<td>入住时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="entertime_es" name="entertime_es"></td>
	    			<td>入住期长:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]"  name="enterlong" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>搬出时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="outtime_es" name="outtime_es"></td>
	    			<td>截止时间</td>
	    			<td><input class="easyui-datebox" editable="false" required="required" id="endtime_es" name="endtime_es"></td>
	    		</tr>
	    		<tr>
	    			<td>优惠价格</td>
	    			<td><input class="easyui-numberbox" name="discountprice" validType="length[0,8]"></td>
	    			<td>押金</td>
	    			<td><input class="easyui-numberbox" name="deposit" validType="length[0,8]"></td>
	    		</tr>
	    		<tr>
	    			<td>WE折扣描述:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="discount"></input></td>
	    			<td>WE折扣描述(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="discount_cn" ></input></td>
	    		</tr> 
	    		<tr>
	    			<td>优惠价格及政策:</td>
	    			<td>
	    				<select class="easyui-combobox"  name="discountmethod" id="discountmethod" data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllRoomList.html',multiple:true" > </select>   				
	    			</td>
	    			<td>优惠价格及政策(cn):</td>
	    			<td>
	    				<select class="easyui-combobox"  name="discountmethod_cn" id="discountmethod_cn" data-options=" valueField: 'memo',
	    			textField: 'memo',width:135,panelHeight:'135',url:'getAllRoomList.html',multiple:true" > </select>   				
	    			</td>
	    		</tr>
	    		 <tr>
	    			<td>户型所在公寓名称:</td>
	    			<td>
						<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getApartmentListByWordKey.html',
	    			onChange:function(){$('#parentid_es').val($(this).combobox('getValue'))}" >
	    			</select>
	    			</td>
	    			<td>公寓编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_es" data-options="required:true"></input></td>
	    		</tr> 
                 <tr>
	    			<td>户型缩略图:</td>
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
					<!-- <td>户型剩余数:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="expand1" ></input></td> -->
                </tr>
                <tr>
	    			<td vlign="top">户型图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="expand2" id="defpicList_es" />
  						<iframe id="ifmupdo_es" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
               	
                </tr>
                <tr>
                	<td>户型排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否显示:</td>
	    			<td>
	    				<select name="state">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>    
	    		<tr>
	    			<td>是否可预订:</td>
	    			<td>
	    				<select name="isbook">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
                    <td>是否可下载Coupon:</td>
	    			<td>
	    				<select name="iscoupon">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>                
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="roomE()" value="提交">&nbsp;&nbsp;
                        <script>
							function roomE(){
								if($('[name="roomES"]').form('validate'))
									$('[name="roomES"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	   
    <!--修改窗口--结束-->    
 
<script type="text/javascript">
function reashIfream(){
	$('#ifmupdo').attr('src',$('#ifmupdo').attr('src'));
}

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
				$.get("setAtlasSessionClear.html",{},function(data){},"text");
				$('#roomadd').window('open');
				
				setTimeout(reashIfream,500);
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				function sps(v){
					var s=v.split(",");
					var ccc=[];
					for(var i=0;i<s.length;i++){
						ccc[i]=s[i];
					}
					//salert(ccc)
					return ccc;
				}
				
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return;}
				
				var row = $('#dg').datagrid('getSelected');
				$.get("setAtlasSession.html",{atlas:row.expand2},function(data){},"text");
				$('#roomedit').form('load', 'getRoomById.html?id='+row.id);
				$.get('getRoomById.html?id='+row.id,{},function(data){
					
					$("#discountmethod").combobox("setValue",sps(data.discountmethod));
					$("#discountmethod_cn").combobox("setValue",sps(data.discountmethod_cn));
					
					$("#entertime_es").datebox("setValue",data.entertime);
					$("#outtime_es").datebox("setValue",data.outtime);
					$("#endtime_es").datebox("setValue",data.endtime);
				},"json");
				$('#roomedit').window('open'); 
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
						    url: 'delRoomById.html?id='+row.id,
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
				location.href="outExcelForRoom.html";
			}
		}]
	});			
})
</script>
</body>
</html>