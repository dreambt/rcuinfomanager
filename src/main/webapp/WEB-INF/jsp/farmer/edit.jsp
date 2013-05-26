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
    <script type="text/javascript">
        $(function(){

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
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span id="uName">[<c:out value="${displayUserName}"/>]</span><a href="" style="color:#FFFFFF">[退出]</a>
                                </div>
                            </td>
                        </tr>
                    </table></td>
            </tr>
        </table>
    </div>
</div>
<div class="container-fluid">
<div class="row-fluid">
<div class="span3">
    <ul class="nav nav-list bs-docs-sidenav affix">
        <li class="active"><a href="#main"><i class="icon-chevron-right"></i>客户电子信息管理</a></li>
        <li class=""><a href="#mobileDeviceManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
        <li class=""><a href="#accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
        <li class=""><a href="#roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
        <li class=""><a href="#systemlogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
    </ul>
</div>
<div class="span9" style="margin-left: -3.435897%;">

    <div class="farmer_info">
        <form name="myform" id="myform" action="" method="post">
            <div class="table-list">
                <table width="100%" border="0">
                    <tbody>
                      <core:forEach items="${personBasicList}" var="personBasic">
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">姓名</td>
                            <td align="center">${personBasic.customerName}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">性别</td>
                            <td align="center">${personBasic.gender}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否农户</td>
                            <td align="center">${personBasic.farmer}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">客户类型</td>
                            <td align="center">${personBasic.customerType}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件类型</td>
                            <td align="center" colspan="2">${personBasic.cerType}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
                            <td align="center" colspan="2">${personBasic.cerNum}</td>
                            <td align="center" colspan="2" rowspan="4">照片</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件有效期</td>
                            <td align="center" colspan="3">${personBasic.cerValidityFrom} - ${personBasic.cerValidityTo}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">出生年月</td>
                            <td align="center">${personBasic.birthday}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">国籍</td>
                            <td align="center">${personBasic.nationality}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否拥有外国护照或居住权</td>
                            <td align="center">${personBasic.havePassport}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">民族</td>
                            <td align="center">${personBasic.nation}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">政治面貌</td>
                            <td align="center">${personBasic.poliLaspect}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">健康状况</td>
                            <td align="center">${personBasic.health}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">婚姻状况</td>
                            <td align="center">${personBasic.maritalStatus}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                居住地址
                            </td>
                            <td align="center" colspan="5">${personBasic.address}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">居住编码</td>
                            <td align="center">${personBasic.postcode}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                区域名称
                            </td>
                            <td align="center"><p>${personBasic.areaName}</p></td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">村别</td>
                            <td align="center"><p>${personBasic.village}</p></td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">联系电话</td>
                            <td align="center">${personBasic.telephone}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">手机号码</td>
                            <td align="center">${personBasic.mbPhoneNum}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                居住状况
                            </td>
                            <td align="center" colspan="2"><p>${personBasic.liveCondition}</p></td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">社会保障情况</td>
                            <td align="center" colspan="4"><p>${personBasic.socialSecurity}</p></td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                最高学位
                            </td>
                            <td align="center">${personBasic.highestDegree}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">最高学历</td>
                            <td align="center">${personBasic.highestEdu}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）关系</td>
                            <td align="center">${personBasic.bankRelation}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）合作关系</td>
                            <td align="center">${personBasic.bankPartnership}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                职业
                            </td>
                            <td align="center" colspan="7">${personBasic.profession}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                个人经营项目
                            </td>
                            <td align="center" colspan="4">${personBasic.businessProj}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">经营年限</td>
                            <td align="center" colspan="2">${personBasic.businessYear}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                经营场所
                            </td>
                            <td align="center" colspan="3">${personBasic.businessSite}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">从事行业</td>
                            <td align="center" colspan="3">${personBasic.industry}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资经营性质</td>
                            <td align="center">${personBasic.businessProp}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资资金情况</td>
                            <td align="center">${personBasic.moneySitu}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投入金额</td>
                            <td align="center">${personBasic.inputMoney}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">自有资金情况</td>
                            <td align="center">${personBasic.ownMoney}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF"> 年收益情况</td>
                            <td align="center" colspan="7">${personBasic.yearIncome}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作情况</td>
                            <td align="center" colspan="7">${personBasic.workSitu}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">单位性质</td>
                            <td align="center" colspan="3">${personBasic.unitProp}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">单位所属行业</td>
                            <td align="center" colspan="3">${personBasic.unitIndustry}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">任职部门</td>
                            <td align="center" colspan="3">${personBasic.department}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作单位类别</td>
                            <td align="center" colspan="3">${personBasic.unitType}</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">职务</td>
                            <td align="center">${personBasic.duties}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年工资收入（万元）</td>
                            <td align="center">${personBasic.annualWageIncome}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作年限</td>
                            <td align="center">${personBasic.workYears}</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">职称</td>
                            <td align="center">${personBasic.workTitle}</td>
                        </tr>
                      </core:forEach>
                        <tr>
                            <td align="center" colspan="8" style="font-size:22px">
                                家庭收支情况
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
                                家庭年总收入（万元）
                            </td>
                            <td align="center" colspan="2">4</td>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭支出（万元）</td>
                            <td align="center" colspan="2">2</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                收入来源
                            </td>
                            <td align="center" colspan="7">务农</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
                                其中：个人年收入（万元）
                            </td>
                            <td align="center" colspan="2">2</td>
                            <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭其他成员年收入（万元）</td>
                            <td align="center" colspan="2">2</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                投资经营性质
                            </td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资资金情况</td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投入金额</td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">自有资金情况</td>
                            <td align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center"  bgcolor="#1e90ff" style="color:#FFFFFF">
                                家庭主要支出项目
                            </td>
                            <td align="center" colspan="3">生活性支出</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">家庭收入能否应付支出</td>
                            <td align="center" colspan="3">能、刚刚够</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8" style="font-size:22px">
                                家庭资产情况
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                总资产（万元）
                            </td>
                            <td align="center">5</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">主要资产</td>
                            <td align="center" colspan="5">房屋</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                房产：1
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                性质
                            </td>
                            <td align="center">自建房</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
                            <td align="center">居住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
                            <td align="center">户口地乡村</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
                            <td align="center">混砖</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                层数
                            </td>
                            <td align="center">1</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                            <td align="center">自住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">建筑面积</td>
                            <td align="center">100-300㎡</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房产价值</td>
                            <td align="center">10-30万</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                是否按揭
                            </td>
                            <td align="center">自建房</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
                            <td align="center">居住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
                            <td align="center">户口地乡村</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
                            <td align="center">混砖</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                房产：2
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                性质
                            </td>
                            <td align="center">自建房</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
                            <td align="center">居住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
                            <td align="center">户口地乡村</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
                            <td align="center">混砖</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                层数
                            </td>
                            <td align="center">1</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                            <td align="center">自住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">建筑面积</td>
                            <td align="center">100-300㎡</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房产价值</td>
                            <td align="center">10-30万</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                是否按揭
                            </td>
                            <td align="center">自建房</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
                            <td align="center">居住</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
                            <td align="center">户口地乡村</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
                            <td align="center">混砖</td>
                        </tr>

                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                土地：1
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                土地面积
                            </td>
                            <td align="center">100-300㎡</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地价值</td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地性质</td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地类型</td>
                            <td align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                土地使用情况
                            </td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地款是否结清</td>
                            <td align="center" colspan="5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                车辆：1
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                情况
                            </td>
                            <td align="center">轿车</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">车辆价值</td>
                            <td align="center">10-30万元</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否按揭</td>
                            <td align="center">否</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                            <td align="center">自用</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                车辆：2
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                情况
                            </td>
                            <td align="center">货车</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">车辆价值</td>
                            <td align="center">10-30万元</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否按揭</td>
                            <td align="center">否</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
                            <td align="center">运营</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                使用金融资产情况
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                情况
                            </td>
                            <td align="center" colspan="3">活期存款 定期存款 股票 基金 债券 投资性保险 其他</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">我社存款</td>
                            <td align="center">10-30万内</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行存款</td>
                            <td align="center">3万元内</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8" style="font-size:22px">
                                家庭负责情况
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                家庭负债总额（万元）
                            </td>
                            <td align="center">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">本行负债（万元）</td>
                            <td align="center" colspan="2">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行负债（万元）</td>
                            <td align="center" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                贷款用途
                            </td>
                            <td align="center" colspan="3">&nbsp;</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">贷款形态</td>
                            <td align="center" colspan="3">&nbsp;</td>
                        </tr>
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
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                姓名
                            </td>
                            <td align="center">张惠孝</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年收入（万元）</td>
                            <td align="center">1</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与户主关系</td>
                            <td align="center">其他血亲</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">常住地址</td>
                            <td align="center">本地区</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                职业
                            </td>
                            <td align="center" colspan="3">专业技术人员</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
                            <td align="center" colspan="3">350583198011151353</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="8" style="font-size:18px">
                                成员：2
                            </td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                姓名
                            </td>
                            <td align="center">张惠贤</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年收入（万元）</td>
                            <td align="center">1</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与户主关系</td>
                            <td align="center">其他血亲</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">常住地址</td>
                            <td align="center">本地区</td>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
                                职业
                            </td>
                            <td align="center" colspan="3">专业技术人员</td>
                            <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
                            <td align="center" colspan="3">350583198011151354</td>
                        </tr>
                 </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
</div>
</div>
</body>
</html>