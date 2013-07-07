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
        var pageNum = $('#currentPage').val();
        if(uid && uid!=''){
            var url = '/family/saveBatchAppoint/'+recordIds+'/'+uid+'/'+pageNum ;
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
            $('#checkOkOperate').click(function () {
                var state = $('#state').val();
                if(state && state!=''){
                    var pageNum = $('#currentPage').val();
                    var url = '/family/saveBatchChecks/'+recordIds+'/'+state+'/'+pageNum;
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
        $("#importBasicOperate").fancybox({
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
        });
    });
    //导入村委会评价表
    $('#importVillageAssess').click(function () {
        $("#importVillageAssess").fancybox({
            'height':400,
            'autoScale':'false',
            'transitionIn'		: 'elastic',
            'transitionOut'		: 'elastic',
            'hideOnContentClick': false,
            'closeBtn' : false,
            'type':'ajax',
            closeClick  : false, // prevents closing when clicking INSIDE fancybox
            helpers   : {
                overlay : {closeClick: false} // prevents closing when clicking OUTSIDE fancybox
            }
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
        } else {
            alert("未勾选任何客户信息！");
        }
    });


});
