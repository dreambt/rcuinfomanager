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
                $('#carForm').submit();
            });

        });
    </script>
</head>
<body>
<form id="carForm" action="/family/saveCar" method="post">
    <core:if test="${personFamilyAssets.assetsId != '' and personFamilyAssets.assetsId != null}">
        <input type="hidden" id="assetsId" name="assetsId" value="${personFamilyAssets.assetsId}"/>
    </core:if>
    <input type="hidden" name="recordId" value="${recordId}"/>
    <table width="100%" border="0">
        <tbody>
        <tr>
            <td align="center" colspan="8" style="font-size:18px">
                添加车辆：
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">情况</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsInfo">
                    <option value="轿车">轿车</option>
                    <option value="货车">货车</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsWorth">
                    <option value="10万以内">10万以内</option>
                    <option value="10-30万">10-30万</option>
                    <option value="30-50万">30-50万</option>
                    <option value="50万以上">50万以上</option>
                </select>
            </td>
            </tr>
            <tr>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsIsInstallment">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsUsingInfo">
                    <option value="营运">营运</option>
                    <option value="出租">出租</option>
                    <option value="闲置">闲置</option>
                    <option value="自用">自用</option>
                    <option value="其他">其他</option>
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