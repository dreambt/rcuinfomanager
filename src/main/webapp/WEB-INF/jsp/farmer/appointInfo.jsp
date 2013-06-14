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
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {

            //确定
            $('#okOperate').click(function () {
                var id = $('#recordId').val();
                var organizationName = $('#organizationName').val();
                var customerName = $('#customerName').val();
                var url = 'family/saveAppointInfo/' + id + '/' + organizationName + '/' + customerName;
                window.location.href = url;
            });

            //关闭
            $('#cancelOperate').click(function () {
                window.top.art.dialog({id: 'assign' }).close();
            });
            //返回main
            var success = '${params.success}';
            if (success && success != '') {
                var url = 'farmer/main';
                $(window.top.window.document).find('#main').attr('src', url);
                window.top.art.dialog({id: 'assign'}).close();
            }

        });
    </script>
</head>
<body>

<form method="post">
    <table width="100%" border="0">
        <tbody>
        <core:forEach items="${appointPeopleList}" var="appointPeople">
            <input type="hidden" id="recordId" name="recordId" value="${appointPeople.recordId}">
            <tr>
                <td><span class="label label-info">户主：</span></td>
                <td>${appointPeople.customerName}</td>
                <td><span class="label label-info">电话：</span></td>
                <td>${appointPeople.telephone}</td>
            </tr>
        </core:forEach>
        <tr>
            <td align="left" colspan="2">
                <span class="label label-info">指派给：</span>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td align="right">
                <select class="span3" name="organizationName" id="organizationName" style="width:202px;">
                    <option value="">选择网点</option>
                    <option value="">小作社</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <input type="text" id="customerName" name="customerName" value=""
                       style="width: 200px;height: 30px; margin-top: 10px;" placeholder="指定客户经理">
            </td>
            <td><span class="help-inline">(可选)</span></td>
        </tr>

        </tbody>
    </table>
</form>
<p align="center">
    <a class="btn" href="#" id="okOperate">确定</a>&nbsp;<a class="btn" href="#" id="cancelOperate">取消</a>
</p>
</body>
</html>