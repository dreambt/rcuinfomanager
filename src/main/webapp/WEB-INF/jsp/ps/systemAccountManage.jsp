<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <!-- Bootstrap -->
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <link id="artDialog-skin" href="/asserts/js/dialog/skins/opera.css" rel="stylesheet"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>
    <script type="text/javascript">
        $(function () {
            /*if(
            ${firstLogin}){
             alert("第一次登录，是否需要修改密码？");
             }*/

            $('.span3').click(function () {
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
        });
    </script>
</head>
<body>

<div class="top">
    <div class="row" style="margin-left: 2px;margin-top: -40px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="145" background="/asserts/img/head.png">
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="60%" height="145"><img src="/asserts/img/logo.png" width="500" height="145"/>
                            </td>
                            <td width="40%" align="right" valign="bottom">
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span
                                        id="uName">[<c:out value="${displayUserName}"/>]</span><a href="/logout"
                                                                                                  style="color:#FFFFFF">
                                    &nbsp;退出</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <ul class="nav nav-list bs-docs-sidenav affix">
                <li class=""><a href="/index"><i class="icon-chevron-right"></i>客户电子信息管理</a></li>
                <li class=""><a href="/clientManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
                <li class="active"><a href="/accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
                <li class=""><a href="/roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
                <li class=""><a href="/systemLogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
            </ul>
        </div>
        <div class="span10" style="margin-left: -8.435897%;">
            <br/>
            <input class="input-block-level" type="text" placeholder="系统帐号管理" disabled="disabled"
                   style="color:#0000AA">

            <div class="content-menu ib-a blue line-x">
                <select name="" style="width:120px; height:30px">
                    <option value="" selected="selected">按账号</option>
                    <option value="">按客户经理姓名</option>
                    <option value="">按角色</option>
                </select>
                <input id="keyword" name="keyword" type="text" style="color:#999999;width:120px; height:30px"
                       class="input-text" value="请输入关键字"/>
                <input type="submit" name="" value="查询" style="width:80px; height:30px"/>
                <input type="button" name="" value="添加账号" style="width:80px; height:30px"/>
                <input type="button" name="" value="添加网点" style="width:80px; height:30px"/>
            </div>

            <div class="table-list">
                <table width="100%">
                    <thead>
                    <tr>
                        <th width="64" align="center">序号</th>
                        <th width="125" align="center">账号</th>
                        <th width="290" align="center">角色</th>
                        <th width="142" align="center">是否对应客户经理</th>
                        <th width="220" align="center">对应客户经理姓名</th>
                        <th width="250" align="center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td align="center">1</td>
                        <td align="center">admin</td>
                        <td align="center"><p>系统管理员</p></td>
                        <td align="center">否</td>
                        <td align="center">系统管理员</td>
                        <td align="center">
                            <a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;
                            <a href="" style="color:#FF0000">删除</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="pagination" style="text-align: center;">
                    <ul>
                        <li><a href="#">«</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>