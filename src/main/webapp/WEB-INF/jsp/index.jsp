<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>农户建档现场电子信息采集系统</title>
    <script type="text/javascript" src="../jquery/jquery-1.7.2.min.js"/>
    <script type="text/javascript">
        $(function () {
            if (${firstLogin}) {
                alert("第一次登录，是否需要修改密码？");
            }
        });
    </script>
</head>

<frameset rows="145,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"/>
    <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
        <frame src="left" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"/>
        <frame src="main" name="mainFrame" id="mainFrame" title="mainFrame"/>
    </frameset>
</frameset>

<noframes>
    <body>
    </body>
</noframes>
</html>
