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
        $(function(){

            //确定   使用json
            $('#okOperate').click(function(){
                var url='';
                var scuessUrl='';
                var params={'':''};
                $.post(url,params,function(result){
                       if(result){
                           window.location.href=scuessUrl;
                       }else{
                           alert("失败");
                       }
                },'json');
            });

            //关闭
            $('#cancelOperate').click(function() {
                window.top.art.dialog({id : 'addAccount' }).close();
            });
            //返回main
            var success='${params.success}';
            if(success&&success!=''){
                var url='farmer/main';
                $(window.top.window.document).find('#main').attr('src',url);
                window.top.art.dialog({id:'addAccount'}).close();
            }

        });
    </script>
</head>
<body>

<form method="post">
    <table width="100%" border="0">
        <tbody>
        <tr>
            <td align="right">
                客户经理：
            </td>
            <td align="left">
                <input  type="text" name="" value="" placeholder="请输入客户经理的姓名"
                        style="width: 200px;height: 30px; margin-top: 10px;"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                帐号：
            </td>
            <td align="left">
                <input type="text" name="customerName" value=""
                       style="width: 200px;height: 30px; margin-top: 10px;" placeholder="请输入要创建的帐号">
            </td>
        </tr>
        <tr>
            <td align="right">
                密码：
            </td>
            <td align="left">
                <input type="text" name="customerName" value=""
                       style="width: 200px;height: 30px; margin-top: 10px;" placeholder="请输入密码">
            </td>
        </tr>
        <tr>
            <td align="right">
                确认密码：
            </td>
            <td align="left">
                <input type="text" name="customerName" value=""
                       style="width: 200px;height: 30px; margin-top: 10px;" placeholder="请再次输入密码">
            </td>
        </tr>
        <tr>
            <td align="right">对应的网点：</td>
            <td align="left">
                <select class="span3" name="organizationName" id="organizationName" style="width:202px;">
                    <option value="">选择网点</option>
                    <option value="" ></option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">
                指定角色：
            </td>
            <td align="left">
                <label class="checkbox inline">
                    <input type="checkbox" id="inlineCheckbox36" value="option1"> 系统管理员
                </label>
                <br>
                <label class="checkbox inline">
                    <input type="checkbox" id="inlineCheckbox37" value="option2"> 客户经理
                </label>
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