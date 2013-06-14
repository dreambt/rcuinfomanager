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
    <link id="artDialog-skin" href="/asserts/js/dialog/skins/opera.css" rel="stylesheet" />
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>
    <script src="/asserts/js/main.js"></script>
    <script type="text/javascript">
        $(function(){

            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });

            $('#addRoleOperate').click(function(){
                var url='systemRole/addSystemRole';
                window.top.artDialog({
                    id: 'addRole',
                    title: '系统角色管理 〉添加',
                    lock:true,
                    content:'<iframe scrolling="auto" width="750" height="550" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                });
            });

            $('#editRole').click(function(){
                var url='systemRole/editSystemRole';
                window.top.artDialog({
                    id: 'editRole',
                    title: '系统角色管理 〉修改',
                    lock:true,
                    content:'<iframe scrolling="auto" width="750" height="550" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                });
            });

            $('#deleteRole').click(function(){
                if(confirm('确定要删除吗？')){
                    var me=$(this);
                    var id=me.attr('recordId');
                    var url = 'systemRole/deleteSystemRole/'+id;
                    window.location.href=url;
                }
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
                            <td width="60%" height="145"><img src="/asserts/img/logo.png" width="500" height="145" /></td>
                            <td width="40%" align="right" valign="bottom" >
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span id="uName">[<c:out value="${displayUserName}"/>]</span><a href="/logout" style="color:#FFFFFF">&nbsp;退出</a>
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
                <li class=""><a href="/accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
                <li class="active"><a href="/roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
                <li class=""><a href="/systemLogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
            </ul>
        </div>
        <div class="span10" style="margin-left: -8.435897%;">
            <br/>
            <input class="input-block-level" type="text" placeholder="系统角色管理" disabled="disabled" style="color:#0000AA">
            <div class="pad-10">
                <div class="content-menu ib-a blue line-x">
                    <input id="addRoleOperate" type="button" value="添加" style="width:80px; height:30px"/>
                </div>
                <form name="myform" id="myform" action="" method="post">

                    <div class="table-list">
                        <table width="100%">
                            <thead>
                            <tr>
                                <th width="271" align="center">序号</th>
                                <th width="271" align="center">角色名称</th>
                                <th width="260" align="center">用户数</th>
                                <th width="260" align="center">角色说明</th>
                                <th width="564" align="center">管理操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <core:forEach items="${roleList}" var="roleInfo" varStatus="idx">
                                <tr>
                                    <td align="center"><core:out value="${idx.index+1}"></core:out></td>
                                    <td align="center">${roleInfo.roleName}</td>
                                    <td align="center">2</td>
                                    <td align="center">${roleInfo.roleDescription}</td>
                                    <td align="center">
                                        <a href="#" style="color:#0099FF" id="editRole">编辑</a>&nbsp;|&nbsp;
                                        <a href="#" style="color:#FF0000" id="deleteRole">删除</a>
                                    </td>
                                </tr>
                            </core:forEach>
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
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>