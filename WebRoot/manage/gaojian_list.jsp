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
		<title>Draft list</title>
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
		<script src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
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
							<small> Draft list </small>
						</div>
					</div>
					<hr>

					<div class="am-g">
						<!-- 搜索 -->
						<form action="gaojian_list.action" method="post" id="sform">
							<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo" />
							<div class="am-u-sm-12 am-u-md-6">
								<div class="am-btn-group am-btn-group-xs">
									<c:if test="${sessionScope.role==1}">
									<button type="button" class="am-btn am-btn-default"
										onclick="add()">
										<span class="am-icon-plus"></span> Draft
									</button>
									</c:if>
								</div>
							</div>
							<div class="am-u-sm-12 am-u-md-6">
								<div class="am-btn-toolbar">
									<div class="am-form-group">
										Title:
										<input type="text" name="name" />
										&nbsp;
										<button class="am-btn am-btn-default" type="submit">
											Search
										</button>
									</div>
								</div>
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
											No.
										</th>
										<th class="table-title">
											Contributor
										</th>
										<th class="table-title">
											Title
										</th>
										<th class="table-title">
											Time of submission
										</th>
										<th class="table-title">
											Reviewer
										</th>
										<th class="table-title">
											Time of review
										</th>
										<th class="table-title">
											Status
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
												${v.tuser.name}
											</td>
											<td>
												${v.name}
											</td>
											<td>
												${v.ttime}
											</td>
											
											<td>
												<c:if test="${not empty v.suser}">
													${v.suser.name}
												</c:if>
											</td>
											<td>
												${v.stime }
											</td>
											<td>
												${v.status}
											</td>
											<td>
												<div class="am-btn-toolbar">
													<div class="am-btn-group am-btn-group-xs">
													<c:if test="${sessionScope.role==0 }">
														<c:if test="${v.status=='Not review' }">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="tofp('${v.id}')">
															<span class="am-icon-pencil-square-o"></span> Distribute
														</button>
														</c:if>
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="toupdate('${v.id}')">
															<span class="am-icon-list"></span> Edit
														</button>
													</c:if>
														
														
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="toview('${v.id}')">
															<span class="am-icon-list"></span> View
														</button>
													
													<c:if test="${sessionScope.role==0}">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
															onclick="todelete('${v.id}')">
															<span class="am-icon-trash-o"></span> Delete
														</button>
													</c:if>
													<c:if test="${sessionScope.role==1}">
														<c:if test="${v.status=='unreviewed'}">
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-secondary"
															onclick="toupdate('${v.id}')">
															<span class="am-icon-list"></span> Edit
														</button>
														<button type="button"
															class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
															onclick="todelete('${v.id}')">
															<span class="am-icon-trash-o"></span> Delete
														</button>
														</c:if>
													</c:if>
													
													<c:if test="${sessionScope.role==2 }">
														<c:if test="${v.status=='Assigned' }">
															<button type="button"
																class="am-btn am-btn-default am-btn-xs am-text-secondary"
																onclick="tops('${v.id}')">
																<span class="am-icon-pencil-square-o"></span> Review
															</button>
														</c:if>
														</c:if>
													</div>
													<c:if test="${sessionScope.role==2 }">
														<c:if test="${v.status=='Assigned' }">
															<button type="button"
																class="am-btn am-btn-default am-btn-xs am-text-secondary"
																onclick="tops2('${v.id}')">
																<span class="am-icon-pencil-square-o"></span> Reject
															</button>
														</c:if>
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
					<form class="am-form" name="aform" action="gaojian_add.action"
						method="post" onsubmit="return checkAdd()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								Title
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" name="gaojian.name" class="am-input-sm" id="name"/>
							</div>
						</div>
		            	<div class="am-g am-margin-top">
						  <div class="am-u-sm-3 am-u-md-3 am-text-right">
							 File
						  </div>
						  <div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="file" id="fujian" name="fujian"
									onchange="uploadFile()" />
								<input type="hidden" id="ppath" name="gaojian.ppath" />
						  </div>
		            	</div> 
		            	<div class="am-g am-margin-top">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								Content
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<TEXTAREA id="pcontent" NAME="gaojian.pcontent" ROWS="16"></TEXTAREA>	
								<script>
									CKEDITOR.replace('pcontent');
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
		<!-- 分配对话框 -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="fp-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					Assign reviewer
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 新增用户表单begin -->
					<form class="am-form" name="aform" action="gaojian_fp.action"
						method="post" onsubmit="return checkfp()">
						<input type="hidden" name="id" id="id"/>
						
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-4 am-u-md-4 am-text-right">
								Reviewer:
							</div>
							<div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
								<select id="sid" name="sid">
								</select>
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
		
		<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
		<script>
//验证增加
function checkAdd(){
	if($("#add-modal #name").val()==""){
		alert("Input title");
		return false;
	}
	
	if($("#add-modal #ppath").val()==""){
		alert("Select file");
		return false;
	}
	if(CKEDITOR.instances.mcontent.getData()==""){
		alert("Input content");
		return false;
	}
	
	return true;
}


function tofp(id){
	$("#fp-modal #id").val(id);
	$("#fp-modal").modal({width:500,height:220});
}
function tops(id){
	if(confirm("Get approved?")){
		location.href="gaojian_sh.action?id="+id;
	}
}
function tops2(id){
	if(confirm("Reject?")){
		location.href="gaojian_reje.action?id="+id;
	}
}

function add(){
	$("#add-modal").modal({width:700,height:500});
}
function doPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#sform").submit();
}
function toupdate(id){
	location.href="gaojian_detail.action?id="+id;
}
function toview(id){
	location.href="gaojian_view.action?id="+id;
}
function todelete(id){
	$("#delete_modal").modal({
        relatedTarget: this,
        onConfirm: function(options) {
        	//执行删除
        	location.href="gaojian_delete.action?id="+id;
        },
        onCancel: function() {
          
        }
      });
}

function checkfp(){
	if($("#fp-modal #sid").val()=="-1"){
		alert("Select reviewer");
		return false;
	}
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
          	  $("#add-modal #ppath").val($(data).find("body").text());
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

$(function(){
	$(function(){
		$.getJSON("user_jsontlist.action",function(data){
			$("#fp-modal #sid").html("<option value='-1'>Select reviewer</option>");
			$(data).each(function(index,d){
				$("#fp-modal #sid").append("<option value='"+d.id+"'>"+d.name+"</option>");
			});
		});
	});
});

</script>

	</body>
</html>
