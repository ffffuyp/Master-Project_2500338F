<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html class="no-js">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Update password</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="icon" type="image/png"
			href="<%=Const.ROOT%>assets/i/favicon.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="stylesheet"
			href="<%=Const.ROOT%>assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
	</head>
	<body>
		<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

		<%@include file="top.jsp"%>

		<div class="am-cf admin-main">
			<!-- sidebar start -->
			<%@include file="sidebar.jsp"%>
			<!-- sidebar end -->

			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-cf am-padding am-padding-bottom-0">
						<div class="am-fl am-cf">
							<strong class="am-text-primary am-text-lg">Index</strong> /
							<small> Password modification</small>
						</div>
					</div>
					<hr>

					<div class="am-g">
						<div class="am-u-sm-9">
							<form class="am-form am-form-horizontal" action="user_updatepwd.action" method="post" onsubmit="return checkUpdate()">
                            	<input type="hidden" name="id" value="${currentUser.id }"/>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">Original password</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password" name="password"/>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">New password</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password1" name="password1"/>
                                    </div>
                                </div>     
								
								<div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">Confirm New Password</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password2"/>
                                    </div>
                                </div> 
								
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary">Save</button>
                                    </div>
                                </div>
                            </form>
							
						</div>
					</div>
				</div>
				<%@include file="footer.jsp"%>
			</div>
			<!-- content end -->
		</div>

		<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
		<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<script>

		//验证
		  function checkUpdate(){
		  	if($("#password").val()==""){
		  		alert("Enter your original password");
		  		return false;
		  	}
		  	
			if($("#password1").val()==""){
		  		alert("Enter new password");
		  		return false;
		  	}
		  	if($("#password2").val()!=$("#password1").val()){
		  		alert("Entered new passwords are inconsistent");
		  		return false;
		  	}
		  	
		  	return true;
		  }
		  	
</script>
	<c:if test="${not empty msg}">
	  	<script>
	  		alert("${msg}");
	  	</script>
	  </c:if>
	</body>
</html>
