<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>村委会（居委会）评价</title>
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
						<td width="27%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
							客户在他行贷款情况
						</td>
						<td width="73%" align="left">
							<INPUT id="u656" type=text value="" class="u656"  style="width:300px">
						</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
							个人银行信用记录
						</td>
						<td align="left">
							<INPUT id="u656" type="checkbox" value="" class="u656">报告期内能积极主动按期偿本付息，无违约记录<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在2次(含)以内本金.利息不超过1个月已还清的不良记录,无超过1个月以上不良记录<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在3次(含)以上本金.利息不超过1个月已还清的不良记录,无超过1个月以上不良记录<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在1-2次(含)本金.利息超过1个月但在3个月以内已还清的不良记录,无超过3个月以上不良记录<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在3次(含)以上本金.利息超过1个月但在3个月以内已还清的不良记录,无超过3个月以上不良记录<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在1-2次(含)本金或利息超过3个月以后才还清的不良记录.<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">存在3次(含)以上本金或利息超过3个月以后才还清的不良记录.<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">评估时点有拖欠利息超过1个月<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">评估时点有次级类贷款,无可疑或损失类贷款<br>
							<INPUT id="u656" type="checkbox" value="" class="u656">评估时点有可疑或损失类贷款<br>
							<INPUT id="u656" type="checkbox" value="" class="u656" checked="checked">报告期内无银行信用记录<br>

						</td>
					</tr>
					<tr>
						<td width="27%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
							他行信用记录
						</td>
						<td width="73%" align="left">
							<SELECT id="other" style="width:300px"  >
								<OPTION  value="良好">良好</OPTION>
								<OPTION selected value="一般">一般</OPTION>
								<OPTION  value="较差">较差</OPTION>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
							变现能力
						</td>
						<td align="left">
							<SELECT id="other" style="width:300px"  >
								<OPTION  value="优秀">优秀</OPTION>
								<OPTION selected value="较好">较好</OPTION>
								<OPTION  value="一般">一般</OPTION>
								<OPTION  value="难以处置">难以处置</OPTION>
							</SELECT>
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