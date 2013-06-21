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

            //关闭
            $('#cancelOperate').click(function () {
                window.top.art.dialog({id: 'addHouse' }).close();
            });
            //返回main
            var success = '${houseSuccess}';
            if (success && success != '') {
                window.top.art.dialog({id: 'addHouse'}).close();
                window.location.reload();
            }

        });
    </script>
</head>
<body>
<%--<form:form modelAttriubte = "houseInfo"  action="/family/saveHouse" method = "post">--%>
<form id="houseForm" action="/family/saveHouse" method="post">
    <input type="hidden" name="assetsId" value="${assetsId}">
    <table width="100%" border="0">
        <tbody>
        <tr>
            <td align="center" colspan="8" style="font-size:18px">
                添加房产
            </td>
        </tr>
        <tr id="defaultItem">
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">性质</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="nature">
                    <option value="商品房">商品房</option>
                    <option value="自建房">自建房</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">用途</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="purpose">
                            <option value="商用楼">商用楼</option>
                            <option value="店铺"></option>
                            <option value="居住"></option>
                            <option value="其他">其他</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="site">
                    <option value="本市市区">本市市区</option>
                    <option value="户口地镇区">户口地镇区</option>
                    <option value="户口地乡村">户口地乡村</option>
                    <option value="本省其他县市">本省其他县市</option>
                    <option value="外省">外省</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="structure">
                    <option value="钢混">钢混</option>
                    <option value="砖混">砖混</option>
                    <option value="砖木">砖木</option>
                    <option value="框架">框架</option>
                    <option value="其他">其他</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">层数</td>
            <td align="left">
                <%--<form:input path="floorNum" class="input-small" style="width: 95px;height: 30px; margin-top: 5px;"/>--%>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="usedSitu">
                    <option value="自住">自住</option>
                    <option value="自身经营使用">自身经营使用</option>
                    <option value="出租">出租</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="houseArea">
                    <option value="100㎡内">100㎡内</option>
                    <option value="100-300㎡">100-300㎡</option>
                    <option value="300-500㎡">300-500㎡</option>
                    <option value="500㎡以上">500㎡以上</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="houseWorth">
                    <option value="10万以内">10万以内</option>
                    <option value="10-30万">10-30万</option>
                    <option value="30-60万">30-60万</option>
                    <option value="60-100万">60-100万</option>
                    <option value="100万以上">100万以上</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="installment">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
            <td align="left">
                <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="hasCredentials">
                    <option value="双证齐全">双证齐全</option>
                    <option value="单土地证">单土地证</option>
                    <option value="无办证">无办证</option>
                </select>
            </td>
            <td align="center" bgcolor="#b4d8ed" style="color:#161823">备注</td>
            <td align="left" colspan="3">
                <%--<form:input path="note1" class="input-small" style="width: 280px;height: 30px; margin-top: 5px;"/>--%>
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