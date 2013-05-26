<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <script src="/asserts/js/bootstrap.min.js"></script>
    <script src="/asserts/js/jquery-1.7.2.min.js"></script>

    <script>
      $(function(){
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
  <form id="form" action="" method="post">
      <div>
          <p>
              <label>户主：</label>赵晓明 &nbsp;<label> 电话：</label>111111111111111
          </p>
      </div>
      <table>
          <tr>
              <td>户主：</td>
              <td></td>
              <td>电话：</td>
              <td>1111111111</td>
          </tr>
          <tr>
              <td>指派给：</td>
          </tr>
          <tr>
              <td>
                  <select class="span2" name="">
                      <option value="">选择网点</option>
                      <option value="" >小作社</option>
                  </select>
              </td>
          </tr>
          <tr>
              <td><input type="text" placeholder="指定客户经理" name="" value="">（可选）</td>
          </tr>
          <tr>
              <td>
                  <p class="text-center">
                      <a class="btn" href="#" id="okOperate">确定</a>&nbsp;
                      <a class="btn" href="#" id="cancelOperate">取消</a>
                  </p>
              </td>
          </tr>
      </table>
  </form>


</body>
</html>