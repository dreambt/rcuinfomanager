<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Bootstrap -->
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //左侧菜单样式控制
            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
        });

        //添加
        function addItem(){
            var option="";
            var li="${personHousePropertyInfoList}";
            for(var i;li.length;i++){

            }

        }
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
                                <div style="margin-bottom:10px; margin-right:10px; color:#161823">您好！<span id="uName">[<c:out value="${displayUserName}"/>]</span><a href="" style="color:#161823">[退出]</a>
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
        <li class=""><a href="/clientManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
        <li class=""><a href="/accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
        <li class=""><a href="/roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
        <li class=""><a href="/systemLogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
    </ul>
</div>
<div class="span10" style="margin-left: -8.435897%;">
<br/>
<input class="input-block-level" type="text" placeholder="客户电子信息管理>查询" disabled="disabled" style="color:#0000AA">
<table class="table table-condensed">
    <tbody>
    <core:forEach items="${personInfoList}" var="personInfo">
        <tr>
            <td><span class="label label-info">户主：</span></td>
            <td>${personInfo.customerName}</td>
            <td><span class="label label-info">电话：</span></td>
            <td>${personInfo.telephone}</td>
            <td><span class="label label-info">收集单位：</span></td>
            <td>${personInfo.organizationName}</td>
            <td><span class="label label-info">收集人：</span></td>
            <td>${personInfo.displayUserName}</td>
        </tr>
    </core:forEach>
    </tbody>
</table>

<div class="form-actions">
<a class="btn btn-primary" href="#">保存</a>
<a class="btn" href="#">取消</a>

<hr  size="1" width="100%" style="margin-bottom: -1px;"/>
<div class="tabbable">
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">个人基本概况信息</a></li>
    <li><a href="#tab2" data-toggle="tab">金融服务需求情况</a></li>
    <li><a href="#tab3" data-toggle="tab">村委会（居委会）评价</a></li>
    <li><a href="#tab4" data-toggle="tab">客户经理评价</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab1">
<div class="farmer_info">
<!--table-->
<div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
<table width="100%" border="1">
<tbody>
<core:forEach items="${personBasicList}" var="personBasic">
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">姓名</td>
    <td align="center">
        <input class="input-small" type="text" name="customerName" value="${personBasic.customerName}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">性别</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.gender}">是</option>
            <option value="${personBasic.gender}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否农户</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.farmer}">是</option>
            <option value="${personBasic.farmer}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">客户类型</td>
    <td align="center">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.customerType}">是</option>
            <option value="${personBasic.customerType}">否</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件类型</td>
    <td align="left" colspan="2">
        <select class="selectpicker" style="width: 155px; margin-top: 5px;">
            <option value="${personBasic.cerType}">是</option>
            <option value="${personBasic.cerType}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
    <td align="left" colspan="2">
        <input class="input-small" type="text" name="customerName" value="${personBasic.cerNum}"
               style="width: 175px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" colspan="2" rowspan="4">
        <img src="${personBasic.photoUri}" class="img-rounded">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件有效期</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="customerName" value="${personBasic.cerValidityFrom}"
               style="width: 125px;height: 30px; margin-top: 5px;"> -
        <input class="input-small" type="text" name="customerName" value="${personBasic.cerValidityTo}"
               style="width: 125px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">出生年月</td>
    <td align="left">
        <input class="input-small" type="text" name="customerName" value="${personBasic.birthday}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">国籍</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.nationality}">是</option>
            <option value="${personBasic.nationality}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否拥有外国护照或居住权</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.havePassport}">是</option>
            <option value="${personBasic.havePassport}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">民族</td>
    <td align="left">
        <input class="input-small" type="text" name="customerName" value="${personBasic.nation}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">政治面貌</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.poliLaspect}">是</option>
            <option value="${personBasic.poliLaspect}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">健康状况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.health}">是</option>
            <option value="${personBasic.health}">否</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">婚姻状况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.maritalStatus}">是</option>
            <option value="${personBasic.maritalStatus}">否</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        居住地址
    </td>
    <td align="left" colspan="5">
        <input class="input-small" type="text" name="customerName" value="${personBasic.address}"
               style="width: 465px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">居住编码</td>
    <td align="left">
        <input class="input-small" type="text" name="customerName" value="${personBasic.postcode}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        区域名称
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.areaName}">崇武镇</option>
            <option value="${personBasic.areaName}">东园镇</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">村别</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.village}">后内</option>
            <option value="${personBasic.village}">前海</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">联系电话</td>
    <td align="left">
        <input class="input-small" type="text" name="customerName" value="${personBasic.telephone}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">手机号码</td>
    <td align="left">
        <input class="input-small" type="text" name="customerName" value="${personBasic.mbPhoneNum}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        居住状况
    </td>
    <td align="left" colspan="2">
        <select class="selectpicker" style="width: 155px; margin-top: 5px;">
            <option value="${personBasic.liveCondition}">自置</option>
            <option value="${personBasic.liveCondition}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">社会保障情况</td>
    <td align="left" colspan="4"><%--${personBasic.socialSecurity}--%>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox1" value="option1">养老保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox2" value="option2">失业保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox3" value="option3">医疗保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox4" value="option4">生育保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox5" value="option5">住房公积金
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        最高学位
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.highestDegree}">学士</option>
            <option value="${personBasic.highestDegree}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">最高学历</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.highestEdu}">本科</option>
            <option value="${personBasic.highestEdu}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）关系</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.bankRelation}">普通客户</option>
            <option value="${personBasic.bankRelation}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）合作关系</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.bankPartnership}">一般</option>
            <option value="${personBasic.bankPartnership}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        职业
    </td>
    <td align="left" colspan="7">
        <select class="selectpicker" style="width: 495px; margin-top: 5px;">
            <option value="${personBasic.profession}">专业技术人员</option>
            <option value="${personBasic.profession}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        个人经营项目
    </td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="customerName" value="${personBasic.businessProj}"
               style="width: 300px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">经营年限</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="customerName" value="${personBasic.businessYear}"
               style="width: 275px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        经营场所
    </td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="customerName" value="${personBasic.businessSite}"
               style="width: 300px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">从事行业</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 275px; margin-top: 5px;">
            <option value="${personBasic.industry}">专业技术人员</option>
            <option value="${personBasic.industry}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.businessProp}">专业技术人员</option>
            <option value="${personBasic.businessProp}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.moneySitu}">专业技术人员</option>
            <option value="${personBasic.moneySitu}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.inputMoney}">专业技术人员</option>
            <option value="${personBasic.inputMoney}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.ownMoney}">专业技术人员</option>
            <option value="${personBasic.ownMoney}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823"> 年收益情况</td>
    <td align="left" colspan="7">
        <select class="selectpicker" style="width: 595px; margin-top: 5px;">
            <option value="${personBasic.yearIncome}">专业技术人员</option>
            <option value="${personBasic.yearIncome}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作情况</td>
    <td align="left" colspan="7">
        <input class="input-small" type="text" name="customerName" value="${personBasic.workSitu}"
               style="width: 595px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位性质</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;">
            <option value="${personBasic.unitProp}">专业技术人员</option>
            <option value="${personBasic.unitProp}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位所属行业</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;">
            <option value="${personBasic.unitIndustry}">专业技术人员</option>
            <option value="${personBasic.unitIndustry}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">任职部门</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="customerName" value="${personBasic.department}"
               style="width: 255px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作单位类别</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;">
            <option value="${personBasic.unitType}">专业技术人员</option>
            <option value="${personBasic.unitType}">其他</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">职务</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.duties}">专业技术人员</option>
            <option value="${personBasic.duties}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">年工资收入（万元）</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.annualWageIncome}">专业技术人员</option>
            <option value="${personBasic.annualWageIncome}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作年限</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.workYears}">专业技术人员</option>
            <option value="${personBasic.workYears}">其他</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">职称</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;">
            <option value="${personBasic.workTitle}">专业技术人员</option>
            <option value="${personBasic.workTitle}">其他</option>
        </select>
    </td>
</tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭收支情况
    </td>
</tr>
<core:forEach items="${personIncomeExpensesList}" var="personIncomeExpenses">
    <tr>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">
            家庭年总收入（万元）
        </td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.fmAllIncome}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭支出（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.fmExpenses}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            收入来源
        </td>
        <td align="left" colspan="7">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.incomeSrc}"
                   style="width: 595px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">
            其中：个人年收入（万元）
        </td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.perIncome}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭其他成员年收入（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.fmOtherMemberIn}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.businessProp}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.moneySitu}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.inputMoney}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personIncomeExpenses.ownMoney}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center"  bgcolor="#b4d8ed" style="color:#161823">家庭主要支出项目</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 255px; margin-top: 5px;">
                <option value="${personIncomeExpenses.fmExpensesProj}">专业技术人员</option>
                <option value="${personIncomeExpenses.fmExpensesProj}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">家庭收入能否应付支出</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 255px; margin-top: 5px;">
                <option value="${personIncomeExpenses.fmInOutRatio}">专业技术人员</option>
                <option value="${personIncomeExpenses.fmInOutRatio}">其他</option>
            </select>
        </td>
    </tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭资产情况
        <button class="btn btn-info" type="button" onclick="addItem();return false;">增加房产</button>
        <button class="btn btn-info" type="button">增加车辆</button>
        <button class="btn btn-info" type="button">增加土地</button>
    </td>
</tr>
<core:forEach items="${personFamilyAssetsList}" var="personFamilyAssets">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">总资产（万元）</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personFamilyAssets.fmAllAssets}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">主要资产</td>
        <td align="left" colspan="5"><%--${personFamilyAssets.mainAssets}--%>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox6" value="option1"> 房屋
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox7" value="option2"> 土地
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox8" value="option3"> 车辆
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox9" value="option1"> 金融资产
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox10" value="option2"> 经营资金
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox11" value="option3"> 其他
            </label>
        </td>
    </tr>
</core:forEach>
<tr>
    <td align="left" colspan="8" style="font-size:18px">
        房产：1
    </td>
</tr>
<core:forEach items="${personHousePropertyInfoList}" var="personHousePropertyInfo">
    <tr id="defaultItem">
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">性质</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.nature}">专业技术人员</option>
                <option value="${personHousePropertyInfo.nature}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">用途</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.purpose}">专业技术人员</option>
                <option value="${personHousePropertyInfo.purpose}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.site}">专业技术人员</option>
                <option value="${personHousePropertyInfo.site}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.structure}">专业技术人员</option>
                <option value="${personHousePropertyInfo.structure}">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">层数</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personHousePropertyInfo.floorNum}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.usedSitu}">专业技术人员</option>
                <option value="${personHousePropertyInfo.usedSitu}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.houseArea}">专业技术人员</option>
                <option value="${personHousePropertyInfo.houseArea}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.houseWorth}">专业技术人员</option>
                <option value="${personHousePropertyInfo.houseWorth}">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.installment}">专业技术人员</option>
                <option value="${personHousePropertyInfo.installment}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personHousePropertyInfo.hasCredentials}">专业技术人员</option>
                <option value="${personHousePropertyInfo.hasCredentials}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">备注</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="customerName" value="${personHousePropertyInfo.note1}"
                   style="width: 280px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>

<tr>
    <td align="left" colspan="8" style="font-size:18px">
        土地：1
    </td>
</tr>
<core:forEach items="${personLandInfoList}" var="personLandInfo">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地面积</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personLandInfo.area}">专业技术人员</option>
                <option value="${personLandInfo.area}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personLandInfo.worth}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personLandInfo.property}">专业技术人员</option>
                <option value="${personLandInfo.property}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personLandInfo.type}">专业技术人员</option>
                <option value="${personLandInfo.type}">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personLandInfo.usedSitu}">专业技术人员</option>
                <option value="${personLandInfo.usedSitu}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地款是否结清</td>
        <td align="left" colspan="5">
            <select class="selectpicker" style="width: 465px; margin-top: 5px;">
                <option value="${personLandInfo.moneyClear}">专业技术人员</option>
                <option value="${personLandInfo.moneyClear}">其他</option>
            </select>
        </td>
    </tr>
</core:forEach>

<tr>
    <td align="left" colspan="8" style="font-size:18px">
        车辆：1
    </td>
</tr>
<core:forEach items="${personCarsInfoList}" var="personCarsInfo">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personCarsInfo.carsInfo}">专业技术人员</option>
                <option value="${personCarsInfo.carsInfo}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personCarsInfo.carsWorth}">专业技术人员</option>
                <option value="${personCarsInfo.carsWorth}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personCarsInfo.carsIsInstallment}">专业技术人员</option>
                <option value="${personCarsInfo.carsIsInstallment}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personCarsInfo.carsUsingInfo}">专业技术人员</option>
                <option value="${personCarsInfo.carsUsingInfo}">其他</option>
            </select>
        </td>
    </tr>
</core:forEach>

<tr>
    <td align="left" colspan="8" style="font-size:18px">
        使用金融资产情况
    </td>
</tr>
<core:forEach items="${personFinancialAssetsList}" var="personFinancialAssets">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">情况</td>
        <td align="left" colspan="3"><%--${personFinancialAssets.financialInfo}--%>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox12" value="option1"> 活期存款
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox13" value="option2"> 定期存款
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox14" value="option3"> 股票
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox15" value="option1"> 基金
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox16" value="option2"> 债券
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox17" value="option3"> 投资性保险
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="inlineCheckbox18" value="option3"> 其他
            </label>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">我社存款</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personFinancialAssets.depositOurBank}">专业技术人员</option>
                <option value="${personFinancialAssets.depositOurBank}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行存款</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personFinancialAssets.depositOtherBank}">专业技术人员</option>
                <option value="${personFinancialAssets.depositOtherBank}">其他</option>
            </select>
        </td>
    </tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭负债情况
    </td>
</tr>
<core:forEach items="${personFamilyIncurDebtsList}" var="personFamilyIncurDebts">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            家庭负债总额（万元）
        </td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personFamilyIncurDebts.fmIncurDebts}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">本行负债（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personFamilyIncurDebts.ourBankDebts}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行负债（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="customerName" value="${personFamilyIncurDebts.otherBankDebts}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款用途</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="customerName" value="${personFamilyIncurDebts.loanPurpose}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款形态</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="customerName" value="${personFamilyIncurDebts.loanShap}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭成员基本情况
    </td>
</tr>
<tr>
    <td align="left" colspan="8" style="font-size:18px">
        成员：1
    </td>
</tr>
<core:forEach items="${personFamilyMemberList}" var="personFamilyMember">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">姓名</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personFamilyMember.familyMemberName}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">年收入（万元）</td>
        <td align="left">
            <input class="input-small" type="text" name="customerName" value="${personFamilyMember.yearIncome}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">与户主关系</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personFamilyMember.leaderRelation}">专业技术人员</option>
                <option value="${personFamilyMember.leaderRelation}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">常住地址</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;">
                <option value="${personFamilyMember.address}">专业技术人员</option>
                <option value="${personFamilyMember.address}">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">职业</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 270px; margin-top: 5px;">
                <option value="${personFamilyMember.profession}">专业技术人员</option>
                <option value="${personFamilyMember.profession}">其他</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="customerName" value="${personFamilyMember.familyMemberCerNum}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>
</tbody>
</table>
</div>
<!--table-->
</div>

</div>
<!--2-->
<div class="tab-pane" id="tab2">
<div class="pad-10">
<div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
<table width="100%" border="1">
<tbody>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您目前使用我行（社）的哪些产品
    </td>
    <td align="left" colspan="3">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox19" value="option1"> 存款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox20" value="option2"> 贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox21" value="option3"> 信用卡
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox22" value="option1"> POS机
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox23" value="option2"> 保管箱
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox24" value="option3"> 网上银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox25" value="option1"> 居家银行
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox26" value="option2"> 短信银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox27" value="option3"> 电话银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox28" value="option2"> 手机银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox29" value="option3"> 其他
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您对我行（社）产品满意度
    </td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">较为适用</option>
            <option value="">需进一步改进</option>
            <option value="">较差</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您在未来两年内是否有资金需求
    </td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">很需要</option>
            <option value="">需要</option>
            <option value="">不需要</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" rowspan="3" bgcolor="#b4d8ed" style="color:#161823">
        如果需要贷款的话，您计划用这笔贷款做什么？
    </td>
    <td align="left" rowspan="3">
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox30" value="option2" > 做生意周转
        </label>
        <br>
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox31" value="option3"> 购买农业生产资料
        </label>
        <br>
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox32" value="option1"> 子女上学
        </label>
        <br>
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox33" value="option2"> 盖（买）房子
        </label>
        <br>
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox34" value="option3"> 购买大件物品
        </label>
        <br>
        <label class="checkbox inline" style="width: 125px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox35" value="option3"> 其他
        </label>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您希望得到的贷款金额是多少？
    </td>
    <td align="left">
        <input type="text" name="" value=""
               style="width: 165px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您可以提供的担保物有？
    </td>
    <td align="left">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox36" value="option1"> 房地产
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox37" value="option2"> 存单
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox38" value="option3"> 债券
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox39" value="option3"> 保证人
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox40" value="option3"> 无
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您希望得到的贷款期限是多久？
    </td>
    <td align="left">
        <input class="input-small" type="text" name="" value=""
               style="width: 165px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        未来1-2年家庭储蓄的主要目的和用途？
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox41" value="option1"> 做生意
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox42" value="option2"> 子女上学
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox43" value="option3"> 盖（买）房子
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox44" value="option3"> 购买大件物品
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox45" value="option3"> 获得利息
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox46" value="option3"> 购买其他金融资产（如股票、债券、基金、保险单）
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox47" value="option3"> 其他
        </label>
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        您目前希望得到我行（社）的哪些服务？
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox48" value="option1"> 存款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox49" value="option2"> 结算
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox50" value="option3"> 贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox51" value="option3"> 信用卡办理
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox52" value="option3"> 个人理财服务，需要
        </label>
        <input type="text" name="" value=""
               style="width: 55px;height: 25px; margin-top: 5px;">项目
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        除了上述业务，您还需要哪些服务？
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox53" value="option1"> 代缴代收服务：
        </label>
        <input type="text" name="" value=""
               style="width: 155px;height: 25px; margin-top: 5px;">
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox54" value="option2">贵重物品保管
        </label>
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox55" value="option3"> 黄金卖买
        </label>
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox56" value="option3"> 外汇卖买
        </label>
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox57" value="option3"> 个人征信咨询
        </label>
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox58" value="option3"> 金融政策、知识的宣传
        </label>
        <br>
        <label class="checkbox inline" style="width: 155px; margin-top: 5px;">
            <input type="checkbox" id="inlineCheckbox59" value="option3"> 其他：
        </label>
        <input type="text" name="" value=""
               style="width: 155px;height: 25px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        您希望我行（社）增加哪些方面的服务？
    </td>
    <td align="left" colspan="2">
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;"></textarea>
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        您对我行（社）服务有何建议？
    </td>
    <td align="left" colspan="2">
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;"></textarea>
    </td>
</tr>
<tr>
    <td align="center" rowspan="7" bgcolor="#b4d8ed" style="color:#161823">
        金融业务需求
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        金融业务需求
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox60" value="option3"> 信用卡
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox61" value="option3"> 福万通卡
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox62" value="option3"> 贵宾卡
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        电子银行业务
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox63" value="option3"> 短信银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox64" value="option3"> 电话银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox65" value="option3"> 网上银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox66" value="option3"> 手机银行
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        代缴代扣业务
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox67" value="option3"> 代缴水费
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox68" value="option3"> 代缴电费
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox69" value="option3"> 代缴烟草费
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox70" value="option3"> 代发工资
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox71" value="option3"> 电子扣税
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox72" value="option3"> 保险费代扣
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        自助机具业务
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox73" value="option3"> 银联POS机
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox74" value="option3"> 福农通
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox75" value="option3"> 小额支付便民点
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox76" value="option3"> 生意通
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox77" value="option3">  居家银行
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        对私贷款业务
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox78" value="option3"> 农户小额信用贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox79" value="option3"> 农户联保贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox80" value="option3"> 农户保证贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox81" value="option3"> 农户抵押贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox82" value="option3"> 农户质押贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox83" value="option3"> 个人存单质押贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox84" value="option3"> “万通宝”农户小额贷
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox85" value="option3"> “万通宝”个人经营贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox86" value="option3"> 组合宝”农户小额贷
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox87" value="option3"> 组合宝”个人经营贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox88" value="option3"> 保无忧”新农保参保人员贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox89" value="option3"> “两女”户计生贴息贷
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox90" value="option3"> 生源地信用助学贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox91" value="option3"> 农村青年创业贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox92" value="option3"> 巾帼创业贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox93" value="option3"> 农户异地创业贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox94" value="option3"> “惠村通”
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox95" value="option3"> 农户建房贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox96" value="option3"> 个人住房按揭贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox97" value="option3"> 个人汽车按揭贷款
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox98" value="option3"> 农民专业合作社贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox99" value="option3"> 公职人员消费贷款
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        对公贷款业务
    </td>
    <td align="left" colspan="2">
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox100" value="option3"> 流动资金贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox101" value="option3"> 固定资产贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox102" value="option3"> 小企业联保贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox103" value="option3"> 中小企业保证贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox104" value="option3"> 担保公司担保贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox105" value="option3"> 海域使用权抵押贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox106" value="option3"> 船舶抵押贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox107" value="option3"> 银行承兑汇票
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox108" value="option3"> 商标专用权质押贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox109" value="option3"> 保函业务
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox110" value="option3"> 银行承兑汇票贴现
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        客户新需求登记
    </td>
    <td align="left" colspan="2">
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;"></textarea>
    </td>
</tr>
</tbody>
</table>
</div>
</div>
</div>

<!-- 3村委会（居委会）评价-->
<div class="tab-pane" id="tab3">
<div class="pad-10">
<div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
<table width="100%">
<tbody>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        一、客户基本资料真实性
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">基本准确</option>
            <option value="">有所保留</option>
            <option value="">有一定差距</option>
            <option value="">有较大差距</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        二、本地居住时间（农户）
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">5年（含）以下</option>
            <option value="">6年（含）以上</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        三、经营能力
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">经验丰富，技术水平高，能力强</option>
            <option value="">经验丰富，技术水平高，能力较强</option>
            <option value="">经验、技术水和能力均一般</option>
            <option value="">经验较欠缺，技术水平和能力较低</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        四、项目潜质
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">优秀</option>
            <option value="">良好</option>
            <option value="">一般</option>
            <option value="">差</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        五、市场经营风险
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">很低</option>
            <option value="">较低</option>
            <option value="">一般</option>
            <option value="">较高</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        六、市场竞争力和发展前景
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">很好</option>
            <option value="">较好</option>
            <option value="">一般</option>
            <option value="">较差</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        七、生产经营力或工作稳定情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">强</option>
            <option value="">中等</option>
            <option value="">一般</option>
            <option value="">差</option>
            <option value="">不清楚</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        八、家庭人均纯收入水平（农户）
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">高收入</option>
            <option value="">中高收入</option>
            <option value="">中等收入</option>
            <option value="">中低收入</option>
            <option value="">低收入</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        九、家庭人均可支配收入水平（非农户）
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">最高收入</option>
            <option value="">高收入</option>
            <option value="">中等偏上收入</option>
            <option value="">中等收入</option>
            <option value="">中等偏下收入</option>
            <option value="">低收入</option>
            <option value="">最低收入</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十、家庭财产水平
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">富足家庭</option>
            <option value="">富裕家庭</option>
            <option value="">殷实家庭</option>
            <option value="">一般家庭</option>
            <option value="">较差家庭</option>
            <option value="">贫困家庭</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十一、税费缴纳情况（含土地、房产款项）
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">正常缴纳</option>
            <option value="">拖欠罚款2次（含）以内</option>
            <option value="">拖欠罚款2次以上</option>
            <option value="">拖欠超过1年</option>
            <option value="">较差家庭</option>
            <option value="">贫困家庭</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十二、敬老情况
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">好</option>
            <option value="">较好</option>
            <option value="">一般</option>
            <option value="">差</option>
            <option value="">很差</option>
            <option value="">不清楚</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十三、邻里关系
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">好</option>
            <option value="">较好</option>
            <option value="">一般</option>
            <option value="">差</option>
            <option value="">很差</option>
            <option value="">不清楚</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十四、对公益事业关心程度
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">高</option>
            <option value="">较高</option>
            <option value="">一般</option>
            <option value="">从不关心</option>
            <option value="">不清楚</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十五、信誉情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">好</option>
            <option value="">较好</option>
            <option value="">一般</option>
            <option value="">较差</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十六、个人品行综合评价
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">优秀</option>
            <option value="">良好</option>
            <option value="">中等</option>
            <option value="">一般</option>
            <option value="">较差</option>
            <option value="">有不良或违法、违规行为</option>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十七、受表彰情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">有</option>
            <option value="">无</option>
            <option value="">不清楚</option>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十八、其他补充
    </td>
    <td align="left">
        <input type="text" name="" value=""
               style="width: 270px; height: 30px;margin-top: 5px;">
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十九、是否为我行（社）重点服务对象
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
            <option value="">是</option>
            <option value="">否</option>
            <option value="">一般</option>
        </select>
    </td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<!-- 4客户经理评价-->
<div class="tab-pane" id="tab4">
    <div class="pad-10">
        <div class="table-list">
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td width="27%" align="center" bgcolor="#b4d8ed" style="color:#161823">
                        客户在他行贷款情况
                    </td>
                    <td width="73%" align="left">
                        <input type="text" name="" value=""
                               style="width: 270px;height: 30px; margin-top: 5px;">
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        个人银行信用记录
                    </td>
                    <td align="left">
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox111" value="option3">
                            报告期内能积极主动按期偿本付息，无违约记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox112" value="option3">
                            存在2次(含)以内本金.利息不超过1个月已还清的不良记录,无超过1个月以上不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox113" value="option3">
                            存在3次(含)以上本金.利息不超过1个月已还清的不良记录,无超过1个月以上不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox114" value="option3">
                            存在1-2次(含)本金.利息超过1个月但在3个月以内已还清的不良记录,无超过3个月以上不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox115" value="option3">
                            存在3次(含)以上本金.利息超过1个月但在3个月以内已还清的不良记录,无超过3个月以上不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox116" value="option3">
                            存在1-2次(含)本金或利息超过3个月以后才还清的不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox117" value="option3">
                            存在3次(含)以上本金或利息超过3个月以后才还清的不良记录
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox118" value="option3">
                            评估时点有拖欠利息超过1个月
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox119" value="option3">
                            评估时点有次级类贷款,无可疑或损失类贷款
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox120" value="option3">
                            评估时点有可疑或损失类贷款
                        </label>
                        <br>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox121" value="option3">
                            报告期内无银行信用记录
                        </label>
                    </td>
                </tr>
                <tr>
                    <td width="27%" align="center" bgcolor="#b4d8ed" style="color:#161823">
                        他行信用记录
                    </td>
                    <td width="73%" align="left">
                        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
                            <option value="">良好</option>
                            <option value="">一般</option>
                            <option value="">较差</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        变现能力
                    </td>
                    <td align="left">
                        <select class="selectpicker" style="width: 270px; margin-top: 5px;">
                            <option value="">优秀</option>
                            <option value="">较好</option>
                            <option value="">一般</option>
                            <option value="">难以处置</option>
                        </select>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
</div>
<!--submit  end-->
</div>
</div>
</div>
</body>
</html>