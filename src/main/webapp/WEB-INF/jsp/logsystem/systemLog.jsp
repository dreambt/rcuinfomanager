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
    <link href="/asserts/js/my97datepicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"/>
    <link href="/asserts/js/my97datepicker/skin/default/datepicker.css" rel="stylesheet" type="text/css"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/my97datepicker/lang/zh-cn.js"></script>
    <script src="/asserts/js/my97datepicker/calendar.js"></script>
    <script src="/asserts/js/my97datepicker/WdatePicker.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>
    <script src="/asserts/js/main.js"></script>

    <script type="text/javascript">
        $(function(){
            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
            //查询
            $('#searchLogs').click(function(){
                $('#searchForm').submit();
            });
            //重置
            $('#cleanLogs').click(function(){
                $('#beginTime').val('');
                $('#endTime').val('');
                $('#userName').val('');
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
                <li class=""><a href="/roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
                <li class="active"><a href="/systemLogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
            </ul>
        </div>
        <div class="span10" style="margin-left: -8.435897%;">
            <br/>
            <input class="input-block-level" type="text" placeholder="系统日志" disabled="disabled" style="color:#0000AA">
            <div class="pad-10">
                <div class="btn-default">
                    <form class="form-search" id="searchForm" action="/logs/queryLogs" method="post">
                        按时间：
                        <input type="text" id="beginTime"  name="beginTime" value="${param.beginTime}" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                               style="width: 115px;height: 25px; margin-top: 10px;">&nbsp;-&nbsp;
                        <input type="text" id="endTime" name="endTime" value="${param.endTime}" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                               style="width: 115px;height: 25px; margin-top: 10px;">
                        <input type="text" id="userName" name="userName" value="${param.userName}" placeholder="按系统帐号"
                               style="width: 140px;height: 25px; margin-top: 10px;">
                        <a href="#" class="btn btn-small" id="searchLogs">查询</a>
                        <a href="#" class="btn btn-small" id="cleanLogs">重置</a>
                    </form>
                </div>

                <div class="table-list">
                    <table width="100%">
                        <thead>
                        <tr>
                            <th width="271" align="center">时间</th>
                            <th width="260" align="center">系统账号</th>
                            <th width="564" align="center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <core:forEach items="${logsInfoList}" var="logsInfo">
                            <tr>
                                <td align="center">${logsInfo.operatedTime}</td>
                                <td align="center">${logsInfo.userName}</td>
                                <td align="center"><p>${logsInfo.operation}</p></td>
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
    </div>
</div>
</body>
</html>