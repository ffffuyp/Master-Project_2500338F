<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Users list</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="<%=Const.ROOT%>assets/i/favicon.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
  
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
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">Index</strong> / <small>User management</small></div>
      </div>
      <hr>
      
      <div class="am-g">
      <!-- 搜索 -->
      <form action="user_list.action" method="post" id="sform">
      	<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo"/>
        <div class="am-u-sm-12 am-u-md-2">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
             <button type="button" class="am-btn am-btn-default" onclick="add()">
              		<span class="am-icon-plus"></span> Add User
              	</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-form-group">
						Name:
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
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-id">NO.</th>
                <th class="table-title">Username</th>
                <th class="table-title">Real name</th>
                <th class="table-title">Phone number</th>
                <th class="table-date am-hide-sm-only">Identity</th>
                <th class="table-set">edit</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="user" varStatus="st">
              <!-- 循环开始 -->
              <tr>
                <td>${st.count}</td>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.phone}</td>
                <td class="am-hide-sm-only">
                	<c:if test="${user.role==1}">Contributor</c:if>
                	<c:if test="${user.role==2}">Reviewer</c:if>
                </td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="toupdate('${user.id}')"><span class="am-icon-pencil-square-o"></span> Edit</button>            
                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="todelete('${user.id}')"><span class="am-icon-trash-o"></span> Delete</button>
                    </div>
                  </div>
                </td>
              </tr>
              <!-- 循环结束 -->
              </c:forEach> 
              </tbody>
            </table>
            <!-- 分页 -->
             <ul data-am-widget="pagination"class="am-pagination am-pagination-select">
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
    <%@include file="footer.jsp" %>
  </div>
  <!-- content end -->
</div>

<!-- 删除对话框begin -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">Delete this record?</div>
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
    <div class="am-modal-hd">Add reviewer
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      	<!-- 新增用户表单begin -->
		<form class="am-form" name="aform" action="user_add.action" method="post" onsubmit="return checkAdd()">
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Username
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="text" name="user.username" class="am-input-sm" id="username"/>
				  </div>
				</div>
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Password
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="password"  name="user.password" class="am-input-sm" id="password"/>
				  </div>
				</div>
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Confirm password
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="password" class="am-input-sm" id="password2"/>
				  </div>
				</div>
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Real name
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="text"  name="user.name" class="am-input-sm" id="name"/>
				  </div>
            	</div>
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Phone number
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="text"  name="user.phone" class="am-input-sm" id="phone"/>
				  </div>
            	</div>
			<div class="am-margin">
		      <button type="submit" class="am-btn am-btn-primary am-btn-xs">Save</button>
		      <button type="reset" class="am-btn am-btn-primary am-btn-xs">Reset</button>
		    </div>
          </form>
    </div>
  </div>
</div>
<!-- 新增用户end -->
<!-- 增加对话框begin -->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="update-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">Edit
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      	<!-- 新增用户表单begin -->
		<form class="am-form" name="aform" action="user_update.action" method="post" onsubmit="return checkUpdate()">
				<input type="hidden" name="id" id="id" />
				
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Real name
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="text"  name="user.name" class="am-input-sm" id="name"/>
				  </div>
            	</div>
				<div class="am-g am-margin-top">
				  <div class="am-u-sm-4 am-u-md-4 am-text-right">
					Phone number
				  </div>
				  <div class="am-u-sm-8 am-u-md-6 am-u-end col-end">
					<input type="text"  name="user.phone" class="am-input-sm" id="phone"/>
				  </div>
            	</div>
        
			<div class="am-margin">
		      <button type="submit" class="am-btn am-btn-primary am-btn-xs">Save</button>
		      <button type="reset" class="am-btn am-btn-primary am-btn-xs">Reset</button>
		    </div>
          </form>
    </div>
  </div>
</div>
<!-- 新增用户end -->
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
//验证增加
function checkAdd(){
	if($("#add-modal #username").val()==""){
		alert("Input user name");
		return false;
	}
	if($("#add-modal #password").val()==""){
		alert("Enter password");
		return false;
	}
	if($("#add-modal #password").val()!=$("#add-modal #password2").val()){
		alert("The entered passwords are inconsistent");
		return false;
	}
	if($("#add-modal #name").val()==""){
		alert("Enter real name");
		return false;
	}
	if($("#add-modal #phone").val()==""){
		alert("Input the phone number");
		return false;
	}
	var regPhone=/^\d{11}$/;
	if(!regPhone.test($("#add-modal #phone").val())){
		alert("The phone number format is incorrect");
		return false;
	}
	return true;
}
function checkUpdate(){
	if($("#update-modal #name").val()==""){
		alert("Enter real name");
		return false;
	}
	if($("#update-modal #phone").val()==""){
		alert("Input the phone number");
		return false;
	}
	var regPhone=/^\d{11}$/;
	if(!regPhone.test($("#update-modal #phone").val())){
		alert("The phone number format is incorrect");
		return false;
	}
	return true;
}
function toupdate(id){
	$.getJSON("user_jsondetail.action",{"id":id},function(data){
		$("#update-modal #id").val(id);
		$("#update-modal #name").val(data.name);
		$("#update-modal #phone").val(data.phone);
		$("#update-modal").modal({width:500,height:280});
	});
}
function add(){
	$("#add-modal").modal({width:500,height:400});
}
function doPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#sform").submit();
}

function todelete(id){
	$("#delete_modal").modal({
        relatedTarget: this,
        onConfirm: function(options) {
        	//执行删除
        	location.href="user_delete.action?id="+id;
        },
        onCancel: function() {
         
        }
      });
}
</script>
</body>
</html>
