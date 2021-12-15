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
    <form action="user_login.action" method="post" id="userForm" class="am-form">
      <label for="name">Username:</label>
      <input type="text" name="username" id="username" value="">
      <br>
      <label for="upass">Password:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      <label for="role">Identity:</label>
      <select name="role" id="role">
      	<option value="-1"> Select identity</option>
      	<option value="0">Admin</option>
      	<option value="1">Contributor</option>
      	<option value="2">Reviewer</option>
      </select>
      <br>
      <div class="am-cf">
        <input type="button" id="loginbtn" value="Login" class="am-btn am-btn-primary am-btn-sm am-fl"> &nbsp; <a href="javascript:add()">Contributor Registration</a> 
      </div>
    </form>
    <hr>
    
  </div>
</div>

<!-- 新增对话框begin -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<h3>Contributor Registration</h3>
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<!-- 新增表单开始 -->
				<form class="am-form" name="addForm" action="<%=Const.ROOT%>user_reg.action" method="post"
					onsubmit="return checkAdd()">	
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							Username
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="username1" name="user.username" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							Password
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password1" name="user.password" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							Confirm password
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password2" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							Real name
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="name1" name="user.name" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							Phone number
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="phone" name="user.phone" class="am-input-sm">
						</div>
					</div>
					<div style="margin-top:10px;">
						<button type="submit" class="am-btn am-btn-primary am-btn-xs">
							Save
						</button>
						<button type="reset" class="am-btn am-btn-primary am-btn-xs">
							Reset
						</button>
					</div>
				</form>
				<!-- 新增表单结束 -->
			</div>
		</div>
	</div>
	<!-- 新增对话框 end-->

<script src="<%=Const.ROOT %>assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=Const.ROOT %>assets/js/amazeui.min.js"></script>
<script src="<%=Const.ROOT %>assets/js/app.js"></script>
<script>
  $(function(){
	  $("#loginbtn").click(function(){
		  var username=$("#username").val();
		  var password=$("#password").val();
		  var role=$("#role").val();
		  if(username==""){
			  alert("Enter user name");
			  return false;
		  }
		  if(password==""){
			  alert("Enter password");
			  return false;
		  }
		  if(role=="-1"){
			  alert("Select identity");
			  return false;
		  }
		  $("#userForm").submit();
	  });
  });

//验证增加
  function checkAdd(){
  	if($("#username1").val()==""){
  		alert("Enter user name");
  		return false;
  	}
  	if($("#password1").val()==""){
  		alert("Enter password");
  		return false;
  	}
  	if($("#password2").val()==""){
  		alert("Confirm password");
  		return false;
  	}
  	if($("#password1").val()!=$("#password2").val()){
  		alert("Entered passwords are inconsistent");
  		return false;
  	}
  	
  	if($("#name1").val()==""){
  		alert("Enter user name");
  		return false;
  	}
  	
  	if($("#phone").val()==""){
  		alert("Enter phone number");
  		return false;
  	}
  	return true;
  }
  function add(){
  	$("#add-modal").modal({width:500,height:330});
  }
  
  </script>
  <s:if test="#request.msg!=null">
  	<script>
  	alert("${msg}");
  	</script>
  </s:if>
</body>
</html>
