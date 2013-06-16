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
            var isCheck='${isCheck}';
            if(isCheck){
               alert(isCheck);
            }
           var recordIds='${recordIds}';
            //确定
            $('#okOperate').click(function () {
                var state = $('#state').val();
                if(state && state!=''){
                    var url = '/family/saveBatchChecks/'+recordIds+'/'+state;
                    window.location.href = url;
                }else{
                    alert("未选择验收结果！");
                }
            });

            //关闭
            $('#cancelOperate').click(function () {
                window.top.art.dialog({id: 'check' }).close();
            });
            //返回main
            var success = '${success}';
            if (success && success != '') {
                var url = 'farmer/main';
                window.top.art.dialog({id: 'check'}).close();
            }

        });
    </script>
</head>
<body>

<form method="post">
    <table width="100%" border="0">
        <tbody>
        <%--<core:forEach items="${appointList}" var="appointPeople">
            <input type="hidden" id="recordId" name="recordId" value="${appointPeople.recordId}">
            <tr>
                <td><span class="label label-info">户主：</span></td>
                <td>${appointPeople.customerName}</td>
                <td><span class="label label-info">电话：</span></td>
                <td>${appointPeople.telephone}</td>
            </tr>
        </core:forEach>--%>
        <tr>
            <td align="left" colspan="2">
                <span class="label label-info">验收</span>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td align="right">
                <select class="span3" name="state" id="state" style="width:202px;">
                    <option value="">选择验收结果</option>
                    <option value="1">验收通过</option>
                    <option value="2">验收拒绝</option>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<p align="center">
    <a class="btn" href="#" id="okOperate">确定</a>&nbsp;
    <a class="btn" href="#" id="cancelOperate">取消</a>
</p>
</body>
</html>