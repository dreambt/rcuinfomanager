<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <title>指派信息</title>
</head>
<body>
  <form:form action="login.html" commandName="loginForm">
    <table style="margin-right: 22px;">
        <tr>
            <td>户主：</td>
            <td><form:input path="userName"/></td>
            <td>电话：</td>
            <td><form:input path="userName"/></td>
        </tr>
        <tr>
            <td>指派给：</td>
            <td>
                <form:select path="">
                  <form:option value="">-选择网点-</form:option>
                  <form:option value="">小作社</form:option>
                </form:select>
            </td>
            <td><form:input path=""/>（可选）</td>
        </tr>
        <tr>
            <td><form:button name="" value="确定"/> </td>
            <td><form:button name="" value="取消"/> </td>
        </tr>
    </table>
  </form:form>
</body>
</html>