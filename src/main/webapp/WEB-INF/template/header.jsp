<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<div class="col-12 py-2">
	<div class="col-12">
		<a href="/yameokja/main">
			<img class="LogoIMGSize" src="/yameokja/resources/IMG/logoIMG.png" alt="LogoIMG"/>
		</a>

<!-- 		나중에 삭제 -->
		<c:if test="${not empty sessionScope.memberId }">
			sessionId : ${sessionScope.memberId }
			/ Lv : ${sessionScope.member.memberLevel }
			<a href="/yameokja/logout">Logout</a>
		</c:if>
		<c:if test="${empty sessionScope.memberId }">
			<a href="#" onclick='window.open("/yameokja/loginForm","LoginForm","width=500, height=600")'>LoginForm</a>	
		</c:if>

		<a href="/yameokja/myPagePost">myPage</a>
		<a href="/yameokja/communityList">communityList</a>
		<a href="/yameokja/storeList">storeList</a>
		<a href="/yameokja/admin">admin</a>
		<a href="" class="chatStart" data-targetid="memberId03">채팅하기</a>
<!-- 		나중에 삭제 끝-->
		
	</div>
</div>
</header>