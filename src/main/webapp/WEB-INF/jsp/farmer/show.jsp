<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <link id="bs-css" href="/asserts/css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <link href="/asserts/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/asserts/css/charisma-app.css" rel="stylesheet">
    <link href="/asserts/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <!--[if IE 8]><link rel="stylesheet" href="/asserts/css/bootstrap-ie8buttonfix.css"><![endif]-->

    <link rel="stylesheet" href="/asserts/css/jquery.fancybox.css"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/modernizr.js"></script>
    <script src="/asserts/js/main.js"></script>
    <script src="/asserts/js/jquery.fancybox.js"></script>
    <script src="/asserts/js/IE8.js"></script>
    <script src="/asserts/js/jquery-ui-1.8.21.custom.min.js"></script>
    <!-- select or dropdown enhancer -->
    <script src="/asserts/js/jquery.chosen.min.js"></script>
    <!-- checkbox, radio, and file input styler -->
    <script src="/asserts/js/jquery.uniform.min.js"></script>
    <script src="/asserts/js/app.js"></script>

    <script type="text/javascript">
        $(function(){

            //左侧菜单样式控制
            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
            var id='${recordId}';

            $("#appoint").click(function(){
                debugger;
                $("#appoint").fancybox({
                    'height':200,
                    'autoScale':'false',
                    'transitionIn'		: 'elastic',
                    'transitionOut'		: 'elastic',
                    'hideOnContentClick': 'false',
                    'hideOnOverlayClick': 'false',
                    'closeBtn' : false,
                    'type':'ajax',
                    closeClick  : false, // prevents closing when clicking INSIDE fancybox
                    helpers   : {
                        overlay : {closeClick: false} // prevents closing when clicking OUTSIDE fancybox
                    }
                })
            });

            $('#delete').click(function(){
                if (confirm('确定要删除吗？')) {
                    var url="/family/delete/"+id;
                    window.location.href=url;
                }
            });
            $('#check').click(function(){
                $("#check").fancybox({
                    'transitionIn'		: 'elastic',
                    'transitionOut'		: 'elastic',
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });

                $('#checkOkOperate').click(function () {
                    var state = $('#state').val();
                    var recordId = $('#recordId').val();
                    if(state && state!=''){
                        var url = '/family/saveBatchChecks/'+recordId+'/'+state;
                        window.location.href = url;
                    }else{
                        alert("未选择验收结果！");
                    }
                });
            });
            $('#editor').click(function(){
                var url = '/family/edit/'+id;
                window.location.href=url;
            });

            $('#photo').click(function(){
                var imgs = new Array()
                $(".img").each(function( index,element ) {
                    imgs[index] = $(element).attr('img')
                });
                $.fancybox(imgs, {
                    'padding'			: 0,
                    'transitionIn'		: 'none',
                    'transitionOut'		: 'none',
                    'type'              : 'image',
                    'changeFade'        : 0
                });
            });

        });
    </script>

</head>
<body>

<!-- topbar starts -->
<div class="top" style="padding-bottom: 5px;">
    <div class="row" style="margin-left: 2px;margin-top: -40px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="145" background="/asserts/img/head.png">
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="60%" height="145"><img src="/asserts/img/logo.png" width="500" height="145" /></td>
                            <td width="40%" align="right" valign="bottom" >
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！<span>[<c:out value="${displayUserName}"/>]</span><a href="/logout" style="color:#FFFFFF">&nbsp;退出</a>
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

        <!-- left menu starts -->
        <div class="span2 main-menu-span">
            <div class="well nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li><a href="/index"><i class="icon-home"></i><span class="hidden-tablet">客户电子信息管理</span></a></li>
                    <core:if test="${userName == 'admin'}">
                        <li><a href="/photo/home"><i class="icon-wrench"></i><span class="hidden-tablet">客户照片管理</span></a></li>
                        <li><a href="/clientManager"><i class="icon-wrench"></i><span class="hidden-tablet">客户端管理</span></a></li>
                        <li><a href="/accountManager"><i class="icon-user"></i><span class="hidden-tablet">系统账号管理</span></a></li>
                        <%--<li><a href="/roleManager"><i class="icon-user"></i><span class="hidden-tablet">系统角色管理</span></a></li>--%>
                        <li><a href="/systemLogManager"><i class="icon-certificate"></i><span class="hidden-tablet">系统日志</span></a></li>
                    </core:if>
                </ul>
            </div><!--/.well -->
        </div><!--/span-->
        <!-- left menu ends -->

        <div id="content" class="span10">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">客户电子信息管理</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">查看</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid">
                <div class="box span12">
                     <div class="box-content">
                        <table class="table table-bordered table-striped table-condensed">
                            <tbody>
                            <core:forEach items="${personInfoList}" var="personInfo">
                                <tr>
                                    <td>户主：</td>
                                    <td>${personInfo.customerName}</td>
                                    <td>电话：</td>
                                    <td>${personInfo.telephone == '' || personInfo.telephone == null ? '&nbsp;' : personInfo.telephone}</td>
                                    <td>收集单位：</td>
                                    <td>${personInfo.organizationName == '' || personInfo.organizationName == null ? '&nbsp;' : personInfo.organizationName}</td>
                                    <td>收集人：</td>
                                    <td>${personInfo.displayUserName == '' || personInfo.displayUserName == null ? '&nbsp;' : personInfo.displayUserName}</td>
                                </tr>
                            </core:forEach>
                            </tbody>
                        </table>
                        <p class="text-center">
                            <core:if test="${personBasicList.state == 0 or personBasicList.state == null or personBasicList.state == ''}">
                                <a class="btn" type="button" href="/family/appoint/${recordId}" id="appoint">指派</a>
                            </core:if>
                            <core:if test="${personBasicList.state==1}">
                                <a href='#checkDiv' class="btn" id="check">验收</a>
                            </core:if>
                            <core:if test="${personBasicList.state!=3}">
                                <button class="btn" type="button" id="editor">编辑</button>
                                <button class="btn" type="button" id="delete">删除</button>
                            </core:if>
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
                                    <div class="table-list">
                                            <table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
                                                <tbody>
                                                <core:choose>
                                                    <core:when test="${empty personBasicList}">
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">姓名</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">性别</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">是否农户</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">客户类型</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">证件类型</td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td colspan="2" rowspan="4">照片</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">证件有效期</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">出生年月</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">国籍</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">是否拥有外国护照或居住权</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">民族</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">政治面貌</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">健康状况</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">婚姻状况</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                居住地址
                                                            </td>
                                                            <td colspan="5">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">居住编码</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                区域名称
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">村别</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">联系电话</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">手机号码</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                居住状况
                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">社会保障情况</td>
                                                            <td colspan="4">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                最高学位
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">最高学历</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">与我行（社）关系</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">与我行（社）合作关系</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                职业
                                                            </td>
                                                            <td colspan="7">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                个人经营项目
                                                            </td>
                                                            <td colspan="4">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">经营年限</td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                经营场所
                                                            </td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">从事行业</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823"> 年收益情况</td>
                                                            <td colspan="7">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">工作情况</td>
                                                            <td colspan="7">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">单位性质</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">单位所属行业</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">任职部门</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">工作单位类别</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">职务</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">年工资收入（万元）</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">工作年限</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">职称</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                <core:otherwise>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">姓名</td>
                                                    <td>${personBasicList.customerName}&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">性别</td>
                                                    <td>
                                                        <core:out value="${personBasicList.gender=='0' ? '女' : '' }"/>
                                                        <core:out value="${personBasicList.gender=='1' ? '男' : '' }"/>
                                                    </td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">是否农户</td>
                                                    <td><core:out value="${personBasicList.farmer=='1' ? '是' : '否' }"/>&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">客户类型</td>
                                                    <td>${personBasicList.customerType}&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">证件类型</td>
                                                    <td>${personBasicList.cerType}&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
                                                    <td colspan="3">${personBasicList.cerNum}&nbsp;</td>
                                                    <core:choose>
                                                        <core:when test="${empty imgList}">
                                                            <td colspan="2" rowspan="8">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="2" rowspan="8">
                                                                    <%--<ul id="pikame">
                                                                        <core:forEach items="${imgList}" var="img" varStatus="idx">
                                                                            <li><img src="/img/${img}" class="img-rounded photo"></li>
                                                                        </core:forEach>
                                                                    </ul>--%>
                                                                <core:forEach items="${imgList}" var="img" varStatus="idx">
                                                                    <div style="hidden:hidden" img="/img/${img}" class="img"></div>
                                                                </core:forEach>
                                                                <img id="photo" src="/img/${imgList[0]}" class="img-rounded photo" style="width: 300px;height: 192px;">
                                                            </td>
                                                        </core:otherwise>
                                                    </core:choose>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">证件有效期</td>
                                                    <td>${personBasicList.cerValidityFrom} - ${personBasicList.cerValidityTo}&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">出生年月</td>
                                                    <td>${personBasicList.birthday}&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">国籍</td>
                                                    <td>${personBasicList.nationality}&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">是否拥有外国护照或居住权</td>
                                                    <td><core:out value="${personBasicList.havePassport=='0' ? '否' : '是'}"/> &nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">民族</td>
                                                    <td>${personBasicList.nation}&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">政治面貌</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.poliLaspect}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.poliLaspect}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">健康状况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.health}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.health}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">婚姻状况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.maritalStatus}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.maritalStatus}</td>
                                                        </core:otherwise>
                                                    </core:choose>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        居住地址
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.address}">
                                                            <td colspan="3">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="3">${personBasicList.address}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">居住编码</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.postcode}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.postcode}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        居住状况
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.liveCondition}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td ><p>${personBasicList.liveCondition}</p></td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">社会保障情况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.socialSecurity}">
                                                            <td colspan="3">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="3"><p>${personBasicList.socialSecurity}</p></td>
                                                        </core:otherwise>
                                                    </core:choose>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        个人经营项目
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.businessProj}">
                                                            <td colspan="2">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="2">${personBasicList.businessProj}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">经营年限</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.businessYear}">
                                                            <td colspan="2">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="2">${personBasicList.businessYear}年</td>
                                                        </core:otherwise>
                                                    </core:choose>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        职业
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.profession}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="5">${personBasicList.profession}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        区域名称
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.areaName}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td><p>${personBasicList.areaName}</p></td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">村别</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.village}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td><p>${personBasicList.village}</p></td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">联系电话</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.telephone}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.telephone}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">手机号码</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.mbPhoneNum}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.mbPhoneNum}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        最高学位
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.highestDegree}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.highestDegree}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">最高学历</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.highestEdu}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.highestEdu}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">与我行（社）关系</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.bankRelation}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.bankRelation}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">与我行（社）合作关系</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.bankPartnership}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.bankPartnership}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">
                                                        经营场所
                                                    </td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.businessSite}">
                                                            <td colspan="3">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="3">${personBasicList.businessSite}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">从事行业</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.industry}">
                                                            <td colspan="3">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="3">${personBasicList.industry}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.businessProp}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.businessProp}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.moneySitu}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.moneySitu}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.inputMoney}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.inputMoney}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.ownMoney}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.ownMoney}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823"> 年收益情况</td>
                                                    <td colspan="7">${personBasicList.yearIncome}&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">工作情况</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.workSitu}">
                                                            <td colspan="7">&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td colspan="7">${personBasicList.workSitu}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">单位性质</td>
                                                    <td colspan="3">${personBasicList.unitProp}&nbsp;</td>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">单位所属行业</td>
                                                    <td colspan="3">${personBasicList.unitIndustryId}&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">任职部门</td>
                                                    <td colspan="3">${personBasicList.department}&nbsp;</td>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">工作单位类别</td>
                                                    <td colspan="5">${personBasicList.unitType}&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td bgcolor="#b4d8ed" style="color:#161823">职务</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.duties}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.duties}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">年工资收入（万元）</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.annualWageIncome}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.annualWageIncome}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">工作年限</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.workYears}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.workYears}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                    <td bgcolor="#b4d8ed" style="color:#161823">职称</td>
                                                    <core:choose>
                                                        <core:when test="${empty personBasicList.workTitle}">
                                                            <td>&nbsp;</td>
                                                        </core:when>
                                                        <core:otherwise>
                                                            <td>${personBasicList.workTitle}</td>
                                                        </core:otherwise>
                                                    </core:choose>

                                                </tr>
                                                </core:otherwise>
                                                </core:choose>


                                                <tr>
                                                    <td colspan="8" style="font-size:22px">
                                                        家庭收支情况
                                                    </td>
                                                </tr>

                                                <core:choose>
                                                    <core:when test="${empty personIncomeExpensesList}">

                                                        <tr>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                                家庭年总收入（万元）
                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭支出（万元）</td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                收入来源
                                                            </td>
                                                            <td colspan="7">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                                其中：个人年收入（万元）
                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭其他成员年收入（万元）</td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td  bgcolor="#b4d8ed" style="color:#161823">家庭主要支出项目</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">家庭收入能否应付支出</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <tr>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                                家庭年总收入（万元）
                                                            </td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.fmAllIncome}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="2">${personIncomeExpensesList.fmAllIncome}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭支出（万元）</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.fmExpenses}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="2">${personIncomeExpensesList.fmExpenses}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                收入来源
                                                            </td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.incomeSrc}">
                                                                    <td colspan="7">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="7">${personIncomeExpensesList.incomeSrc}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                                其中：个人年收入（万元）
                                                            </td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.perIncome}">
                                                                    <td colspan="2">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <core:choose>
                                                                        <core:when test="${personIncomeExpensesList.perIncome=='0.0000'}">
                                                                            <td colspan="2">0</td>
                                                                        </core:when>
                                                                        <core:otherwise>
                                                                            <td colspan="2">${personIncomeExpensesList.perIncome}</td>
                                                                        </core:otherwise>
                                                                    </core:choose>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td colspan="2" bgcolor="#b4d8ed" style="color:#161823">家庭其他成员年收入（万元）</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.fmOtherMemberIn}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="2">${personIncomeExpensesList.fmOtherMemberIn}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资经营性质</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.businessProp}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personIncomeExpensesList.businessProp}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">投资资金情况</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.moneySitu}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personIncomeExpensesList.moneySitu}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">投入金额</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.inputMoney}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personIncomeExpensesList.inputMoney}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">自有资金情况</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.ownMoney}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personIncomeExpensesList.ownMoney}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                        </tr>
                                                        <tr>
                                                            <td  bgcolor="#b4d8ed" style="color:#161823">家庭主要支出项目</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.fmExpensesProj}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="3">${personIncomeExpensesList.fmExpensesProj}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">家庭收入能否应付支出</td>
                                                            <core:choose>
                                                                <core:when test="${empty personIncomeExpensesList.fmInOutRatio}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="3">${personIncomeExpensesList.fmInOutRatio}</td>
                                                                </core:otherwise>
                                                            </core:choose>
                                                        </tr>
                                                    </core:otherwise>
                                                </core:choose>


                                                <tr>
                                                    <td colspan="8" style="font-size:22px">
                                                        家庭资产情况
                                                    </td>
                                                </tr>
                                                <core:choose>
                                                    <core:when test="${empty personFamilyAssets}">

                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">总资产（万元）</td>
                                                            <td colspan="5">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">主要资产</td>
                                                            <td colspan="5">&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">总资产（万元）</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFamilyAssets.fmAllAssets}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personFamilyAssets.fmAllAssets}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">主要资产</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFamilyAssets.mainAssets}">
                                                                    <td colspan="5">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="5">${personFamilyAssets.mainAssets}</td>
                                                                </core:otherwise>
                                                            </core:choose>
                                                        </tr>
                                                    </core:otherwise>
                                                </core:choose>


                                                <core:choose>
                                                    <core:when test="${empty personHousePropertyInfoList}">
                                                        <tr>
                                                            <td align="left" colspan="8" style="font-size:18px">
                                                                房产：1
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">性质</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">用途</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">层数</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">备注</td>
                                                            <td>&nbsp;</td>
                                                        </tr>

                                                    </core:when>
                                                    <core:otherwise>
                                                        <core:forEach items="${personHousePropertyInfoList}" var="personHousePropertyInfo" varStatus="idx">
                                                            <tr>
                                                                <td align="left" colspan="8" style="font-size:18px">
                                                                    房产：<core:out value="${idx.index+1}"></core:out>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">性质</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.nature}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.nature}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">用途</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.purpose}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.purpose}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">所在位置</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.site}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.site}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">房屋结构</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.structure}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.structure}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">层数</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.floorNum}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.floorNum}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.usedSitu}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.usedSitu}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">建筑面积</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.houseArea}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.houseArea}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">房产价值</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.houseWorth}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.houseWorth}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.installment}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <core:choose>
                                                                            <core:when test="${personHousePropertyInfo.installment=='0'}">
                                                                                <td>否</td>
                                                                            </core:when>
                                                                            <core:otherwise>
                                                                                <td>是</td>
                                                                            </core:otherwise>
                                                                        </core:choose>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">是否办证</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.hasCredentials}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personHousePropertyInfo.hasCredentials}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">备注</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personHousePropertyInfo.note1}">
                                                                        <td colspan="3">&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td colspan="3">${personHousePropertyInfo.note1}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                        </core:forEach>
                                                    </core:otherwise>
                                                </core:choose>

                                                <core:choose>
                                                    <core:when test="${empty personLandInfoList}">
                                                        <tr>
                                                            <td align="left" colspan="8" style="font-size:18px">
                                                                土地：1
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">土地面积</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823" >土地款是否结清</td>
                                                            <td colspan="5">&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <core:forEach items="${personLandInfoList}" var="personLandInfo" varStatus="idx">
                                                            <tr>
                                                                <td align="left" colspan="8" style="font-size:18px">
                                                                    土地：<core:out value="${idx.index+1}"></core:out>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地面积</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.area}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personLandInfo.area}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地价值</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.worth}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personLandInfo.worth}万</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地性质</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.property}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personLandInfo.property}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地类型</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.type}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personLandInfo.type}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地使用情况</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.usedSitu}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personLandInfo.usedSitu}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">土地款是否结清</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personLandInfo.moneyClear}">
                                                                        <td colspan="5">&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <core:choose>
                                                                            <core:when test="${personLandInfo.moneyClear=='0'}">
                                                                                <td colspan="5">否</td>
                                                                            </core:when>
                                                                            <core:otherwise>
                                                                                <td colspan="5">是</td>
                                                                            </core:otherwise>
                                                                        </core:choose>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                        </core:forEach>
                                                    </core:otherwise>
                                                </core:choose>


                                                <core:choose>
                                                    <core:when test="${empty personCarsInfoList}">
                                                        <tr>
                                                            <td align="left" colspan="8" style="font-size:18px">
                                                                车辆：1
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">情况</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <core:forEach items="${personCarsInfoList}" var="personCarsInfo" varStatus="idx">
                                                            <tr>
                                                                <td align="left" colspan="8" style="font-size:18px">
                                                                    车辆：<core:out value="${idx.index+1}"></core:out>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">情况</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personCarsInfo.carsInfo}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personCarsInfo.carsInfo}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">车辆价值</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personCarsInfo.carsWorth}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personCarsInfo.carsWorth}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">是否按揭</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personCarsInfo.carsIsInstallment}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <core:choose>
                                                                            <core:when test="${personCarsInfo.carsIsInstallment=='0'}">
                                                                                <td>否</td>
                                                                            </core:when>
                                                                            <core:otherwise>
                                                                                <td>是</td>
                                                                            </core:otherwise>
                                                                        </core:choose>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">使用情况</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personCarsInfo.carsUsingInfo}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personCarsInfo.carsUsingInfo}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                        </core:forEach>
                                                    </core:otherwise>
                                                </core:choose>

                                                <tr>
                                                    <td align="left" colspan="8" style="font-size:18px">
                                                        使用金融资产情况
                                                    </td>
                                                </tr>
                                                <core:choose>
                                                    <core:when test="${empty personFinancialAssetsList}">
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">情况</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">我社存款</td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">他行存款</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <%--<core:forEach items="${personFinancialAssetsList}" var="personFinancialAssets">--%>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">情况</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFinancialAssetsList.financialInfo}">
                                                                    <td colspan="3">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="3">${personFinancialAssetsList.financialInfo}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">我社存款</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFinancialAssetsList.depositOurBank}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personFinancialAssetsList.depositOurBank}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">他行存款</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFinancialAssetsList.depositOtherBank}">
                                                                    <td>&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td>${personFinancialAssetsList.depositOtherBank}</td>
                                                                </core:otherwise>
                                                            </core:choose>
                                                        </tr>
                                                    </core:otherwise>
                                                </core:choose>

                                                <tr>
                                                    <td colspan="8" style="font-size:22px">
                                                        家庭负债情况
                                                    </td>
                                                </tr>

                                                <core:choose>
                                                    <core:when test="${empty personFamilyIncurDebtsList}">
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                家庭负债总额（万元）
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">本行负债（万元）</td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">他行负债（万元）</td>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">贷款用途</td>
                                                            <td colspan="3">&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">贷款形态</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">
                                                                家庭负债总额（万元）
                                                            </td>
                                                            <td>${personFamilyIncurDebtsList.fmIncurDebts}&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">本行负债（万元）</td>
                                                            <td colspan="2">${personFamilyIncurDebtsList.ourBankDebts}&nbsp;</td>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">他行负债（万元）</td>
                                                            <td colspan="2">${personFamilyIncurDebtsList.otherBankDebts}&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">贷款用途</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFamilyIncurDebtsList.loanPurpose}">
                                                                    <td colspan="3">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="3">${personFamilyIncurDebtsList.loanPurpose}</td>
                                                                </core:otherwise>
                                                            </core:choose>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">贷款形态</td>
                                                            <core:choose>
                                                                <core:when test="${empty personFamilyIncurDebtsList.loanShap}">
                                                                    <td colspan="3">&nbsp;</td>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <td colspan="3">${personFamilyIncurDebtsList.loanShap}</td>
                                                                </core:otherwise>
                                                            </core:choose>
                                                        </tr>
                                                    </core:otherwise>
                                                </core:choose>

                                                <tr>
                                                    <td colspan="8" style="font-size:22px">
                                                        家庭成员基本情况
                                                    </td>
                                                </tr>

                                                <core:choose>
                                                    <core:when test="${empty personFamilyMemberList}">
                                                        <tr>
                                                            <td align="left" colspan="8" style="font-size:18px">
                                                                成员：1
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#b4d8ed" style="color:#161823">姓名</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">年收入（万元）</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">与户主关系</td>
                                                            <td>&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">职业</td>
                                                            <td>&nbsp;</td>

                                                        </tr>
                                                        <tr>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
                                                            <td colspan="3">&nbsp;</td>

                                                            <td bgcolor="#b4d8ed" style="color:#161823">常住地址</td>
                                                            <td colspan="3">&nbsp;</td>
                                                        </tr>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <core:forEach items="${personFamilyMemberList}" var="personFamilyMember" varStatus="idx">
                                                            <tr>
                                                                <td align="left" colspan="8" style="font-size:18px">
                                                                    成员：<core:out value="${idx.index+1}"></core:out>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#b4d8ed" style="color:#161823">姓名</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.familyMemberName}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personFamilyMember.familyMemberName}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">年收入（万元）</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.yearIncome}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personFamilyMember.yearIncome}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">与户主关系</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.leaderRelation}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personFamilyMember.leaderRelation}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">职业</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.profession}">
                                                                        <td>&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td>${personFamilyMember.profession}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                            </tr>
                                                            <tr>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">证件号码</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.familyMemberCerNum}">
                                                                        <td colspan="3">&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td colspan="3">${personFamilyMember.familyMemberCerNum}</td>
                                                                    </core:otherwise>
                                                                </core:choose>

                                                                <td bgcolor="#b4d8ed" style="color:#161823">常住地址</td>
                                                                <core:choose>
                                                                    <core:when test="${empty personFamilyMember.address}">
                                                                        <td colspan="3">&nbsp;</td>
                                                                    </core:when>
                                                                    <core:otherwise>
                                                                        <td colspan="3">${personFamilyMember.address}</td>
                                                                    </core:otherwise>
                                                                </core:choose>
                                                            </tr>
                                                        </core:forEach>
                                                    </core:otherwise>
                                                </core:choose>
                                                </tbody>
                                             </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab2">
                                <div class="pad-10">
                                   <div class="table-list">
                                            <table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
                                            <tbody>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您目前使用我行（社）的哪些产品
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.usedProduct}">
                                                        <td colspan="3">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="3">${financeService.usedProduct}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>

                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您对我行（社）产品满意度
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.satisfaction}">
                                                        <td colspan="3">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="3">${financeService.satisfaction}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您在未来两年内是否有资金需求
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.moneyNeedReadable}">
                                                        <td colspan="3">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="3">${financeService.moneyNeedReadable}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td rowspan="3" bgcolor="#b4d8ed" style="color:#161823">
                                                    如果需要贷款的话，您计划用这笔贷款做什么？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.moneyTodo}">
                                                        <td rowspan="3">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td rowspan="3">${financeService.moneyTodo}</td>
                                                    </core:otherwise>
                                                </core:choose>

                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您希望得到的贷款金额是多少？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.moneyCount}">
                                                        <td>&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td>${financeService.moneyCount}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您可以提供的担保物有？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.guarantee}">
                                                        <td>&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td>${financeService.guarantee}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    您希望得到的贷款期限是多久？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.timeLimit}">
                                                        <td>&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td>${financeService.timeLimit}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                    未来1-2年家庭储蓄的主要目的和用途？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.fmDepositTodo}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.fmDepositTodo}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                    您目前希望得到我行（社）的哪些服务？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.needServices}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.needServices}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                    除了上述业务，您还需要哪些服务？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.needServicesElse}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.needServicesElse}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                    您希望我行（社）增加哪些方面的服务？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.holpForServices}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.holpForServices}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td  colspan="2" bgcolor="#b4d8ed" style="color:#161823">
                                                    您对我行（社）服务有何建议？
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.suggestion}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.suggestion}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td rowspan="7" bgcolor="#b4d8ed" style="color:#161823">
                                                    金融业务需求
                                                </td>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    金融业务需求
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.bankCard}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.bankCard}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    电子银行业务
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.electronBank}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.electronBank}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    代缴代扣业务
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.agentPay}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.agentPay}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    自助机具业务
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.auto}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.auto}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    对私贷款业务
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.privateLoan}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.privateLoan}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    对公贷款业务
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.publicLoan}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.publicLoan}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    客户新需求登记
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty financeService.newRequirement}">
                                                        <td colspan="2">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td colspan="2">${financeService.newRequirement}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            </tbody>
                                        </table>
                                   </div>
                                </div>
                            </div>

                             <!--村委会（居委会）评价-->
                            <div class="tab-pane" id="tab3">
                                <div class="pad-10">
                                <div class="table-list">
                                    <table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
                                        <tbody>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                一、客户基本资料真实性
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.truth}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.truth}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                二、本地居住时间（农户）
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.localLivingTime}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.localLivingTime}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                三、经营能力
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.operatingCapacity}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.operatingCapacity}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                四、项目潜质
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.projectPotential}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.projectPotential}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                五、市场经营风险
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.operationalRisks}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.operationalRisks}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                六、市场竞争力和发展前景
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.developmentProspects}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.developmentProspects}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                七、生产经营力或工作稳定情况
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.operatingStability}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.operatingStability}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                八、家庭人均纯收入水平（农户）
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.capitaNetIncomeLevel}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.capitaNetIncomeLevel}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                九、家庭人均可支配收入水平（非农户）
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.disposableIncomeLevel}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.disposableIncomeLevel}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十、家庭财产水平
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.familyPropertyLevel}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.familyPropertyLevel}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十一、税费缴纳情况（含土地、房产款项）
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.payTaxes}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.payTaxes}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十二、敬老情况
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.respectSitu}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.respectSitu}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十三、邻里关系
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.neighborhood}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.neighborhood}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十四、对公益事业关心程度
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.publicWelfareLevel}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.publicWelfareLevel}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十五、信誉情况
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.creditworthiness}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.creditworthiness}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十六、个人品行综合评价
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.conduct}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.conduct}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十七、受表彰情况
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.praised}">
                                                    <td width="73%">&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td width="73%">${villageManagerEvaList.praised}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十八、其他补充
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.supplement}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.supplement}</td>
                                                </core:otherwise>
                                            </core:choose>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="left" bgcolor="#b4d8ed" style="color:#161823">
                                                十九、是否为我行（社）重点服务对象
                                            </td>
                                            <core:choose>
                                                <core:when test="${empty villageManagerEvaList.importantObject}">
                                                    <td>&nbsp;</td>
                                                </core:when>
                                                <core:otherwise>
                                                    <td>${villageManagerEvaList.importantObject}</td>
                                                </core:otherwise>
                                            </core:choose>
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
                                        <table width="100%" border="1" cellspacing="0" width="732px" color="#727f8a;">
                                            <tbody>
                                            <tr>
                                                <td width="27%" bgcolor="#b4d8ed" style="color:#161823">
                                                    客户在他行贷款情况
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty customerManagerEvaList.loanSitu}">
                                                        <td width="73%">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td width="73%">${customerManagerEvaList.loanSitu}</td>
                                                    </core:otherwise>
                                                </core:choose>

                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    个人银行信用记录
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty customerManagerEvaList.creditRecord}">
                                                        <td>&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td>${customerManagerEvaList.creditRecord}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td width="27%" bgcolor="#b4d8ed" style="color:#161823">
                                                    他行信用记录
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty customerManagerEvaList.otherBankRecord}">
                                                        <td width="73%">&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td width="73%">${customerManagerEvaList.otherBankRecord}</td>
                                                    </core:otherwise>
                                                </core:choose>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#b4d8ed" style="color:#161823">
                                                    变现能力
                                                </td>
                                                <core:choose>
                                                    <core:when test="${empty customerManagerEvaList.houseToMoney}">
                                                        <td>&nbsp;</td>
                                                    </core:when>
                                                    <core:otherwise>
                                                        <td>${customerManagerEvaList.houseToMoney}</td>
                                                    </core:otherwise>
                                                </core:choose>
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
        </div>
    </div>
</div>

<div id="checkDiv" style="display:none">
    <form method="post">
        <input type="hidden" id="recordId" value="${personBasicList.recordId}"/>
        <table width="100%" border="0">
            <tbody>
            <%--<core:forEach items="${appointList}" var="appointPeople">
                <input type="hidden" id="recordId" name="recordId" value="${appointPeople.recordId}">
                <tr>
                    <td><span class="label label-info">户主：</span></td>
                    <td>${appointPeople.customerName}</td>
                    <td><span class="label label-info">电话：</span></td>
                    <td>${appointPeople.telephone}</td>
                </tr>
            </core:forEach>--%>
            <tr>
                <td align="left">
                    <span>验收</span>
                </td>
                <td align="right">
                    <select class="span3" name="state" id="state" style="width:202px;">
                        <option value="">选择验收结果</option>
                        <option value="3">验收通过</option>
                        <option value="4">验收拒绝</option>
                    </select>
                </td>
            </tr>

            </tbody>
        </table>
    </form>
    <p>
        <a class="btn" href="#" id="checkOkOperate">确定</a>&nbsp;
        <a class="btn" href="#" id="checkCancelOperate" onClick="parent.jQuery.fancybox.close();return false">取消</a>
    </p>
</div>

</body>
</html>