<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <link id="bs-css" href="/asserts/css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <link href="/asserts/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/asserts/css/charisma-app.css" rel="stylesheet">
    <link href="/asserts/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <!--[if IE 8]><link rel="stylesheet" href="/asserts/css/bootstrap-ie8buttonfix.css"><![endif]-->

    <link rel="stylesheet" href="/asserts/css/jquery.fancybox.css"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/modernizr.js"></script>
    <script src="/asserts/js/main.js"></script>
    <script src="/asserts/js/jquery.fancybox.js"></script>
    <script src="/asserts/js/IE8.js"></script>
    <script src="/asserts/js/jquery-ui-1.8.21.custom.min.js"></script>
    <!-- select or dropdown enhancer -->
    <script src="/asserts/js/jquery.chosen.min.js"></script>
    <!-- checkbox, radio, and file input styler -->
    <script src="/asserts/js/jquery.uniform.min.js"></script>
    <script src="/asserts/js/app.js"></script>

    <script type="text/javascript">
        $(function(){

            //datepicker
            $('.datepicker').datepicker({"dateFormat": 'yy-mm-dd'});

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

        jQuery(function($){
            $.datepicker.regional['zh-CN'] = {
                closeText: '关闭',
                prevText: '<上月',
                nextText: '下月>',
                currentText: '今天',
                monthNames: ['一月','二月','三月','四月','五月','六月',
                    '七月','八月','九月','十月','十一月','十二月'],
                monthNamesShort: ['一','二','三','四','五','六',
                    '七','八','九','十','十一','十二'],
                dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
                dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
                dayNamesMin: ['日','一','二','三','四','五','六'],
                weekHeader: '周',
                dateFormat: 'yy-mm-dd',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: true,
                yearSuffix: '年'};
            $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
        });
    </script>
</head>
<body>

<!-- topbar starts -->
<div class="top" style="padding-bottom: 5px;">
    <div class="row" style="margin-left: 2px;margin-top: -40px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="145" background="/asserts/img/head.png">
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="60%" height="145"><img src="/asserts/img/logo.png" width="500" height="145" /></td>
                            <td width="40%" align="right" valign="bottom" >
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span>[<c:out value="${displayUserName}"/>]</span><a href="/logout" style="color:#FFFFFF">&nbsp;退出</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
<!-- topbar ends -->
<div class="container-fluid">
    <div class="row-fluid">

        <!-- left menu starts -->
        <div class="span2 main-menu-span">
            <div class="well nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li><a href="/index"><i class="icon-home"></i><span class="hidden-tablet">客户电子信息管理</span></a></li>
                    <core:if test="${userName == 'admin'}">
                        <li><a href="/photo/home"><i class="icon-wrench"></i><span class="hidden-tablet">客户照片管理</span></a></li>
                        <li><a href="/clientManager"><i class="icon-wrench"></i><span class="hidden-tablet">客户端管理</span></a></li>
                        <li><a href="/accountManager"><i class="icon-user"></i><span class="hidden-tablet">系统账号管理</span></a></li>
                        <%--<li><a href="/roleManager"><i class="icon-user"></i><span class="hidden-tablet">系统角色管理</span></a></li>--%>
                        <li><a href="/systemLogManager"><i class="icon-certificate"></i><span class="hidden-tablet">系统日志</span></a></li>
                    </core:if>
                </ul>
            </div><!--/.well -->
        </div><!--/span-->
        <!-- left menu ends -->

        <div id="content" class="span10">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">主页</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">系统日志</a>
                    </li>
                </ul>
            </div>

            <div class="pad-10">
                <div class="btn-default">
                    <form class="form-search" id="searchForm" action="/systemLogManager" method="post">
                        按时间：
                        <input type="text" id="beginTime"  name="beginTime" value="${param.beginTime}" class="input-xlarge datepicker" style="width: 115px;" >
                              &nbsp;-&nbsp;
                        <input type="text" id="endTime" name="endTime" value="${param.endTime}" class="input-xlarge datepicker" style="width: 115px;">
                        <input type="text" id="userName" name="userName" value="${param.userName}" placeholder="按系统帐号" style="width: 115px;">
                        <a href="#" class="btn btn-small" id="searchLogs">查询</a>
                        <a href="#" class="btn btn-small" id="cleanLogs">重置</a>
                    </form>
                </div>

                <table class="table table-bordered table-striped table-condensed">
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
                        <li> <a href="/systemLogManager/?page=1">首页</a> </li>
                        <c:forEach begin="1" end="${pageCount}" var="p">
                            <li class="${currentPage == p ? 'active' : ''}" > <a href="/systemLogManager/?page=${p}">${p}</a> </li>
                        </c:forEach>
                        <li> <a href="/systemLogManager/?page=${pageCount}">尾页</a> </li>
                    </ul>
                </div>
            </div>

         </div>
    </div>
</div>

</body>
</html>