<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp" />
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>
    <style type="text/css">
        .type-file-box{position: relative;width: 260px;}
        input{vertical-align: middle;margin: 0;padding: 0;}
        .type-file-text{height: 22px;border: 1px solid #CDCDCD; width: 180px;}
        .type-file-button{background-color: #FFF;border: 1px solid #CDCDCD;height: 24px;width: 70px;}
        .type-file-file{position: absolute;top: 0;right: 0;height: 24px;filter:alpha(opacity:0);opacity: 0;width: 260px;}
    </style>
    <script type="text/javascript">
        $(function(){
            var textButton="<input type='text' name='file' id='textfield' class='type-file-text'><input type='submit' name='button' id='button' value='文件上传' class='type-file-button'> ";
            $(textButton).insertBefore('#fileField');
            $('#fileField').change(function(){
                $('#textfield').val($("#fileField").val());
            });

            //确定
            $('#addOpera').click(function(){
                $('#form').submit();
            });

            //关闭
            $('#cancelOperate').click(function() {
                window.top.art.dialog({id : 'assign' }).close();
            });
            //返回main
            var success='${params.success}';
            if(success&&success!=''){
                var url='farmer/main';
                $(window.top.window.document).find('#main').attr('src',url);
                window.top.art.dialog({id:'assign'}).close();
            }

        });
    </script>
</head>
<body>

<form id="myform" action="" method="post">
    <div class="type-file-box">
        <input id="fileField" class="type-file-file" type="file" name="file">
    </div>
</form>
<p align="center">
    <a class="btn" href="#" id="okOperate">导入</a>&nbsp;
    <a class="btn" href="#" id="cancelOperate">取消</a>
</p>
</body>
</html>