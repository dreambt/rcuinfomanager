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
    <link rel="stylesheet" href="/asserts/css/jquery.fancybox.css"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/jquery.fancybox.js"></script>
    <script type="text/javascript">
        $(function(){

            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });

            //添加帐号
            $('#addAccount').click(function(){

                $("#addAccount").fancybox({
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });
                /*var url='systemAccount/addAccount';
                window.top.artDialog({
                    id: 'addAccount',
                    title: '添加帐号',
                    lock:true,
                    content:'<iframe scrolling="auto" width="500" height="380" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                });*/
            });
            //添加网点
            $('#addStipple').click(function(){
                var url='systemAccount/addStipple';
                window.top.artDialog({
                    id: 'addStipple',
                    title: '系统帐号管理  〉管理网点 ',
                    lock:true,
                    content:'<iframe scrolling="auto" width="400" height="280" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                });
            });

            $('#editAccount').click(function(){
                var url='systemAccount/editAccount';
                window.top.artDialog({
                    id: 'editAccount',
                    title: '修改帐号',
                    lock:true,
                    content:'<iframe scrolling="auto" width="500" height="380" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
                });
            });

            $('#deleteAccount').click(function(){
                if(confirm('确定要删除吗？')){
                    var me=$(this);
                    var id=me.attr('recordId');
                    var url = 'systemAccount/deleteAccount'+id;
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
                <div class="btn-group">
                    <button class="btn">查询</button>
                    <a id="addAccount" class="btn" href="#addUser">添加账号</a>
                    <button class="btn" id="addStipple">添加网点</button>
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
                        <th width="220" align="center">对应客户经理姓名</th>
                        <th width="250" align="center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <core:forEach items="${accountList}" var="accountInfo" varStatus="idx">
                        <tr>
                            <td align="center"><core:out value="${idx.index+1}"></core:out></td>
                            <td align="center">${accountInfo.userName}</td>
                            <td align="center"><p>${accountInfo.roleName}</p></td>
                            <td align="center">否</td>
                            <td align="center">${accountInfo.displayUserName}</td>
                            <td align="center">
                                <a href="#" style="color:#0099FF" id="editAccount">编辑</a>&nbsp;|&nbsp;
                                <a href="#" style="color:#FF0000" id="deletedAccount">删除</a>
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
        </div>
    </div>

    <!-- add user -->
    <div style="display:none">
        <div id="addUser">
            <form method="post" action="/systemAccount/addAccount">
                <table width="100%" border="0">
                    <tbody>
                    <tr>
                        <td align="right">客户经理：</td>
                        <td align="left"><input  type="text" name="displayUserName" style="width: 200px;height: 30px;margin-top: 10px;" value="${user.displayUserName}" placeholder="请输入客户经理的姓名"/> </td>
                    </tr>
                    <tr>
                        <td align="right">帐号：</td>
                        <td align="left"> <input type="text" name="userName" style="width: 200px;height: 30px;margin-top: 10px;" value="${user.userName}" placeholder="请输入要创建的帐号"></td>
                    </tr>
                    <tr>
                        <td align="right"> 密码： </td>
                        <td align="left"> <input type="text" name="password" style="width: 200px;height: 30px;margin-top: 10px;" value="${user.password}"  placeholder="请输入密码"></td>
                    </tr>
                    <tr>
                        <td align="right"> 确认密码：</td>
                        <td align="left"> <input type="text" name="confirmPassword" style="width: 200px;height: 30px;margin-top: 10px;" value="${user.confirmPassword}" placeholder="请再次输入密码"></td>
                    </tr>
                    <tr>
                        <td align="right">对应的网点：</td>
                        <td align="left">
                            <select class="span3" name="organizationName" id="organizationName" style="width:202px;">
                                <option value="">选择网点</option>
                                <option value="" ></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">指定角色：</td>
                        <td align="left">
                            <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox36" value="option1"> 系统管理员 </label>
                            <br>
                            <label class="checkbox inline"> <input type="checkbox" id="inlineCheckbox37" value="option2"> 客户经理 </label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div style="margin-left: 100px;">
                    <button type="submit" class="btn">确定</button>
                    <button type="cancel" class="btn" onClick="parent.jQuery.fancybox.close();return false">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>