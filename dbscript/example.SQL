/***************/
/*             */
/* example.SQL */
/*             */
/***************/

/* Begin Transaction */
/* begin transaction;*/

/* Data [baseinfo] */
insert into [baseinfo] values(5, 'admin', '小岞镇新桥村', '张惠忠', '350583198011151352', 0, 0, '身份证', '20010302', '20210302', '一般农户', '19801115', '中国', 0, '汉族', '群众', '小岞镇新桥村09组410号', '362100', '87830100', '13100000000', '350521113204', '新桥', '其他', '初中', '良好', '普通客户', '自置', '已婚', '养老保险,医疗保险', '一般', '专业技术人员', '务农', 6, '户口所在地', '农、林、牧、渔业', '', null, null, null, null, '3-6万元', '5年（含）以上', '一般', '其他', '1010101', '稻谷种植', null, '无职业', '一般员工', '无', 1, '2013-06-14 00:00:00.000', '2013-06-14 00:00:00.000', null, '2013-06-14 00:00:00.000', null, null, null, null);


/* Data [familyassets] */
insert into [familyassets] values(7, 5, 250, '房屋,土地,车辆,金融资产', '3万元内', '3万元内', null, null, null, null);


/* Data [carsinfo] */
insert into [carsinfo] values(5, 7, '轿车', '10-30万元', 1, '自用', null, null, null, null);
insert into [carsinfo] values(6, 7, '货车', '10万以内', 1, '营运', null, null, null, null);


/* Data [customermanagereva] */
insert into [customermanagereva] values(8, 5, '', '报告期内无银行信用记录', '一般', '较好', null, null, null, null);


/* Data [familyincurdebts] */
insert into [familyincurdebts] values(11, 5, 5, 5, null, '买车', '现金', null, null, null, null);


/* Data [familymemberinfo] */
insert into [familymemberinfo] values(6, 5, '350583199806030001', '350583198011151352', '张啥小', 1, '子女', '专业技术人员', '本地区', null, null, null, null);
insert into [familymemberinfo] values(7, 5, '350583198201010002', '350583198011151352', '李妹', 1, '配偶', '专业技术人员', '本地区', null, null, null, null);
insert into [familymemberinfo] values(8, 5, '350583198705040003', '350583198011151352', '张三丰', 1, '子女', '专业技术人员', '本地区', null, null, null, null);


/* Data [financeservices] */
insert into [financeservices] values(8, 5, '存款,贷款,信用卡,POS机,保管箱,网上银行,居家银行,短信银行,电话银行,手机银行,其他', '较为适用', 0, '购买农业生产资料', 2, 36, '房地产,存单,债券,保证人', '做生意,子女上学,盖（买）房子,购买大件物品,获得利息,购买其他金融资产（如股票、债券、基金、保险单）,其他', null, null, null, null, '信用卡,福万通卡,贵宾卡', '短信银行,电话银行,网上银行,手机银行', '代缴水费,代缴电费,代缴烟草费,代发工资,电子扣税,保险费代扣', '银联POS机,福农通,小额支付便民点,生意通,居家银行', null, '流动资金贷款,固定资产贷款,小企业联保贷款,中小企业保证贷款,担保公司担保贷款,海域使用权抵押贷款,船舶抵押贷款,商标专用权质押贷款,保函业务,银行承兑汇票,银行承兑汇票贴现', '农户小额信用贷款,农户联保贷款,农户保证贷款,农户抵押贷款,农户质押贷款,个人存单质押贷款,“万通宝”农户小额贷款,“万通宝”个人经营贷款,“组合宝”农户小额贷款,“组合宝”个人经营贷款,“保无忧”新农保参保人员贷款,“两女”户计生贴息贷款,生源地信用助学贷款,农村青年创业贷款,巾帼创业贷款,农户异地创业贷款,“惠村通”,农户建房贷款,个人住房按揭贷款,个人汽车按揭贷款,农民专业合作社贷款,公职人员消费贷款', null, null, null, null);


/* Data [financialassets] */
insert into [financialassets] values(5, 7, '活期存款,股票', '3万元内', '3万元内', null, null, null, null);


/* Data [housepropertyinfo] */
insert into [housepropertyinfo] values(4, 7, '自建房', '户口地乡村', '砖混', '居住', 1, '自住', '100㎡内', '30-60万', 1, '无办证', null, null, null, null);
insert into [housepropertyinfo] values(5, 7, '商品房', '户口地乡村', '钢混', '商用楼', 1, '出租', '100-300㎡', '30-60万', 1, '无办证', null, null, null, null);


/* Data [incomeexpenses] */
insert into [incomeexpenses] values(6, 5, 6, 5, '工薪,务农,打工', 3, 3, '生活性支出', '不能', null, null, null, null);


/* Data [landinfo] */
insert into [landinfo] values(4, 7, '100-300㎡', '50', '集体证', '山地或滩涂', '自用', 0, null, null, null, null);
insert into [landinfo] values(5, 7, '100-300㎡', '45', '集体证', '山地或滩涂', '自用', 0, null, null, null, null);


/* Commit Transaction */
/* commit transaction;*/

