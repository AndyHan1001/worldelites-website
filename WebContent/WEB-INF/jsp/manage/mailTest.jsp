<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1">
    <title>后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/easyui136/demo/demo.css">
	<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/resources/easyui136/jquery.easyui.min.js"></script>

    <link href="<%=path %>/resources/css/default.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src='<%=path %>/resources/easyui136/outlook2.js'> </script>

    <script type="text/javascript">
					//管理分类：基本配置、文章管理、商城管理、社区论坛、会员管理
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"基本配置",
							"menus":[{"menuname":"系统信息","icon":"icon-","url":"init/systeminfo.html"},
							         {"menuname":"生成地图","icon":"icon-nav","url":"init/mapinit.html"},
							         {"menuname":"外加项管理","icon":"icon-nav","url":"init/menu.html"},
									{"menuname":"类型管理","icon":"icon-log","url":"init/typelist.html"},
									//{"menuname":"小组管理","icon":"icon-role","url":"init/group.html"},
									//{"menuname":"日志管理","icon":"icon-log","url":"init/loglist.html"},
									//{"menuname":"关系管理","icon":"icon-role","url":"init/relation.html"},
									{"menuname":"国家管理","icon":"icon-log","url":"init/industry.html"},
									{"menuname":"地理管理","icon":"icon-log","url":"init/geography.html"},
									{"menuname":"学校管理","icon":"icon-log","url":"init/school.html"},
									{"menuname":"公寓管理","icon":"icon-log","url":"init/apartment.html"},
									{"menuname":"房间管理","icon":"icon-log","url":"init/room.html"},
									//{"menuname":"违禁词管理","icon":"icon-log","url":"init/badword.html"}
								]
						} ,{"menuid":"28","icon":"icon-sys","menuname":"文章管理",
							"menus":[{"menuname":"文章管理","icon":"icon-nav","url":"docs/article.html"},
									//{"menuname":"评论管理","icon":"icon-nav","url":"docs/comment.html"},
									{"menuname":"图片管理","icon":"icon-nav","url":"docs/picture.html"},
									//{"menuname":"图集管理","icon":"icon-nav","url":"docs/atlas.html"},
									{"menuname":"栏目管理","icon":"icon-nav","url":"docs/column.html"}
								]
						} ,{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[//{"menuname":"商品管理","icon":"icon-nav","url":"shop/product.html"},
							         {"menuname":"订单管理","icon":"icon-nav","url":"shop/order.html"},
							         {"menuname":"优惠券管理","icon":"icon-nav","url":"shop/coupon.html"},
									{"menuname":"支付管理","icon":"icon-nav","url":"shop/pay.html"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"社区论坛",
							"menus":[{"menuname":"帖子管理","icon":"icon-nav","url":"ubbs/thread.html"},									
									{"menuname":"回复管理","icon":"icon-nav","url":"ubbs/replay.html"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"会员管理",
							"menus":[{"menuname":"用户管理","icon":"icon-users","url":"user/user.html"},
							         {"menuname":"收藏管理","icon":"icon-users","url":"user/collection.html"},						         
									 //{"menuname":"消息管理","icon":"icon-nav","url":"user/message.html"} 
							 		{"menuname":"邮件日志管理","icon":"icon-users","url":"user/maillogs.html"}		
								]
						}
				]};        																															
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {

            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/ajax/loginout.ashx';
                    }
                });

            })
			
			
			
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(<%=path%>/resources/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 admin <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px;font-size: 16px; "><img src="<%=path %>/resources/images/blocks.gif" width="20" height="20" align="absmiddle" />  后台管理系统</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">World Elites</div>
    </div>
    <!-- 首页左侧---导航内容 -->
    <div region="west" split="true" title="导航菜单" style="width:150px; min-height:300px; overflow:scroll" id="west">
        <div class="easyui-accordion" fit="true" border="false" style="overflow:visible;">
                            
        </div>
    </div>
    
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
       		 <!--首页右侧上部tab--每一个DIV为一个右侧tab-->
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">				
			<h1>欢迎使用后台管理系统</h1>
			${sessionScope.buser.passport }
			</div>            
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>