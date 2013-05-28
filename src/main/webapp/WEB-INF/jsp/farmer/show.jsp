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
        <li class=""><a href="#mobileDeviceManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
        <li class=""><a href="#accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
        <li class=""><a href="#roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
        <li class=""><a href="#systemlogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
    </ul>
</div>
<div class="span10" style="margin-left: -8.435897%;">
<br/>
<input class="input-block-level" type="text" placeholder="客户电子信息管理>查询" disabled="disabled" style="color:#0000AA">
<table class="table table-condensed">
    <tbody>
    <tr>
        <td><span class="label label-info">户主：</span></td>
        <td>张晓明</td>
        <td><span class="label label-info">电话：</span></td>
        <td>11111111111</td>
        <td><span class="label label-info">收集单位：</span></td>
        <td>惠安分社区</td>
        <td><span class="label label-info">收集人：</span></td>
        <td>管理员</td>
    </tr>
    </tbody>
</table>
<p class="text-center">
    <button class="btn" type="button">指派</button>
    <button class="btn" type="button">删除</button>
    <button class="btn" type="button">验收</button>
    <button class="btn" type="button">编辑</button>
</p>
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
<div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
<table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
<tbody>
<core:forEach items="${personBasicList}" var="personBasic">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">姓名</td>
        <td align="center">${personBasic.customerName}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">性别</td>
        <td align="center">${personBasic.gender}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否农户</td>
        <td align="center">${personBasic.farmer}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">客户类型</td>
        <td align="center">${personBasic.customerType}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件类型</td>
        <td align="center" colspan="2">${personBasic.cerType}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
        <td align="center" colspan="2">${personBasic.cerNum}</td>
        <td align="center" colspan="2" rowspan="4">照片</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件有效期</td>
        <td align="center" colspan="3">${personBasic.cerValidityFrom} - ${personBasic.cerValidityTo}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">出生年月</td>
        <td align="center">${personBasic.birthday}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">国籍</td>
        <td align="center">${personBasic.nationality}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否拥有外国护照或居住权</td>
        <td align="center">${personBasic.havePassport}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">民族</td>
        <td align="center">${personBasic.nation}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">政治面貌</td>
        <td align="center">${personBasic.poliLaspect}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">健康状况</td>
        <td align="center">${personBasic.health}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">婚姻状况</td>
        <td align="center">${personBasic.maritalStatus}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            居住地址
        </td>
        <td align="center" colspan="5">${personBasic.address}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">居住编码</td>
        <td align="center">${personBasic.postcode}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            区域名称
        </td>
        <td align="center"><p>${personBasic.areaName}</p></td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">村别</td>
        <td align="center"><p>${personBasic.village}</p></td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">联系电话</td>
        <td align="center">${personBasic.telephone}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">手机号码</td>
        <td align="center">${personBasic.mbPhoneNum}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            居住状况
        </td>
        <td align="center" colspan="2"><p>${personBasic.liveCondition}</p></td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">社会保障情况</td>
        <td align="center" colspan="4"><p>${personBasic.socialSecurity}</p></td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            最高学位
        </td>
        <td align="center">${personBasic.highestDegree}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">最高学历</td>
        <td align="center">${personBasic.highestEdu}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）关系</td>
        <td align="center">${personBasic.bankRelation}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）合作关系</td>
        <td align="center">${personBasic.bankPartnership}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            职业
        </td>
        <td align="center" colspan="7">${personBasic.profession}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            个人经营项目
        </td>
        <td align="center" colspan="4">${personBasic.businessProj}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">经营年限</td>
        <td align="center" colspan="2">${personBasic.businessYear}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            经营场所
        </td>
        <td align="center" colspan="3">${personBasic.businessSite}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">从事行业</td>
        <td align="center" colspan="3">${personBasic.industry}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
        <td align="center">${personBasic.businessProp}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
        <td align="center">${personBasic.moneySitu}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
        <td align="center">${personBasic.inputMoney}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
        <td align="center">${personBasic.ownMoney}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823"> 年收益情况</td>
        <td align="center" colspan="7">${personBasic.yearIncome}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作情况</td>
        <td align="center" colspan="7">${personBasic.workSitu}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位性质</td>
        <td align="center" colspan="3">${personBasic.unitProp}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位所属行业</td>
        <td align="center" colspan="3">${personBasic.unitIndustry}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">任职部门</td>
        <td align="center" colspan="3">${personBasic.department}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作单位类别</td>
        <td align="center" colspan="3">${personBasic.unitType}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">职务</td>
        <td align="center">${personBasic.duties}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">年工资收入（万元）</td>
        <td align="center">${personBasic.annualWageIncome}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作年限</td>
        <td align="center">${personBasic.workYears}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">职称</td>
        <td align="center">${personBasic.workTitle}</td>
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
        <td align="center" colspan="2">${personIncomeExpenses.fmAllIncome}</td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭支出（万元）</td>
        <td align="center" colspan="2">${personIncomeExpenses.fmExpenses}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            收入来源
        </td>
        <td align="center" colspan="7">${personIncomeExpenses.incomeSrc}</td>
    </tr>
    <tr>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">
            其中：个人年收入（万元）
        </td>
        <td align="center" colspan="2">${personIncomeExpenses.perIncome}</td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭其他成员年收入（万元）</td>
        <td align="center" colspan="2">${personIncomeExpenses.fmOtherMemberIn}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
        <td align="center">${personIncomeExpenses.businessProp}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
        <td align="center">${personIncomeExpenses.moneySitu}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
        <td align="center">${personIncomeExpenses.inputMoney}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
        <td align="center">${personIncomeExpenses.ownMoney}</td>
    </tr>
    <tr>
        <td align="center"  bgcolor="#b4d8ed" style="color:#161823">家庭主要支出项目</td>
        <td align="center" colspan="3">${personIncomeExpenses.fmExpensesProj}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">家庭收入能否应付支出</td>
        <td align="center" colspan="3">${personIncomeExpenses.fmInOutRatio}</td>
    </tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭资产情况
    </td>
</tr>
<core:forEach items="${personFamilyAssetsList}" var="personFamilyAssets">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">总资产（万元）</td>
        <td align="center">${personFamilyAssets.fmAllAssets}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">主要资产</td>
        <td align="center" colspan="5">${personFamilyAssets.mainAssets}</td>
    </tr>
</core:forEach>
<tr>
    <td align="left" colspan="8" style="font-size:18px">
        房产：1
    </td>
</tr>
<core:forEach items="${personHousePropertyInfoList}" var="personHousePropertyInfo">
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">性质</td>
        <td align="center">${personHousePropertyInfo.nature}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">用途</td>
        <td align="center">${personHousePropertyInfo.purpose}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
        <td align="center">${personHousePropertyInfo.site}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
        <td align="center">${personHousePropertyInfo.structure}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">层数</td>
        <td align="center">${personHousePropertyInfo.floorNum}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="center">${personHousePropertyInfo.usedSitu}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
        <td align="center">${personHousePropertyInfo.houseArea}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
        <td align="center">${personHousePropertyInfo.houseWorth}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="center">${personHousePropertyInfo.installment}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
        <td align="center">${personHousePropertyInfo.hasCredentials}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">备注</td>
        <td align="center">${personHousePropertyInfo.note1}</td>
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
        <td align="center">${personLandInfo.area}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
        <td align="center">${personLandInfo.worth}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
        <td align="center">${personLandInfo.property}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
        <td align="center">${personLandInfo.type}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
        <td align="center">${personLandInfo.usedSitu}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地款是否结清</td>
        <td align="center" colspan="5">${personLandInfo.moneyClear}</td>
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
        <td align="center">${personCarsInfo.carsInfo}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
        <td align="center">${personCarsInfo.carsWorth}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="center">${personCarsInfo.carsIsInstallment}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="center">${personCarsInfo.carsUsingInfo}</td>
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
        <td align="center" colspan="3">${personFinancialAssets.financialInfo}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">我社存款</td>
        <td align="center">${personFinancialAssets.depositOurBank}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行存款</td>
        <td align="center">${personFinancialAssets.depositOtherBank}</td>
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
        <td align="center">${personFamilyIncurDebts.fmIncurDebts}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">本行负债（万元）</td>
        <td align="center" colspan="2">${personFamilyIncurDebts.ourBankDebts}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行负债（万元）</td>
        <td align="center" colspan="2">${personFamilyIncurDebts.otherBankDebts}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款用途</td>
        <td align="center" colspan="3">${personFamilyIncurDebts.loanPurpose}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款形态</td>
        <td align="center" colspan="3">${personFamilyIncurDebts.loanShap}</td>
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
        <td align="center">${personFamilyMember.familyMemberName}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">年收入（万元）</td>
        <td align="center">${personFamilyMember.yearIncome}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">与户主关系</td>
        <td align="center">${personFamilyMember.leaderRelation}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">常住地址</td>
        <td align="center">${personFamilyMember.address}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">职业</td>
        <td align="center" colspan="3">${personFamilyMember.profession}</td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
        <td align="center" colspan="3">${personFamilyMember.familyMemberCerNum}</td>
    </tr>
</core:forEach>
</tbody>
</table>
</div>
</div>
</div>
<div class="tab-pane" id="tab2">
    <div class="pad-10">
        <div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您目前使用我行（社）的哪些产品
                    </td>
                    <td align="center" colspan="3">存款</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您对我行（社）产品满意度
                    </td>
                    <td align="center" colspan="3">较为适用</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您在未来两年内是否有资金需求
                    </td>
                    <td align="center" colspan="3">不需要</td>
                </tr>
                <tr>
                    <td align="center" rowspan="3" bgcolor="#b4d8ed" style="color:#161823">
                        如果需要贷款的话，您计划用这笔贷款做什么？
                    </td>
                    <td align="center" rowspan="3">&nbsp;</td>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您希望得到的贷款金额是多少？
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您可以提供的担保物有？
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        您希望得到的贷款期限是多久？
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                        未来1-2年家庭储蓄的主要目的和用途？
                    </td>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                        您目前希望得到我行（社）的哪些服务？
                    </td>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                        除了上述业务，您还需要哪些服务？
                    </td>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                        您希望我行（社）增加哪些方面的服务？
                    </td>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                        您对我行（社）服务有何建议？
                    </td>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" rowspan="7" bgcolor="#b4d8ed" style="color:#161823">
                        金融业务需求
                    </td>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        金融业务需求
                    </td>
                    <td align="center" colspan="2">信用卡 福万通卡 贵宾卡</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        电子银行业务
                    </td>
                    <td align="center" colspan="2">短信银行 电话银行 网上银行 手机银行</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        代缴代扣业务
                    </td>
                    <td align="center" colspan="2">代缴水费 代缴电费 代缴烟草费 代发工资 电子扣税 保险费代扣</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        自助机具业务
                    </td>
                    <td align="center" colspan="2">银联POS机 福农通 小额支付便民点 生意通 居家银行</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        对私贷款业务
                    </td>
                    <td align="center" colspan="2">农户小额信用贷款 农户联保贷款 农户保证贷款</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        对公贷款业务
                    </td>
                    <td align="center" colspan="2">流动资金贷款 固定资产贷款 小企业联保贷款 中小企业保证贷款</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        客户新需求登记
                    </td>
                    <td align="center" colspan="2">无</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--村委会（居委会）评价-->
<div class="tab-pane" id="tab3">
    <div class="pad-10">
        <div class="table-list" style="table-layout:fixed; height:345px; overflow:scroll;">
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        一、客户基本资料真实性						</td>
                    <td width="73%" align="center"></td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        二、本地居住时间（农户）
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        三、经营能力
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        四、项目潜质
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        五、市场经营风险
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        六、市场竞争力和发展前景
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        七、生产经营力或工作稳定情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        八、家庭人均纯收入水平（农户）
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        九、家庭人均可支配收入水平（非农户）
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十、家庭财产水平
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十一、税费缴纳情况（含土地、房产款项）
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十二、敬老情况
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十三、邻里关系
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十四、对公益事业关心程度
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十五、信誉情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十六、个人品行综合评价
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十七、受表彰情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十八、其他补充
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                        十九、是否为我行（社）重点服务对象
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--客户经理评价-->
<div class="tab-pane" id="tab4">
    <div class="pad-10">
        <div class="table-list">
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td width="27%" align="center" bgcolor="#b4d8ed" style="color:#161823">
                        客户在他行贷款情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        个人银行信用记录
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="center" bgcolor="#b4d8ed" style="color:#161823">
                        他行信用记录
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        变现能力
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
<script src="/asserts/js/jquery-1.7.2.min.js"></script>
<script src="/asserts/js/bootstrap.min.js"></script>
</body>
</html>