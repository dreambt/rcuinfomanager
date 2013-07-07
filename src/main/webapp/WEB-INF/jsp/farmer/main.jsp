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
        .removeOpacity {
            opacity: 1 !important;
            filter: alpha(opacity=100) !important;
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

            handerChangePasswordSubmit = function(){
                $.ajax({
                    type: "post",
                    url: "/systemAccount/changePassword",
                    dataType: "json",
                    data:'oldpassword=' + $("#oldpassword").val() + "&password=" + $("#password").val() + "&confirmPassword=" + $("#confirmPassword").val(),
                    success: function (data) {
                        if (data.errMsg) {
                            $(".errMsg").append(data.errMsg).show();
                        } else {
                            $.fancybox.close();
                            location.reload(true);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
            };

            var msg="${msg}";
            if(msg){
                alert(msg);
            }
            $('#cleanOpera').click(function(){
                $('#organizationName').val('');
                $('#selectAreas').val('');
                $('#areaName').val('');
                $('#displayUserName').val('');
            });

           $('#selectAreas').change(function(){
               var me=$(this);
               var areaId=me.val();
               var url='/area/'+ areaId;
               var params={'areaId':areaId};
               $.post(url,params,function(data){
                   $('#areaName').children().remove();
                   $('#areaName').append('<option value="">按村</option>');
                   if (data) {
                       data.forEach(function(item) {
                           var option=$('<option>');
                           option.val(item.areaName);
                           option.text(item.areaName);
                           $('#areaName').append(option);
                       });
                   }
               });
           });

          $('#selectAll').click(function(){
              debugger;
              if ($('#selectAll').is(':checked')){
                  $(".checkOpera").attr('checked', true);
              } else {
                  $(".checkOpera").attr('checked', false);
              }

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
<!-- topbar ends -->
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
                        <a href="#">主页</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">客户电子信息管理</a>
                    </li>
                </ul>
            </div>

            <div class="sortable row-fluid">
                <div class="well span12 top-block">
                    <table class="table table-bordered table-striped table-condensed">
                        <tr>
                            <td>总条数</td><td>${baseInfoStat.totalCount}</td><td>已提交</td><td>${baseInfoStat.submittedCount}</td><td>验收通过</td><td>${baseInfoStat.acceptedCount}</td><td>验收拒绝</td><td>${baseInfoStat.rejectedCount}</td>
                        </tr>
                        <tr>
                            <td>总资产3万以下</td><td>${familyAssetsStat.item1}</td><td>总资产3万（含）-5万</td><td>${familyAssetsStat.item2}</td><td>总资产5万（含）-10万</td><td>${familyAssetsStat.item3}</td><td>总资产10万以上</td><td>${familyAssetsStat.item4}</td>
                        </tr>
                        <tr>
                            <td>村委会评价3万以下</td><td>${villageEvaStat.item1}</td><td>村委会评价3万（含）-5万</td><td>${villageEvaStat.item2}</td><td>村委会评价5万（含）-10万</td><td>${villageEvaStat.item3}</td><td>总资产10万以上</td><td>${villageEvaStat.item4}</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="row-fluid">
                <div class="box span12">
                    <div class="box-content">

                        <div class="navbar" style="margin-bottom: -10px;">
                            <div class="btn-group">
                                <table>
                                    <tr>
                                        <td>
                                            <form action="/index" method="post">
                                                <select name="organizationName" class="selectpicker" style="width: 95px;margin-left: 5px;margin-right: 5px;" id="organizationName">
                                                    <option value="">按网点</option>
                                                    <core:forEach items="${netWorkList}" var="netWork">
                                                        <option value="${netWork.organizationName}">${netWork.organizationName}</option>
                                                    </core:forEach>
                                                </select>
                                                <select id="selectAreas" name="areaId" class="selectpicker" style="width: 95px;margin-left: 5px;margin-right: 5px;">
                                                    <option value="-1">按乡镇</option>
                                                    <core:forEach items="${areasInfoList}" var="areasInfos">
                                                        <option value="${areasInfos.areaId}">${areasInfos.areaName}</option>
                                                    </core:forEach>
                                                </select>
                                                <select id="areaName" name="areaName" class="selectpicker" style="width: 95px;margin-left: 5px;margin-right: 5px;">
                                                    <option value="">按村</option>
                                                </select>
                                                <input type="text" id="displayUserName" name="displayUserName" value="${params.displayUserName}" placeholder="按客户经理" style="width: 95px; height:20px; margin-right: 5px">
                                                <button type="submit" class="btn" id="search" style="margin-top: 0px;">查询</button>
                                                <a class="btn" href="#" id="cleanOpera" style="margin-top: 0px;">重置</a>
                                                <a class="btn" href="#appointDiv" id="assignOperate">批量指派</a>
                                                <a class="btn" href="#check" id="checkOperate">验收</a>
                                            </form>
                                        </td>
                                        <td>
                                            <div class="btn-group" style="margin-top: -17px;">
                                                <a class="btn dropdown-toggle" data-toggle="dropdown">导入 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="/family/importBasicData" id="importBasicOperate">导入基础数据</a></li>
                                                    <li><a href="/family/importVillageAssess" id="importVillageAssess">导入村委会评价表</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="btn-group" style="margin-top: -17px;">
                                                <a class="btn dropdown-toggle" data-toggle="dropdown">导出 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#" id="exportData">导出数据</a></li>
                                                    <li><a href="#" id="exportVillageAssess">导出村委会评价表</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                            <tr>
                                <th width="20">
                                   <input type="checkbox" id="selectAll" class="removeOpacity"/>
                                </th>
                                <th width="38">序号</th>
                                <th>户主姓名</th>
                                <th>联系电话</th>
                                <th>提交日期</th>
                                <th>收集单位</th>
                                <th>收集人</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <core:forEach items="${familyInfoList}" var="familyInfo" varStatus="idx">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="checkOpera" class="checkOpera removeOpacity" recordId="${familyInfo.recordId}"/>
                                    </td>
                                    <td><core:out value="${idx.index+1}"></core:out></td>
                                    <td>${familyInfo.customerName}</td>
                                    <td>${familyInfo.telephone}</td>
                                    <td>${familyInfo.submitTime}</td>
                                    <td>${familyInfo.organizationName}</td>
                                    <td>${familyInfo.displayUserName}</td>
                                    <core:choose>
                                        <core:when test="${familyInfo.state==1}">
                                            <td>已提交</td>
                                        </core:when>
                                        <core:when test="${familyInfo.state==2}">
                                            <td>已指派</td>
                                        </core:when>
                                        <core:when test="${familyInfo.state==3}">
                                            <td>验收通过</td>
                                        </core:when>
                                        <core:when test="${familyInfo.state==4}">
                                            <td>验收拒绝</td>
                                        </core:when>
                                        <core:otherwise>
                                            <td>&nbsp;</td>
                                        </core:otherwise>
                                    </core:choose>
                                    <td class="center">
                                        <a class="btn btn-success showOperate" href="#"  recordId="${familyInfo.recordId}">
                                            <i class="icon-zoom-in icon-white"></i>
                                            查看
                                        </a>
                                        <core:if test="${familyInfo.state == 0 or familyInfo.state == null or familyInfo.state == ''}">
                                            <a class="btn btn-success appointOperate" href="#appointDiv"  recordId="${familyInfo.recordId}">
                                                <i class="icon-flag icon-white"></i>
                                                指派
                                            </a>
                                        </core:if>
                                        <core:if test="${familyInfo.state!=3}">
                                            <a class="btn btn-info editOperate" href="#" recordId="${familyInfo.recordId}">
                                                <i class="icon-edit icon-white"></i>
                                                编辑
                                            </a>
                                            <a class="btn btn-danger deleteOperate" href="#" recordId="${familyInfo.recordId}" assetsId="${familyInfo.assetsId}">
                                                <i class="icon-trash icon-white"></i>
                                                删除
                                            </a>
                                        </core:if>
                                    </td>
                                </tr>
                            </core:forEach>
                            </tbody>
                        </table>
                        <div class="pagination" style="text-align: center;">
                            <ul>
                                <li> <a href="/index/?page=1">首页</a> </li>
                                <c:forEach begin="1" end="${pageCount}" var="p">
                                    <li class="${currentPage == p ? 'active' : ''}"> <a href="/index/?page=${p}">${p}</a> </li>
                                </c:forEach>
                                <li> <a href="/index/?page=${pageCount}">尾页</a> </li>
                                <li><a href="#">总${pageCount}页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>





        </div>
    </div>
</div>



<div id="changePassword" style="display:none">
    <div class="errMsg alert" style="display:none"></div>
    <input type="text" style="display: none" id="userId"/>
    <table width="100%" border="0">
        <tbody>
            <tr>
                <td align="right"> 旧密码： </td>
                <td align="left"> <input type="text" id="oldpassword" name="oldpassword" style="width: 200px;height: 30px;margin-top: 10px;"   placeholder="请输入密码"/></td>
            </tr>
            <tr>
                <td align="right"> 新密码： </td>
                <td align="left"> <input type="text" id="password" name="password" style="width: 200px;height: 30px;margin-top: 10px;"   placeholder="请输入密码"/></td>
            </tr>
            <tr>
                <td align="right"> 确认新密码：</td>
                <td align="left"> <input type="text" id="confirmPassword" name="confirmPassword" style="width: 200px;height: 30px;margin-top: 10px;" placeholder="请再次输入密码"/></td>
            </tr>
        </tbody>
    </table>
    <div style="margin-left: 100px;">
        <button type="submit" class="btn userSubmit" onclick="handerChangePasswordSubmit()" id="changePasswordSubmit" >确定</button>
        <button type="cancel" class="btn" onClick="parent.jQuery.fancybox.close();return false">取消</button>
    </div>
</div>

<div id="check" style="display:none">
    <form method="post">
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
    <p >
        <a class="btn" href="#" id="checkOkOperate">确定</a>&nbsp;
        <a class="btn" href="#" id="checkCancelOperate" onClick="parent.jQuery.fancybox.close();return false">取消</a>
    </p>
</div>

<input type="hidden" name="page" value="${currentPage}" id="currentPage">

<div id="appointDiv" style="display:none">
    <input type="hidden" id="recordIds"/>
    <h4 style="border-top-color: palevioletred;">指派信息</h4>
    <div class="row-fluid">
        <div class="span2">指派给：</div>
        <div class="span3">
            <select class="span3" name="userId" id="selectUserId" style="width:202px;">
                <option value="">指定客户经理</option>
                <core:forEach items="${userNameList}" var="uList">
                    <option value="${uList.userId}">${uList.userName}</option>
                </core:forEach>
            </select>
        </div>
    </div>
    <p >
        <a class="btn" href="#" id="appointOkOperate">确定</a>&nbsp;
        <a class="btn" href="#" id="appointCancelOperate" onClick="parent.jQuery.fancybox.close();return false">取消</a>
    </p>
</div>

<script type="text/javascript">
    $(function(){
        if(${needModifyPassword}){
            if(confirm('第一次登录，是否需要修改密码？')){
                var content = $('#changePassword').html();
                $('#changePassword').remove();
                $.fancybox({
                    'content': content,
                    'hideOnContentClick': true,
                    'closeBtn' : false
                });

            }
        }
    });
</script>
</body>
</html>