<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp" />
<html>
<head>
    <title>农户建档现场电子信息采集系统</title>
    <!-- Bootstrap -->
    <link href="/asserts/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/doc.css" rel="stylesheet" media="screen">
    <link href="/asserts/css/style.css" rel="stylesheet" media="screen">
    <script type="text/javascript">
        $(function(){
        });
    </script>
</head>
<body>

<div class="farmer_info">
   <form name="myform" id="myform" action="" method="post">
     <div class="table-list">
       <table width="100%" border="1">
          <tbody>
             <tr>
               <td align="center">张惠忠</td>
               <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">性别</td>
               <td align="center">男</td>
               <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">是否农户</td>
               <td align="center">是</td>
               <td align="center" bgcolor="#1e90ff" style="color:#FFFFFF">客户类型</td>
               <td align="center">一般农户</td>
             </tr>
          </tbody>
       </table>
     </div>
   </form>
</div>
<script src="/asserts/js/jquery-1.7.2.min.js"></script>
<script src="/asserts/js/bootstrap.min.js"></script>
</body>
</html>