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
            $('.span3').click(function(){
                $("li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
            $('#finishOperate').click(function(){
                if ($('#fileName').val() != '') {
                    $('#submitForm').submit();
                } else {
                    alert("请先上传客户端文件!");
                }

            });

            var fileName = '${fileName}';
            if (fileName && fileName != '') {
                alert('上传成功');
            }

            $('.deleteClientVersion').click(function(){
                if(confirm('确定要删除吗？')){
                    var me=$(this);
                    var id=me.attr('recordId');
                    var url = '/client/deleteClientVersion/'+id;
                    window.location.href=url;
                }
            });

            /*$("#upload").click(function () {
                var filename = $("#file").val();
                $.ajax({
                    type: "POST",
                    url: "/client/uploadFile",
                    contentType: 'multipart/form-data',
                    data: {
                        file: filename
                    },
                    success: function () {
                        alert("Data Uploaded: ");
                    }
                });
            });*/
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
                                <div style="margin-bottom:10px; margin-right:10px; color:#FFFFFF">您好！
                                    <span id="uName">[<c:out value="${displayUserName}"/>]</span>
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
                <li class=""><a href="/index"><i class="icon-chevron-right"></i>客户电子信息管理</a></li>
                <li class="active"><a href="/clientManager"><i class="icon-chevron-right"></i>客户端管理</a></li>
                <li class=""><a href="/accountManager"><i class="icon-chevron-right"></i>系统账号管理</a></li>
                <li class=""><a href="/roleManager"><i class="icon-chevron-right"></i>系统角色管理</a></li>
                <li class=""><a href="/systemLogManager"><i class="icon-chevron-right"></i>系统日志</a></li>
            </ul>
        </div>
        <div class="span10" style="margin-left: -8.435897%;">
            <br/>
            <input class="input-block-level" type="text" value="客户端管理" disabled="disabled" style="color:#0000AA;margin-bottom: 0px; margin-top: -18px;">

            <hr  size="1" width="100%" style="margin-bottom: -1px;"/>
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">客户端版本</a></li>
                    <%--<li><a href="#tab2" data-toggle="tab">安装设备授权</a></li>--%>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">

                        <div class="farmer_info">
                            <div class="table-list" >
                                <form action="/client/uploadFile" method="POST" enctype="multipart/form-data">
                                    <table>
                                        <tr>
                                            <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                                                选择要导入的客户端文件：
                                            </td>
                                            <td align="left">
                                                <input type="file" id="file" name="file" size="10"/>
                                                <button class="btn" id="upload" type="submit">上传</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <form id="submitForm" action="/client/saveClient" method="post">
                                   <table width="100%" border="0">
                                        <tr>
                                            <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                                                填写要导入的客户端版本：
                                            </td>
                                            <td align="left">
                                                <input type="text" name="appVerName"  value="" style="width: 140px;height: 25px; margin-top: 5px;"/>
                                            </td>
                                            <td align="center" bgcolor="#b4d8ed" style="color:#161823">版本描述：</td>
                                            <td align="left">
                                                <input type="text" name="descb"  value="" style="width: 140px;height: 25px; margin-top: 5px;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" bgcolor="#b4d8ed" style="color:#161823">
                                                需要导入的客户端文件名：
                                            </td>
                                            <td align="left">
                                                <input type="text" value="${fileName}" id="fileName" name="url" readonly>
                                            </td>
                                            <td align="center" bgcolor="#b4d8ed" style="color:#161823">

                                                <input type="checkbox" name="coerce"/>是否强制更新
                                            </td>
                                            <td align="center">
                                                <a class="btn" href="#" id="finishOperate">完成</a>
                                            </td>
                                        </tr>
                                    </table>
                                </form>

                                <table width="100%" border="0">
                                    <tbody>
                                    <tr>
                                        <td align="center" colspan="4">
                                            历史版本
                                        </td>
                                    </tr>
                                    <core:forEach items="${clientManagers}" var="clientManager" varStatus="idx">
                                        <tr>
                                            <td align="center">${clientManager.appVerName}</td>
                                            <td align="center">${clientManager.descb}</td>
                                            <td align="center">
                                                <core:if test="${clientManager.isCoerce ne 1}">
                                                    非强制更新
                                                </core:if>
                                                <core:if test="${clientManager.isCoerce ne 0}">
                                                    强制更新
                                                </core:if>
                                            </td>
                                            <td align="center">
                                                <a href="${clientManager.url}">下载</a>&nbsp;
                                                <a href="#" class="deleteClientVersion" recordId="${clientManager.id}">删除</a>
                                            </td>
                                        </tr>
                                    </core:forEach>
                                </table>
                                <div class="pagination" style="text-align: center;">
                                    <ul>
                                        <li> <a href="/clientManager/?page=1">首页</a> </li>
                                        <c:forEach begin="1" end="${pageCount}" var="p">
                                            <li> <a href="/clientManager/?page=${p}">${p}</a> </li>
                                        </c:forEach>
                                        <li> <a href="/clientManager/?page=${pageCount}">尾页</a> </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="tab-pane" id="tab2">
                        <div class="pad-10">
                            <div class="table-list">
                                <table width="100%" border="1">
                                    <tbody>
                                    <tr>
                                        <td align="center" colspan="5" bgcolor="#1e90ff" style="color:#FFFFFF; font-size:20px">
                                            限制使用客户端的移动终端<br>
                                            <label style="font-style:oblique; font-size:16px;color: #FFFF66">
                                                （若开启，则终端标识列表中对应的终端才可使用客户端）</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="18%" align="center">当前状态：</td>
                                        <td width="17%" align="center">
                                            <label >关闭</label>
                                        </td>
                                        <td width="21%" align="center"><input  type="button" name="" value="开启" style="width:80px; height:30px"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br><br>
                                <table width="100%" border="1">
                                    <tbody>
                                    <tr>
                                        <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF; font-size:20px">终端标识列表</td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <table cellpadding="0" cellspacing="3" border="0">
                                                <tbody>
                                                <tr>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        <input  type="text" name="" value="" placeholder="请输入关键字" style="width:150px; height:30px;"/>
                                                    </td>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        <input type="button" name="" value="查找" style="width:80px; height:30px"/>
                                                    </td>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        <input  type="button" name="" value="添加" style="width:80px; height:30px"/>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="right" style="padding-right:20px">
                                            <table cellpadding="0" cellspacing="3" border="0">
                                                <tbody>
                                                <tr>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        &nbsp;1&nbsp;/&nbsp;1&nbsp;
                                                    </td>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        ?&nbsp;1&nbsp;?&nbsp;
                                                    </td>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">
                                                        ?&nbsp;4&nbsp;?&nbsp;
                                                    </td>
                                                    <td align="center" style="border-bottom-color:#FFFFFF">??&nbsp;5?</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="17%" align="center">
                                            <label id="">001D7DAADE72</label>
                                        </td>
                                        <td width="50%" align="center" >
                                            <a href="" style="color:#0099FF">编辑</a>&nbsp;|&nbsp;<a href="" style="color:#FF0000">删除</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>