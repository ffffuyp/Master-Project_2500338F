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
		<title>Notice list</title>
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
							<small> Notice management </small>
						</div>
					</div>
					<hr>

					<div class="am-g">
						<!-- 搜索 -->
						<form action="gonggao_list.action" method="post" id="sform">
							<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo" />
							<div class="am-u-sm-12 am-u-md-6">
								<c:if test="${sessionScope.role==0 }">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default"
										onclick="add()">
										<span class="am-icon-plus"></span> Add
									</button>
								</div>
								</c:if>
							</div>
							<div class="am-u-sm-12 am-u-md-6">
								
							</div>

						</form>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-id">
											NO.
										</th>
										<th class="table-title">
											Content
										</th>
										<th class="table-set">
											Edit
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.list}" var="v" varStatus="st">
										<!-- 循环开始 -->
										<tr>
											<td>
												${st.count}
											</td>
											<td>
												${v.content}
											</td>
											
											<td>
												<div class="am-btn-toolbar">
													<div class="am-btn-group am-btn-group-xs">
														
														<c:if test="${sessionScope.role!=0 }">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="toview('${v.id}')">
															<span class="am-icon-pencil-square-o"></span> View
														</button>
														</c:if>
														<c:if test="${sessionScope.role==0 }">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="toupdate('${v.id}')">
															<span class="am-icon-pencil-square-o"></span> Edit
														</button>
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
															onclick="todelete('${v.id}')">
															<span class="am-icon-trash-o"></span> Delete
														</button>
														</c:if>
													</div>
												</div>
											</td>
										</tr>
										<!-- 循环结束 -->
									</c:forEach>
								</tbody>
							</table>
							<!-- 分页 -->
							<ul data-am-widget="pagination"
								class="am-pagination am-pagination-select">
								<li class="am-pagination-prev ">
									<a href="javascript:doPage('${pageBean.prePage }')" class="">Page Up</a>
								</li>
								<li class="am-pagination-select">
									${pageBean.pageNo }/${pageBean.totalPage }
								</li>
								<li class="am-pagination-next ">
									<a href="javascript:doPage('${pageBean.nextPage }')" class="">Page Down</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<%@include file="footer.jsp"%>
			</div>
			<!-- content end -->
		</div>

		<!-- 删除对话框begin -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					Delete this record?
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>No</span>
					<span class="am-modal-btn" data-am-modal-confirm>Yes</span>
				</div>
			</div>
		</div>
		<!-- 删除对话框end -->
		<!-- 增加对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					Add
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 新增用户表单begin -->
					<form class="am-form" name="aform" action="gonggao_add.action"
						method="post" onsubmit="return checkAdd()">
						
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-4 am-u-md-2 am-text-right">
								Content
							</div>
							<div class="am-u-sm-8 am-u-md-10 am-u-end col-end">
								<TEXTAREA id="content1" NAME="gonggao.content" ROWS="6"></TEXTAREA>	
								<script>
									CKEDITOR.replace('content1');
								</script>
							</div>
						</div>
						
						<div class="am-margin">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								Save
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs">
								Reset
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--修改对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="update-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					Edit
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 修改用户表单begin -->
					<form class="am-form" name="aform" action="gonggao_update.action"
						method="post" onsubmit="return checkUpdate()">
						<input type="hidden" name="id" id="id" />
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-4 am-u-md-2 am-text-right">
								Content
							</div>
							<div class="am-u-sm-8 am-u-md-10 am-u-end col-end">
								<TEXTAREA id="content2" NAME="gonggao.content" ROWS="6"></TEXTAREA>	
								<script>
									CKEDITOR.replace('content2');
								</script>
							</div>
						</div>
						
						<div class="am-margin">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								Save
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs">
								Reset
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="view-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					View
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 修改用户表单begin -->
						<table class="am-table am-table-bordered am-table-radius">
								<tr class="am-active">
									<td width="30%">Time</td>
									<td width="70%" id="gtime"></td>
								</tr>
								<tr>
									<td>Content</td>
									<td align="left" id="content"></td>
								</tr>
						</table>
				</div>
			</div>
		</div>
		
		
		
		<!-- 修改用户end -->
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
		<script src="<%=path%>/js/ajaxfileupload.js"></script>
		<script>
		
//验证增加
function checkAdd(){
	if(CKEDITOR.instances.content1.getData()==""){
		alert("Input content");
		return false;
	}
	return true;
}
function checkUpdate(){
	if(CKEDITOR.instances.content2.getData()==""){
		alert("Input content");
		return false;
	}
	
	return true;
}
function add(){
	$("#add-modal").modal({width:700,height:410});
}
function doPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#sform").submit();
}
function toupdate(id){
	$.getJSON("gonggao_jsondetail.action",{"id":id},function(data){
		$("#update-modal #id").val(id);
		//$("#update-modal #content2").val(data.content);
		CKEDITOR.instances.content2.setData(data.content);
		$("#update-modal").modal({width:700,height:410});
	});
}
function toview(id){
	$.getJSON("gonggao_jsondetail.action",{"id":id},function(data){
		//$("#update-modal #content2").val(data.content);
		//CKEDITOR.instances.content2.setData(data.content);
		$("#view-modal #gtime").html(data.gtime);
		$("#view-modal #content").html(data.content);
		$("#view-modal").modal({width:700,height:410});
	});
}
function todelete(id){
	$("#delete_modal").modal({
        relatedTarget: this,
        onConfirm: function(options) {
        	//执行删除
        	location.href="gonggao_delete.action?id="+id;
        },
        onCancel: function() {
        }
      });
}


</script>
	</body>
</html>
