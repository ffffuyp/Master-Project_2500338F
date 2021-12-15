<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="<%=Const.ROOT%>index.jsp"><span class="am-icon-home"></span> Index</a></li>   	
   		<!-- 管理员 -->
   		<c:if test="${sessionScope.role==0}">
   			<li class="admin-parent">
	          <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-list"></span> Admin <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
	          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
	            <li><a href="user_list.action"><span class="am-icon-angle-right"></span> User management</a></li>
	            <li><a href="gaojian_list.action"><span class="am-icon-angle-right"></span> Draft management</a></li>
	           
	             <li><a href="news_list.action"><span class="am-icon-angle-right"></span> Information management</a></li>
	             <li><a href="gonggao_list.action"><span class="am-icon-angle-right"></span> Notice Managerment</a></li>
	          </ul>
	        </li>
   		</c:if>		
   		
		<!-- 投稿人 -->
   		<c:if test="${sessionScope.role==1}">
   			<li class="admin-parent">
	          <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-list"></span> Contributor <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
	          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
	            <li><a href="gonggao_list.action"><span class="am-icon-angle-right"></span> Notice</a></li>
	            <li><a href="news_list.action"><span class="am-icon-angle-right"></span> Information</a></li>
	            <li><a href="gaojian_list.action"><span class="am-icon-angle-right"></span> Draft</a></li>
	          </ul>
	        </li>
   		</c:if>
   		
   		<c:if test="${sessionScope.role==2}">
   			<li class="admin-parent">
	          <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-list"></span> Reviewer <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
	          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
	           <li><a href="gonggao_list.action"><span class="am-icon-angle-right"></span> Notice</a></li>
	           <li><a href="gaojian_list.action"><span class="am-icon-angle-right"></span> Draft</a></li>
	           
	          </ul>
	        </li>
   		</c:if>
   		
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-list"></span> System management <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
            <li><a href="<%=Const.ROOT %>updateuser.jsp"><span class="am-icon-angle-right"></span> Personal information </a></li>
            <li><a href="<%=Const.ROOT %>updatepwd.jsp"><span class="am-icon-angle-right"></span> Password modification </a></li>
            <li><a href="<%=Const.ROOT%>user_logout.action"><span class="am-icon-th"></span> Log out </a></li>
          </ul>
        </li>
      </ul>
      
    </div>
  </div>