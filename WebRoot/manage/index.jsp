<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Exam Setting and Review system</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="<%=Const.ROOT %>assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=Const.ROOT %>assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=Const.ROOT %>assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=Const.ROOT %>assets/css/admin.css">
  <style>
  .blog-entry-article {
    margin:3rem 0;
    padding-bottom: 3rem;
    border-bottom: 1px solid #e5e5e5;
}
.blog-entry-img {
    padding:0;
    max-width:100%;
    height:auto;
}
  </style>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<%@include file="top.jsp" %>

<div class="am-cf admin-main">
  <!-- sidebar start -->
 <%@include file="sidebar.jsp" %>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">Index</strong> </div>
      </div>
      <ul class="am-avg-sm-12 am-avg-md-12 am-margin am-padding am-text-center admin-content-list ">
        <h1>Wecome to Exam Setting and Review system</h1>
      </ul>
      <div class="am-u-md-6 am-u-sm-6">
      <table class="am-table am-table-bordered am-table-radius">
      <tr class="am-active">
		<td colspan="3" align="center"><h2>Notice</h2></td>
	  </tr>
      <c:forEach items="${sessionScope.gonggaoList}" var="gonggao" varStatus="st">
      	<tr>
      		<td width="5%" align="center">${st.count }</td>
      		<td width="60%"><a href="javascript:showG(${gonggao.id})">${gonggao.content}</a></td>
      		<td width="30%" align="center">${gonggao.gtime}</td>
      	</tr>
      </c:forEach> 
      </table>
    </div>
    
    <div class="am-u-md-6 am-u-sm-6">
      <c:if test="${sessionScope.role!=2}">
      <table class="am-table am-table-bordered am-table-radius">
      <tr class="am-active">
		<td colspan="3" align="center"><h2>Information</h2></td>
	  </tr>
      <c:forEach items="${sessionScope.newsList}" var="news" varStatus="st">
       <tr>
      		<td width="5%" align="center">${st.count }</td>
      		<td width="60%" class="blog-entry-text""><p><a href="javascript:showN(${news.id})">${news.title}</a></p></td>
      		<td width="30%" align="center">${news.ntime}</td>
      	</tr>
      </c:forEach> 
      </table>
	</c:if>
    </div>
    </div>

    <%@include file="footer.jsp" %>
  </div>
  <!-- content end -->

</div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 新增用户表单begin -->
					<table class="am-table am-table-bordered am-table-radius">
								<tr class="am-active">
									<td width="30%">Time</td>
									<td width="70%" id="ntime"></td>
								</tr>
								<tr>
									<td>Title</td>
									<td align="left" id="title"></td>
								</tr>
								<tr>
									<td>Content</td>
									<td align="left" id="content"></td>
								</tr>
								<tr>
									<td>File</td>
									<td align="left" id="path"></td>
								</tr>
						</table>
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
<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=Const.ROOT %>assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=Const.ROOT %>assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="<%=Const.ROOT %>assets/js/amazeui.min.js"></script>
<script src="<%=Const.ROOT %>assets/js/app.js"></script>
<Script>
function todownload(url){
	location.href="download.action?fileName="+url;
}
function showN(id){
	$.getJSON("news_jsondetail.action",{"id":id},function(data){
		$("#add-modal #title").html(data.title);
		$("#add-modal #ntime").html(data.ntime);
		$("#add-modal #content").html(data.content);
		$("#add-modal #path").html("<a href=\"javascript:todownload('"+data.path+"')\">Download</a>");
		$("#add-modal").modal({width:700,height:600});
	});
}

function showG(id){
	$.getJSON("gonggao_jsondetail.action",{"id":id},function(data){
		//$("#update-modal #content2").val(data.content);
		//CKEDITOR.instances.content2.setData(data.content);
		$("#view-modal #gtime").html(data.gtime);
		$("#view-modal #content").html(data.content);
		$("#view-modal").modal({width:700,height:410});
	});
}
</Script>
</body>
</html>
