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

            $('.usedProduct').each(function(index,element){
                $('.'+$(element).val()).prop('checked', true);
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
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span>[<c:out value="${displayUserName}"/>]</span><a href="" style="color:#FFFFFF">&nbsp;[退出]</a>
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
<input class="input-block-level" type="text" placeholder="客户电子信息管理>编辑" disabled="disabled" style="color:#0000AA">
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
<div class="table-list">
<table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
<tbody>

<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">姓名</td>
    <td align="center">
        <input class="input-small" type="text" name="customerName" value="${personBasicList.customerName}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">性别</td>
    <td align="left">

        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="gender">

            <option value="${personBasicList.gender}">${personBasicList.gender}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否农户</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="farmer">
            <core:choose>
                <core:when test="${personBasicList.farmer==0}">
                    <option value="${personBasicList.farmer}" selected="selected">否</option>
                    <option value="1">是</option>
                </core:when>
                <core:otherwise>
                    <option value="0">否</option>
                    <option value="${personBasicList.farmer}" selected="selected">是</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">客户类型</td>
    <td align="center">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="customerType">
            <option value="${personBasicList.customerType}">${personBasicList.customerType}</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件类型</td>
    <td align="left" colspan="2">
        <select class="selectpicker" style="width: 155px; margin-top: 5px;" name="cerType">
            <option value="${personBasicList.cerType}">${personBasicList.cerType}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
    <td align="left" colspan="2">
        <input class="input-small" type="text" name="cerNum" value="${personBasicList.cerNum}"
               style="width: 175px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" colspan="2" rowspan="4">
        <img src="${personBasicList.photoUri}" class="img-rounded">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件有效期</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="cerValidityFrom" value="${personBasicList.cerValidityFrom}"
               style="width: 125px;height: 30px; margin-top: 5px;"> -
        <input class="input-small" type="text" name="cerValidityTo" value="${personBasicList.cerValidityTo}"
               style="width: 125px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">出生年月</td>
    <td align="left">
        <input class="input-small" type="text" name="birthday" value="${personBasicList.birthday}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">国籍</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="nationality">
            <option value="${personBasicList.nationality}">${personBasicList.nationality}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否拥有外国护照或居住权</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="havePassport">
            <core:choose>
                <core:when test="${personBasicList.havePassport==0}">
                    <option value="${personBasicList.havePassport}" selected="selected">否</option>
                    <option value="1">是</option>
                </core:when>
                <core:otherwise>
                    <option value="0">否</option>
                    <option value="${personBasicList.havePassport}" selected="selected">是</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">民族</td>
    <td align="left">
        <input class="input-small" type="text" name="nation" value="${personBasicList.nation}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">政治面貌</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="poliLaspect">
            <core:choose>
            <core:when test="${personBasicList.poliLaspect=='群众'}">
                <option value="${personBasicList.poliLaspect}" selected="selected">群众</option>
                <option value="党员">党员</option>
            </core:when>
            <core:otherwise>
                <option value="群众">群众</option>
                <option value="${personBasicList.poliLaspect}" selected="selected">党员</option>
            </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">健康状况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="health">
            <core:choose>
            <core:when test="${personBasicList.health=='良好'}">
                <option value="${personBasicList.health}" selected="selected">良好</option>
                <option value="一般">一般</option>
                <option value="差">差</option>
            </core:when>
            <core:when test="${personBasicList.health=='一般'}">
                <option value="良好" >良好</option>
                <option value="${personBasicList.health}" selected="selected">一般</option>
                <option value="差">差</option>
            </core:when>
            <core:otherwise>
                <option value="良好" >良好</option>
                <option value="一般">一般</option>
                <option value="${personBasicList.health}" selected="selected">差</option>
            </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">婚姻状况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="maritalStatus">
            <core:choose>
            <core:when test="${personBasicList.maritalStatus=='已婚'}">
                <option value="${personBasicList.maritalStatus}" selected="selected">已婚</option>
                <option value="未说明">未说明</option>
            </core:when>
            <core:otherwise>
                <option value="已婚">已婚</option>
                <option value="${personBasicList.maritalStatus}" selected="selected">未说明</option>
            </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        居住地址
    </td>
    <td align="left" colspan="5">
        <input class="input-small" type="text" name="address" value="${personBasicList.address}"
               style="width: 465px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">居住编码</td>
    <td align="left">
        <input class="input-small" type="text" name="postcode" value="${personBasicList.postcode}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        区域名称
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="areaName">



            <option value="${personBasicList.areaName}">${personBasicList.areaName}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">村别</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="village">
            <option value="${personBasicList.village}">${personBasicList.village}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">联系电话</td>
    <td align="left">
        <input class="input-small" type="text" name="telephone" value="${personBasicList.telephone}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">手机号码</td>
    <td align="left">
        <input class="input-small" type="text" name="mbPhoneNum" value="${personBasicList.mbPhoneNum}"
               style="width: 95px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        居住状况
    </td>
    <td align="left" colspan="2">
        <select class="selectpicker" style="width: 155px; margin-top: 5px;" name="liveCondition">
            <core:choose>
                <core:when test="${personBasicList.liveCondition=='自置'}">
                    <option value="${personBasicList.liveCondition}" selected="selected">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='按揭'}">
                    <option value="自置">自置</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='亲属楼宇'}">
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='集体宿舍'}">
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='租房'}">
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='共有住宅'}">
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.liveCondition=='其他'}">
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="自置">自置</option>
                    <option value="按揭">按揭</option>
                    <option value="亲属楼宇">亲属楼宇</option>
                    <option value="集体宿舍">集体宿舍</option>
                    <option value="租房">租房</option>
                    <option value="共有住宅">共有住宅</option>
                    <option value="其他">其他</option>
                    <option value="${personBasicList.liveCondition}" selected="selected">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">社会保障情况</td>
    <td align="left" colspan="4"><%--${personBasicList.socialSecurity}--%>
        <core:forEach items="${usedProducts}" var="usedProduct">
            <input value="${usedProduct}" class="usedProductHid" style="display:none" />
        </core:forEach>

        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox1" value="养老保险" class="养老保险">养老保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox2" value="失业保险" class="失业保险">失业保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox3" value="医疗保险" class="医疗保险">医疗保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox4" value="生育保险" class="生育保险">生育保险
        </label>
        <label class="checkbox inline">
            <input type="checkbox" id="inlineCheckbox5" value="住房公积金" class="住房公积金">住房公积金
        </label>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        最高学位
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="highestDegree">
            <core:choose>
                <core:when test="${personBasicList.highestDegree=='名誉博士'}">
                    <option value="${personBasicList.highestDegree}" selected="selected">名誉博士</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="学士">学士</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestDegree=='博士'}">
                    <option value="名誉博士">名誉博士</option>
                    <option value="${personBasicList.highestDegree}" selected="selected">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="学士">学士</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestDegree=='硕士'}">
                    <option value="名誉博士">名誉博士</option>
                    <option value="博士">博士</option>
                    <option value="${personBasicList.highestDegree}" selected="selected">硕士</option>
                    <option value="学士">学士</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestDegree=='学士'}">
                    <option value="名誉博士">名誉博士</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="${personBasicList.highestDegree}" selected="selected">学士</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestDegree=='其他'}">
                    <option value="名誉博士">名誉博士</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="学士">学士</option>
                    <option value="${personBasicList.highestDegree}" selected="selected">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="名誉博士">名誉博士</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="学士">学士</option>
                    <option value="其他">其他</option>
                    <option value="${personBasicList.highestDegree}" selected="selected">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">最高学历</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="highestEdu">
            <core:choose>
                <core:when test="${personBasicList.highestEdu=='研究生'}">
                    <option value="${personBasicList.highestEdu}" selected="selected">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='本科'}">
                    <option value="研究生">研究生</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='大专'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='中等专业学校或中等技术学校'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='技术学校'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='高中'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='初中'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='小学'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.highestEdu=='文盲或半文盲'}">
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">文盲或半文盲</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="${personBasicList.highestEdu}" selected="selected">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="中等专业学校或中等技术学校">中等专业学校或中等技术学校</option>
                    <option value="技术学校">技术学校</option>
                    <option value="高中">高中</option>
                    <option value="初中">初中</option>
                    <option value="小学">小学</option>
                    <option value="文盲或半文盲">文盲或半文盲</option>
                    <option value="${personBasicList.highestEdu}" selected="selected">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）关系</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="bankRelation">
            <option value="${personBasicList.bankRelation}">${personBasicList.bankRelation}</option>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">与我行（社）合作关系</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="bankPartnership">
            <option value="${personBasicList.bankPartnership}">${personBasicList.bankPartnership}</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        职业
    </td>
    <td align="left" colspan="7">
        <select class="selectpicker" style="width: 495px; margin-top: 5px;" name="profession">
            <core:choose>
                <core:when test="${personBasicList.profession=='国家机关、党群组织、企业、事业单位负责人'}">
                    <option value="${personBasicList.profession}" selected="selected">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='专业技术人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="${personBasicList.profession}" selected="selected">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='办事人员和有关人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="${personBasicList.profession}" selected="selected">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='商业、服务业人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="${personBasicList.profession}" selected="selected">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='农、林、木、渔、水利业生产人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="${personBasicList.profession}" selected="selected">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='生产、运输设备操作人员及有关人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="${personBasicList.profession}" selected="selected">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='军人'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="${personBasicList.profession}" selected="selected">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.profession=='不便分类的其他从业人员'}">
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="${personBasicList.profession}" selected="selected">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</option>
                    <option value="专业技术人员">专业技术人员</option>
                    <option value="办事人员和有关人员">办事人员和有关人员</option>
                    <option value="商业、服务业人员">商业、服务业人员</option>
                    <option value="农、林、木、渔、水利业生产人员">农、林、木、渔、水利业生产人员</option>
                    <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</option>
                    <option value="军人">军人</option>
                    <option value="不便分类的其他从业人员">不便分类的其他从业人员</option>
                    <option value="未知">未知</option>
                    <option value="${personBasicList.profession}" selected="selected">未说明</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        个人经营项目
    </td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="businessProj" value="${personBasicList.businessProj}"
               style="width: 300px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">经营年限</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="businessYear" value="${personBasicList.businessYear}"
               style="width: 275px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        经营场所
    </td>
    <td align="left" colspan="3">

        <input class="input-small" type="text" name="businessSite" value="${personBasicList.businessSite}"
               style="width: 300px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">从事行业</td> <%--从数据库取--%>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 275px; margin-top: 5px;" name="industry">
            <option value="${personBasicList.industry}">${personBasicList.industry}</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="businessProp">
            <core:choose>
                <core:when test="${personBasicList.businessProp}=='个体工商户'}">
                    <option value="${personBasicList.businessProp}" selected="selected">个体工商户</option>
                    <option value="合伙企业">合伙企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="其他">其他</option>
                </core:when>
                <core:when test="${personBasicList.businessProp}=='合伙企业'}">
                    <option value="个体工商户">个体工商户</option>
                    <option value="${personBasicList.businessProp}" selected="selected">合伙企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="其他">其他</option>
                </core:when>
                <core:when test="${personBasicList.businessProp}=='有限责任公司'}">
                    <option value="个体工商户">个体工商户</option>
                    <option value="合伙企业">合伙企业</option>
                    <option value="${personBasicList.businessProp}" selected="selected">有限责任公司</option>
                    <option value="其他">其他</option>
                </core:when>
                <core:otherwise>
                    <option value="个体工商户">个体工商户</option>
                    <option value="合伙企业">合伙企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="${personBasicList.businessProp}" selected="selected">其他</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="moneySitu">
            <core:choose>
                <core:when test="${personBasicList.moneySitu}=='独自投入'}">
                    <option value="${personBasicList.moneySitu}" selected="selected">独自投入</option>
                    <option value="与他人合伙">与他人合伙</option>
                    <option value="自身经营">自身经营</option>
                    <option value="挂靠他人合伙">挂靠他人合伙</option>
                </core:when>
                <core:when test="${personBasicList.moneySitu}=='与他人合伙'}">
                    <option value="独自投入">独自投入</option>
                    <option value="${personBasicList.moneySitu}" selected="selected">与他人合伙</option>
                    <option value="自身经营">自身经营</option>
                    <option value="挂靠他人合伙">挂靠他人合伙</option>
                </core:when>
                <core:when test="${personBasicList.moneySitu}=='自身经营'}">
                    <option value="独自投入">独自投入</option>
                    <option value="与他人合伙">与他人合伙</option>
                    <option value="${personBasicList.moneySitu}" selected="selected">自身经营</option>
                    <option value="挂靠他人合伙">挂靠他人合伙</option>
                </core:when>
                <core:otherwise>
                    <option value="独自投入">独自投入</option>
                    <option value="与他人合伙">与他人合伙</option>
                    <option value="自身经营">自身经营</option>
                    <option value="${personBasicList.moneySitu}" selected="selected">挂靠他人合伙</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="inputMoney">
            <core:choose>
                <core:when test="${personBasicList.inputMoney}=='10万元以内'}">
                    <option value="${personBasicList.inputMoney}" selected="selected">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.inputMoney}=='10-50万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="${personBasicList.inputMoney}" selected="selected">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.inputMoney}=='50-100万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="${personBasicList.inputMoney}" selected="selected">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.inputMoney}=='100-300万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="${personBasicList.inputMoney}" selected="selected">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.inputMoney}=='300-1000万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="${personBasicList.inputMoney}" selected="selected">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:otherwise>
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="${personBasicList.inputMoney}" selected="selected">1000万元以上</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="ownMoney">
            <core:choose>
                <core:when test="${personBasicList.ownMoney}=='10万元以内'}">
                    <option value="${personBasicList.ownMoney}" selected="selected">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.ownMoney}=='10-50万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="${personBasicList.ownMoney}" selected="selected">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.ownMoney}=='50-100万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="${personBasicList.ownMoney}" selected="selected">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.ownMoney}=='100-300万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="${personBasicList.ownMoney}" selected="selected">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.ownMoney}=='300-1000万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="${personBasicList.ownMoney}" selected="selected">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:otherwise>
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="${personBasicList.ownMoney}" selected="selected">1000万元以上</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823"> 年收益情况</td>
    <td align="left" colspan="7">
        <select class="selectpicker" style="width: 595px; margin-top: 5px;" name="yearIncome">
            <core:choose>
                <core:when test="${personBasicList.yearIncome}=='10万元以内'}">
                    <option value="${personBasicList.yearIncome}" selected="selected">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.yearIncome}=='10-50万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="${personBasicList.yearIncome}" selected="selected">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.yearIncome}=='50-100万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="${personBasicList.yearIncome}" selected="selected">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.yearIncome}=='100-300万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="${personBasicList.yearIncome}" selected="selected">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:when test="${personBasicList.yearIncome}=='300-1000万元'}">
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="${personBasicList.yearIncome}" selected="selected">300-1000万元</option>
                    <option value="1000万元以上">1000万元以上</option>
                </core:when>
                <core:otherwise>
                    <option value="10万元以内">10万元以内</option>
                    <option value="10-50万元">10-50万元</option>
                    <option value="50-100万元">50-100万元</option>
                    <option value="100-300万元">100-300万元</option>
                    <option value="300-1000万元">300-1000万元</option>
                    <option value="${personBasicList.yearIncome}" selected="selected">1000万元以上</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作情况</td>
    <td align="left" colspan="7">
        <input class="input-small" type="text" name="workSitu" value="${personBasicList.workSitu}"
               style="width: 595px;height: 30px; margin-top: 5px;">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位性质</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;" name="unitProp">
            <core:choose>
                <core:when test="${personBasicList.unitProp}=='党政机关'}">
                    <option value="${personBasicList.unitProp}" selected="selected">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='事业单位'}">
                    <option value="党政机关">党政机关</option>
                    <option value="${personBasicList.unitProp}" selected="selected">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='军队社会团体'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="${personBasicList.unitProp}" selected="selected">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='内资企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="${personBasicList.unitProp}" selected="selected">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='国有企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='集体企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='股份合作企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='联营企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='有限责任公司'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='股份有限公司'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="${personBasicList.unitProp}" selected="selected">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='私营企业'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="${personBasicList.unitProp}" selected="selected">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='个体经营'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="${personBasicList.unitProp}" selected="selected">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.unitProp}=='其他'}">
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="${personBasicList.unitProp}" selected="selected">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="党政机关">党政机关</option>
                    <option value="事业单位">事业单位</option>
                    <option value="军队社会团体">军队社会团体</option>
                    <option value="内资企业">内资企业</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体企业">集体企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="有限责任公司">有限责任公司</option>
                    <option value="股份有限公司">股份有限公司</option>
                    <option value="私营企业">私营企业</option>
                    <option value="个体经营">个体经营</option>
                    <option value="其他">其他</option>
                    <option value="${personBasicList.unitProp}" selected="selected">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">单位所属行业</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;" name="unitIndustryId">
            <option value="${personBasicList.unitIndustryId}">${personBasicList.unitIndustryId}</option>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">任职部门</td>
    <td align="left" colspan="3">
        <input class="input-small" type="text" name="department" value="${personBasicList.department}"
               style="width: 255px;height: 30px; margin-top: 5px;">
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作单位类别</td>
    <td align="left" colspan="3">
        <select class="selectpicker" style="width: 255px; margin-top: 5px;" name="unitType">
            <core:choose>
                <core:when test="${personBasicList.unitType=='国家机关、团体、事业单位等'}">
                    <option value="${personBasicList.unitType}" selected="selected">国家机关、团体、事业单位等</option>
                    <option value="金融、烟草、邮电通讯、电力、民航、水电气供应">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="上市企业、大型优质企业等">上市企业、大型优质企业等</option>
                    <option value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</option>
                    <option value="其他">其他</option>
                    <option value="无职业">无职业</option>
                </core:when>
                <core:when test="${personBasicList.unitType=='金融、烟草、邮电通讯、电力、民航、水电气供应'}">
                    <option value="国家机关、团体、事业单位等">国家机关、团体、事业单位等</option>
                    <option value="${personBasicList.unitType}" selected="selected">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="上市企业、大型优质企业等">上市企业、大型优质企业等</option>
                    <option value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</option>
                    <option value="其他">其他</option>
                    <option value="无职业">无职业</option>
                </core:when>
                <core:when test="${personBasicList.unitType=='上市企业、大型优质企业等'}">
                    <option value="国家机关、团体、事业单位等">国家机关、团体、事业单位等</option>
                    <option value="金融、烟草、邮电通讯、电力、民航、水电气供应">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="${personBasicList.unitType}" selected="selected">上市企业、大型优质企业等</option>
                    <option value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</option>
                    <option value="其他">其他</option>
                    <option value="无职业">无职业</option>
                </core:when>
                <core:when test="${personBasicList.unitType=='三资、民营企业及其他企业等'}">
                    <option value="国家机关、团体、事业单位等">国家机关、团体、事业单位等</option>
                    <option value="金融、烟草、邮电通讯、电力、民航、水电气供应">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="上市企业、大型优质企业等">上市企业、大型优质企业等</option>
                    <option value="${personBasicList.unitType}" selected="selected">三资、民营企业及其他企业等</option>
                    <option value="其他">其他</option>
                    <option value="无职业">无职业</option>
                </core:when>
                <core:when test="${personBasicList.unitType=='其他'}">
                    <option value="国家机关、团体、事业单位等">国家机关、团体、事业单位等</option>
                    <option value="金融、烟草、邮电通讯、电力、民航、水电气供应">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="上市企业、大型优质企业等">上市企业、大型优质企业等</option>
                    <option value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</option>
                    <option value="${personBasicList.unitType}" selected="selected">其他</option>
                    <option value="无职业">无职业</option>
                </core:when>
                <core:otherwise>
                    <option value="国家机关、团体、事业单位等">国家机关、团体、事业单位等</option>
                    <option value="金融、烟草、邮电通讯、电力、民航、水电气供应">金融、烟草、邮电通讯、电力、民航、水电气供应</option>
                    <option value="上市企业、大型优质企业等">上市企业、大型优质企业等</option>
                    <option value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</option>
                    <option value="其他">其他</option>
                    <option value="${personBasicList.unitType}" selected="selected">无职业</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">职务</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="duties">
            <core:choose>
                <core:when test="${personBasicList.duties=='高级领导'}">
                    <option value="${personBasicList.duties}" selected="selected">高级领导</option>
                    <option value="中级领导">中级领导</option>
                    <option value="一般员工">一般员工</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.duties=='中级领导'}">
                    <option value="高级领导">高级领导</option>
                    <option value="${personBasicList.duties}" selected="selected">中级领导</option>
                    <option value="一般员工">一般员工</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.duties=='一般员工'}">
                    <option value="高级领导">高级领导</option>
                    <option value="中级领导">中级领导</option>
                    <option value="${personBasicList.duties}" selected="selected">一般员工</option>
                    <option value="其他">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.duties=='一般员工'}">
                    <option value="高级领导">高级领导</option>
                    <option value="中级领导">中级领导</option>
                    <option value="一般员工">一般员工</option>
                    <option value="${personBasicList.duties}" selected="selected">其他</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="高级领导">高级领导</option>
                    <option value="中级领导">中级领导</option>
                    <option value="一般员工">一般员工</option>
                    <option value="其他">其他</option>
                    <option value="${personBasicList.duties}" selected="selected">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">年工资收入（万元）</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="annualWageIncome">
            <core:choose>
                <core:when test="${personBasicList.annualWageIncome=='3万元以内'}">
                    <option value="${personBasicList.annualWageIncome}" selected="selected">3万元以内</option>
                    <option value="3-6万元">3-6万元</option>
                    <option value="6-12万元">6-12万元</option>
                    <option value="12万元以上">12万元以上</option>
                </core:when>
                <core:when test="${personBasicList.annualWageIncome=='3-6万元'}">
                    <option value="3万元以内">3万元以内</option>
                    <option value="${personBasicList.annualWageIncome}" selected="selected">3-6万元</option>
                    <option value="6-12万元">6-12万元</option>
                    <option value="12万元以上">12万元以上</option>
                </core:when>
                <core:when test="${personBasicList.annualWageIncome=='6-12万元'}">
                    <option value="3万元以内">3万元以内</option>
                    <option value="3-6万元">3-6万元</option>
                    <option value="${personBasicList.annualWageIncome}" selected="selected">6-12万元</option>
                    <option value="12万元以上">12万元以上</option>
                </core:when>
                <core:otherwise>
                    <option value="3万元以内">3万元以内</option>
                    <option value="3-6万元">3-6万元</option>
                    <option value="6-12万元">6-12万元</option>
                    <option value="${personBasicList.annualWageIncome}" selected="selected">12万元以上</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">工作年限</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="workYears">
            <core:choose>
                <core:when test="${personBasicList.workYears=='5年(含)以上'}">
                    <option value="${personBasicList.workYears}" selected="selected">5年(含)以上</option>
                    <option value="3(含)-5年">3(含)-5年</option>
                    <option value="3年以内">3年以内</option>
                </core:when>
                <core:when test="${personBasicList.workYears=='3(含)-5年'}">
                    <option value="5年(含)以上">5年(含)以上</option>
                    <option value="${personBasicList.workYears}" selected="selected">3(含)-5年</option>
                    <option value="3年以内">3年以内</option>
                </core:when>
                <core:otherwise>
                    <option value="5年(含)以上">5年(含)以上</option>
                    <option value="3(含)-5年">3(含)-5年</option>
                    <option value="${personBasicList.workYears}" selected="selected">3年以内</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">职称</td>
    <td align="left">
        <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="workTitle">
            <core:choose>
                <core:when test="${personBasicList.workTitle=='高级'}">
                    <option value="无">无</option>
                    <option value="${personBasicList.workTitle}" selected="selected">高级</option>
                    <option value="中级">中级</option>
                    <option value="初级">初级</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.workTitle=='中级'}">
                    <option value="无">无</option>
                    <option value="高级">高级</option>
                    <option value="${personBasicList.workTitle}" selected="selected">中级</option>
                    <option value="初级">初级</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.workTitle=='初级'}">
                    <option value="无">无</option>
                    <option value="高级">高级</option>
                    <option value="中级">中级</option>
                    <option value="${personBasicList.workTitle}" selected="selected">初级</option>
                    <option value="未知">未知</option>
                </core:when>
                <core:when test="${personBasicList.workTitle=='未知'}">
                    <option value="无">无</option>
                    <option value="高级">高级</option>
                    <option value="中级">中级</option>
                    <option value="初级">初级</option>
                    <option value="${personBasicList.workTitle}" selected="selected">未知</option>
                </core:when>
                <core:otherwise>
                    <option value="${personBasicList.workTitle}" selected="selected">无</option>
                    <option value="高级">高级</option>
                    <option value="中级">中级</option>
                    <option value="初级">初级</option>
                    <option value="未知">未知</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>

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
            <input class="input-small" type="text" name="fmAllIncome" value="${personIncomeExpenses.fmAllIncome}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭支出（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="fmExpenses" value="${personIncomeExpenses.fmExpenses}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">
            收入来源
        </td>
        <td align="left" colspan="7">
            <input class="input-small" type="text" name="incomeSrc" value="${personIncomeExpenses.incomeSrc}"
                   style="width: 595px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">
            其中：个人年收入（万元）
        </td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="perIncome" value="${personIncomeExpenses.perIncome}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭其他成员年收入（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="fmOtherMemberIn" value="${personIncomeExpenses.fmOtherMemberIn}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <%--<tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
        <td align="left">
           <input class="input-small" type="text" name="businessProp" value="${personIncomeExpenses.businessProp}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
        <td align="left">
            <input class="input-small" type="text" name="moneySitu" value="${personIncomeExpenses.moneySitu}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
        <td align="left">
            <input class="input-small" type="text" name="inputMoney" value="${personIncomeExpenses.inputMoney}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
        <td align="left">

           &lt;%&ndash; <input class="input-small" type="text" name="ownMoney" value="${personIncomeExpenses.ownMoney}"
                   style="width: 95px;height: 30px; margin-top: 5px;">&ndash;%&gt;
        </td>
    </tr>--%>
    <tr>
        <td align="center"  bgcolor="#b4d8ed" style="color:#161823">家庭主要支出项目</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 255px; margin-top: 5px;" name="fmExpensesProj">
                <core:choose>
                    <core:when test="${personIncomeExpenses.fmExpensesProj=='生活性支出'}">
                        <option value="${personIncomeExpenses.fmExpensesProj}" selected="selected">生活性支出</option>
                        <option value="交际应酬等消费支出">交际应酬等消费支出</option>
                        <option value="投资性支出">投资性支出</option>
                        <option value="其他支出">其他支出</option>
                    </core:when>
                    <core:when test="${personIncomeExpenses.fmExpensesProj=='生活性支出'}">
                        <option value="生活性支出">生活性支出</option>
                        <option value="${personIncomeExpenses.fmExpensesProj}" selected="selected">交际应酬等消费支出</option>
                        <option value="投资性支出">投资性支出</option>
                        <option value="其他支出">其他支出</option>
                    </core:when>
                    <core:when test="${personIncomeExpenses.fmExpensesProj=='投资性支出'}">
                        <option value="生活性支出">生活性支出</option>
                        <option value="交际应酬等消费支出">交际应酬等消费支出</option>
                        <option value="${personIncomeExpenses.fmExpensesProj}" selected="selected">投资性支出</option>
                        <option value="其他支出">其他支出</option>
                    </core:when>
                    <core:otherwise>
                        <option value="生活性支出">生活性支出</option>
                        <option value="交际应酬等消费支出">交际应酬等消费支出</option>
                        <option value="投资性支出">投资性支出</option>
                        <option value="${personIncomeExpenses.fmExpensesProj}" selected="selected">其他支出</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">家庭收入能否应付支出</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 255px; margin-top: 5px;" name="fmInOutRatio">
                <core:choose>
                    <core:when test="${personIncomeExpenses.fmInOutRatio=='能、绰绰有余'}">
                        <option value="${personIncomeExpenses.fmInOutRatio}" selected="selected">能、绰绰有余</option>
                        <option value="能、还有余盈">能、还有余盈</option>
                        <option value="能、刚刚够">能、刚刚够</option>
                        <option value="不能">不能</option>
                    </core:when>
                    <core:when test="${personIncomeExpenses.fmInOutRatio=='能、还有余盈'}">
                        <option value="能、绰绰有余">能、绰绰有余</option>
                        <option value="${personIncomeExpenses.fmInOutRatio}" selected="selected">能、还有余盈</option>
                        <option value="能、刚刚够">能、刚刚够</option>
                        <option value="不能">不能</option>
                    </core:when>
                    <core:when test="${personIncomeExpenses.fmInOutRatio=='能、刚刚够'}">
                        <option value="能、绰绰有余">能、绰绰有余</option>
                        <option value="能、还有余盈">能、还有余盈</option>
                        <option value="${personIncomeExpenses.fmInOutRatio}" selected="selected">能、刚刚够</option>
                        <option value="不能">不能</option>
                    </core:when>
                    <core:otherwise>
                        <option value="能、绰绰有余">能、绰绰有余</option>
                        <option value="能、还有余盈">能、还有余盈</option>
                        <option value="能、刚刚够">能、刚刚够</option>
                        <option value="${personIncomeExpenses.fmInOutRatio}" selected="selected">不能</option>
                    </core:otherwise>
                </core:choose>
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
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">总资产（万元）</td>
    <td align="left">
        <input class="input-small" type="text" name="fmAllAssets" value="${personFamilyAssets.fmAllAssets}"
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

<core:forEach items="${personHousePropertyInfoList}" var="personHousePropertyInfo" varStatus="idx">
    <tr>
        <td align="left" colspan="8" style="font-size:18px">
            房产：<core:out value="${idx.index+1}"></core:out>
        </td>
    </tr>
    <tr id="defaultItem">
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">性质</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="nature">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.nature=='商品房'}">
                        <option value="${personHousePropertyInfo.nature}" selected="selected">商品房</option>
                        <option value="自建房"></option>
                    </core:when>
                    <core:otherwise>
                        <option value="商品房">商品房</option>
                        <option value="${personHousePropertyInfo.nature}" selected="selected">自建房</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">用途</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="purpose">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.purpose=='商用楼'}">
                        <option value="${personHousePropertyInfo.purpose}" selected="selected">商用楼</option>
                        <option value="店铺">店铺</option>
                        <option value="居住">居住</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.purpose=='店铺'}">
                        <option value="商用楼">商用楼</option>
                        <option value="${personHousePropertyInfo.purpose}" selected="selected">店铺</option>
                        <option value="居住">居住</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.purpose=='居住'}">
                        <option value="商用楼">商用楼</option>
                        <option value="店铺">店铺</option>
                        <option value="${personHousePropertyInfo.purpose}" selected="selected">居住</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:otherwise>
                        <option value="商用楼">商用楼</option>
                        <option value="店铺"></option>
                        <option value="居住"></option>
                        <option value="${personHousePropertyInfo.purpose}" selected="selected">其他</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="site">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.site=='本市市区'}">
                        <option value="${personHousePropertyInfo.site}" selected="selected">本市市区</option>
                        <option value="户口地镇区">户口地镇区</option>
                        <option value="户口地乡村">户口地乡村</option>
                        <option value="本省其他县市">本省其他县市</option>
                        <option value="外省">外省</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.site=='户口地镇区'}">
                        <option value="本市市区">本市市区</option>
                        <option value="${personHousePropertyInfo.site}" selected="selected">户口地镇区</option>
                        <option value="户口地乡村">户口地乡村</option>
                        <option value="本省其他县市">本省其他县市</option>
                        <option value="外省">外省</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.site=='户口地乡村'}">
                        <option value="本市市区">本市市区</option>
                        <option value="户口地镇区">户口地镇区</option>
                        <option value="${personHousePropertyInfo.site}" selected="selected">户口地乡村</option>
                        <option value="本省其他县市">本省其他县市</option>
                        <option value="外省">外省</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.site=='本省其他县市'}">
                        <option value="本市市区">本市市区</option>
                        <option value="户口地镇区">户口地镇区</option>
                        <option value="户口地乡村">户口地乡村</option>
                        <option value="${personHousePropertyInfo.site}" selected="selected">本省其他县市</option>
                        <option value="外省">外省</option>
                    </core:when>
                    <core:otherwise>
                        <option value="本市市区">本市市区</option>
                        <option value="户口地镇区">户口地镇区</option>
                        <option value="户口地乡村">户口地乡村</option>
                        <option value="本省其他县市">本省其他县市</option>
                        <option value="${personHousePropertyInfo.site}" selected="selected">外省</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="structure">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.structure=='钢混'}">
                        <option value="${personHousePropertyInfo.structure}" selected="selected">钢混</option>
                        <option value="砖混">砖混</option>
                        <option value="砖木">砖木</option>
                        <option value="框架">框架</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.structure=='砖混'}">
                        <option value="钢混">钢混</option>
                        <option value="${personHousePropertyInfo.structure}" selected="selected">砖混</option>
                        <option value="砖木">砖木</option>
                        <option value="框架">框架</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.structure=='砖木'}">
                        <option value="钢混">钢混</option>
                        <option value="砖混">砖混</option>
                        <option value="${personHousePropertyInfo.structure}" selected="selected">砖木</option>
                        <option value="框架">框架</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.structure=='框架'}">
                        <option value="钢混">钢混</option>
                        <option value="砖混">砖混</option>
                        <option value="砖木">砖木</option>
                        <option value="${personHousePropertyInfo.structure}" selected="selected">框架</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:otherwise>
                        <option value="钢混">钢混</option>
                        <option value="砖混">砖混</option>
                        <option value="砖木">砖木</option>
                        <option value="框架">框架</option>
                        <option value="${personHousePropertyInfo.structure}" selected="selected">其他</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">层数</td>
        <td align="left">
            <input class="input-small" type="text" name="floorNum" value="${personHousePropertyInfo.floorNum}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="usedSitu">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.usedSitu=='自住'}">
                        <option value="${personHousePropertyInfo.usedSitu}" selected="selected">自住</option>
                        <option value="自身经营使用">自身经营使用</option>
                        <option value="出租">出租</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.usedSitu=='自身经营使用'}">
                        <option value="自住">自住</option>
                        <option value="${personHousePropertyInfo.usedSitu}" selected="selected">自身经营使用</option>
                        <option value="出租">出租</option>
                    </core:when>
                    <core:otherwise>
                        <option value="自住">自住</option>
                        <option value="自身经营使用">自身经营使用</option>
                        <option value="${personHousePropertyInfo.usedSitu}" selected="selected">出租</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="houseArea">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.houseArea=='100㎡内'}">
                        <option value="${personHousePropertyInfo.houseArea}" selected="selected">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.houseArea=='100-300㎡'}">
                        <option >100㎡内</option>
                        <option value="${personHousePropertyInfo.houseArea}" selected="selected">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.houseArea=='300-500㎡'}">
                        <option value="100㎡内">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="${personHousePropertyInfo.houseArea}" selected="selected">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="100㎡内">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="${personHousePropertyInfo.houseArea}" selected="selected">500㎡以上</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="houseWorth">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.houseWorth=='10万以内'}">
                        <option value="${personHousePropertyInfo.houseWorth}" selected="selected">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="100万以上">100万以上</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.houseWorth=='10-30万'}">
                        <option value="10万以内">10万以内</option>
                        <option value="${personHousePropertyInfo.houseWorth}" selected="selected">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="100万以上">100万以上</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.houseWorth=='30-60万'}">
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="${personHousePropertyInfo.houseWorth}" selected="selected">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="100万以上">100万以上</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.houseWorth=='60-100万'}">
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="${personHousePropertyInfo.houseWorth}" selected="selected">60-100万</option>
                        <option value="100万以上">100万以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="${personHousePropertyInfo.houseWorth}" selected="selected">100万以上</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="installment">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.installment=='1'}">
                        <option value="${personHousePropertyInfo.installment}" selected="selected">是</option>
                        <option value="0">否</option>
                    </core:when>
                    <core:otherwise>
                        <option value="1">是</option>
                        <option value="${personHousePropertyInfo.installment}" selected="selected">否</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="hasCredentials">
                <core:choose>
                    <core:when test="${personHousePropertyInfo.hasCredentials=='双证齐全'}">
                        <option value="${personHousePropertyInfo.hasCredentials}" selected="selected">双证齐全</option>
                        <option value="单土地证">单土地证</option>
                        <option value="无办证">无办证</option>
                    </core:when>
                    <core:when test="${personHousePropertyInfo.hasCredentials=='双证齐全'}">
                        <option value="双证齐全">双证齐全</option>
                        <option value="${personHousePropertyInfo.hasCredentials}" selected="selected">单土地证</option>
                        <option value="无办证">无办证</option>
                    </core:when>
                    <core:otherwise>
                        <option value="双证齐全">双证齐全</option>
                        <option value="单土地证">单土地证</option>
                        <option value="${personHousePropertyInfo.hasCredentials}" selected="selected">无办证</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">备注</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="note1" value="${personHousePropertyInfo.note1}"
                   style="width: 280px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>


<core:forEach items="${personLandInfoList}" var="personLandInfo" varStatus="idx">
    <tr>
        <td align="left" colspan="8" style="font-size:18px">
            土地：<core:out value="${idx.index+1}"></core:out>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地面积</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="area">
                <core:choose>
                    <core:when test="${personLandInfo.area=='100㎡内'}">
                        <option value="${personLandInfo.area}" selected="selected">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:when test="${personLandInfo.area=='100-300㎡'}">
                        <option >100㎡内</option>
                        <option value="${personLandInfo.area}" selected="selected">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:when test="${personLandInfo.area=='300-500㎡'}">
                        <option value="100㎡内">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="${personLandInfo.area}" selected="selected">300-500㎡</option>
                        <option value="500㎡以上">500㎡以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="100㎡内">100㎡内</option>
                        <option value="100-300㎡">100-300㎡</option>
                        <option value="300-500㎡">300-500㎡</option>
                        <option value="${personLandInfo.area}" selected="selected">500㎡以上</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
        <td align="left">
            <input class="input-small" type="text" name="worth" value="${personLandInfo.worth}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="property">
                <core:choose>
                    <core:when test="${personLandInfo.property=='国有出让'}">
                        <option value="${personLandInfo.property}" selected="selected">国有出让</option>
                        <option value="国有划拨">国有划拨</option>
                        <option value="集体证">集体证</option>
                        <option value="无办证">无办证</option>
                    </core:when>
                    <core:when test="${personLandInfo.property=='国有划拨'}">
                        <option value="国有出让">国有出让</option>
                        <option value="${personLandInfo.property}" selected="selected">国有划拨</option>
                        <option value="集体证">集体证</option>
                        <option value="无办证">无办证</option>
                    </core:when>
                    <core:when test="${personLandInfo.property=='集体证'}">
                        <option value="国有出让">国有出让</option>
                        <option value="国有划拨">国有划拨</option>
                        <option value="${personLandInfo.property}" selected="selected">集体证</option>
                        <option value="无办证">无办证</option>
                    </core:when>
                    <core:otherwise>
                        <option value="国有出让">国有出让</option>
                        <option value="国有划拨">国有划拨</option>
                        <option value="集体证">集体证</option>
                        <option value="${personLandInfo.property}" selected="selected">无办证</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="type">
                <core:choose>
                    <core:when test="${personLandInfo.type=='商业地'}">
                        <option value="${personLandInfo.type}" selected="selected">商业地</option>
                        <option value="住宅用地">住宅用地</option>
                        <option value="工业地">工业地</option>
                        <option value="耕地">耕地</option>
                        <option value="山地或滩涂">山地或滩涂</option>
                    </core:when>
                    <core:when test="${personLandInfo.type=='住宅用地'}">
                        <option value="商业地">商业地</option>
                        <option value="${personLandInfo.type}" selected="selected">住宅用地</option>
                        <option value="工业地">工业地</option>
                        <option value="耕地">耕地</option>
                        <option value="山地或滩涂">山地或滩涂</option>
                    </core:when>
                    <core:when test="${personLandInfo.type=='工业地'}">
                        <option value="商业地">商业地</option>
                        <option value="住宅用地">住宅用地</option>
                        <option value="${personLandInfo.type}" selected="selected">工业地</option>
                        <option value="耕地">耕地</option>
                        <option value="山地或滩涂">山地或滩涂</option>
                    </core:when>
                    <core:when test="${personLandInfo.type=='耕地'}">
                        <option value="商业地">商业地</option>
                        <option value="住宅用地">住宅用地</option>
                        <option value="工业地">工业地</option>
                        <option value="${personLandInfo.type}" selected="selected">耕地</option>
                        <option value="山地或滩涂">山地或滩涂</option>
                    </core:when>
                    <core:otherwise>
                        <option value="商业地">商业地</option>
                        <option value="住宅用地">住宅用地</option>
                        <option value="工业地">工业地</option>
                        <option value="耕地">耕地</option>
                        <option value="${personLandInfo.type}" selected="selected">山地或滩涂</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="usedSitu">
                <core:choose>
                    <core:when test="${personLandInfo.usedSitu=='自用'}">
                        <option value="${personLandInfo.usedSitu}" selected="selected">自用</option>
                        <option value="出借">出借</option>
                        <option value="出租">出租</option>
                        <option value="未使用">未使用</option>
                    </core:when>
                    <core:when test="${personLandInfo.usedSitu=='出借'}">
                        <option value="自用">自用</option>
                        <option value="${personLandInfo.usedSitu}" selected="selected">出借</option>
                        <option value="出租">出租</option>
                        <option value="未使用">未使用</option>
                    </core:when>
                    <core:when test="${personLandInfo.usedSitu=='出租'}">
                        <option value="自用">自用</option>
                        <option value="出借">出借</option>
                        <option value="${personLandInfo.usedSitu}" selected="selected">出租</option>
                        <option value="未使用">未使用</option>
                    </core:when>
                    <core:otherwise>
                        <option value="自用">自用</option>
                        <option value="出借">出借</option>
                        <option value="出租">出租</option>
                        <option value="${personLandInfo.usedSitu}" selected="selected">未使用</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">土地款是否结清</td>
        <td align="left" colspan="5">
            <select class="selectpicker" style="width: 465px; margin-top: 5px;" name="moneyClear">
                <core:choose>
                    <core:when test="${personLandInfo.moneyClear=='1'}">
                        <option value="${personLandInfo.moneyClear}" selected="selected">是</option>
                        <option value="0">否</option>
                    </core:when>
                    <core:otherwise>
                        <option value="1">是</option>
                        <option value="${personLandInfo.moneyClear}" selected="selected">否</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
    </tr>
</core:forEach>


<core:forEach items="${personCarsInfoList}" var="personCarsInfo" varStatus="idx">
    <tr>
        <td align="left" colspan="8" style="font-size:18px">
            车辆：<core:out value="${idx.index+1}"></core:out>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsInfo">
                <core:choose>
                    <core:when test="${personCarsInfo.carsInfo=='轿车'}">
                        <option value="${personCarsInfo.carsInfo}" selected="selected">轿车</option>
                        <option value="货车">货车</option>
                    </core:when>
                    <core:otherwise>
                        <option value="轿车">轿车</option>
                        <option value="${personCarsInfo.carsInfo}" selected="selected">货车</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsWorth">
                <core:choose>
                    <core:when test="${personCarsInfo.carsWorth=='10万以内'}">
                        <option value="${personCarsInfo.carsWorth}" selected="selected">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-50万">30-50万</option>
                        <option value="50万以上">50万以上</option>
                    </core:when>
                    <core:when test="${personCarsInfo.carsWorth=='10-30万'}">
                        <option value="10万以内">10万以内</option>
                        <option value="${personCarsInfo.carsWorth}" selected="selected">10-30万</option>
                        <option value="30-50万">30-50万</option>
                        <option value="50万以上">50万以上</option>
                    </core:when>
                    <core:when test="${personCarsInfo.carsWorth=='30-50万'}">
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="${personCarsInfo.carsWorth}" selected="selected">30-50万</option>
                        <option value="50万以上">50万以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-50万">30-50万</option>
                        <option value="${personCarsInfo.carsWorth}" selected="selected">50万以上</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsIsInstallment">
                <core:choose>
                    <core:when test="${personCarsInfo.carsIsInstallment=='1'}">
                        <option value="${personCarsInfo.carsIsInstallment}" selected="selected">是</option>
                        <option value="0">否</option>
                    </core:when>
                    <core:otherwise>
                        <option value="1">是</option>
                        <option value="${personCarsInfo.carsIsInstallment}" selected="selected">否</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="carsUsingInfo">
                <core:choose>
                    <core:when test="${personCarsInfo.carsUsingInfo=='营运'}">
                        <option value="${personCarsInfo.carsUsingInfo}" selected="selected">营运</option>
                        <option value="出租">出租</option>
                        <option value="闲置">闲置</option>
                        <option value="自用">自用</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personCarsInfo.carsUsingInfo=='出租'}">
                        <option value="营运<">营运</option>
                        <option value="${personCarsInfo.carsUsingInfo}" selected="selected">出租</option>
                        <option value="闲置">闲置</option>
                        <option value="自用">自用</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personCarsInfo.carsUsingInfo=='闲置'}">
                        <option value="营运<">营运</option>
                        <option value="出租">出租</option>
                        <option value="${personCarsInfo.carsUsingInfo}" selected="selected">闲置</option>
                        <option value="自用">自用</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:when test="${personCarsInfo.carsUsingInfo=='自用'}">
                        <option value="营运<">营运</option>
                        <option value="出租">出租</option>
                        <option value="闲置">闲置</option>
                        <option value="${personCarsInfo.carsUsingInfo}" selected="selected">自用</option>
                        <option value="其他">其他</option>
                    </core:when>
                    <core:otherwise>
                        <option value="营运">营运</option>
                        <option value="出租">出租</option>
                        <option value="闲置">闲置</option>
                        <option value="自用">自用</option>
                        <option value="${personCarsInfo.carsUsingInfo}" selected="selected">其他</option>
                    </core:otherwise>
                </core:choose>
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
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="depositOurBank">
                <core:choose>
                    <core:when test="${personFinancialAssets.depositOurBank=='3万元内'}">
                        <option value="${personFinancialAssets.depositOurBank}" selected="selected">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOurBank=='3-10万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="${personFinancialAssets.depositOurBank}" selected="selected">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOurBank=='10-30万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="${personFinancialAssets.depositOurBank}" selected="selected">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOurBank=='30-100万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="${personFinancialAssets.depositOurBank}" selected="selected">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="${personFinancialAssets.depositOurBank}" selected="selected">100万以上</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行存款</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="depositOtherBank">
                <core:choose>
                    <core:when test="${personFinancialAssets.depositOtherBank=='3万元内'}">
                        <option value="${personFinancialAssets.depositOtherBank}" selected="selected">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOtherBank=='3-10万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="${personFinancialAssets.depositOtherBank}" selected="selected">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOtherBank=='10-30万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="${personFinancialAssets.depositOtherBank}" selected="selected">10-30万元内</option>
                        <option value="30-100万元内">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:when test="${personFinancialAssets.depositOtherBank=='30-100万元内'}">
                        <option value="3万元内">3万元内</option>
                        <option value="3-10万元内">3-10万元内</option>
                        <option value="10-30万元内">10-30万元内</option>
                        <option value="${personFinancialAssets.depositOtherBank}" selected="selected">30-100万元内</option>
                        <option value="100万元以上">100万元以上</option>
                    </core:when>
                    <core:otherwise>
                        <option value="10万以内">10万以内</option>
                        <option value="10-30万">10-30万</option>
                        <option value="30-60万">30-60万</option>
                        <option value="60-100万">60-100万</option>
                        <option value="${personFinancialAssets.depositOtherBank}" selected="selected">100万以上</option>
                    </core:otherwise>
                </core:choose>
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
            <input class="input-small" type="text" name="fmIncurDebts" value="${personFamilyIncurDebts.fmIncurDebts}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">本行负债（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="ourBankDebts" value="${personFamilyIncurDebts.ourBankDebts}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">他行负债（万元）</td>
        <td align="left" colspan="2">
            <input class="input-small" type="text" name="otherBankDebts" value="${personFamilyIncurDebts.otherBankDebts}"
                   style="width: 155px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款用途</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="loanPurpose" value="${personFamilyIncurDebts.loanPurpose}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">贷款形态</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="loanShap" value="${personFamilyIncurDebts.loanShap}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭成员基本情况
    </td>
</tr>

<core:forEach items="${personFamilyMemberList}" var="personFamilyMember" varStatus="idx">
    <tr>
        <td align="left" colspan="8" style="font-size:18px">
            成员：<core:out value="${idx.index+1}"></core:out>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">姓名</td>
        <td align="left">
            <input class="input-small" type="text" name="familyMemberName" value="${personFamilyMember.familyMemberName}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">年收入（万元）</td>
        <td align="left">
            <input class="input-small" type="text" name="yearIncome" value="${personFamilyMember.yearIncome}"
                   style="width: 95px;height: 30px; margin-top: 5px;">
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">与户主关系</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="leaderRelation">
                <core:choose>
                    <core:when test="${personFamilyMember.leaderRelation=='配偶'}">
                        <option value="${personFamilyMember.leaderRelation}" selected="selected">配偶</option>
                        <option value="父母">父母</option>
                        <option value="子女">子女</option>
                        <option value="其他血亲">其他血亲</option>
                        <option value="其他姻亲">其他姻亲</option>
                    </core:when>
                    <core:when test="${personFamilyMember.leaderRelation=='父母'}">
                        <option value="配偶">配偶</option>
                        <option value="${personFamilyMember.leaderRelation}" selected="selected">父母</option>
                        <option value="子女">子女</option>
                        <option value="其他血亲">其他血亲</option>
                        <option value="其他姻亲">其他姻亲</option>
                    </core:when>
                    <core:when test="${personFamilyMember.leaderRelation=='子女'}">
                        <option value="配偶">配偶</option>
                        <option value="父母">父母</option>
                        <option value="${personFamilyMember.leaderRelation}" selected="selected">子女</option>
                        <option value="其他血亲">其他血亲</option>
                        <option value="其他姻亲">其他姻亲</option>
                    </core:when>
                    <core:when test="${personFamilyMember.leaderRelation=='其他血亲'}">
                        <option value="配偶">配偶</option>
                        <option value="父母">父母</option>
                        <option value="子女">子女</option>
                        <option value="${personFamilyMember.leaderRelation}" selected="selected">其他血亲</option>
                        <option value="其他姻亲">其他姻亲</option>
                    </core:when>
                    <core:otherwise>
                        <option value="配偶">配偶</option>
                        <option value="父母">父母</option>
                        <option value="子女">子女</option>
                        <option value="其他血亲">其他血亲</option>
                        <option value="${personFamilyMember.leaderRelation}" selected="selected">其他姻亲</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">常住地址</td>
        <td align="left">
            <select class="selectpicker" style="width: 95px; margin-top: 5px;" name="address">
                <core:choose>
                    <core:when test="${personFamilyMember.address=='本市'}">
                        <option value="${personFamilyMember.address}" selected="selected">本市</option>
                        <option value="本地区">本地区</option>
                        <option value="省内地区">省内地区</option>
                        <option value="省外">省外</option>
                    </core:when>
                    <core:when test="${personFamilyMember.address=='本地区'}">
                        <option value="本市">本市</option>
                        <option value="${personFamilyMember.address}" selected="selected">本地区</option>
                        <option value="省内地区">省内地区</option>
                        <option value="省外">省外</option>
                    </core:when>
                    <core:when test="${personFamilyMember.address=='省内地区'}">
                        <option value="本市">本市</option>
                        <option value="本地区">本地区</option>
                        <option value="${personFamilyMember.address}" selected="selected">省内地区</option>
                        <option value="省外">省外</option>
                    </core:when>
                    <core:otherwise>
                        <option value="本市">本市</option>
                        <option value="本地区">本地区</option>
                        <option value="省内地区">省内地区</option>
                        <option value="${personFamilyMember.address}" selected="selected">省外</option>
                    </core:otherwise>
                </core:choose>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">职业</td>
        <td align="left" colspan="3">
            <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="profession">




                <option value="${personFamilyMember.profession}">${personFamilyMember.profession}</option>
            </select>
        </td>
        <td align="center" bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
        <td align="left" colspan="3">
            <input class="input-small" type="text" name="familyMemberCerNum" value="${personFamilyMember.familyMemberCerNum}"
                   style="width: 270px;height: 30px; margin-top: 5px;">
        </td>
    </tr>
</core:forEach>
</tbody>
</table>
</div>
</div>
</div>
<!--2-->
<div class="tab-pane" id="tab2">
<div class="pad-10">
<div class="table-list">
<table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
<tbody>
<tr>
    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
        您目前使用我行（社）的哪些产品
    </td>
    <td align="left" colspan="3">
        <core:forEach items="${usedProducts}" var="usedProduct">
                <input type="text" value="${usedProduct}" style="display: none" class="usedProduct"/>
        </core:forEach>
        <label class="checkbox inline">
            <input type="checkbox" class="存款" value="存款" name="" > 存款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="贷款" value="贷款" name=""> 贷款
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="信用卡" value="信用卡" name=""> 信用卡
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="POS机" value="POS机" name="" > POS机
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="保管箱" value="保管箱" name="" > 保管箱
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="网上银行" value="网上银行" name="" > 网上银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="居家银行" value="居家银行" name="" > 居家银行
        </label>
        <br>
        <label class="checkbox inline">
            <input type="checkbox" class="短信银行" value="短信银行" name="" > 短信银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="电话银行" value="电话银行" name="" > 电话银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="手机银行" value="手机银行" name="" > 手机银行
        </label>
        <label class="checkbox inline">
            <input type="checkbox" class="其他" value="其他" name="" > 其他
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
        如果需要贷款的话,您计划用这笔贷款做什么？
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
            <input type="checkbox" id="inlineCheckbox52" value="option3"> 个人理财服务,需要
        </label>
        <input type="text" name="" value=""
               style="width: 55px;height: 25px; margin-top: 5px;">项目
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        除了上述业务,您还需要哪些服务？
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
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;" name=""></textarea>
    </td>
</tr>
<tr>
    <td align="center"  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
        您对我行（社）服务有何建议？
    </td>
    <td align="left" colspan="2">
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;" name=""></textarea>
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
        <textarea rows="3" style="width: 355px;height: 85px; margin-top: 5px;" name=""></textarea>
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
<div class="table-list">
<table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
<tbody>

<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        一、客户基本资料真实性
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="truth">
            <core:choose>
                <core:when test="${villageManagerEvaList.truth=='基本准确'}">
                    <option value="${villageManagerEvaList.truth}" selected="selected">基本准确</option>
                    <option value="有所保留">有所保留</option>
                    <option value="有一定差距">有一定差距</option>
                    <option value="有较大差距">有较大差距</option>
                </core:when>
                <core:when test="${villageManagerEvaList.truth=='有所保留'}">
                    <option value="基本准确">基本准确</option>
                    <option value="${villageManagerEvaList.truth}" selected="selected">有所保留</option>
                    <option value="有一定差距">有一定差距</option>
                    <option value="有较大差距">有较大差距</option>
                </core:when>
                <core:when test="${villageManagerEvaList.truth=='有一定差距'}">
                    <option value="基本准确">基本准确</option>
                    <option value="有所保留">有所保留</option>
                    <option value="${villageManagerEvaList.truth}" selected="selected">有一定差距</option>
                    <option value="有较大差距">有较大差距</option>
                </core:when>
                <core:otherwise>
                    <option value="基本准确">基本准确</option>
                    <option value="有所保留">有所保留</option>
                    <option value="有一定差距">有一定差距</option>
                    <option value="${villageManagerEvaList.truth}" selected="selected">有较大差距</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        二、本地居住时间（农户）
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="localLivingTime">
            <core:choose>
                <core:when test="${villageManagerEvaList.localLivingTime=='5年(含)以下'}">
                    <option value="${villageManagerEvaList.localLivingTime}" selected="selected">5年(含)以下</option>
                    <option value="6年(含)以上">6年(含)以上</option>
                </core:when>
                <core:otherwise>
                    <option value="5年(含)以下">5年(含)以下</option>
                    <option value="${villageManagerEvaList.localLivingTime}" selected="selected">6年(含)以上</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        三、经营能力
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="operatingCapacity">
            <core:choose>
                <core:when test="${villageManagerEvaList.operatingCapacity=='经验丰富,技术水平高,能力强'}">
                    <option value="${villageManagerEvaList.operatingCapacity}" selected="selected">经验丰富,技术水平高,能力强</option>
                    <option value="经验丰富,技术水平高,能力较强">经验丰富,技术水平高,能力较强</option>
                    <option value="经验,技术水和能力均一般">经验,技术水和能力均一般</option>
                    <option value="经验较欠缺,技术水平和能力较低">经验较欠缺,技术水平和能力较低</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operatingCapacity=='经验丰富,技术水平高,能力较强'}">
                    <option value="经验丰富,技术水平高,能力强">经验丰富,技术水平高,能力强</option>
                    <option value="${villageManagerEvaList.operatingCapacity}" selected="selected">经验丰富,技术水平高,能力较强</option>
                    <option value="经验,技术水和能力均一般">经验,技术水和能力均一般</option>
                    <option value="经验较欠缺,技术水平和能力较低">经验较欠缺,技术水平和能力较低</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operatingCapacity=='经验,技术水和能力均一般'}">
                    <option value="经验丰富,技术水平高,能力强">经验丰富,技术水平高,能力强</option>
                    <option value="经验丰富,技术水平高,能力较强">经验丰富,技术水平高,能力较强</option>
                    <option value="${villageManagerEvaList.operatingCapacity}" selected="selected">经验,技术水和能力均一般</option>
                    <option value="经验较欠缺,技术水平和能力较低">经验较欠缺,技术水平和能力较低</option>
                </core:when>
                <core:otherwise>
                    <option value="经验丰富,技术水平高,能力强">经验丰富,技术水平高,能力强</option>
                    <option value="经验丰富,技术水平高,能力较强">经验丰富,技术水平高,能力较强</option>
                    <option value="经验,技术水和能力均一般">经验,技术水和能力均一般</option>
                    <option value="${villageManagerEvaList.operatingCapacity}" selected="selected">经验较欠缺,技术水平和能力较低</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        四、项目潜质
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="projectPotential">
            <core:choose>
                <core:when test="${villageManagerEvaList.projectPotential=='优秀'}">
                    <option value="${villageManagerEvaList.projectPotential}" selected="selected">优秀</option>
                    <option value="良好">良好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                </core:when>
                <core:when test="${villageManagerEvaList.projectPotential=='良好'}">
                    <option value="优秀">优秀</option>
                    <option value="${villageManagerEvaList.projectPotential}" selected="selected">良好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                </core:when>
                <core:when test="${villageManagerEvaList.projectPotential=='一般'}">
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="${villageManagerEvaList.projectPotential}" selected="selected">一般</option>
                    <option value="差">差</option>
                </core:when>
                <core:otherwise>
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.projectPotential}" selected="selected">差</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        五、市场经营风险
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="operationalRisks">
            <core:choose>
                <core:when test="${villageManagerEvaList.operationalRisks=='很低'}">
                    <option value="${villageManagerEvaList.operationalRisks}" selected="selected">很低</option>
                    <option value="较低">较低</option>
                    <option value="一般">一般</option>
                    <option value="较高">较高</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operationalRisks=='较低'}">
                    <option value="很低">很低</option>
                    <option value="${villageManagerEvaList.operationalRisks}" selected="selected">较低</option>
                    <option value="一般">一般</option>
                    <option value="较高">较高</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operationalRisks=='一般'}">
                    <option value="很低">很低</option>
                    <option value="较低">较低</option>
                    <option value="${villageManagerEvaList.operationalRisks}" selected="selected">一般</option>
                    <option value="较高">较高</option>
                </core:when>
                <core:otherwise>
                    <option value="很低">很低</option>
                    <option value="较低">较低</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.operationalRisks}" selected="selected">较高</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        六、市场竞争力和发展前景
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="developmentProspects">
            <core:choose>
                <core:when test="${villageManagerEvaList.developmentProspects=='很好'}">
                    <option value="${villageManagerEvaList.developmentProspects}" selected="selected">很好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="较高">较高</option>
                </core:when>
                <core:when test="${villageManagerEvaList.developmentProspects=='较好'}">
                    <option value="很好">很好</option>
                    <option value="${villageManagerEvaList.developmentProspects}" selected="selected">较好</option>
                    <option value="一般">一般</option>
                    <option value="较高">较高</option>
                </core:when>
                <core:when test="${villageManagerEvaList.developmentProspects=='一般'}">
                    <option value="很好">很好</option>
                    <option value="较好">较好</option>
                    <option value="${villageManagerEvaList.developmentProspects}" selected="selected">一般</option>
                    <option value="较差">较差</option>
                </core:when>
                <core:otherwise>
                    <option value="很好">很好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.developmentProspects}" selected="selected">较差</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        七、生产经营力或工作稳定情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="operatingStability">
            <core:choose>
                <core:when test="${villageManagerEvaList.operatingStability=='强'}">
                    <option value="${villageManagerEvaList.operatingStability}" selected="selected">强</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operatingStability=='中等'}">
                    <option value="强">强</option>
                    <option value="${villageManagerEvaList.operatingStability}" selected="selected">中等</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operatingStability=='一般'}">
                    <option value="强">强</option>
                    <option value="中等">中等</option>
                    <option value="${villageManagerEvaList.operatingStability}" selected="selected">一般</option>
                    <option value="差">差</option>
                    <option value="">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.operatingStability=='差'}">
                    <option value="强">强</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.operatingStability}" selected="selected">差</option>
                    <option value="">不清楚</option>
                </core:when>
                <core:otherwise>
                    <option value="强">强</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="${villageManagerEvaList.operatingStability}" selected="selected">不清楚</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        八、家庭人均纯收入水平（农户）
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="capitaNetIncomeLevel">
            <core:choose>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='高收入'}">
                    <option value="${villageManagerEvaList.capitaNetIncomeLevel}" selected="selected">高收入</option>
                    <option value="中高收入">中高收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中低收入">中低收入</option>
                    <option value="低收入">低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='中等'}">
                    <option >高收入</option>
                    <option value="${villageManagerEvaList.capitaNetIncomeLevel}" selected="selected">中高收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中低收入">中低收入</option>
                    <option value="低收入">低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='一般'}">
                    <option value="高收入">高收入</option>
                    <option value="中高收入">中高收入</option>
                    <option value="${villageManagerEvaList.capitaNetIncomeLevel}" selected="selected">中等收入</option>
                    <option value="中低收入">中低收入</option>
                    <option value="低收入">低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='差'}">
                    <option value="高收入">高收入</option>
                    <option value="中高收入">中高收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="${villageManagerEvaList.capitaNetIncomeLevel}" selected="selected">中低收入</option>
                    <option value="低收入">低收入</option>
                </core:when>
                <core:otherwise>
                    <option value="高收入">高收入</option>
                    <option value="中高收入">中高收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中低收入">中低收入</option>
                    <option value="${villageManagerEvaList.capitaNetIncomeLevel}" selected="selected">低收入</option>
                </core:otherwise>
            </core:choose> 
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        九、家庭人均可支配收入水平（非农户）
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="disposableIncomeLevel">
            <core:choose>
                <core:when test="${villageManagerEvaList.disposableIncomeLevel=='最高收入'}">
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='高收入'}">
                    <option value="最高收入">最高收入</option>
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='中等偏上收入'}">
                    <option value="最高收入">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option  value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='中等收入'}">
                    <option value="最高收入">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='中等偏下收入'}">
                    <option value="最高收入">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:when test="${villageManagerEvaList.capitaNetIncomeLevel=='低收入'}">
                    <option value="最高收入">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">低收入</option>
                    <option value="最低收入">最低收入</option>
                </core:when>
                <core:otherwise>
                    <option value="最高收入">最高收入</option>
                    <option value="高收入">高收入</option>
                    <option value="中等偏上收入">中等偏上收入</option>
                    <option value="中等收入">中等收入</option>
                    <option value="中等偏下收入">中等偏下收入</option>
                    <option value="低收入">低收入</option>
                    <option value="${villageManagerEvaList.disposableIncomeLevel}" selected="selected">最低收入</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十、家庭财产水平
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="familyPropertyLevel">
            <core:choose>
                <core:when test="${villageManagerEvaList.familyPropertyLevel=='富足家庭'}">
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">富足家庭</option>
                    <option value="富裕家庭">富裕家庭</option>
                    <option value="殷实家庭">殷实家庭</option>
                    <option value="一般家庭">一般家庭</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.familyPropertyLevel=='富裕家庭'}">
                    <option value="富足家庭">富足家庭</option>
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">富裕家庭</option>
                    <option value="殷实家庭">殷实家庭</option>
                    <option value="一般家庭">一般家庭</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.familyPropertyLevel=='殷实家庭'}">
                    <option value="富足家庭">富足家庭</option>
                    <option value="富裕家庭">富裕家庭</option>
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">殷实家庭</option>
                    <option value="一般家庭">一般家庭</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.familyPropertyLevel=='一般家庭'}">
                    <option value="富足家庭">富足家庭</option>
                    <option value="富裕家庭">富裕家庭</option>
                    <option value="殷实家庭">殷实家庭</option>
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">一般家庭</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.familyPropertyLevel=='较差家庭'}">
                    <option value="富足家庭">富足家庭</option>
                    <option value="富裕家庭">富裕家庭</option>
                    <option value="殷实家庭">殷实家庭</option>
                    <option value="一般家庭">一般家庭</option>
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:otherwise>
                    <option value="富足家庭">富足家庭</option>
                    <option value="富裕家庭">富裕家庭</option>
                    <option value="殷实家庭">殷实家庭</option>
                    <option value="一般家庭">一般家庭</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="${villageManagerEvaList.familyPropertyLevel}" selected="selected">贫困家庭</option>
                </core:otherwise>
            </core:choose> 
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十一、税费缴纳情况（含土地、房产款项）
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="payTaxes">
            <core:choose>
                <core:when test="${villageManagerEvaList.payTaxes=='正常缴纳'}">
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">正常缴纳</option>
                    <option value="拖欠罚款2次(含)以内">拖欠罚款2次(含)以内</option>
                    <option value="拖欠罚款2次以上">拖欠罚款2次以上</option>
                    <option value="拖欠超过1年">拖欠超过1年</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.payTaxes=='拖欠罚款2次(含)以内'}">
                    <option value="正常缴纳">正常缴纳</option>
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">拖欠罚款2次(含)以内</option>
                    <option value="拖欠罚款2次以上">拖欠罚款2次以上</option>
                    <option value="拖欠超过1年">拖欠超过1年</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.payTaxes=='拖欠罚款2次以上'}">
                    <option value="正常缴纳">正常缴纳</option>
                    <option value="拖欠罚款2次(含)以内">拖欠罚款2次(含)以内</option>
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">拖欠罚款2次以上</option>
                    <option value="拖欠超过1年">拖欠超过1年</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.payTaxes=='拖欠超过1年'}">
                    <option value="正常缴纳">正常缴纳</option>
                    <option value="拖欠罚款2次(含)以内">拖欠罚款2次(含)以内</option>
                    <option value="拖欠罚款2次以上">拖欠罚款2次以上</option>
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">拖欠超过1年</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:when test="${villageManagerEvaList.payTaxes=='较差家庭'}">
                    <option value="正常缴纳">正常缴纳</option>
                    <option value="拖欠罚款2次(含)以内">拖欠罚款2次(含)以内</option>
                    <option value="拖欠罚款2次以上">拖欠罚款2次以上</option>
                    <option value="拖欠超过1年">拖欠超过1年</option>
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">较差家庭</option>
                    <option value="贫困家庭">贫困家庭</option>
                </core:when>
                <core:otherwise>
                    <option value="正常缴纳">正常缴纳</option>
                    <option value="拖欠罚款2次(含)以内">拖欠罚款2次(含)以内</option>
                    <option value="拖欠罚款2次以上">拖欠罚款2次以上</option>
                    <option value="拖欠超过1年">拖欠超过1年</option>
                    <option value="较差家庭">较差家庭</option>
                    <option value="${villageManagerEvaList.payTaxes}" selected="selected">贫困家庭</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十二、敬老情况
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="respectSitu">
            <core:choose>
                <core:when test="${villageManagerEvaList.respectSitu=='好'}">
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.respectSitu=='较好'}">
                    <option value="好">好</option>
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.respectSitu=='一般'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.respectSitu=='差'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.respectSitu=='很差'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:otherwise>
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="${villageManagerEvaList.respectSitu}" selected="selected">不清楚</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十三、邻里关系
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="neighborhood">
            <core:choose>
                <core:when test="${villageManagerEvaList.neighborhood=='好'}">
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.neighborhood=='较好'}">
                    <option value="好">好</option>
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.neighborhood=='一般'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.neighborhood=='差'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">差</option>
                    <option value="很差">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.neighborhood=='很差'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">很差</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:otherwise>
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="差">差</option>
                    <option value="很差">很差</option>
                    <option value="${villageManagerEvaList.neighborhood}" selected="selected">不清楚</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十四、对公益事业关心程度
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="publicWelfareLevel">
            <core:choose>
                <core:when test="${villageManagerEvaList.publicWelfareLevel=='高'}">
                    <option value="${villageManagerEvaList.publicWelfareLevel}" selected="selected">高</option>
                    <option value="较高">较高</option>
                    <option value="一般">一般</option>
                    <option value="从不关心">从不关心</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.publicWelfareLevel=='较高'}">
                    <option value="高">高</option>
                    <option value="${villageManagerEvaList.publicWelfareLevel}" selected="selected">较高</option>
                    <option value="一般">一般</option>
                    <option value="从不关心">从不关心</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.publicWelfareLevel=='一般'}">
                    <option value="高">高</option>
                    <option value="较高">较高</option>
                    <option value="${villageManagerEvaList.publicWelfareLevel}" selected="selected">一般</option>
                    <option value="从不关心">从不关心</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.publicWelfareLevel=='从不关心'}">
                    <option value="高">高</option>
                    <option value="较高">较高</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.publicWelfareLevel}" selected="selected">从不关心</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:otherwise>
                    <option value="高">高</option>
                    <option value="较高">较高</option>
                    <option value="一般">一般</option>
                    <option value="从不关心">从不关心</option>
                    <option value="${villageManagerEvaList.publicWelfareLevel}" selected="selected">不清楚</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十五、信誉情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="creditworthiness">
            <core:choose>
                <core:when test="${villageManagerEvaList.creditworthiness=='好'}">
                    <option value="${villageManagerEvaList.creditworthiness}" selected="selected">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                </core:when>
                <core:when test="${villageManagerEvaList.creditworthiness=='较好'}">
                    <option value="好">好</option>
                    <option value="${villageManagerEvaList.creditworthiness}" selected="selected">较好</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                </core:when>
                <core:when test="${villageManagerEvaList.creditworthiness=='一般'}">
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="${villageManagerEvaList.creditworthiness}" selected="selected">一般</option>
                    <option value="较差">较差</option>
                </core:when>
                <core:otherwise>
                    <option value="好">好</option>
                    <option value="较好">较好</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.creditworthiness}" selected="selected">较差</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十六、个人品行综合评价
    </td>
    <td align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="conduct">
            <core:choose>
                <core:when test="${villageManagerEvaList.conduct=='优秀'}">
                    <option value="${villageManagerEvaList.conduct}" selected="selected">优秀</option>
                    <option value="良好">良好</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                    <option value="有不良或违法、违规行为">有不良或违法、违规行为</option>
                </core:when>
                <core:when test="${villageManagerEvaList.conduct=='良好'}">
                    <option value="优秀">优秀</option>
                    <option value="${villageManagerEvaList.conduct}" selected="selected">良好</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                    <option value="有不良或违法、违规行为">有不良或违法、违规行为</option>
                </core:when>
                <core:when test="${villageManagerEvaList.conduct=='中等'}">
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="${villageManagerEvaList.conduct}" selected="selected">中等</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                    <option value="有不良或违法、违规行为">有不良或违法、违规行为</option>
                </core:when>
                <core:when test="${villageManagerEvaList.conduct=='一般'}">
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="中等">中等</option>
                    <option value="${villageManagerEvaList.conduct}" selected="selected">一般</option>
                    <option value="较差">较差</option>
                    <option value="有不良或违法、违规行为">有不良或违法、违规行为</option>
                </core:when>
                <core:when test="${villageManagerEvaList.conduct=='较差'}">
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="${villageManagerEvaList.conduct}" selected="selected">较差</option>
                    <option value="有不良或违法、违规行为">有不良或违法、违规行为</option>
                </core:when>
                <core:otherwise>
                    <option value="优秀">优秀</option>
                    <option value="良好">良好</option>
                    <option value="中等">中等</option>
                    <option value="一般">一般</option>
                    <option value="较差">较差</option>
                    <option value="${villageManagerEvaList.conduct}" selected="selected">有不良或违法、违规行为</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十七、受表彰情况
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="praised">
            <core:choose>
                <core:when test="${villageManagerEvaList.praised=='有'}">
                    <option value="${villageManagerEvaList.praised}" selected="selected">有</option>
                    <option value="无">无</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:when test="${villageManagerEvaList.praised=='无'}">
                    <option value="有">有</option>
                    <option value="${villageManagerEvaList.praised}" selected="selected">无</option>
                    <option value="不清楚">不清楚</option>
                </core:when>
                <core:otherwise>
                    <option value="有">有</option>
                    <option value="无">无</option>
                    <option value="${villageManagerEvaList.praised}" selected="selected">不清楚</option>
                </core:otherwise>
            </core:choose>
        </select>
    </td>
</tr>
<tr>
    <td align="left" bgcolor="#b4d8ed" style="color:#161823">
        十八、其他补充
    </td>
    <td align="left">
        <input type="text" name="supplement" value="${villageManagerEvaList.supplement}"
               style="width: 270px; height: 30px;margin-top: 5px;">
    </td>
</tr>
<tr>
    <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
        十九、是否为我行（社）重点服务对象
    </td>
    <td width="73%" align="left">
        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="importantObject">
            <core:choose>
                <core:when test="${villageManagerEvaList.importantObject=='是'}">
                    <option value="${villageManagerEvaList.importantObject}" selected="selected">是</option>
                    <option value="否">否</option>
                    <option value="一般">一般</option>
                </core:when>
                <core:when test="${villageManagerEvaList.importantObject=='否'}">
                    <option value="是">是</option>
                    <option value="${villageManagerEvaList.importantObject}" selected="selected">否</option>
                    <option value="一般">一般</option>
                </core:when>
                <core:otherwise>
                    <option value="是">是</option>
                    <option value="否">否</option>
                    <option value="${villageManagerEvaList.importantObject}" selected="selected">一般</option>
                </core:otherwise>
            </core:choose>
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
            <table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
                <tbody>
                <tr>
                    <td width="27%" align="center" bgcolor="#b4d8ed" style="color:#161823">
                        客户在他行贷款情况
                    </td>
                    <td width="73%" align="left">
                        <input type="text" name="loanSitu" value="${customerManagerEvaList.loanSitu}"
                               style="width: 270px;height: 30px; margin-top: 5px;">
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                        个人银行信用记录
                    </td>
                    <td align="left">            <%--${customerManagerEvaList.creditRecord}  --%>
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox111" value="option3">
                            报告期内能积极主动按期偿本付息,无违约记录
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
                        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="otherBankRecord">
                            <option value="${customerManagerEvaList.otherBankRecord}">良好</option>
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
                        <select class="selectpicker" style="width: 270px; margin-top: 5px;" name="houseToMoney">
                            <option value="${customerManagerEvaList.houseToMoney}">优秀</option>
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