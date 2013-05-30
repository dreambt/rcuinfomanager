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
    <link id="artDialog-skin" href="/asserts/js/dialog/skins/opera.css" rel="stylesheet" />
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>
    <script src="/asserts/js/main.js"></script>
    <script type="text/javascript">
        $(function(){
            if(${firstLogin}){
                alert("第一次登录，是否需要修改密码？");
            }
        });
    </script>
</head>
<body>

<div class="top">
    <div class="row" style="margin-left: 2px;margin-top: -40px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="145" background="/asserts/img/head.png">
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="60%" height="145"><img src="/asserts/img/logo.png" width="500" height="145" /></td>
                            <td width="40%" align="right" valign="bottom" >
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">
                                    您好！<span id="uName">[<c:out value="${displayUserName}"/>]</span>
                                    <a href="/logout" style="color:#FFFFFF">&nbsp;退出</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <ul class="nav nav-list bs-docs-sidenav affix">
                <li class="active"><a href="/index"><i class="icon-chevron-right"></i>客户电子信息管理</a></li>
                <li clientId="mobileDevice"><a href="#mobileDeviceManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
                <li clientId="account"><a href="#accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
                <li clientId="role"><a href="#roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
                <li clientId="sysTemLog"><a href="#systemlogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
            </ul>
        </div>
        <div class="span10" style="margin-left: -8.435897%;">
            <br/>
            <input class="input-block-level" type="text" placeholder="客户电子信息管理" disabled="disabled" style="color:#0000AA">
            <div class="navbar">
                <div class="btn-group">
                    <select class="selectpicker" style="width: 95px; margin-top: 10px;">
                        <option value="" selected="selected">按网点</option>
                    </select>
                    <select class="selectpicker" style="width: 95px; margin-top: 10px;">
                        <option value="" selected="selected">按乡镇</option>
                    </select>
                    <select class="selectpicker" style="width: 95px; margin-top: 10px;">
                        <option value="" selected="selected">按村</option>
                    </select>
                    <input type="text"  name="" value="" placeholder="按客户经理" style="width: 95px; height:30px;margin-top: 10px;">
                    <a class="btn" href="#">查询</a>
                </div>
                <div class="btn-group">
                    <button class="btn" type="button">指派</button>
                    <button class="btn" type="button">验收</button>
                </div>
                <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">导入 <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#">导入基础数据</a></li>
                        <li><a href="#">导入村委会评价表</a></li>
                    </ul>
                </div>
                <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">导出 <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#">导出基础数据</a></li>
                        <li><a href="#">导出村委会评价表</a></li>
                    </ul>
                </div>
            </div>

            <div class="table-list">
                <table width="100%">
                    <thead>
                    <tr>
                        <th width="77" align="center" class="first">
                            <input type="checkbox"/>全选
                        </th>
                        <th width="74" align="center">序号</th>
                        <th width="115" align="center">户主姓名</th>
                        <th width="115" align="center">联系电话</th>
                        <th width="115" align="center">提交日期</th>
                        <th width="115" align="center">收集单位</th>
                        <th width="110" align="center">收集人</th>
                        <th width="100" align="center">状态</th>
                        <th width="280" align="center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <core:forEach items="${familyInfoList}" var="familyInfo">
                    <tr>
                        <td align="center" class="first">
                            <input type="checkbox" class="checkOpera" recordId="${familyInfo.recordId}"/>
                        </td>
                        <td align="center">${familyInfo.recordId}</td>
                        <td align="center">${familyInfo.customerName}</td>
                        <td align="center">${familyInfo.telephone}</td>
                        <td align="center">${familyInfo.submitTime}</td>
                        <td align="center">${familyInfo.organizationName}</td>
                        <td align="center">${familyInfo.displayUserName}</td>
                        <td align="center">${familyInfo.state}</td>
                        <td align="center">
                            <a href="#" style="color:#0099FF" class="showOperate" recordId="${familyInfo.recordId}">查看</a>&nbsp;|&nbsp;
                            <a href="#" style="color:#0099FF" class="appointOperate" recordId="${familyInfo.recordId}">指派</a>&nbsp;|&nbsp;
                            <a href="#" style="color:#0099FF" class="editOperate" recordId="${familyInfo.recordId}">编辑</a>&nbsp;|&nbsp;
                            <a href="#" style="color:#FF0000" class="deleteOperate" recordId="${familyInfo.recordId}">删除</a>
                        </td>
                    </tr>
                    </core:forEach>
                    </tbody>
                </table>
            </div>

            <div class="pagination" style="text-align: center;">
                <ul>
                    <li><a href="#">«</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>