$(function () {

    $('input[placeholder]').each(function(){
        var input = $(this);
        $(input).val(input.attr('placeholder'));

        $(input).focus(function(){
            if (input.val() == input.attr('placeholder')) {
                input.val('');
            }
        });

        $(input).blur(function(){
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.val(input.attr('placeholder'));
            }
        });
    });

    //左侧菜单样式控制
    $('.span3').click(function () {
        $("li[class='active']").removeAttr("class");
        $(this).addClass("active");
    });

    //查看
    $('.showOperate').click(function () {
        var me = $(this);
        var recordId = me.attr('recordId');
        var url = '/family/' + recordId;
        window.location.href = url;
    });

    //编辑
    $('.editOperate').click(function () {
        var me = $(this);
        var recordId = me.attr('recordId');
        var url = '/family/edit/' + recordId;
        window.location.href = url;
    });


    //删除
    $('.deleteOperate').click(function () {
        if (confirm('确定要删除吗？')) {
            var me = $(this);
            var recordId = me.attr('recordId');
            //var assetsId = me.attr('assetsId');
            var url = '/family/delete/'+recordId;
            window.location.href = url;
        }
    });

    //全选
    var firstNodes = $('.first');
    firstNodes.eq(0).bind('click', chooseAll);
    function chooseAll() {
        var me = $(this);
        var flag;
        if (me.children('input:enabled').eq(0).attr('checked')) {
            flag = true;
        } else {
            flag = false;
        }
        $.each(firstNodes, function (i, firstNode) {
            if (i != 0) {
                $(firstNode).children('input:enabled').eq(0).attr('checked', flag);
            }
        });
    }

    //指派
    $('.appointOperate').click(function () {
        var me = $(this);
        var recordId = me.attr('recordId');

        $(".appointOperate").fancybox({
            'transitionIn'		: 'elastic',
            'transitionOut'		: 'elastic',
            'hideOnContentClick': true,
            'closeBtn' : false
        });
        $('#recordIds').val(recordId);
    });

    // 批量指派
    $('#assignOperate').click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            $('#recordIds').val(recordIds);
            $("#assignOperate").fancybox({
                'transitionIn'		: 'elastic',
                'transitionOut'		: 'elastic',
                'hideOnContentClick': true,
                'closeBtn' : false
            });
        } else {
            alert("未勾选任何客户信息！");
        }
    });

    $('#appointOkOperate').click(function () {
        var uid =$('#selectUserId').val();
        var recordIds = $('#recordIds').val();
        if(uid && uid!=''){
            var url = '/family/saveBatchAppoint/'+recordIds+'/'+uid ;
            window.location.href = url;
        }else{
            alert("指定经理不能为空！");
        }
    });

    //验收
    var batchCheckNode = $('#checkOperate');
    batchCheckNode.click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            $("#checkOperate").fancybox({
                'transitionIn'		: 'elastic',
                'transitionOut'		: 'elastic',
                'hideOnContentClick': true,
                'closeBtn' : false
            });

            /*var url = '/family/batchChecks/' + recordIds;
            window.art.dialog({
                id: 'check',
                title: '验收信息',
                lock: true,
                content: '<iframe scrolling="auto" width="450" height="210" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
            });*/
            $('#checkOkOperate').click(function () {
                var state = $('#state').val();
                if(state && state!=''){
                    var url = '/family/saveBatchChecks/'+recordIds+'/'+state;
                    window.location.href = url;
                }else{
                    alert("未选择验收结果！");
                }
            });
        } else {
            alert("未勾选任何客户信息！");
        }
    });

    //导入基础数据
    $('#importBasicOperate').click(function () {
        var url = '/family/importBasicData';
        window.top.artDialog({
            id: 'import',
            title: '导入数据信息',
            lock: true,
            content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
        });
    });
    //导入村委会评价表
    $('#importVillageAssess').click(function () {
        var url = '/family/importVillageAssess';
        window.top.artDialog({
            id: 'import',
            title: '导入数据信息',
            lock: true,
            content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
        });
    });

    $('#exportData').click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            if ($('#selectAll').is(':checked')) {
                recordIds = 'All';
            }
            var url = '/family/exportData/' + recordIds;
            document.location.href = url;
            /*window.top.artDialog({
             id: 'export',
             title: '导出数据信息',
             lock: true,
             content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
             });*/
        } else {
            alert("未勾选任何客户信息！");
        }
    });

    //导出数据
    $('#exportBasicData4Household').click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            if ($('#selectAll').is(':checked')) {
                recordIds = 'All';
            }
            var url = '/family/exportBasicData4Household/' + recordIds;
            document.location.href = url;
            /*window.top.artDialog({
                id: 'export',
                title: '导出数据信息',
                lock: true,
                content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
            });*/
        } else {
            alert("未勾选任何客户信息！");
        }
    });

    $('#exportBasicData4Members').click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            if ($('#selectAll').is(':checked')) {
                recordIds = 'All';
            }
            var url = '/family/exportBasicData4Members/' + recordIds;
            document.location.href = url;
            /*window.top.artDialog({
             id: 'export',
             title: '导出数据信息',
             lock: true,
             content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
             });*/
        } else {
            alert("未勾选任何客户信息！");
        }
    });

    //导出村委会评价表
    $('#exportVillageAssess').click(function () {
        var me = $(this);
        var checkOperaNodes = $('.checkOpera');
        var isExist = false;
        var recordIds = '';
        var j = 0;
        $.each(checkOperaNodes, function (i, checkOperaNode) {
            checkOperaNode = $(checkOperaNode);
            if (checkOperaNode.attr('checked')) {
                isExist = true;
                if (j == 0) {
                    recordIds = checkOperaNode.attr('recordId');
                } else {
                    recordIds = recordIds + ',' + checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if (isExist) {
            if ($('#selectAll').is(':checked')) {
                recordIds = 'All';
            }
            var url = '/family/exportVillagerEstimation/' + recordIds;
            document.location.href = url;
           /* window.top.artDialog({
                id: 'export',
                title: '导出数据信息',
                lock: true,
                content: '<iframe scrolling="auto" width="400" height="250" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="' + url + '"/>'
            });*/
        } else {
            alert("未勾选任何客户信息！");
        }
    });


});
