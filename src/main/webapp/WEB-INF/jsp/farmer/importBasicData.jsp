<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/bootstrap.file-input.js"></script>
    <script type="text/javascript">
        $(function () {
            //确定
            $('#okOperate').click(function () {
                $('#myForm').submit();
            });

        });

        function fillFileName() {
            $('#fileName').val($('#file').val())
        }
    </script>
</head>
<body>

<form:form action="/family/saveImportBasicData" enctype="multipart/form-data" method="POST">
    <table>
        <tr>
            <td >
                <input type="file" id="file" name="file" title="请选择需要导入的文件">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <div class="btn-group" style="margin-left: 50px;">
        <input type="submit" value="导入" class="btn" />
        <button class="btn" id="cancelOperate">取消</button>
    </div>
</form:form>
</body>
</html>