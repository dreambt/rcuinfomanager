<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>系统角色管理</title>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/zh-cn-system.css" rel="stylesheet" type="text/css">
<link href="../css/table_form.css" rel="stylesheet" type="text/css">
<link href="../css/dialog.css" rel="stylesheet" type="text/css">

<script language="javascript" type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script language="javascript" type="text/javascript" src="../js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="../js/styleswitch.js"></script>
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
	  <div class="content-menu ib-a blue line-x">
	  		<select name="" style="width:120px; height:30px">
				<option value="" selected="selected">按账号</option>
				<option value="">按客户经理姓名</option>
				<option value="">按角色</option>
			</select>
	  		<input id="keyword" name="keyword" type="text" style="color:#999999;width:120px; height:25px" class="input-text" value="请输入关键字"/>
			<input id="" type="submit" name="" value="查询" style="width:80px; height:30px"/>
			<input id="" type="button" name="" value="添加账号" style="width:80px; height:30px"/>
			<input id="" type="button" name="" value="添加网点" style="width:80px; height:30px"/>
	</div>
<form name="myform" id="myform" action="" method="post">
<div class="btn">
      <div id="reject_content" style="background-color: #fff; solid 1px;position:absolute;left:0;top:0;padding:15px 5px 5px;" >
		<table cellpadding="0" cellspacing="3" border="0">
			<tbody>
				<tr>
					<td align="center">&nbsp;<label>1</label>&nbsp;/&nbsp;<label>1</label>&nbsp;&nbsp;</td>
					<td align="center">
						共&nbsp;<label>1</label>页&nbsp;&nbsp;
					</td>
					<td align="center">
						共&nbsp;<label>4</label>条&nbsp;&nbsp;
					</td>
					<td align="center">每页&nbsp;20条</td>
				</tr>
			</tbody>
		</table>
			
		</div>
		<div id="pages" style="background-color: #fff; solid 1px;position:absolute;right:0;top:0" > 
			<table cellpadding="0" cellspacing="3" border="0">
			<tbody align="center">
				<tr align="center">
					<td align="center"><a href="" class="a1" style="font-weight:bold">首页</a>&nbsp;</td>
					<td align="center">
						<a href="" class="a1">上一页</a>&nbsp;
					</td>
					<td align="center">
					<a href="" class="a1">下一页</a>&nbsp;
					</td>
					<td align="center"><a href="" class="a1" style="font-weight:bold">尾页</a>&nbsp;</td>
					<td align="center" style="color:#FF0000">跳转至:</td>
					<td align="center"><input type="text" name="" value="" class="input-text" style="width:35px; height:22px"/></td>
					<td align="center" style="color:#FF0000">页</td>
					<td align="center"><a href="" class="a1" style="color:#FF0000">GO</a></td>
				</tr>
			</tbody>
		</table>
			</div>
	 </div>
<div class="table-list">
    <table width="100%">
        <thead>
            <tr>
				<th width="64" align="center">序号</th>
			  	<th width="125" align="center">账号</th>
				<th width="290" align="center">角色</th>
            	<th width="142" align="center">是否对应客户经理</th>
            	<th width="138" align="center">对应客户经理姓名</th>
				<th width="379" align="center">操作</th>
            </tr>
        </thead>
		<tbody>
            <tr>
				<td align="center">1</td>
				<td align="center">admin</td>
				<td align="center"><p>系统管理员</p></td>
				<td align="center">否</td>
				<td align="center">&nbsp;</td>
				<td align="center"><a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a></td>
			</tr>
			<tr>
              <td align="center">2</td>
			  <td align="center">老王</td>
			  <td align="center"><p>客户经理</p></td>
			  <td align="center">否</td>
			  <td align="center">王尼玛</td>
			  <td align="center"><a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a></td>
		  	</tr>
			<tr>
              <td align="center">3</td>
			  <td align="center">老李</td>
			  <td align="center"><p>系统管理员   客户经理</p></td>
			  <td align="center">是</td>
			  <td align="center">李大催</td>
			  <td align="center"><a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a></td>
		  	</tr>
			<tr>
              <td align="center">4</td>
			  <td align="center">小叶</td>
			  <td align="center"><p>客户经理</p></td>
			  <td align="center">否</td>
			  <td align="center">叶丝丝</td>
			  <td align="center"><a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a></td>
		  	</tr>
     </tbody>
    </table>
</div>
<div class="btn">
      <div id="reject_content" style="background-color: #fff; solid 1px;position:absolute;left:0;top:0;padding:15px 5px 5px;" >
		<table cellpadding="0" cellspacing="3" border="0">
			<tbody>
				<tr>
					<td align="center">&nbsp;<label>1</label>&nbsp;/&nbsp;<label>1</label>&nbsp;&nbsp;</td>
					<td align="center">
						共&nbsp;<label>1</label>页&nbsp;&nbsp;
					</td>
					<td align="center">
						共&nbsp;<label>4</label>条&nbsp;&nbsp;
					</td>
					<td align="center">每页&nbsp;20条</td>
				</tr>
			</tbody>
		</table>
			
	  </div>
	  <div id="pages" style="background-color: #fff; solid 1px;position:absolute;right:0;top:0" >
	    <table cellpadding="0" cellspacing="3" border="0">
          <tbody align="center">
            <tr align="center">
              <td align="center"><a href="" class="a1" style="font-weight:bold">首页</a>&nbsp;</td>
              <td align="center"><a href="" class="a1">上一页</a> &nbsp;</td>
              <td align="center"><a href="" class="a1">下一页</a>&nbsp;</td>
              <td align="center"><a href="" class="a1" style="font-weight:bold">尾页</a>&nbsp;</td>
			  <td align="center" style="color:#FF0000">跳转至:</td>
			  <td align="center"><input type="text" name="" value="" style="width:35px; height:22px"/></td>
			  <td align="center" style="color:#FF0000">页</td>
			  <td align="center"><a href="" class="a1" style="color:#FF0000">GO</a></td>
            </tr>
          </tbody>
        </table>
	  </div>
    </div>
</form>
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