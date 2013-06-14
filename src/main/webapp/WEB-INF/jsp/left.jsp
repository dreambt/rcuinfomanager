<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>农户建档现场电子信息采集系统</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-image: url(/images/left.gif);
        }

        -->
    </style>
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
</head>
<SCRIPT language=JavaScript>
    function tupian(idt) {
        var nametu = "xiaotu" + idt;
        var tp = document.getElementById(nametu);
        tp.src = "../images/ico05.gif";//图片ico04为白色的正方形

        for (var i = 1; i < 30; i++) {

            var nametu2 = "xiaotu" + i;
            if (i != idt * 1) {
                var tp2 = document.getElementById('xiaotu' + i);
                if (tp2 != undefined) {
                    tp2.src = "../images/ico06.gif";
                }//图片ico06为蓝色的正方形
            }
        }
    }

    function list(idstr) {
        var name1 = "subtree" + idstr;
        var name2 = "img" + idstr;
        var objectobj = document.all(name1);
        var imgobj = document.all(name2);


        //alert(imgobj);

        if (objectobj.style.display == "none") {
            for (i = 1; i < 10; i++) {
                var name3 = "img" + i;
                var name = "subtree" + i;
                var o = document.all(name);
                if (o != undefined) {
                    o.style.display = "none";
                    var image = document.all(name3);
                    //alert(image);
                    image.src = "../images/ico04.gif";
                }
            }
            objectobj.style.display = "";
            imgobj.src = "../images/ico03.gif";
        }
        else {
            objectobj.style.display = "none";
            imgobj.src = "../images/ico04.gif";
        }
    }

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
    <tr>
        <TD>
            <!--  客户电子信息管理开始    -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="/farmer/index" target="mainFrame" class="left-font03">客户电子信息管理</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <!--  客户电子信息管理结束    -->


            <!--  客户端管理开始    -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img7" id="img7" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="/device/clientVersion" target="mainFrame" class="left-font03">客户端管理</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <!--  客户端管理结束    -->

            <!--  系统账号管理开始    -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img1" id="img1" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="/ps/systemAccountManage.jsp" target="mainFrame"
                                       class="left-font03">系统账号管理</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <!--  系统账号管理结束    -->

            <!--  系统角色管理开始    -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%" height="12"><img name="img2" id="img2" src="../images/ico04.gif"
                                                                width="8" height="11"/></td>
                                <td width="92%"><a href="/ps/systemRoleManager.jsp" target="mainFrame"
                                                   class="left-font03">系统角色管理</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--  系统角色管理结束    -->

            <!--  系统日志开始    -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%" height="12"><img name="img3" id="img3" src="../images/ico04.gif"
                                                                width="8" height="11"/></td>
                                <td width="92%"><a href="/logsystem/systemLog.jsp" target="mainFrame"
                                                   class="left-font03">系统日志</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--  系统日志结束    -->

        </TD>
    </tr>

</table>
</body>
</html>
