<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>农户建档现场电子信息采集系统</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" type="text/javascript" src="../jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function(){
               $('.login_tj_btn').click(function(){
                   if($('#userName').val()==''){
                       alert('用户名不能为空!');
                       return;
                   }else if($('#password').val()==''){
                       alert('密码不能为空!');
                       return;
                   }
                   /*
                    else if($('#safeCode').val()==''){
                    alert('验证码不能为空!');
                    return;
                    }*/
                   $('#loginForm').submit();
               });
        });
    </script>
</head>

<body>
<div id="login_bg" class="login_box">
<div class="login_iptbox">
    <form:form action="login.html" commandName="loginForm">
        <input type="submit" class="login_tj_btn">
        <label>用户名：</label><form:input path="userName" class="ipt"/>
        <label>密码：</label><form:password path="password" class="ipt"/>
        <label>验证码：</label><input name="code" type="text" class="ipt ipt_reg" onfocus="document.getElementById('yzm').style.display='block'">
        <div id="yzm" class="yzm"><img id="code_img" onclick="" src=""><br><a href="">单击更换验证码</a></div>
    </form:form>
</div>
<div class="cr">CopyRight 2013-2014  <a href="http://www.fjhaxh.com/" target="_blank">惠安县农村信用合作联社</a> & 上海广盈 <a href="" target="_blank">BODING TEAM</a> </div>
</div>
</body>
</html>
