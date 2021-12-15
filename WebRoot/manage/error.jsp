<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head lang="cn">
  <meta charset="UTF-8">
  <title>Exam Setting and Review system</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="<%=Const.ROOT %>assets/i/favicon.png">
  <link rel="stylesheet" href="<%=Const.ROOT %>assets/css/amazeui.min.css"/>
  
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>Exam Setting and Review system</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <s:actionmessage/>
    <s:actionerror/>
    <s:fielderror></s:fielderror>
    <hr>
    
  </div>
</div>
<script src="<%=Const.ROOT %>assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=Const.ROOT %>assets/js/amazeui.min.js"></script>
<script src="<%=Const.ROOT %>assets/js/app.js"></script>

  <s:if test="#request.msg!=null">
  	<script>
  	alert("${msg}");
  	</script>
  </s:if>
</body>
</html>
