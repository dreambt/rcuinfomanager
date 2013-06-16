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
    <script type="text/javascript">
        $(function () {
            //确定
            $('#addOpera').click(function () {
                $('#myForm').submit();
            });

            //关闭
            $('#cancelOperate').click(function () {
                window.top.art.dialog({id: 'export' }).close();
            });
            //返回main
            var success = '${params.success}';
            if (success && success != '') {
                var url = 'farmer/main';
                window.top.art.dialog({id: 'export'}).close();
            }

        });
    </script>
</head>
<body>

<form id="myForm" action="/family/saveExportBasicData" method="post">
    <input type="hidden" name="recordIds" value="${recordIds}"/>
       <table>
           <tr>
               <td>
                   <%--<p align="center">
                     <span class="label label-warning">
                        说明：导入基础信息、导入照片压缩包、导入村委会评价表
                     </span>
                   </p>--%>
                   &nbsp;
               </td>
           </tr>
           <tr>
               <td>&nbsp;</td>
           </tr>
           <tr>
               <td>
                   <p align="center"><input id="fileField" type="file" name="file"></p>
               </td>
           </tr>
       </table>
</form>
<p align="center">
    <a class="btn" href="#" id="okOperate">导出</a>&nbsp;
    <a class="btn" href="#" id="cancelOperate">取消</a>
</p>
</body>
</html>