<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <div class="container">
	        <a class="navbar-brand" href="/springclass-bloghy/postList">MyBlog Main</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		            <a class="nav-link" href='${pageContext.servletContext.contextPath}/
					${ sessionScope.isLogin ? "logout" : "loginForm" }'>
					${ sessionScope.isLogin ? "로그아웃" : "로그인" }</a>
	            	<li class="nav-item"><a class="nav-link" href="joinForm">회원가입</a></li>
	            	<li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;	</li>
	                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
	                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
	                <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
	                <li class="nav-item">
	                	<a class="nav-link active" aria-current="page" href="postList">
	                		Blog
	                	</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
	