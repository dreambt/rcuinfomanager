<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <!-- Bootstrap -->
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <!--[if IE 8]><link rel="stylesheet" href="/asserts/css/bootstrap-ie8buttonfix.css"><![endif]-->
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
                $('.userSubmit').attr('id','addUserSubmit');
                $(".errMsg").empty().hide();
                $("#addAccount").fancybox({
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });
            });

            $('#addUserSubmit').click(function(){

                if (!$("#organizationId").val()) {
                    $(".errMsg").append("请选择一个对应的网点").show();
                    return;
                }

                $.ajax({
                    type: "post",
                    url: "/systemAccount/addAccount",
                    dataType: "json",
                    data:'displayUserName=' + $("#displayUserName").val() + "&userName=" + $("#userName").val() + "&password=" + $("#password").val()+ "&confirmPassword=" + $("#confirmPassword").val() + "&organizationId=" + $("#organizationId").val(),
                    success: function (data) {
                        if (data.errMsg) {
                            $(".errMsg").append(data.errMsg).show();
                        } else {
                            $.fancybox.close();
                            location.reload(true);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            });

            //添加网点
            $('#addStipple').click(function(){
                $("#addStipple").fancybox({
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });
            });

            $('.editAccount').click(function(){
                var me=$(this);
                var id = me.attr('recordId');

                $.ajax({
                    type: "get",
                    url: "/systemAccount/user/"+id,
                    dataType: "json",
                    success: function (data) {
                       $('#userId').val(id);
                       $('#displayUserName_edit').val(data.displayUserName);
                       $('#userName_edit').val(data.userName);
                       $('#password_edit').val(data.password);
                       $('#organizationId_edit').val(data.organizationId);
                    }
                });

                $('.userSubmit').attr('id','editUserSubmit');
                var url='/systemAccount/editAccount';
                $(".errMsg").empty().hide();
                $(".editAccount").fancybox({
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });
            });

            $('#editUserSubmit').click(function(){

                $.ajax({
                    type: "post",
                    url: "/systemAccount/editAccount",
                    dataType: "json",
                    data:'displayUserName=' + $("#displayUserName_edit").val() + "&userName=" + $("#userName_edit").val() + "&password=" + $("#password_edit").val()+ "&userId=" + $("#userId").val() + "&organizationId=" + $("#organizationId_edit").val(),
                    success: function (data) {
                        if (data.errMsg) {
                            $(".errMsg").append(data.errMsg).show();
                        } else {
                            $.fancybox.close();
                            location.reload(true);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            });

            $('.deleteAccount').click(function(){
                if(confirm('确定要删除吗？')){
                    var me=$(this);
                    var id=me.attr('recordId');
                    var url = '/systemAccount/deleteAccount/'+id;
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
            <input class="input-block-level" type="text" value="系统帐号管理" disabled="disabled"
                   style="color:#0000AA;margin-bottom: 0px; margin-top: -18px;">

            <div class="content-menu ib-a blue line-x" style="margin-top: 10px;">
                <select name="" style="width:120px; height:30px">
                    <option value="" selected="selected">按账号</option>
                    <option value="">按客户经理姓名</option>
                    <option value="">按角色</option>
                </select>
                <input id="keyword" name="keyword" type="text" style="color:#999999;width:120px; height:20px; margin-right: 5px"
                       class="input-text" value="请输入关键字"/>
                <div class="btn-group" style="margin-top: 0px;">
                    <button class="btn">查询</button>
                    <a id="addAccount" class="btn" href="#addUser">添加账号</a>
                    <a id="addStipple" class="btn" href="#addStippleContent">添加网点</a>
                </div>
            </div>

            <div class="table-list" style="margin-top: 10px;">
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
                            <td align="center">
                                是
                            </td>
                            <td align="center">${accountInfo.displayUserName}</td>
                            <td align="center">
                                <a href="#editUser" style="color:#0099FF" class="editAccount" recordId=${accountInfo.userId}>编辑</a>&nbsp;|&nbsp;
                                <a href="#" style="color:#FF0000" class="deleteAccount" recordId=${accountInfo.userId}>删除</a>
                            </td>
                        </tr>
                    </core:forEach>
                    </tbody>
                </table>
                <div class="pagination" style="text-align: center;">
                    <ul>
                        <li> <a href="/accountManager/?page=1">首页</a> </li>
                        <c:forEach begin="1" end="${pageCount}" var="p">
                            <li> <a href="/accountManager/?page=${p}">${p}</a> </li>
                        </c:forEach>
                        <li> <a href="/accountManager/?page=${pageCount}">尾页</a> </li>
                        <li> <span>总${pageCount}页</span> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- add user -->
    <div id="addUser" style="display:none">
        <div class="errMsg alert" style="display:none"></div>
        <table width="100%" border="0">
            <tbody>
            <tr>
                <td align="right">客户经理：</td>
                <td align="left"><input  type="text" id="displayUserName" name="displayUserName" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请输入客户经理的姓名"/> </td>
            </tr>
            <tr>
                <td align="right">帐号：</td>
                <td align="left"><input type="text" id="userName" name="userName" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请输入要创建的帐号"></td>
            </tr>
            <tr>
                <td align="right"> 密码： </td>
                <td align="left"> <input type="text" id="password" name="password" style="width: 200px;height: 30px;margin-top: 10px;"   placeholder="请输入密码"></td>
            </tr>
            <tr>
                <td align="right"> 确认密码：</td>
                <td align="left"> <input type="text" id="confirmPassword" name="confirmPassword" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请再次输入密码"></td>
            </tr>
            <tr>
                <td align="right">对应的网点：</td>
                <td align="left">
                    <select class="span3" id="organizationId" name="organizationId" id="organizationId" style="width:202px;">
                        <option value="">选择网点</option>
                        <core:forEach items="${orgList}" var="org">
                            <option value="${org.organizationId}">${org.organizationName}</option>
                        </core:forEach>
                    </select>
                </td>
            </tr>
            <%--<tr>
                <td align="right">指定角色：</td>
                <td align="left">
                    <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox36" value="option1"> 系统管理员 </label>
                    <br>
                    <label class="checkbox inline"> <input type="checkbox" id="inlineCheckbox37" value="option2"> 客户经理 </label>
                </td>
            </tr>--%>
            </tbody>
        </table>
        <div style="margin-left: 100px;">
            <button type="submit" class="btn userSubmit" id="addUserSubmit" >确定</button>
            <button type="cancel" class="btn" onClick="parent.jQuery.fancybox.close();return false">取消</button>
        </div>
    </div>

    <!-- edit user -->
    <div id="editUser" style="display:none">
        <div class="errMsg alert" style="display:none"></div>
        <input type="text" style="display: none" id="userId"/>
        <table width="100%" border="0">
            <tbody>
            <tr>
                <td align="right">客户经理：</td>
                <td align="left"><input  type="text" id="displayUserName_edit" name="displayUserName" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请输入客户经理的姓名"/> </td>
            </tr>
            <tr>
                <td align="right">帐号：</td>
                <td align="left"><input type="text" id="userName_edit" name="userName" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请输入要创建的帐号" disabled></td>
            </tr>
            <tr>
                <td align="right"> 密码： </td>
                <td align="left"> <input type="text" id="password_edit" name="password" style="width: 200px;height: 30px;margin-top: 10px;"   placeholder="请输入密码"></td>
            </tr>
            <tr>
                <td align="right">对应的网点：</td>
                <td align="left">
                    <select class="span3" id="organizationId_edit" name="organizationId" id="organizationId" style="width:202px;">
                        <option value="">选择网点</option>
                        <core:forEach items="${orgList}" var="org">
                            <option value="${org.organizationId}">${org.organizationName}</option>
                        </core:forEach>
                    </select>
                </td>
            </tr>
            <%--<tr>
                <td align="right">指定角色：</td>
                <td align="left">
                    <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox36" value="option1"> 系统管理员 </label>
                    <br>
                    <label class="checkbox inline"> <input type="checkbox" id="inlineCheckbox37" value="option2"> 客户经理 </label>
                </td>
            </tr>--%>
            </tbody>
        </table>
        <div style="margin-left: 100px;">
            <button type="submit" class="btn userSubmit" id="editUserSubmit" >确定</button>
            <button type="cancel" class="btn" onClick="parent.jQuery.fancybox.close();return false">取消</button>
        </div>
    </div>

    <!-- 添加网点 -->
    <div id="addStippleContent" style="display:none">
        <form method="post" action="/systemAccount/addStipple">
            <table width="100%" border="0">
                <tbody>
                <tr>
                    <td align="right">网点名称：</td>
                    <td align="left"><input  type="text" name="organizationName" style="width: 200px;height: 30px;margin-top: 10px;" value="${organizationInfo.organizationName}" placeholder="请输入客户经理的姓名"/> </td>
                </tr>
                <tr>
                    <td align="right">该网点的上级网点：</td>
                    <td align="left">
                      <select name="organizationId">
                          <option value="0"></option>
                          <core:forEach items="${orgList}" var="org">
                              <option value="${org.organizationId}">${org.organizationName}</option>
                          </core:forEach>
                      </select>
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
</body>
</html>