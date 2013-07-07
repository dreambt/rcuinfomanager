<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">

        $(function () {
            //确定
            $('#okOperate').click(function () {
                var id = $('#recordId').val();
                var uid =$('#userId').val();
                if(uid && uid!=''){
                    var url = '/family/saveAppoint/'+id+'/'+uid;
                    window.location.href = url;
                }else{
                    alert("指定客户经理不能为空！");
                }
            });

        });
    </script>
</head>
<body>

<form method="post">
    <table width="100%" border="0">
        <tbody>
            <input type="hidden" id="recordId" name="recordId" value="${appointList.recordId}">
            <tr>
                <td>户主：</td>
                <td>${appointList.customerName}</td>
                <td>电话：</td>
                <td>${appointList.telephone}</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    指派给：
                </td>
                <td colspan="2">
                    <select class="span3" name="userId" id="userId" style="width:202px;">
                        <option value="">指定客户经理</option>
                        <core:forEach items="${userNameList}" var="uList">
                            <option value="${uList.userId}">${uList.userName}</option>
                        </core:forEach>
                    </select>
                </td>
            </tr>

        </tbody>
    </table>
</form>
<p align="center">
    <a class="btn" href="#" id="okOperate">确定</a>&nbsp;
    <a class="btn" href="/family/${appointList.recordId}" id="cancelOperate"  target="_parent">取消</a>
</p>
</body>
</html>