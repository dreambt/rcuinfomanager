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
    <link rel="stylesheet" href="/asserts/css/jquery.fancybox.css"/>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/dialog/artDialog.js"></script>
    <script src="/asserts/js/main.js"></script>
    <script src="/asserts/js/jquery.fancybox.js"></script>

    <script type="text/javascript">
        $(function(){

            $('#search').click(function(){
                $('#searchForm').submit();
            });


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

            var delMsg="${delSuccess}";
            if(delMsg){
                alert(delMsg);
            }

           $('#selectAreas').change(function(){
               var me=$(this);
               var areaId=me.val();
               var url='/area/'+ areaId;
               var params={'areaId':areaId};
               $.post(url,params,function(data){
                   $('#village').children().remove();
                   $('#village').append('<option value="">按村</option>');
                   if (data) {
                       data.forEach(function(item) {
                           var option=$('<option>');
                           option.val(item.areaId);
                           option.text(item.areaName);
                           $('#village').append(option);
                       });
                   }
               });
           });
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
            <input class="input-block-level" type="text" placeholder="客户电子信息管理" disabled="disabled" style="color:#0000AA">
            <div class="navbar">
                <div class="btn-group">
                    <form action="/index" id=""method="post">
                        <select name="organizationName" class="selectpicker" style="width: 95px;">
                            <option value="">按网点</option>
                            <core:forEach items="${netWorkList}" var="netWork">
                                <option value="${netWork.organizationName}">${netWork.organizationName}</option>
                            </core:forEach>
                        </select>
                        <select id="selectAreas" name="areaName" class="selectpicker" style="width: 95px;">
                            <option value="areaName">按乡镇</option>
                            <core:forEach items="${areasInfoList}" var="areasInfos">
                                <option value="${areasInfos.areaId}">${areasInfos.areaName}</option>
                            </core:forEach>
                        </select>
                        <select id="village" name="village" class="selectpicker" style="width: 95px;">
                            <option value="">按村</option>
                        </select>
                        <input type="text"  name="organizationName" value="${params.organizationName}" placeholder="按客户经理" style="width: 95px; height:30px;">
                        <button type="submit" class="btn" href="#" id="search" style="margin-top: -10px;">查询</button>
                    </form>
                </div>
                <div class="btn-group" style="margin-top: -24px;">
                    <core:choose>
                        <core:when test="${userNameByAdmin=='admin'}">
                            <button class="btn" type="button" id="assignOperate">批量指派</button>
                            <button class="btn" type="button" id="checkOperate">验收</button>
                        </core:when>
                    </core:choose>
                </div>
                <div class="btn-group" style="margin-top: -24px;">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">导入 <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="importBasicOperate">导入基础数据</a></li>
                        <li><a href="#" id="importVillageAssess">导入村委会评价表</a></li>
                    </ul>
                </div>
                <div class="btn-group" style="margin-top: -24px;">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">导出 <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="exportData">导出数据</a></li>
                        <li><a href="#" id="exportBasicData4Household">导出户主数据</a></li>
                        <li><a href="#" id="exportBasicData4Members">导出家庭成员数据</a></li>
                        <li><a href="#" id="exportVillageAssess">导出村委会评价表</a></li>
                    </ul>
                </div>
            </div>

            <div class="table-list">
                <table width="100%">
                    <thead>
                    <tr>
                        <th width="77" align="center" class="first">
                            <input type="checkbox" id="selectAll" />全选
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
                    <core:forEach items="${familyInfoList}" var="familyInfo" varStatus="idx">
                        <tr>
                            <td align="center" class="first">
                                <input type="checkbox" name="checkOpera" class="checkOpera" recordId="${familyInfo.recordId}"/>
                            </td>
                            <td align="center"><core:out value="${idx.index+1}"></core:out></td>
                            <td align="center">${familyInfo.customerName}</td>
                            <td align="center">${familyInfo.telephone}</td>
                            <td align="center">${familyInfo.submitTime}</td>
                            <td align="center">${familyInfo.organizationName}</td>
                            <td align="center">${familyInfo.displayUserName}</td>
                            <core:choose>
                                <core:when test="${familyInfo.state==2}">
                                    <td align="center">已指派</td>
                                </core:when>
                                <core:when test="${familyInfo.state==3}">
                                    <td align="center">验收通过</td>
                                </core:when>
                                <core:when test="${familyInfo.state==4}">
                                    <td align="center">验收拒绝</td>
                                </core:when>
                                <core:when test="${familyInfo.state==5}">
                                    <td align="center">已提交</td>
                                </core:when>
                                <core:otherwise>
                                    <td align="center">&nbsp;</td>
                                </core:otherwise>
                            </core:choose>
                            <td align="center">
                                <a href="#" style="color:#0099FF" class="showOperate" recordId="${familyInfo.recordId}">查看</a>&nbsp;|&nbsp;
                                <core:choose>
                                 <core:when test="${userNameByAdmin=='admin'}">
                                    <a href="#" style="color:#0099FF" class="appointOperate" recordId="${familyInfo.recordId}">指派</a>&nbsp;|&nbsp;
                                 </core:when>
                                </core:choose>
                                <a href="#" style="color:#0099FF" class="editOperate" recordId="${familyInfo.recordId}">编辑</a>&nbsp;|&nbsp;
                                <a href="#" style="color:#FF0000" class="deleteOperate" recordId="${familyInfo.recordId}" assetsId="${familyInfo.assetsId}">删除</a>
                            </td>
                        </tr>
                    </core:forEach>
                    </tbody>
                </table>
                <div class="pagination" style="text-align: center;">
                    <ul>
                        <li> <a href="/index/?page=1">首页</a> </li>
                        <c:forEach begin="1" end="${pageCount}" var="p">
                            <li> <a href="/index/?page=${p}">${p}</a> </li>
                        </c:forEach>
                        <li> <a href="/index/?page=${pageCount}">尾页</a> </li>
                    </ul>
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