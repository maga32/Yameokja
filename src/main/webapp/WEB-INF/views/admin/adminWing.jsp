<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="/yameokja/resources/css/admin.css" />
<script src="/yameokja/resources/js/admin.js"></script>

<div class="fixed-top">
	<nav class="row">
		<!-- 오픈버튼 클릭전 시작 -->
		<div class="col-10 defaultOpened"></div>
		
		<button class="col-1 btn defaultOpened buttons" id="openAdminMenu">
			<span class="fa-stack fa-lg">
				<i class="fa fa-circle fa-stack-2x"></i>
				<i class="fa fa-bars fa-stack-1x fa-inverse"></i>
			</span>
		</button>
		<!-- 오픈버튼 클릭전 끝 -->
		
		<!-- 오픈버튼 클릭후 시작 -->
		<button class="col-4 col-md-6 col-lg-8 defaultClosed buttons bg-dark opacity-75" id="closeAdminMenu" style="display:none;">
		</button>
		<div class="col-8 col-md-6 col-lg-4 bg-light adminMenu defaultClosed" style="height:100vh; display:none;">
			<div class="container-fluid">
			    <a class="navbar-brand" href="#">관리자모드</a>
			    <a class="nav-link p-3 sidebar-link" href="adminMember">회원관리</a>
			    <a class="nav-link p-3 sidebar-link" href="adminCategory">카테고리 관리</a>
		    </div>
    	</div>
    	<!-- 오픈버튼 클릭후 끝 -->
    	
	</nav>
	
</div>