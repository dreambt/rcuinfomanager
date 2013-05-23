<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>安装设备授权</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/zh-cn-system.css" rel="stylesheet" type="text/css">
<link href="css/table_form.css" rel="stylesheet" type="text/css">
<link href="css/dialog.css" rel="stylesheet" type="text/css">

<script language="javascript" type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script language="javascript" type="text/javascript" src="js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="js/styleswitch.js"></script>
<script type="text/javascript">
	window.focus();
	var pc_hash = 'AttuXV';
	</script>
</head>
<body>
<style type="text/css">
	html{_overflow-y:scroll}
</style><div id="closeParentTime" style="display:none">1</div>

<div class="pad-10">
	<form name="myform" id="myform" action="" method="post">
		<div class="table-list">
			<table width="100%" border="1">
				<tbody>
					<tr>
						<td align="center" colspan="5" bgcolor="#1e90ff" style="color:#FFFFFF; font-size:20px">
							限制使用客户端的移动终端（<label style="font-style:oblique; font-size:16px;color: #FFFF66">若开启，则终端标识列表中对应的终端才可使用客户端</label>）
						</td>
					</tr>
					<tr>
						<td width="18%" align="center">当前状态：</td>
						<td width="17%" align="center">
							<label id="">关闭</label>
						</td>
						<td width="21%" align="center"><input id="" type="button" name="" value="开启" style="width:80px; height:30px"/></td>
					</tr>
			 </tbody>
			</table>
		</div>
		<br><br><br><br>
		<div class="table-list">
			<table width="100%" border="0">
					<tbody>
						<tr>
							<td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF; font-size:20px">终端标识列表</td>
						</tr>
						<tr>
							<td align="left">
								<table cellpadding="0" cellspacing="3" border="0">
									<tbody>
										<tr>
											<td align="center" style="border-bottom-color:#FFFFFF">
												<input id="" type="text" name="" value="请输入关键字" style="width:150px; height:25px;"/>
											</td>
											<td align="center" style="border-bottom-color:#FFFFFF">
												<input id="" type="button" name="" value="查找" style="width:80px; height:30px"/>
											</td>
											<td align="center" style="border-bottom-color:#FFFFFF">
												<input id="" type="button" name="" value="添加" style="width:80px; height:30px"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td align="right" style="padding-right:20px">
								<table cellpadding="0" cellspacing="3" border="0">
									<tbody>
										<tr>
											<td align="center" style="border-bottom-color:#FFFFFF">
												&nbsp;<label>1</label>&nbsp;/&nbsp;<label>1</label>&nbsp;&nbsp;
											</td>
											<td align="center" style="border-bottom-color:#FFFFFF">
												共&nbsp;<label>1</label>页&nbsp;&nbsp;
											</td>
											<td align="center" style="border-bottom-color:#FFFFFF">
												共&nbsp;<label>4</label>条&nbsp;&nbsp;
											</td>
											<td align="center" style="border-bottom-color:#FFFFFF">每页&nbsp;20条</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
						  <td width="17%" align="center">
								<label id="">001D7DAADE72</label>
							</td>
							<td width="50%" align="center" >
								<a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a>
							</td>
						</tr>
					</tbody>
				</table>
		</div>
	</form></div>
</div>
<script language="javascript" type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript"> 
<!--
function push() {
	var str = 0;
	var id = tag = '';
	$("input[name='ids[]']").each(function() {
		if($(this).attr('checked')==true) {
			str = 1;
			id += tag+$(this).val();
			tag = '|';
		}
	});
	if(str==0) {
		alert('您没有勾选信息');
		return false;
	}
	window.top.art.dialog({id:'push'}).close();
	window.top.art.dialog({title:'推送：',id:'push',iframe:'?m=content&c=push&action=position_list&catid=209&modelid=45&id='+id,width:'800',height:'500'}, function(){var d = window.top.art.dialog({id:'push'}).data.iframe;// 使用内置接口获取iframe对象
	var form = d.document.getElementById('dosubmit');form.click();return false;}, function(){window.top.art.dialog({id:'push'}).close()});
}
function confirm_delete(){
	if(confirm('确认删除吗？')) $('#myform').submit();
}
function view_comment(id, name) {
	window.top.art.dialog({id:'view_comment'}).close();
	window.top.art.dialog({yesText:'关闭',title:'查看评论：'+name,id:'view_comment',iframe:'index.php?m=comment&c=comment_admin&a=lists&show_center_id=1&commentid='+id,width:'800',height:'500'}, function(){window.top.art.dialog({id:'edit'}).close()});
}
function reject_check(type) {
	if(type==1) {
		var str = 0;
		$("input[name='ids[]']").each(function() {
			if($(this).attr('checked')==true) {
				str = 1;
			}
		});
		if(str==0) {
			alert('您没有勾选信息');
			return false;
		}
		document.getElementById('myform').action='?m=content&c=content&a=pass&catid=209&steps=0&reject=1';
		document.getElementById('myform').submit();
	} else {
		$('#reject_content').css('display','');
		return false;
	}	
}
setcookie('refersh_time', 0);
function refersh_window() {
	var refersh_time = getcookie('refersh_time');
	if(refersh_time==1) {
		window.location.reload();
	}
}
setInterval("refersh_window()", 3000);
//-->
</script>

<div style="display: none; position: absolute;" class=""><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move; display: block;"></div><a class="aui_close" href="javascript:/*artDialog*/;" style="display: block;">×</a></div></td></tr><tr><td class="aui_icon" style="display: none;"><div class="aui_iconBg" style="background-image: none; background-position: initial initial; background-repeat: initial initial;"></div></td><td class="aui_main" style="width: auto; height: auto;"><div class="aui_content" style="padding: 20px 25px;"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: se-resize;"></td></tr></tbody></table></div></div></body></html>