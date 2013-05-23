<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>农户建档现场电子信息采集系统</title>
<link href="/css/reset.css" rel="stylesheet" type="text/css">
<link href="/css/zh-cn-system.css" rel="stylesheet" type="text/css">
<link href="/css/table_form.css" rel="stylesheet" type="text/css">
<link href="/css/dialog.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="/js/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="/js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="/js/styleswitch.js"></script>
<script type="text/javascript">
	window.focus();
	var pc_hash = 'AttuXV';
     $(function(){
          //查看
         $('#showOperate').click(function(event){
             var me=$(this);
             var recordId = me.attr('recordId');
             var url='family/show/id='+recordId;
             location.href = url;
             event.preventDefault();
         });

         //指派
          $('#appointOperate').click(function(){
              var me=$(this);
              var recordId=me.attr('recordId');
              var url='family/appoint/id='+recordId;
              window.top.artDialog({
                  id: 'assign',
                  title: '指派信息',
                  lock:true,
                  content:'<iframe scrolling="auto" width="620" height="560" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
              });
          });

         //编辑
         $('#editOperate').click(function(event){
              var me=$(this);
              var recordId=me.attr('recordId');
              var url='family/edit/id='+recordId;
              location.href = url;
              event.preventDefault();
         });


         //删除
         $('#deleteOperate').click(function(event){
             if(confirm('确定要删除吗？')){
                 var me=$(this);
                 var recordId=me.attr('recordId');
                 var url = 'family/delete/id='+recordId;
                 location.href=url;
                 event.preventDefault();
             }
         });

         //全选
         var firstNodes= $('.first');
         firstNodes.eq(0).bind('click',chooseAll);
         function chooseAll(){
             var me=$(this);
             var flag;
             if(me.children('input:enabled').eq(0).attr('checked')){
                 flag=true;
             }else{
                 flag=false;
             }
             $.each(firstNodes,function(i,firstNode){
                     if(i!=0){
                         $(firstNode).children('input:enabled').eq(0).attr('checked',flag);
                     }
             });
             event.preventDefault();
         }

        // 批量指派
         var batchAssignNode=$('#assignOperate');
         batchAssignNode.click(function(){
             var me=$(this);
             var checkOperaNodes=$('.checkOpera');
             var isExist=false;
             var recordIds='';
             var j=0;
             $.each(checkOperaNodes,function(i,checkOperaNode){
                 checkOperaNode=$(checkOperaNode);
                 if(checkOperaNode.attr('checked')){
                     isExist=true;
                     if(j==0){
                         recordIds=checkOperaNode.attr('recordId');
                     }else{
                         recordIds=recordIds+','+checkOperaNode.attr('recordId');
                     }
                     j++;
                 }
             });
             if(isExist){
                 var url = 'family/batchAppoint/ids='+recordIds;
                 window.top.artDialog({
                     id: 'assign',
                     title: '指派信息',
                     lock:true,
                     content:'<iframe scrolling="auto" width="620" height="560" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                 });
             }else{
                 alert("未勾选任何客户信息！");
             }
         });





     });
</script>
</head>
<body>
<style type="text/css">
	html{_overflow-y:scroll}
</style><div id="closeParentTime" style="display:none">1</div>

<div class="pad-10">
	  <div class="content-menu ib-a blue line-x">
	  		<select name="" style="width:80px; height:25px">
				<option value="" selected="selected">按网点</option>
			</select>
			<select name="" style="width:80px; height:25px">
				<option value="" selected="selected">按乡镇</option>
			</select>
			<select name="select" style="width:80px; height:25px">
              <option value="" selected="selected">按村</option>
            </select>
			<input id="keyword" name="keyword" type="text" style="color:#999999;width:120px; height:25px" value="按客户经理"/>
			<input id="queryOperate" type="button" name="" value="查询" style="width:80px; height:30px"/>
			<input id="assignOperate" type="button"  value="指派" style="width:80px; height:30px"/>
			<input id="checkOperate" type="button"  value="验收" style="width:80px; height:30px"/>
			<input id="importOperate" type="button" name="" value="导入" style="width:80px; height:30px"/>
			<input id="exportOperate" type="button" name="" value="导出" style="width:80px; height:30px"/>
	</div>
<form name="myform" id="myform" action="" method="post">
<div class="btn">
      <div id="reject_content" style="background-color: #fff; solid: 1px;position:absolute;left:0;top:0;padding:15px 5px 5px;" >
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
					<td align="center">每页&nbsp;10条</td>
				</tr>
			</tbody>
		</table>
		</div>

		<div id="pages" style="background-color: #fff; solid: 1px;position:absolute;right:0;top:0" >
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
					<td align="center"><input id="" name="" type="text" style="width:35px; height:22px" value=""/></td>
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
				<th width="77" align="center" class="first">
					<input type="checkbox"/>全选
			    </th>
				<th width="74" align="center">序号</th>
			  	<th width="109" align="center">户主姓名</th>
				<th width="161" align="center">联系电话</th>
            	<th width="132" align="center">提交日期</th>
            	<th width="139" align="center">收集单位</th>
				<th width="164" align="center">收集人</th>
				<th width="174" align="center">状态</th>
				<th width="230" align="center">操作</th>
            </tr>
        </thead>
		<tbody>
        <core:forEach items="${familyInfoList}" var="familyInfo">
          <tr>
              <td align="center" class="first">
                <input class="checkOpera" type="checkbox" recordId="${familyInfo.recordId}"/>
              </td>
              <td align="center">${familyInfo.recordId}</td>
              <td align="center">${familyInfo.customerName}</td>
              <td align="center"><p>${familyInfo.telephone}</p></td>
              <td align="center">${familyInfo.submitTime}</td>
              <td align="center">${familyInfo.organizationName}</td>
              <td align="center">${familyInfo.displayUserName}</td>
              <td align="center">${familyInfo.state}</td>
              <td align="center">
                <a href="#" style="color:#0099FF" id="showOperate" recordId="${familyInfo.recordId}">查看</a>&nbsp;|&nbsp;
                <a href="#" style="color:#0099FF" id="appointOperate" recordId="${familyInfo.recordId}">指派</a>&nbsp;|&nbsp;
                <a href="#" style="color:#0099FF" id="editOperate" recordId="${familyInfo.recordId}">编辑</a>&nbsp;|&nbsp;
                <a href="#" style="color:#FF0000" id="deleteOperate" recordId="${familyInfo.recordId}">删除</a>
              </td>
          </tr>
        </core:forEach>
        </tbody>
    </table>
</div>
<div class="btn">
      <div id="reject_content" style="background-color: #fff; solid: 1px;position:absolute;left:0;top:0;padding:15px 5px 5px;" >
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
	  <div id="pages" style="background-color: #fff; solid: 1px;position:absolute;right:0;top:0" >
	    <table cellpadding="0" cellspacing="3" border="0">
          <tbody align="center">
            <tr align="center">
              <td align="center"><a href="" class="a1" style="font-weight:bold">首页</a>&nbsp;</td>
              <td align="center"><a href="" class="a1">上一页</a> &nbsp;</td>
              <td align="center"><a href="" class="a1">下一页</a>&nbsp;</td>
              <td align="center"><a href="" class="a1" style="font-weight:bold">尾页</a>&nbsp;</td>
			  <td align="center" style="color:#FF0000">跳转至:</td>
			  <td align="center"><input type="text" name="" value="" style="width:35px;height:22px"/></td>
			  <td align="center" style="color:#FF0000">页</td>
			  <td align="center"><a href="" class="a1" style="color:#FF0000">GO</a></td>
            </tr>
          </tbody>
        </table>
	  </div>
    </div>
</form>
</div>
<%--<script language="javascript" type="text/javascript" src="js/cookie.js"></script>
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
</script>--%>

<div style="display: none; position: absolute;" class="">
    <div class="aui_outer"><table class="aui_border">
        <tbody>
          <tr>
              <td class="aui_nw"></td>
              <td class="aui_n"></td>
              <td class="aui_ne"></td>
          </tr>
          <tr>
              <td class="aui_w"></td>
              <td class="aui_c">
                  <div class="aui_inner">
                      <table class="aui_dialog">
                          <tbody>
                          <tr>
                              <td colspan="2" class="aui_header">
                                  <div class="aui_titleBar">
                                      <div class="aui_title" style="cursor: move; display: block;"></div>
                                      <a class="aui_close" href="javascript:/*artDialog*/;" style="display: block;">×</a>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td class="aui_icon" style="display: none;">
                                  <div class="aui_iconBg" style="background-image: none; background-position: initial initial; background-repeat: initial initial;"></div>
                              </td>
                              <td class="aui_main" style="width: auto; height: auto;">
                                  <div class="aui_content" style="padding: 20px 25px;"></div>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2" class="aui_footer">
                                  <div class="aui_buttons" style="display: none;"></div>
                              </td>
                          </tr>
                          </tbody>
                      </table>
                  </div>
              </td>
              <td class="aui_e"></td>
          </tr>
          <tr>
              <td class="aui_sw"></td>
              <td class="aui_s"></td>
              <td class="aui_se" style="cursor: se-resize;"></td>
          </tr>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>