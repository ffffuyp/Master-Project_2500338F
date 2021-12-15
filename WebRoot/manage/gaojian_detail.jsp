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
		<script src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/ckeditor/ckeditor.js"></script>

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
							<small>Edit the draft</small>
						</div>
					</div>
					<hr>

					<div class="am-g">
						<div class="am-u-sm-9">
							<!-- 修改表单begin -->
							<form class="am-form" name="updateForm"
								action="gaojian_update.action" method="post"
								onsubmit="return checkUpdate()">
								<input type="hidden" name="id" id="id" value="${gaojian.id}" />
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Title
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" name="gaojian.name" class="am-input-sm"
											id="name" value="${gaojian.name}"/>
									</div>
								</div>
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Contributor
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" class="am-input-sm"
											readonly value="${gaojian.tuser.name}" />
									</div>
								</div>	
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Time of submission
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" name="gaojian.ttime" class="am-input-sm"
											id="ttime" value="${gaojian.ttime}" onclick="WdatePicker()"/>
									</div>
								</div>
								<c:if test="${sessionScope.role==0}">
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Time of revision
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" name="gaojian.stime" class="am-input-sm"
											id="stime" value="${gaojian.stime}"  onclick="WdatePicker()"/>
									</div>
								</div>
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Reviewer
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" class="am-input-sm"
											readonly value="${gaojian.suser.name}" />
									</div>
								</div>
								</c:if>
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										File
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="file" id="fujian" name="fujian"
										onchange="uploadFile()" />
										<input type="hidden" id="ppath" name="gaojian.ppath" value="${gaojian.ppath}"/>
										<c:if test="${not empty gaojian.ppath}">
											<a href="javascript:todownload('${gaojian.ppath}')">Download</a>
										</c:if>
									</div>
								</div>
								
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Content
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<TEXTAREA id="pcontent" NAME="gaojian.pcontent" ROWS="16">${gaojian.pcontent}</TEXTAREA>	
										<script>
											CKEDITOR.replace('pcontent');
										</script>
									</div>
								</div>
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-3 am-text-right">
										Status
									</div>
									<div class="am-u-sm-8 am-u-md-9 am-u-end col-end">
										<input type="text" class="am-input-sm" name="gaojian.status"
											readonly value="${gaojian.status}" />
									</div>
								</div>
								
								<div style="margin-top: 4px; text-align: center;">
									<c:if test="${sessionScope.role==0}">
										<button type="submit" class="am-btn am-btn-primary am-btn-xs">
											Edit
										</button>
									</c:if>
									<button type="button" onclick="history.go(-1)" class="am-btn am-btn-primary am-btn-xs">
										Return
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
			<!--<![endif]-->
			<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
			<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
			<script src="<%=Const.ROOT%>assets/js/app.js"></script>
<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
			<script>
	function checkUpdate() {
		if($("#name").val()==""){
			alert("Input the file name");
			return false;
		}
		if($("#ppath").val()==""){
			alert("Select file");
			return false;
		}
		return true;
	}
	function todownload(url){
		location.href="<%=Const.ROOT%>download.action?fileName="+url;
	}
	//上传文件
	function uploadFile(){
		  if($("#fujian").val()==""){
			  alert("Select file");
		  }else{
		  $.ajaxFileUpload
	    (
	        {
	            url: '<%=Const.ROOT%>upload', //用于文件上传的服务器端请求地址
	            secureuri: false, //是否需要安全协议，一般设置为false
	            fileElementId: 'fujian', //文件上传域的ID
	            success: function (data, status)  //服务器成功响应处理函数
	            {        	
	          	  $("#ppath").val($(data).find("body").text());
	          	  alert("Upload successful. please click save button");
	            },
	            error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert("Fail to upload");
	            }
	        }
	    );
		  }
	    return false;
	}
</script>

	</body>
</html>
