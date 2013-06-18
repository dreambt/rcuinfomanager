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
            var recordIds = '${recordIds}';
            var isUserName='${isUserName}';
            if(isUserName){
               alert(isUserName);
            }
            //确定
            $('#addOpera').click(function () {
                var uid =$('#userId').val();
                if(uid && uid!=''){
                    var url = '/family/saveBatchAppoint/'+recordIds+'/'+uid ;
                    window.location.href = url;
                }else{
                    alert("指定经理不能为空！");
                }

            });

            //关闭
            $('#cancelOperate').click(function () {
                window.top.art.dialog({id: 'assign' }).close();
                var url = '/index';
                window.location.href = url;
            });
            //返回main
            var success = '${success}';
            if (success && success != '') {
                var url = '/farmer/main';
                window.top.art.dialog({id: 'assign'}).close();
            }

        });
    </script>
</head>
<body>

<form method="post">
    <table width="100%" border="0">
        <tbody>
        <tr>
            <td align="left" colspan="2">
                <span class="label label-info">指派给：</span>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td align="right">
                <select class="span3" name="userId" id="userId" style="width:202px;">
                    <option value="">指定客户经理</option>
                    <core:forEach items="${userNameList}" var="uList">
                        <option value="${uList.userId}">${uList.userName}</option>
                    </core:forEach>
                </select>
            </td>
        </tr>
       <%-- <tr>
            <td align="right" colspan="2">
                <input type="text" id="customerName" name="customerName" value=""
                       style="width: 200px;height: 30px; margin-top: 10px;" placeholder="指定客户经理">
            </td>
            <td><span class="help-inline">(可选)</span></td>
        </tr>--%>
        </tbody>
    </table>
</form>
<p align="center">
    <a class="btn" href="#" id="addOpera">确定</a>&nbsp;
    <a class="btn" href="/index" id="cancelOperate">取消</a>
</p>
</body>
</html>