<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                $('#houseForm').submit();
            });

        });
    </script>
</head>
<body>
    <form id="houseForm" action="/family/saveLand" method="post">
        <input type="hidden" name="assetsId" value="${assetsId}"/>
        <input type="hidden" name="recordId" value="${recordId}"/>
        <table width="100%" border="0">
            <tbody>
            <tr>
                <td align="center" colspan="8" style="font-size:18px">
                    添加土地
                </td>
            </tr>
            <tr id="defaultItem">
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地面积</td>
                <td align="left">
                    <select class="selectpicker"  name="area">
                        <option value="100㎡内">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </select>
                </td>
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
                <td align="left">
                    <input class="input-small" type="text" name="worth" value="">
                </td>
                </tr>
                <tr>
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
                <td align="left">
                    <select class="selectpicker" name="property">
                        <option value="国有出让">国有出让</option>
                        <option value="国有划拨">国有划拨</option>
                        <option value="集体证">集体证</option>
                        <option value="无办证">无办证</option>
                    </select>
                </td>
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
                <td align="left">
                    <select class="selectpicker" name="type">
                        <option value="商业地">商业地</option>
                        <option value="住宅用地">住宅用地</option>
                        <option value="工业地">工业地</option>
                        <option value="耕地">耕地</option>
                        <option value="山地或滩涂">山地或滩涂</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
                <td align="left">
                    <select class="selectpicker"  name="usedSitu">
                        <option value="自用">自用</option>
                        <option value="出借">出借</option>
                        <option value="出租">出租</option>
                        <option value="未使用">未使用</option>
                    </select>
                </td>
                </td>
                <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地款是否结清</td>
                <td align="left">
                    <select class="selectpicker" name="moneyClear">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <p align="center">
        <a class="btn" href="#" id="okOperate">确定</a>&nbsp;
        <a class="btn" href="/family/edit/${recordId}" id="cancelOperate"  target="_parent">取消</a>
    </p>
</body>
</html>