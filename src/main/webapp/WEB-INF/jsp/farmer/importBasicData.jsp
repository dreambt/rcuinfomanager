<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp" />
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <link href="/asserts/js/swfupload/css/default.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/asserts/js/swfupload/swfupload.js"></script>
    <script type="text/javascript" src="/asserts/js/swfupload/js/swfupload.queue.js"></script>
    <script type="text/javascript" src="/asserts/js/swfupload/js/fileprogress.js"></script>
    <script type="text/javascript" src="/asserts/js/swfupload/js/handlers.js"></script>
    <script type="text/javascript" src="/asserts/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/asserts/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var swfu;
        var file_queue = [];
        $(function(){
            //上传
            $('#uploadOpera').click(function(){
                alert("+++++=");
                for(var i=0;i<file_queue.length;i++){
                    swfu.startUpload(file_queue[i].id);
                }
            });
            //取消
            $('#closeOpera').click(function(){
                alert("23eeeee");
                  if(parent.uploadComplete){
                      parent.uploadComplete();
                  }else{
                      alert("上传失败");
                  }
            });
        });

        //上传控件参数
        window.onload = function() {
            var upload_raw_type;
            swfu = new SWFUpload({
                flash_url : "../asserts/js/swfupload/swfupload.swf",
                upload_url: "${request.contextPath}",
                post_params: {
                    "addUid": "<%=session.getAttribute("userId") %>",
                    "JSESSIONID": '<cookie name="JSESSIONID" />'
                },
                file_size_limit : "1000 MB",
                file_types : "*.jpg;*.png;*.gif;*.bmp;*.xls;*.xlsx",
                file_types_description : "所有文件",
                file_upload_limit : 0,
                file_queue_limit : 0,
                button_window_mode : "transparent",
                custom_settings : {
                    progressTarget : "fsUploadProgress",
                    cancelButtonId : "btnCancel"
                },
                debug: false,

                // Button settings
                button_image_url: "../asserts/js/swfupload/images/TestImageNoText_65x29.png",
                button_width: "65",
                button_height: "29",
                button_placeholder_id: "spanButtonPlaceHolder",
                button_text: '<span class="theFont">浏览</span>',
                button_text_style: ".theFont { font-size: 16;margin-left: 2px; height: 29px; }",
                button_text_left_padding: 12,
                button_text_top_padding: 3,

                // The event handler functions are defined in handlers.js
                file_queued_handler : fileQueued,
                file_queue_error_handler : fileQueueError,
                file_dialog_complete_handler : fileDialogComplete,
                upload_start_handler : uploadStart,
                upload_progress_handler : uploadProgress,
                upload_error_handler : uploadError,
                upload_success_handler : uploadSuccess,
                upload_complete_handler : uploadComplete,
                queue_complete_handler : queueComplete	// Queue plugin event
            });
        };

        var fileSuffixal = {};
        var complete_file_count = 0;
        fileSuffixal['bmp'] = 'picture';
        fileSuffixal['gif'] = 'picture';
        fileSuffixal['jpg'] = 'picture';
        fileSuffixal['png'] = 'picture';
        fileSuffixal['xls'] = 'text';
        fileSuffixal['xlsx'] = 'text';

        //获取上传文件类型
        function validateFileSuffixal(file){
            var suffixal;
            var idx = file.name.lastIndexOf('.');
            if(idx != -1) {
                suffixal = file.name.substring(idx + 1);
            }
            suffixal = suffixal.toLowerCase();
            if(suffixal) {
                return fileSuffixal[suffixal];
            } else {
                return false;
            }
        }
        //获取文件大小
        function getFileSizeDesc (length){
            if(length < 1024) {
                return length + "B";
            } else if(length < 1024 * 1024) {
                return parseInt(length / 1024, 10) + "K";
            } else  {
                return parseInt(length / (1024 * 1024), 10) + "M";
            }
        }
    </script>
</head>
<body>
<div>
    <%--<input type="hidden" value="${session.user_id}" id="userId">--%>

        <%--<dl class="uploadFiles clearfix">
            <dt onmouseout="$('.tips_con').hide();" onmouseover="$('.tips_con').show();" class="tips">
            <span class="tips_tb"></span>
            <div class="tips_con" style="display:none;">
                <div>支持的图片类型：
                    bmp&nbsp;
                    gif&nbsp;
                    jpg&nbsp;
                    png
                </div>
                <div>支持的文本类型：
                    xls&nbsp;
                    xlsx
                </div>
            </div>
            </dt>
            <dt>添加:</dt>
        </dl>--%>
        <div class="fieldset flash" id="fsUploadProgress"></div>
        <div id="divStatus" style="display:none">0 Files Uploaded</div>
        <div style="margin: 5px;">
            <span id="spanButtonPlaceHolder"></span>
            <input id="btnCancel" type="button" value="取消上传" onclick="swfu.cancelQueue();" disabled="disabled"
                   style="margin-left: 2px; font-size: 10pt; height: 29px;" />
        </div>
        <p align="center">
            <a href="javascript:void(0)" class="btn" id="uploadOpera"><span>上传</span></a>
            <a href="javascript:void(0)" class="btn" id="closeOpera"><span>返回</span></a>
        </p>

</div>
</body>
</html>