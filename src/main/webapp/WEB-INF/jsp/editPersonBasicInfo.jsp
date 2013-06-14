<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <title>个人基本概况信息</title>
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
<table align="center" width="100%" border="1">
<tbody>
<tr>
    <td width="13%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        姓名
    </td>
    <td width="13%" align="left">
        <input id="" type="text" name="" value=""/></td>
    <td width="11%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">性别</td>
    <td width="14%" align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">男</option>
            <option value="">女</option>
        </select></td>
    <td width="13%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否农户</td>
    <td width="13%" align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">是</option>
            <option value="">否</option>
        </select></td>
    <td width="12%" align="center" bgcolor="#1e90ff" style="color:#FFFFFF">客户类型</td>
    <td width="11%" align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">一般农户</option>
            <option value="">其他自然人</option>
            <option value="">个人经营户</option>
        </select></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        证件类型
    </td>
    <td align="left" colspan="2">
        <select id="" name="" style="width:200px">
            <option value="" selected="selected">身份证</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
    <td align="left" colspan="2">
        <input id="" type="text" name="" value="" maxlength="18" style="width:200px"/></td>
    <td align="center" colspan="2" rowspan="4">照片</td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        证件有效期
    </td>
    <td align="left" colspan="3">
        <link rel="stylesheet" type="text/css" href="css/calendar/jscal2.css">
        <link rel="stylesheet" type="text/css" href="css/calendar/border-radius.css">
        <link rel="stylesheet" type="text/css" href="css/calendar/win2k.css">
        <script type="text/javascript" src="js/calendar/calendar.js"></script>
        <script type="text/javascript" src="js/calendar/lang/en.js"></script>
        从&nbsp;&nbsp;<input type="text" name="start_time" id="start_time" value="" size="10" class="date" readonly="">&nbsp;&nbsp;
        <script type="text/javascript">
            Calendar.setup({
                weekNumbers: false,
                inputField: "start_time",
                trigger: "start_time",
                dateFormat: "%Y-%m-%d",
                showTime: false,
                minuteStep: 1,
                onSelect: function () {
                    this.hide();
                }
            });
        </script>
        到 &nbsp;&nbsp;<input type="text" name="end_time" id="end_time" value="" size="10" class="date input-text"
                             readonly="">&nbsp;
        <script type="text/javascript">
            Calendar.setup({
                weekNumbers: false,
                inputField: "end_time",
                trigger: "end_time",
                dateFormat: "%Y-%m-%d",
                showTime: false,
                minuteStep: 1,
                onSelect: function () {
                    this.hide();
                }
            });
        </script>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">出生年月</td>
    <td align="left">
        <input id="" type="text" name="" value=""/></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">国籍</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">中国</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否拥有外国护照或居住权</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="">是</option>
            <option value="" selected="selected">否</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">民族</td>
    <td align="left"><input id="" type="text" name="" value=""/></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">政治面貌</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">群众</option>
            <option value="">党员</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">健康状况</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="">良好</option>
            <option value="" selected="selected">一般</option>
            <option value="">差</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">婚姻状况</td>
    <td align="left">
        <select id="" name="" style="width:140px">
            <option value="" selected="selected">未说明的婚姻状况</option>
            <option value="">已婚</option>
        </select></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        居住地址
    </td>
    <td align="left" colspan="5">
        <input id="" type="text" name="" value="" style="width:600px"/></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">居住编码</td>
    <td align="left">
        <input id="" type="text" name="" value="362100"/></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        区域名称
    </td>
    <td align="left" colspan="3">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">螺阳镇</option>
            <option value="">...</option>
            <option value="">等等</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">新桥</option>
            <option value="">...</option>
            <option value="">等等</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">联系电话</td>
    <td align="left"><input id="" type="text" name="" value=""/></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">手机号码</td>
    <td align="left"><input id="" type="text" name="" value=""/></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        居住状况
    </td>
    <td align="left" colspan="2">
        <select id="" name="" style="width:220px">
            <option value="" selected="selected">自置</option>
            <option value="">按揭</option>
            <option value="">亲属楼宇</option>
            <option value="">集体宿舍</option>
            <option value="">租房</option>
            <option value="">共有住宅</option>
            <option value="">其他</option>
            <option value="">未知</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">社会保障情况</td>
    <td align="left" colspan="4">
        <input id="" type="checkbox" name="" value="" checked="checked"/>养老保险
        <input id="" type="checkbox" name="" value=""/>失业保险
        <input id="" type="checkbox" name="" value=""/>医疗保险
        <input id="" type="checkbox" name="" value=""/>生育保险
        <input id="" type="checkbox" name="" value=""/>失业保险
        <input id="" type="checkbox" name="" value=""/>住房公积金
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        最高学位
    </td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="">名誉博士</option>
            <option value="">博士</option>
            <option value="">硕士</option>
            <option value="">学士</option>
            <option value="" selected="selected">其他</option>
            <option value="">未知</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">最高学历</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="">研究生</option>
            <option value="">本科</option>
            <option value="">大专</option>
            <option value="">中等专业学校或中等技术学校</option>
            <option value="">技术学校</option>
            <option value="">高中</option>
            <option value="">初中</option>
            <option value="" selected="selected">小学</option>
            <option value="">文盲或半文盲</option>
            <option value="">未知</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）关系</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">普通客户</option>
        </select></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与我行（社）合作关系</td>
    <td align="left">
        <select id="" name="" style="width:120px">
            <option value="" selected="selected">一般</option>
        </select></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        职业
    </td>
    <td align="left" colspan="7">
        <select id="" name="">
            <option value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</OPTION>
            <option value="专业技术人员">专业技术人员</OPTION>
            <option value="办事人员和有关人员">办事人员和有关人员</OPTION>
            <option value="商业、服务业人员">商业、服务业人员</OPTION>
            <option selected value="农、林、牧、渔、水利业生产人员">农、林、牧、渔、水利业生产人员</OPTION>
            <option value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</OPTION>
            <option value="军人">军人</OPTION>
            <option value="不便分类的其他从业人员">不便分类的其他从业人员</OPTION>
            <option value="未知">未知</OPTION>
        </select></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        个人经营项目
    </td>
    <td align="left" colspan="4">
        <input id="" type="text" name="" value="" style="width:500px"/></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">经营年限</td>
    <td align="left" colspan="2">
        <input id="" type="text" name="" value=""/></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        经营场所
    </td>
    <td align="left" colspan="3">
        <select id="" name="">
            <OPTION selected value="户口所在地">户口所在地</OPTION>
            <OPTION value="本市">本市</OPTION>
            <OPTION value="本地区">本地区</OPTION>
            <OPTION value="本省">本省</OPTION>
            <OPTION value="外省">外省</OPTION>
            <OPTION value="详细地址">详细地址</OPTION>
        </select>
        <input id="" name="" type="text" value="" style="width:280px"/></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">从事行业</td>
    <td align="left" colspan="3">
        <SELECT id="" name="">
            <OPTION selected value="农、林、牧、渔业">农、林、牧、渔业</OPTION>
        </SELECT></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        投资经营性质
    </td>
    <td align="left">
        <SELECT id="" name="">
            <OPTION value="个体工商户">个体工商户</OPTION>
            <OPTION value="合伙企业">合伙企业</OPTION>
            <OPTION value="有限责任公司">有限责任公司</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投资资金情况</td>
    <td align="left">
        <SELECT id="" name="">
            <OPTION value="独自投入">独自投入</OPTION>
            <OPTION value="与他人合伙">与他人合伙</OPTION>
            <OPTION value="自身经营">自身经营</OPTION>
            <OPTION value="挂靠他人合伙">挂靠他人合伙</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">投入金额</td>
    <td align="left">
        <SELECT id="" name="">
            <OPTION value="10万元以内">10万元以内</OPTION>
            <OPTION value="10-50万元">10-50万元</OPTION>
            <OPTION value="50-100万元">50-100万元</OPTION>
            <OPTION value="100-300万元">100-300万元</OPTION>
            <OPTION value="300-1000万元">300-1000万元</OPTION>
            <OPTION value="1000万元以上">1000万元以上</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">自有资金情况</td>
    <td align="left">
        <SELECT id="" name="">
            <OPTION value="10万元以内">10万元以内</OPTION>
            <OPTION value="10-50万元">10-50万元</OPTION>
            <OPTION value="50-100万元">50-100万元</OPTION>
            <OPTION value="100-300万元">100-300万元</OPTION>
            <OPTION value="300-1000万元">300-1000万元</OPTION>
            <OPTION value="1000万元以上">1000万元以上</OPTION>
        </SELECT></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        年收益情况
    </td>
    <td align="left" colspan="7">
        <SELECT id="" name="">
            <OPTION value="10万元以内">10万元以内</OPTION>
            <OPTION value="10-50万元">10-50万元</OPTION>
            <OPTION value="50-100万元">50-100万元</OPTION>
            <OPTION value="100-300万元">100-300万元</OPTION>
            <OPTION value="300-1000万元">300-1000万元</OPTION>
            <OPTION value="1000万元以上">1000万元以上</OPTION>
        </SELECT></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        工作情况
    </td>
    <td align="left" colspan="7">
        <INPUT id="" type=text name="" value="小岞镇新桥村09组410号" style="width:500px"></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        单位性质
    </td>
    <td align="left" colspan="3">
        <SELECT id="" name="">
            <OPTION value="党政机关">党政机关</OPTION>
            <OPTION value="事业单位">事业单位</OPTION>
            <OPTION value="军队社会团体">军队社会团体</OPTION>
            <OPTION value="内资企业">内资企业</OPTION>
            <OPTION value="国有企业">国有企业</OPTION>
            <OPTION value="集体企业">集体企业</OPTION>
            <OPTION value="股份合作企业">股份合作企业</OPTION>
            <OPTION value="联营企业">联营企业</OPTION>
            <OPTION value="有限责任公司">有限责任公司</OPTION>
            <OPTION value="股份有限公司">股份有限公司</OPTION>
            <OPTION value="私营企业">私营企业</OPTION>
            <OPTION value="个体经营">个体经营</OPTION>
            <OPTION value="其他">其他</OPTION>
            <OPTION value="未知">未知</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">单位所属行业</td>
    <td align="left" colspan="3">
        <SELECT id="u2431" class="u2431">
            <OPTION selected value="农、林、牧、渔业">农、林、牧、渔业</OPTION>
        </SELECT></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        任职部门
    </td>
    <td align="left" colspan="3"><input name="text" type=text id="u2432" value="" style="width:200px"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作单位类别</td>
    <td align="left" colspan="3">
        <SELECT id="u2433" class="u2433">
            <OPTION value="国家机关、团体、事业单位等" selected="selected">国家机关、团体、事业单位等</OPTION>
            <OPTION value="金融、烟草、邮电通信、电力、民航、水电气供应等">金融、烟草、邮电通信、电力、民航、水电气供应等</OPTION>
            <OPTION value="上市企业、大型优质企业等">上市企业、大型优质企业等</OPTION>
            <OPTION value="三资、民营企业及其他企业等">三资、民营企业及其他企业等</OPTION>
            <OPTION value="其他">其他</OPTION>
            <OPTION value="无职业">无职业</OPTION>
        </SELECT></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        职务
    </td>
    <td align="left">
        <SELECT id="u2434" class="u2434">
            <OPTION value="高级领导">高级领导</OPTION>
            <OPTION value="中级领导">中级领导</OPTION>
            <OPTION selected value="一般员工">一般员工</OPTION>
            <OPTION value="其他">其他</OPTION>
            <OPTION value="未知">未知</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年工资收入（万元）</td>
    <td align="left">
        <SELECT id="u2435" class="u2435">
            <OPTION value="3万元内">3万元内</OPTION>
            <OPTION selected value="3-6万元">3-6万元</OPTION>
            <OPTION value="6-12万元">6-12万元</OPTION>
            <OPTION value="12万元以上">12万元以上</OPTION>
        </SELECT></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">工作年限</td>
    <td align="left">
        <SELECT id="u2436" class="u2436">
            <OPTION selected value="5年（含）以上">5年（含）以上</OPTION>
            <OPTION value="3(含）-5年">3(含）-5年</OPTION>
            <OPTION value="3年以内">3年以内</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">职称</td>
    <td align="left">
        <SELECT id="u2437" class="u2437">
            <OPTION selected value="无">无</OPTION>
            <OPTION value="高级">高级</OPTION>
            <OPTION value="中级">中级</OPTION>
            <OPTION value="初级">初级</OPTION>
            <OPTION value="未知">未知</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        家庭收支情况
    </td>
</tr>
<tr>
    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
        家庭年总收入（万元）
    </td>
    <td align="left" colspan="2"><INPUT id="u2438" type=text value="4" class="u2438"></td>
    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭支出（万元）</td>
    <td align="left" colspan="2"><INPUT id="u2439" type=text value="2" class="u2439"></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        收入来源
    </td>
    <td align="left" colspan="7"><INPUT id="" type=text name="" value="务农" style="width:200px"></td>
</tr>
<tr>
    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">
        其中：个人年收入（万元）
    </td>
    <td align="left" colspan="2"><INPUT id="u2440" type=text value="2" class="u2440"></td>
    <td align="center" colspan="2" bgcolor="#1e90ff" style="color:#FFFFFF">家庭其他成员年收入（万元）</td>
    <td align="left" colspan="2"><INPUT id="" type=text name="" value="2"></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        家庭主要支出项目
    </td>
    <td align="left" colspan="3">
        <SELECT id="u2445" class="u2445">
            <OPTION selected value="生活性支出">生活性支出</OPTION>
            <OPTION value="交际应酬等消费支出">交际应酬等消费支出</OPTION>
            <OPTION value="投资性支出">投资性支出</OPTION>
            <OPTION value="其他支出">其他支出</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">家庭收入能否应付支出</td>
    <td align="left" colspan="3">
        <SELECT id="u2446" class="u2446">
            <OPTION value="能、绰绰有余">能、绰绰有余</OPTION>
            <OPTION value="能、还有盈余">能、还有盈余</OPTION>
            <OPTION selected value="能、刚刚够">能、刚刚够</OPTION>
            <OPTION value="不能">不能</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" colspan="8" style="font-size:22px">
        <label>家庭资产情况</label>
        <INPUT id="u2442" type="button" name="" value="增加房产" style="width:100px;height:30px">
        <INPUT id="u2443" type="button" name="" value="增加车辆" style="width:100px;height:30px">
        <INPUT id="u2444" type="button" name="" value="增加土地" style="width:100px;height:30px">
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        总资产（万元）
    </td>
    <td align="center">
        <INPUT id="u2447" type=text value="5" class="u2447">
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">主要资产</td>
    <td align="left" colspan="5">
        <input id="" type="checkbox" name="" value="" checked="checked"/>房屋
        <input id="" type="checkbox" name="" value=""/>土地
        <input id="" type="checkbox" name="" value=""/>车辆
        <input id="" type="checkbox" name="" value=""/>金融资产
        <input id="" type="checkbox" name="" value=""/>经营资金
        <input id="" type="checkbox" name="" value=""/>其他
    </td>
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
    <td align="left">
        <SELECT id="u2460" class="u2460">
            <OPTION value="商品房">商品房</OPTION>
            <OPTION selected value="自建房">自建房</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
    <td align="left">
        <SELECT id="u2461" class="u2461">
            <OPTION value="商用楼">商用楼</OPTION>
            <OPTION value="店铺">店铺</OPTION>
            <OPTION selected value="居住">居住</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
    <td align="left">
        <SELECT id="u2462" class="u2462">
            <OPTION value="本市市区">本市市区</OPTION>
            <OPTION value="户口地镇区">户口地镇区</OPTION>
            <OPTION selected value="户口地乡村">户口地乡村</OPTION>
            <OPTION value="本省其他县市">本省其他县市</OPTION>
            <OPTION value="外省">外省</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
    <td align="left">
        <SELECT id="u2463" class="u2463">
            <OPTION value="钢混">钢混</OPTION>
            <OPTION selected value="砖混">砖混</OPTION>
            <OPTION value="砖木">砖木</OPTION>
            <OPTION value="框架">框架</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        层数
    </td>
    <td align="left"><INPUT id="u2464" type=text value="1" class="u2464"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
    <td align="left">
        <SELECT id="u2465" class="u2465">
            <OPTION selected value="自住">自住</OPTION>
            <OPTION value="自身经营使用">自身经营使用</OPTION>
            <OPTION value="出租">出租</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">建筑面积</td>
    <td align="left">
        <SELECT id="u2466" class="u2466">
            <OPTION value="100㎡内">100㎡内</OPTION>
            <OPTION selected value="100-300㎡">100-300㎡</OPTION>
            <OPTION value="300㎡-500㎡">300㎡-500㎡</OPTION>
            <OPTION value="500㎡以上">500㎡以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房产价值</td>
    <td align="left">
        <SELECT id="u2467" class="u2467">
            <OPTION value="10万以内">10万以内</OPTION>
            <OPTION selected value="10-30万">10-30万</OPTION>
            <OPTION value="30-60万">30-60万</OPTION>
            <OPTION value="60-100万">60-100万</OPTION>
            <OPTION value="100万以上">100万以上</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        是否按揭
    </td>
    <td align="left">
        <SELECT id="u2468" class="u2468">
            <OPTION selected value="是">是</OPTION>
            <OPTION value="否">否</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
    <td align="left">
        <SELECT id="u2469" class="u2469">
            <OPTION value="双证齐全">双证齐全</OPTION>
            <OPTION value="单土地证">单土地证</OPTION>
            <OPTION selected value="无办证">无办证</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">备注</td>
    <td align="left" colspan="3">
        <INPUT id="u2470" type=text value="" class="u2470" style="width:200px">
    </td>
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
    <td align="left">
        <SELECT id="u2460" class="u2460">
            <OPTION value="商品房">商品房</OPTION>
            <OPTION selected value="自建房">自建房</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
    <td align="left">
        <SELECT id="u2461" class="u2461">
            <OPTION value="商用楼">商用楼</OPTION>
            <OPTION value="店铺">店铺</OPTION>
            <OPTION selected value="居住">居住</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">所在位置</td>
    <td align="left">
        <SELECT id="u2462" class="u2462">
            <OPTION value="本市市区">本市市区</OPTION>
            <OPTION value="户口地镇区">户口地镇区</OPTION>
            <OPTION selected value="户口地乡村">户口地乡村</OPTION>
            <OPTION value="本省其他县市">本省其他县市</OPTION>
            <OPTION value="外省">外省</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房屋结构</td>
    <td align="left">
        <SELECT id="u2463" class="u2463">
            <OPTION value="钢混">钢混</OPTION>
            <OPTION selected value="砖混">砖混</OPTION>
            <OPTION value="砖木">砖木</OPTION>
            <OPTION value="框架">框架</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        层数
    </td>
    <td align="left"><INPUT id="u2464" type=text value="1" class="u2464"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
    <td align="left">
        <SELECT id="u2465" class="u2465">
            <OPTION selected value="自住">自住</OPTION>
            <OPTION value="自身经营使用">自身经营使用</OPTION>
            <OPTION value="出租">出租</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">建筑面积</td>
    <td align="left">
        <SELECT id="u2466" class="u2466">
            <OPTION value="100㎡内">100㎡内</OPTION>
            <OPTION selected value="100-300㎡">100-300㎡</OPTION>
            <OPTION value="300㎡-500㎡">300㎡-500㎡</OPTION>
            <OPTION value="500㎡以上">500㎡以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">房产价值</td>
    <td align="left">
        <SELECT id="u2467" class="u2467">
            <OPTION value="10万以内">10万以内</OPTION>
            <OPTION selected value="10-30万">10-30万</OPTION>
            <OPTION value="30-60万">30-60万</OPTION>
            <OPTION value="60-100万">60-100万</OPTION>
            <OPTION value="100万以上">100万以上</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        是否按揭
    </td>
    <td align="left">
        <SELECT id="u2468" class="u2468">
            <OPTION selected value="是">是</OPTION>
            <OPTION value="否">否</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">用途</td>
    <td align="left">
        <SELECT id="u2469" class="u2469">
            <OPTION value="双证齐全">双证齐全</OPTION>
            <OPTION value="单土地证">单土地证</OPTION>
            <OPTION selected value="无办证">无办证</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">备注</td>
    <td align="left" colspan="3">
        <INPUT id="u2470" type=text value="" class="u2470" style="width:200px">
    </td>
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
    <td align="left">
        <SELECT id="u2482" class="u2482">
            <OPTION value="100㎡内">100㎡内</OPTION>
            <OPTION selected value="100-300㎡">100-300㎡</OPTION>
            <OPTION value="300㎡-500㎡">300㎡-500㎡</OPTION>
            <OPTION value="500㎡以上">500㎡以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地价值</td>
    <td align="left">
        <INPUT id="u2483" type=text value="" class="u2483">
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地性质</td>
    <td align="left">
        <SELECT id="u2484" class="u2484">
            <OPTION value="国有出让">国有出让</OPTION>
            <OPTION value="国有划拨">国有划拨</OPTION>
            <OPTION selected value="集体证">集体证</OPTION>
            <OPTION value="无办证">无办证</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地类型</td>
    <td align="left">
        <SELECT id="u2485" class="u2485">
            <OPTION value="商业地">商业地</OPTION>
            <OPTION value="住宅用地">住宅用地</OPTION>
            <OPTION value="工业地">工业地</OPTION>
            <OPTION value="耕地">耕地</OPTION>
            <OPTION selected value="山地或滩涂">山地或滩涂</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        土地使用情况
    </td>
    <td align="left">
        <SELECT id="u2486" class="u2486">
            <OPTION selected value="自用">自用</OPTION>
            <OPTION value="出借">出借</OPTION>
            <OPTION value="出租">出租</OPTION>
            <OPTION value="未使用">未使用</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">土地款是否结清</td>
    <td align="left" colspan="5">
        <SELECT id="u2487" class="u2487">
            <OPTION selected value="是">是</OPTION>
            <OPTION value="否">否</OPTION>
        </SELECT>
    </td>
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
    <td align="left">
        <SELECT id="u2488" class="u2488">
            <OPTION selected value="轿车">轿车</OPTION>
            <OPTION value="货车">货车</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">车辆价值</td>
    <td align="left">
        <SELECT id="u2489" class="u2489">
            <OPTION value="10万以内">10万以内</OPTION>
            <OPTION selected value="10-30万">10-30万</OPTION>
            <OPTION value="30-50万">30-50万</OPTION>
            <OPTION value="50万以上">50万以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否按揭</td>
    <td align="left">
        <SELECT id="u2490" class="u2490">
            <OPTION value="是">是</OPTION>
            <OPTION selected value="否">否</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
    <td align="left">
        <SELECT id="u2491" class="u2491">
            <OPTION value="营运">营运</OPTION>
            <OPTION value="出租">出租</OPTION>
            <OPTION value="闲置">闲置</OPTION>
            <OPTION selected value="自用">自用</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
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
    <td align="left">
        <SELECT id="u2488" class="u2488">
            <OPTION selected value="轿车">轿车</OPTION>
            <OPTION value="货车">货车</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">车辆价值</td>
    <td align="left">
        <SELECT id="u2489" class="u2489">
            <OPTION value="10万以内">10万以内</OPTION>
            <OPTION selected value="10-30万">10-30万</OPTION>
            <OPTION value="30-50万">30-50万</OPTION>
            <OPTION value="50万以上">50万以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否按揭</td>
    <td align="left">
        <SELECT id="u2490" class="u2490">
            <OPTION value="是">是</OPTION>
            <OPTION selected value="否">否</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">使用情况</td>
    <td align="left">
        <SELECT id="u2491" class="u2491">
            <OPTION selected value="营运">营运</OPTION>
            <OPTION value="出租">出租</OPTION>
            <OPTION value="闲置">闲置</OPTION>
            <OPTION value="自用">自用</OPTION>
            <OPTION value="其他">其他</OPTION>
        </SELECT>
    </td>
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
    <td align="left" colspan="3">
        <input id="" type="checkbox" name="" value="" checked="checked"/>活期存款
        <input id="" type="checkbox" name="" value=""/>定期存款
        <input id="" type="checkbox" name="" value=""/>股票
        <input id="" type="checkbox" name="" value=""/>基金
        <input id="" type="checkbox" name="" value=""/>债券
        <input id="" type="checkbox" name="" value=""/>投资性保险
        <input id="" type="checkbox" name="" value=""/>其他
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">我社存款</td>
    <td align="left">
        <SELECT id="u2510" class="u2510">
            <OPTION value="3万元内">3万元内</OPTION>
            <OPTION value="3-10万元内">3-10万元内</OPTION>
            <OPTION selected value="10-30万元内">10-30万元内</OPTION>
            <OPTION value="30-100万元内">30-100万元内</OPTION>
            <OPTION value="100万元以上">100万元以上</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行存款</td>
    <td align="left">
        <SELECT id="u2511" class="u2511">
            <OPTION selected value="3万元内">3万元内</OPTION>
            <OPTION value="3-10万元内">3-10万元内</OPTION>
            <OPTION value="10-30万元内">10-30万元内</OPTION>
            <OPTION value="30-100万元内">30-100万元内</OPTION>
            <OPTION value="100万元以上">100万元以上</OPTION>
        </SELECT>
    </td>
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
    <td align="left">
        <INPUT id="u2512" type=text value="" class="u2512">
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">本行负债（万元）</td>
    <td align="left" colspan="2"><INPUT id="u2513" type=text value="" class="u2513"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">他行负债（万元）</td>
    <td align="left" colspan="2"><INPUT id="u2514" type=text value="" class="u2514"></td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        贷款用途
    </td>
    <td align="left" colspan="3"><INPUT id="u2515" type=text value="" class="u2515"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">贷款形态</td>
    <td align="left" colspan="3"><INPUT id="u2516" type=text value="" class="u2516"></td>
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
    <td align="left"><INPUT id="u2517" type=text value="张惠孝" class="u2517"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年收入（万元）</td>
    <td align="left"><INPUT id="u2518" type=text value="1" class="u2518"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与户主关系</td>
    <td align="left">
        <SELECT id="u2519" class="u2519">
            <OPTION value="配偶">配偶</OPTION>
            <OPTION value="父母">父母</OPTION>
            <OPTION value="子女">子女</OPTION>
            <OPTION selected value="其他血亲">其他血亲</OPTION>
            <OPTION value="其他姻亲">其他姻亲</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">常住地址</td>
    <td align="left">
        <SELECT id="u2520" class="u2520">
            <OPTION value="本市">本市</OPTION>
            <OPTION selected value="本地区">本地区</OPTION>
            <OPTION value="省内地区">省内地区</OPTION>
            <OPTION value="省外">省外</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        职业
    </td>
    <td align="left" colspan="3">
        <SELECT id="u2521" class="u2521">
            <OPTION value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</OPTION>
            <OPTION selected value="专业技术人员">专业技术人员</OPTION>
            <OPTION value="办事人员和有关人员">办事人员和有关人员</OPTION>
            <OPTION value="商业、服务业人员">商业、服务业人员</OPTION>
            <OPTION value="农、林、牧、渔、水利业生产人员">农、林、牧、渔、水利业生产人员</OPTION>
            <OPTION value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</OPTION>
            <OPTION value="军人">军人</OPTION>
            <OPTION value="不便分类的其他从业人员">不便分类的其他从业人员</OPTION>
            <OPTION value="未知">未知</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
    <td align="left" colspan="3"><INPUT id="u2522" type=text value="350583198011151353" maxlength="18"
                                        style="width:200px"></td>
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
    <td align="left"><INPUT id="u2517" type=text value="张惠贤" class="u2517"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">年收入（万元）</td>
    <td align="left"><INPUT id="u2518" type=text value="1" class="u2518"></td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">与户主关系</td>
    <td align="left">
        <SELECT id="u2519" class="u2519">
            <OPTION value="配偶">配偶</OPTION>
            <OPTION value="父母">父母</OPTION>
            <OPTION value="子女">子女</OPTION>
            <OPTION selected value="其他血亲">其他血亲</OPTION>
            <OPTION value="其他姻亲">其他姻亲</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">常住地址</td>
    <td align="left">
        <SELECT id="u2520" class="u2520">
            <OPTION value="本市">本市</OPTION>
            <OPTION selected value="本地区">本地区</OPTION>
            <OPTION value="省内地区">省内地区</OPTION>
            <OPTION value="省外">省外</OPTION>
        </SELECT>
    </td>
</tr>
<tr>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">
        职业
    </td>
    <td align="left" colspan="3">
        <SELECT id="u2521" class="u2521">
            <OPTION value="国家机关、党群组织、企业、事业单位负责人">国家机关、党群组织、企业、事业单位负责人</OPTION>
            <OPTION selected value="专业技术人员">专业技术人员</OPTION>
            <OPTION value="办事人员和有关人员">办事人员和有关人员</OPTION>
            <OPTION value="商业、服务业人员">商业、服务业人员</OPTION>
            <OPTION value="农、林、牧、渔、水利业生产人员">农、林、牧、渔、水利业生产人员</OPTION>
            <OPTION value="生产、运输设备操作人员及有关人员">生产、运输设备操作人员及有关人员</OPTION>
            <OPTION value="军人">军人</OPTION>
            <OPTION value="不便分类的其他从业人员">不便分类的其他从业人员</OPTION>
            <OPTION value="未知">未知</OPTION>
        </SELECT>
    </td>
    <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">证件号码</td>
    <td align="left" colspan="3"><INPUT id="u2522" type=text value="350583198011151353" maxlength="18"
                                        style="width:200px"></td>
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