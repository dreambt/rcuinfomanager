<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>系统角色管理</title>
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <link id="artDialog-skin" href="/asserts/js/dialog/skins/opera.css" rel="stylesheet" />
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>

</head>
<body>
<style type="text/css">
	html{_overflow-y:scroll}
</style>
<div id="closeParentTime" style="display:none">1</div>

<div class="pad-10">
<form name="myform" id="myform" action="" method="post">
	<div class="table-list">
		<table width="100%" border="0" style="margin:20px">
			<tbody>
				<tr>
					<td align="left" colspan="5" height="50">
						当前客户端版本：
						<label id="" name="" style="color:#FF0000">V1.0.0</label>
                    </td>
				</tr>
				<tr>
					<td width="21%" align="right" height="50">填写要导入的客户端版本：</td>
				    <td width="19%" align="left">
                        <input type="text" id="" name="" value="" style="width:200px"/>
                    </td>
					<td width="18%" align="right">版本描述：</td>
				    <td align="left" colspan="2">
                        <input type="text" id="" name="" value="" style="width:400px"/>
                    </td>
				</tr>
				<tr>
					<td width="21%" align="right" height="50">填写要导入的客户端版本：</td>
				    <td align="left" valign="middle" colspan="2">
				        <input type="file" id="" name="" value="" valign="middle"
                               style="width:280px;height:30px;align:center"/>&nbsp;&nbsp;&nbsp;&nbsp;
				        <input type="button" id="" name="Input" value="上传" style="width:80px; height:30px"/>
                    </td>
					<td width="14%" align="left">
				        <input type="checkbox" id="" name="" value=""/>是否强制更新
                    </td>
					<td width="28%" align="left">
				        <input type="button" id="" name="" value="完成" style="width:80px; height:30px"/>
                    </td>
				</tr>
		 </tbody>
		</table>
	</div>
	<div class="table-list">
		<table width="100%" border="1" style="margin-left:20px; margin-right:20px">
				<tbody>
					<tr>
						<td align="center" colspan="4" bgcolor="#1e90ff" style="color:#FFFFFF">历史版本</td>
					</tr>
					<tr>
						<td width="17%" align="center" height="50">
							<label id="">HANX V1.0.0.apk</label>
						</td>
						<td width="19%" align="center">
							<label id="">2013-04-11 09:00:00</label>
						</td>
						<td width="14%" align="center">
							<label id="" style="color:#FF0000">强制更新</label>
						</td>
						<td width="50%" align="center" >
							<a href="" style="color:#0099FF">下载</a>
                               &nbsp;|&nbsp;
                            <a href="" style="color:#FF0000">删除</a>
						</td>
					</tr>
			 	</tbody>
	    </table>
	</div>
</form>
</div>
</body>
</html>