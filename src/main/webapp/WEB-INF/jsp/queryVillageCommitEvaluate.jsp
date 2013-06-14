<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <title>村委会（居委会）评价</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/zh-cn-system.css" rel="stylesheet" type="text/css">
    <link href="css/table_form.css" rel="stylesheet" type="text/css">
    <link href="css/dialog.css" rel="stylesheet" type="text/css">

    <script language="javascript" type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/admin_common.js"></script>
    <script language="javascript" type="text/javascript" src="js/styleswitch.js"></script>
    <script type="text/javascript">
        window.focus();
        var pc_hash = 'AttuXV';
    </script>
</head>
<body>
<style type="text/css">
    html {
        _overflow-y: scroll
    }
</style>
<div id="closeParentTime" style="display:none">1</div>

<div class="pad-10">
    <form name="myform" id="myform" action="" method="post">
        <div class="table-list">
            <table width="100%" border="1">
                <tbody>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        一、客户基本资料真实性
                    </td>
                    <td width="73%" align="center"></td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        二、本地居住时间（农户）
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        三、经营能力
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        四、项目潜质
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        五、市场经营风险
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        六、市场竞争力和发展前景
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        七、生产经营力或工作稳定情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        八、家庭人均纯收入水平（农户）
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        九、家庭人均可支配收入水平（非农户）
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十、家庭财产水平
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十一、税费缴纳情况（含土地、房产款项）
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十二、敬老情况
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十三、邻里关系
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十四、对公益事业关心程度
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十五、信誉情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十六、个人品行综合评价
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十七、受表彰情况
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十八、其他补充
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="27%" align="left" bgcolor="#1e90ff" style="color:#FFFFFF">
                        十九、是否为我行（社）重点服务对象
                    </td>
                    <td width="73%" align="center">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
</div>
</div>
<script language="javascript" type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript">
    <!--
    function push() {
        var str = 0;
        var id = tag = '';
        $("input[name='ids[]']").each(function () {
            if ($(this).attr('checked') == true) {
                str = 1;
                id += tag + $(this).val();
                tag = '|';
            }
        });
        if (str == 0) {
            alert('您没有勾选信息');
            return false;
        }
        window.top.art.dialog({id: 'push'}).close();
        window.top.art.dialog({title: '推送：', id: 'push', iframe: '?m=content&c=push&action=position_list&catid=209&modelid=45&id=' + id, width: '800', height: '500'}, function () {
            var d = window.top.art.dialog({id: 'push'}).data.iframe;// 使用内置接口获取iframe对象
            var form = d.document.getElementById('dosubmit');
            form.click();
            return false;
        }, function () {
            window.top.art.dialog({id: 'push'}).close()
        });
    }
    function confirm_delete() {
        if (confirm('确认删除吗？')) $('#myform').submit();
    }
    function view_comment(id, name) {
        window.top.art.dialog({id: 'view_comment'}).close();
        window.top.art.dialog({yesText: '关闭', title: '查看评论：' + name, id: 'view_comment', iframe: 'index.php?m=comment&c=comment_admin&a=lists&show_center_id=1&commentid=' + id, width: '800', height: '500'}, function () {
            window.top.art.dialog({id: 'edit'}).close()
        });
    }
    function reject_check(type) {
        if (type == 1) {
            var str = 0;
            $("input[name='ids[]']").each(function () {
                if ($(this).attr('checked') == true) {
                    str = 1;
                }
            });
            if (str == 0) {
                alert('您没有勾选信息');
                return false;
            }
            document.getElementById('myform').action = '?m=content&c=content&a=pass&catid=209&steps=0&reject=1';
            document.getElementById('myform').submit();
        } else {
            $('#reject_content').css('display', '');
            return false;
        }
    }
    setcookie('refersh_time', 0);
    function refersh_window() {
        var refersh_time = getcookie('refersh_time');
        if (refersh_time == 1) {
            window.location.reload();
        }
    }
    setInterval("refersh_window()", 3000);
    //-->
</script>

<div style="display: none; position: absolute;" class="">
    <div class="aui_outer">
        <table class="aui_border">
            <tbody>
            <tr>
                <td class="aui_nw"></td>
                <td class="aui_n"></td>
                <td class="aui_ne"></td>
            </tr>
            <tr>
                <td class="aui_w"></td>
                <td class="aui_c">
                    <div class="aui_inner">
                        <table class="aui_dialog">
                            <tbody>
                            <tr>
                                <td colspan="2" class="aui_header">
                                    <div class="aui_titleBar">
                                        <div class="aui_title" style="cursor: move; display: block;"></div>
                                        <a class="aui_close" href="javascript:/*artDialog*/;"
                                           style="display: block;">×</a></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="aui_icon" style="display: none;">
                                    <div class="aui_iconBg"
                                         style="background-image: none; background-position: initial initial; background-repeat: initial initial;"></div>
                                </td>
                                <td class="aui_main" style="width: auto; height: auto;">
                                    <div class="aui_content" style="padding: 20px 25px;"></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="aui_footer">
                                    <div class="aui_buttons" style="display: none;"></div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td class="aui_e"></td>
            </tr>
            <tr>
                <td class="aui_sw"></td>
                <td class="aui_s"></td>
                <td class="aui_se" style="cursor: se-resize;"></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>