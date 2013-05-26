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
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span id="uName">[<c:out value="${displayUserName}"/>]</span><a href="" style="color:#FFFFFF">[退出]</a>
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
<div class="span9" style="margin-left: -3.435897%;">
<br/>
<input class="input-block-level" type="text" placeholder="客户电子信息管理>查询" disabled="disabled" style="color:#0000AA">
<table class="table table-condensed">
    <tbody>
       <tr>
           <td>户主：</td>
           <td>张晓明</td>
           <td>电话:</td>
           <td>11111111111</td>
           <td>收集单位:</td>
           <td>惠安分社区</td>
           <td>收集人:</td>
           <td>管理员</td>
       </tr>
    </tbody>
</table>

<p align="center">
    <button class="btn" type="button">指派</button>
    <button class="btn" type="button">删除</button>
    <button class="btn" type="button">验收</button>
    <button class="btn" type="button">编辑</button>
</p>

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
             <div class="table-list">
                <table width="100%" border="0">
                  <tbody>
                  <core:forEach items="${personBasicList}" var="personBasicList">
                       <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">姓名</td>
                         <td align="center">${personBasicList.customerName}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">性别</td>
                         <td align="center">${personBasicList.gender}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否农户</td>
                         <td align="center">${personBasicList.farmer}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">客户类型</td>
                         <td align="center">${personBasicList.customerType}</td>
                       </tr>
                       <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件类型</td>
                         <td align="center" colspan="2">${personBasicList.cerType}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
                         <td align="center" colspan="2">${personBasicList.cerNum}</td>
                         <td align="center" colspan="2" rowspan="4">照片</td>
                       </tr>
                       <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件有效期</td>
                         <td align="center" colspan="3">${personBasicList.cerValidityFrom} - ${personBasicList.cerValidityTo}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">出生年月</td>
                         <td align="center">${personBasicList.birthday}</td>
                       </tr>
                       <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">国籍</td>
                         <td align="center">${personBasicList.nationality}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否拥有外国护照或居住权</td>
                         <td align="center">${personBasicList.havePassport}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">民族</td>
                         <td align="center">${personBasicList.nation}</td>
                        </tr>
                         <tr>
                          <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">政治面貌</td>
                          <td align="center">${personBasicList.poliLaspect}</td>
                          <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">健康状况</td>
                          <td align="center">${personBasicList.health}</td>
                          <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">婚姻状况</td>
                          <td align="center">${personBasicList.maritalStatus}</td>
                         </tr>
                         <tr>
                          <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 居住地址
                          </td>
                          <td align="center" colspan="5">${personBasicList.address}</td>
                          <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">居住编码</td>
                          <td align="center">${personBasicList.postcode}</td>
                         </tr>
                         <tr>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 区域名称
                           </td>
                           <td align="center"><p>${personBasicList.areaName}</p></td>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">村别</td>
                           <td align="center"><p>${personBasicList.village}</p></td>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">联系电话</td>
                           <td align="center">${personBasicList.telephone}</td>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">手机号码</td>
                           <td align="center">${personBasicList.mbPhoneNum}</td>
                         </tr>
                         <tr>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 居住状况
                           </td>
                           <td align="center" colspan="2"><p>${personBasicList.liveCondition}</p></td>
                           <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">社会保障情况</td>
                           <td align="center" colspan="4"><p>${personBasicList.socialSecurity}</p></td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 最高学位
                             </td>
                             <td align="center">${personBasicList.highestDegree}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">最高学历</td>
                             <td align="center">${personBasicList.highestEdu}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）关系</td>
                             <td align="center">${personBasicList.bankRelation}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）合作关系</td>
                             <td align="center">${personBasicList.bankPartnership}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 职业
                             </td>
                             <td align="center" colspan="7">${personBasicList.profession}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 个人经营项目
                             </td>
                             <td align="center" colspan="4">${personBasicList.businessProj}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">经营年限</td>
                             <td align="center" colspan="2">${personBasicList.businessYear}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                 经营场所
                             </td>
                             <td align="center" colspan="3">${personBasicList.businessSite}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">从事行业</td>
                             <td align="center" colspan="3">${personBasicList.industry}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资经营性质</td>
                             <td align="center">${personBasicList.businessProp}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资资金情况</td>
                             <td align="center">${personBasicList.moneySitu}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投入金额</td>
                             <td align="center">${personBasicList.inputMoney}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">自有资金情况</td>
                             <td align="center">${personBasicList.ownMoney}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF"> 年收益情况</td>
                             <td align="center" colspan="7">${personBasicList.yearIncome}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作情况</td>
                             <td align="center" colspan="7">${personBasicList.workSitu}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">单位性质</td>
                             <td align="center" colspan="3">${personBasicList.unitProp}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">单位所属行业</td>
                             <td align="center" colspan="3">${personBasicList.unitIndustry}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">任职部门</td>
                             <td align="center" colspan="3">${personBasicList.department}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作单位类别</td>
                             <td align="center" colspan="3">${personBasicList.unitType}</td>
                         </tr>
                         <tr>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">职务</td>
                             <td align="center">${personBasicList.duties}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年工资收入（万元）</td>
                             <td align="center">${personBasicList.annualWageIncome}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作年限</td>
                             <td align="center">${personBasicList.workYears}</td>
                             <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">职称</td>
                             <td align="center">${personBasicList.workTitle}</td>
                         </tr>
                  </core:forEach>

                         <tr>
                             <td align="center" colspan="8" style="font-size:22px">
                             家庭收支情况
                              </td>
                         </tr>
                   <core:forEach items="personIncomeExpensesList" var="personIncomeExpensesList">
                      <tr>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
                             家庭年总收入（万元）
                            </td>
                            <td align="center" colspan="2">${personIncomeExpensesList.fmAllIncome}</td>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭支出（万元）</td>
                            <td align="center" colspan="2">${personIncomeExpensesList.fmExpenses}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             收入来源
                         </td>
                         <td align="center" colspan="7">${personIncomeExpensesList.incomeSrc}</td>
                     </tr>
                     <tr>
                         <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
                             其中：个人年收入（万元）
                         </td>
                         <td align="center" colspan="2">${personIncomeExpensesList.perIncome}</td>
                         <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭其他成员年收入（万元）</td>
                         <td align="center" colspan="2">${personIncomeExpensesList.fmOtherMemberIn}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             投资经营性质
                         </td>
                         <td align="center">${personIncomeExpensesList.businessProp}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资资金情况</td>
                         <td align="center">${personIncomeExpensesList.moneySitu}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投入金额</td>
                         <td align="center">${personIncomeExpensesList.inputMoney}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">自有资金情况</td>
                         <td align="center">${personIncomeExpensesList.ownMoney}</td>
                     </tr>
                     <tr>
                         <td align="center"  bgcolor="#1e90ff" style="color:#FFFFFF">
                             家庭主要支出项目
                         </td>
                         <td align="center" colspan="3">${personIncomeExpensesList.fmExpensesProj}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">家庭收入能否应付支出</td>
                         <td align="center" colspan="3">${personIncomeExpensesList.fmInOutRatio}</td>
                     </tr>
                </core:forEach>

                     <tr>
                         <td align="center" colspan="8" style="font-size:22px">
                             家庭资产情况
                         </td>
                     </tr>
                <core:forEach items="personFamilyAssetsList" var="personFamilyAssetsList">
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             总资产（万元）
                         </td>
                         <td align="center">${personFamilyAssetsList.fmAllAssets}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">主要资产</td>
                         <td align="center" colspan="5">${personFamilyAssetsList.mainAssets}</td>
                     </tr>
                </core:forEach>
                     <tr>
                         <td align="left" colspan="8" style="font-size:18px">
                             房产：1
                         </td>
                     </tr>

                <core:forEach items="${personHousePropertyInfoList}" var="personHousePropertyInfo">
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             性质
                         </td>
                         <td align="center">${personHousePropertyInfo.nature}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
                         <td align="center">${personHousePropertyInfo.purpose}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
                         <td align="center">${personHousePropertyInfo.site}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
                         <td align="center">${personHousePropertyInfo.structure}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">层数</td>
                         <td align="center">${personHousePropertyInfo.floorNum}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                         <td align="center">${personHousePropertyInfo.usedSitu}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">建筑面积</td>
                         <td align="center">${personHousePropertyInfo.houseArea}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房产价值</td>
                         <td align="center">${personHousePropertyInfo.houseWorth}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             是否按揭
                         </td>
                         <td align="center">${personHousePropertyInfo.installment}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否办证</td>
                         <td align="center">${personHousePropertyInfo.hasCredentials}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">备注</td>
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
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             土地面积
                         </td>
                         <td align="center">${personLandInfo.area}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地价值</td>
                         <td align="center">${personLandInfo.worth}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地性质</td>
                         <td align="center">${personLandInfo.property}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地类型</td>
                         <td align="center">${personLandInfo.type}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地使用情况</td>
                         <td align="center">${personLandInfo.landUsedSitu}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地款是否结清</td>
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
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">情况</td>
                         <td align="center">${personCarsInfo.carsInfo}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">车辆价值</td>
                         <td align="center">${personCarsInfo.carsWorth}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否按揭</td>
                         <td align="center">${personCarsInfo.carsIsInstallment}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                         <td align="center">${personCarsInfo.carsUsingInfo}</td>
                     </tr>
                </core:forEach>

                     <tr>
                         <td align="left" colspan="8" style="font-size:18px">
                             使用金融资产情况
                         </td>
                     </tr>
                <core:forEach items="${personFinancialAssets}" var="personFinancialAssets">
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">情况</td>
                         <td align="center" colspan="3">${personFinancialAssets.financialInfo}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">我社存款</td>
                         <td align="center">${personFinancialAssets.depositOurBank}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行存款</td>
                         <td align="center">${personFinancialAssets.depositOtherBank}</td>
                     </tr>
                </core:forEach>

                     <tr>
                         <td align="center" colspan="8" style="font-size:22px">
                             家庭负责情况
                         </td>
                     </tr>
                <core:forEach items="personFamilyIncurDebtsList" var="personFamilyIncurDebtsList">
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             家庭负债总额（万元）
                         </td>
                         <td align="center">${personFamilyIncurDebtsList.fmIncurDebts}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">本行负债（万元）</td>
                         <td align="center" colspan="2">${personFamilyIncurDebtsList.ourBankDebts}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行负债（万元）</td>
                         <td align="center" colspan="2">${personFamilyIncurDebtsList.otherBankDebts}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">贷款用途</td>
                         <td align="center" colspan="3">${personFamilyIncurDebtsList.loanPurpose}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">贷款形态</td>
                         <td align="center" colspan="3">${personFamilyIncurDebtsList.loanShap}</td>
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
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             姓名
                         </td>
                         <td align="center">${personFamilyMember.familyMemberName}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年收入（万元）</td>
                         <td align="center">${personFamilyMember.yearIncome}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与户主关系</td>
                         <td align="center">${personFamilyMember.leaderRelation}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">常住地址</td>
                         <td align="center">${personFamilyMember.address}</td>
                     </tr>
                     <tr>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                             职业
                         </td>
                         <td align="center" colspan="3">${personFamilyMember.profession}</td>
                         <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
                         <td align="center" colspan="3">${personFamilyMember.familyMemberCerNum}</td>
                     </tr>
                </core:forEach>
                  </tbody>
                </table>
             </div>
           </div>
        </div>

        <div class="tab-pane" id="tab2">
            <p>Howdy, I'm in Section 2.</p>
        </div>

        <div class="tab-pane" id="tab3">
            <p>Howdy, I'm in Section 3.</p>
        </div>

        <div class="tab-pane" id="tab4">
            <p>Howdy, I'm in Section 4.</p>
        </div>
    </div>
</div>
</div>
</div>
</div>

</body>
</html>