<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link id="bs-css" href="/asserts/css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        .login_box {
            background: url(/asserts/img/login_bg.png) no-repeat;
            width: 602px;
            height: 416px;
            overflow: hidden;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -301px;
            margin-top: -208px;
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

    <script type="text/javascript">
        $(function () {
            var msg='${msg}';
            if(msg){
                alert(msg);
            }
            $('.login_tj_btn').click(function () {
                if ($('#userName').val() == '') {
                    alert('用户名不能为空!');
                    return;
                } else if ($('#password').val() == '') {
                    alert('密码不能为空!');
                    return;
                }
                $('#loginForm').submit();
            });
        });
    </script>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="row-fluid">
            <div class="span12 center login-header">
                <h2>欢迎使用农户建档现场电子信息采集系统</h2>
            </div><!--/span-->
        </div><!--/row-->

        <div class="row-fluid">
            <div class="well span5 center login-box">
                <div class="alert alert-info">
                    请通过用户名跟密码登陆
                </div>
                <form:form action="/login.html" commandName="loginForm">
                    <fieldset>
                        <div class="input-prepend" title="Username" data-rel="tooltip">
                            <label>用户名：</label><form:input path="userName" class="ipt"/>
                        </div>
                        <div class="clearfix"></div>

                        <div class="input-prepend" title="Password" data-rel="tooltip">
                            <label>密码：</label><form:password path="password" class="ipt"/>
                        </div>
                        <div class="clearfix"></div>

                        <p class="center span5">
                            <button type="submit" class="btn btn-primary">登陆</button>
                        </p>
                    </fieldset>
                </form:form>
            </div><!--/span-->
        </div><!--/row-->

    </div><!--/fluid-row-->

    <footer>
        <p style="text-align: center">CopyRight 2013-2014 <a href="http://www.fjhaxh.com/" target="_blank">惠安县农村信用合作联社</a> & 上海广盈</p>
    </footer>
</div><!--/.fluid-container-->


</body>

</html>
