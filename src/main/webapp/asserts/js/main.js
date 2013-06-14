$(function(){
    //左侧菜单样式控制
    $('.span3').click(function(){
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

    //编辑
    $('.editOperate').click(function(){
        var me=$(this);
        var id=me.attr('recordId');
        var url='family/edit/'+id;
        window.location.href = url;
    });


    //删除
    $('.deleteOperate').click(function(){
        if(confirm('确定要删除吗？')){
            var me=$(this);
            var id=me.attr('recordId');
            var url = 'family/delete/'+id;
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

    //指派
    $('.appointOperate').click(function(){
        var me=$(this);
        var recordId=me.attr('recordId');
        //var uName=me.attr('userName');
        var url='family/appoint/'+recordId;
        window.art.dialog({
            id: 'assign',
            title: '指派信息',
            lock:true,
            content:'<iframe scrolling="auto" width="450" height="210" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
        });
    });

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
            if(!recordIds.split(',')){
              var url='family/appoint/'+recordId;
              window.art.dialog({
                id: 'assign',
                title: '指派信息',
                lock:true,
                content:'<iframe scrolling="auto" width="450" height="210" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
              });
            }else{
                alert("只能勾选任一项信息！");
            }
        }else{
            alert("未选勾选任何信息！");
        }
    });

    //导入基础数据
    $('#importBasicOperate').click(function(){
        var url='family/importBasicData';
        window.top.artDialog({
            id: 'import',
            title: '导入基础数据信息',
            lock:true,
            content:'<iframe scrolling="auto" width="500" height="350" frameborder="0" style="border: none;margin: -20px -25px;"marginheight="0" marginwidth="0" src="'+ url +'"/>'
        });

    });
});
