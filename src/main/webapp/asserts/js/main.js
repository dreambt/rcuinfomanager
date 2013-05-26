$(function(){

    var firstLoginResult='${firstLogin}';
    if(firstLoginResult){
        alert("第一次登录，是否需要修改密码？");
    }
    //左侧菜单样式控制
    $('.nav li').click(function(){
        $("li[class='active']").removeAttr("class");
        $(this).addClass("active");
    });

    //查看
    $('.showOperate').click(function(){
        var me=$(this);
        var recordId = me.attr('recordId');
        var url='family/'+recordId;
        window.location.href = url;
    });

    //指派
    $('.appointOperate').click(function(){
        var me=$(this);
        var recordId=me.attr('recordId');
        var url='family/appoint/'+recordId;
        window.art.dialog({
            id: 'assign',
            title: '指派信息',
            lock:true,
            content:'<iframe scrolling="auto" width="550" height="220" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
        });
    });

    //编辑
    $('.editOperate').click(function(){
        var me=$(this);
        var recordId=me.attr('recordId');
        var url='family/edit/'+recordId;
        window.location.href = url;
    });


    //删除
    $('.deleteOperate').click(function(){
        if(confirm('确定要删除吗？')){
            var me=$(this);
            var recordId=me.attr('recordId');
            var url = 'family/delete/'+recordId;
            window.location.href=url;
        }
    });

    //全选
    var firstNodes= $('.first');
    firstNodes.eq(0).bind('click',chooseAll);
    function chooseAll(){
        var me=$(this);
        var flag;
        if(me.children('input:enabled').eq(0).attr('checked')){
            flag=true;
        }else{
            flag=false;
        }
        $.each(firstNodes,function(i,firstNode){
            if(i!=0){
                $(firstNode).children('input:enabled').eq(0).attr('checked',flag);
            }
        });
    }

    // 批量指派
    var batchAssignNode=$('#assignOperate');
    batchAssignNode.click(function(){
        var me=$(this);
        var checkOperaNodes=$('.checkOpera');
        var isExist=false;
        var recordIds='';
        var j=0;
        $.each(checkOperaNodes,function(i,checkOperaNode){
            checkOperaNode=$(checkOperaNode);
            if(checkOperaNode.attr('checked')){
                isExist=true;
                if(j==0){
                    recordIds=checkOperaNode.attr('recordId');
                }else{
                    recordIds=recordIds+','+checkOperaNode.attr('recordId');
                }
                j++;
            }
        });
        if(isExist){
            var url = 'family/batchAppoint/ids='+recordIds;
            window.top.artDialog({
                id: 'assign',
                title: '指派信息',
                lock:true,
                content:'<iframe scrolling="auto" width="620" height="560" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
            });
        }else{
            alert("未勾选任何客户信息！");
        }
    });

});