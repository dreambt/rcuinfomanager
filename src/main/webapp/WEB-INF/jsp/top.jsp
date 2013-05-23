<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>农户建档现场电子信息采集系统</title>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/zh-cn-system.css" rel="stylesheet" type="text/css">
<link href="../css/dialog.css" rel="stylesheet" type="text/css">
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../jquery/jquery-1.7.2.min.js"></script>
<style type="text/css">
    .objbody{overflow:hidden}
</style>
<script type="text/javascript">
     var pc_hash = 'sOPFbX';
    $(function(){
        var logoutOperateNode=$('#logoutOperate');
        logoutOperateNode.click(function(){
            var url='logout';
            window.location.href = url;
            event.preventDefault();
        });
    });
</script>
</head>

<body scroll="no" class="objbody">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="145" background="../images/head.png">
	<table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60%" height="145"><img src="../images/logo.png" width="500" height="145" /></td>
        <td width="40%" align="right" valign="bottom" >
    	<div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span id="uName">
            [<c:out value="${displayUserName}"/>]</span>
            <a href="#" style="color:#FFFFFF" id="logoutOperate">[退出]</a>
    	</div>
		</td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
