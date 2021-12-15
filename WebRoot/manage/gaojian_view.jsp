<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title></title>
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
							<small>Draft View</small>
						</div>
					</div>
					<hr>

					<div class="am-g">
						<div class="am-u-sm-9">
							<!-- 修改表单begin -->
							<table class="am-table am-table-bordered am-table-radius">
								<tr class="am-active">
									<td width="30%">Title</td>
									<td width="70%">${gaojian.name}</td>
								</tr>
								<tr>
									<td>Contributor</td>
									<td>${gaojian.tuser.name}</td>
								</tr>
								
								<tr>
									<td>Time of submission</td>
									<td>${gaojian.ttime}</td>
								</tr>
								<tr>
									<td>Reviewer</td>
									<td>${gaojian.suser.name}</td>
								</tr>
								<tr>
									<td>Time of Revision</td>
									<td>${gaojian.stime}</td>
								</tr>
								
								<tr>
									<td>File</td>
									<td>
									<c:if test="${not empty gaojian.ppath}">
										<a href="javascript:todownload('${gaojian.ppath}')">Download</a>
									</c:if>
									</td>
								</tr>
								<tr>
									<td>Content</td>
									<td>${gaojian.pcontent}</td>
								</tr>
								<tr>
									<td>Status</td>
									<td>${gaojian.status}</td>
								</tr>
							</table>
							<div style="margin-top: 4px; text-align: center;">
								<button type="button" onclick="history.go(-1)" class="am-btn am-btn-primary am-btn-xs">
									Return
								</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
			<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
			<!--<![endif]-->
			<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
			<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
			<script src="<%=Const.ROOT%>assets/js/app.js"></script>
<script>
function todownload(url){
	location.href="<%=Const.ROOT%>download.action?fileName="+url;
}
</script>
	</body>
</html>
