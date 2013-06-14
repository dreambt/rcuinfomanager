<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改角色</title>
    <link href="../css/reset.css" rel="stylesheet" type="text/css">
    <link href="../css/zh-cn-system.css" rel="stylesheet" type="text/css">
    <link href="../css/table_form.css" rel="stylesheet" type="text/css">
    <link href="../css/dialog.css" rel="stylesheet" type="text/css">
    <script language="javascript" type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="../js/admin_common.js"></script>
    <script language="javascript" type="text/javascript" src="../js/styleswitch.js"></script>
</head>
<body>
<div class="pad-10">
    <form name="myform" id="myform" action="" method="post">
        <div class="content-menu ib-a blue line-x">
            <a href="" target="mainFrame" class="left-font03">
                <input id="" type="button" name="" value="保存" style="width:80px; height:30px"/>
            </a>
        </div>

        <div class="table-list">
            <br>
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td align="center" width="15%">
                        角色名称：
                    </td>
                    <td align="left">
                        <input type="text"  name="" value="" class="input-text" style="color:#999999;">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        角色说明：
                    </td>
                    <td align="left">
                        <input type="text" name=""  value=""  class="input-text" style="color:#999999"/>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">功能权限设置</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#CCFCFE">模块名称</td>
                    <td align="center" bgcolor="#CCFCFE">模块功能</td>
                </tr>
                <tr>
                    <td align="left"><input type="checkbox" name="" value=""/>客户个人信用信息</td>
                    <td align="left">
                        <input type="checkbox" name="" value=""/>查询&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>查看&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>指派&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>编辑&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>删除&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>导入基础信息&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>导入评价表&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>导出完整信息&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>验收
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="checkbox" name="" value=""/>客户端管理</td>
                    <td align="left">
                        <input type="checkbox" name="" value=""/>上传客户端&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>开启/关闭授权&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>查找终端&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>添加终端&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>编辑终端&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>删除终端
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="checkbox" name="" value=""/>系统账号管理</td>
                    <td align="left">
                        <input type="checkbox" name="" value=""/>添加网点&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>查询账号&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>添加账号&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>编辑账号&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>删除账号
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="checkbox" name="" value=""/>系统角色管理</td>
                    <td align="left">
                        <input type="checkbox" name="" value=""/>添加角色&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>编辑角色&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" value=""/>删除角色
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="checkbox" name="" value=""/>系统日志管理</td>
                    <td align="left">
                        <input type="checkbox" name="" value=""/>查询日志
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">数据权限设置</td>
                </tr>
                <tr>
                    <td align="left">数据范围：</td>
                    <td align="left">
                        <input type="radio" name="dataRange" value="" checked="checked"/>全部数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="dataRange" value=""/>用户数据（由该用户产生的数据或委托给该用户的数据）
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
</div>
</body>
</html>