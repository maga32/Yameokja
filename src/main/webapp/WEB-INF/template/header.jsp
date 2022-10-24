<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<div class="col-12 py-2">
	<div class="col-12">
		<a href="main">
			<img class="LogoIMGSize" src="resources/IMG/logoIMG.png" alt="LogoIMG"/>
		</a>

<!-- 		나중에 삭제 -->
		<c:if test="${not empty sessionScope.memberId }">
			session : ${sessionScope.memberId }
			<a href="logout">Logout</a>
		</c:if>
		<c:if test="${empty sessionScope.memberId }">
			<a href="#" onclick='window.open("loginForm","LoginForm","width=500, height=600")'>LoginForm</a>	
		</c:if>

		<a href="myPagePost">myPage</a>
		<a href="communityList">communityList</a>
		<a href="storeList">storeList</a>
<!-- 		나중에 삭제 끝-->
		
	</div>
</div>
</header>