<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Profile</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css" />
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
  	<script src="/yameokja/resources/js/common.js"></script>
</head>
<body>
<form name="blockListForm" id="blockListForm">
	<input type="hidden" name="userId" value="${ user.memberId }" />
</form>
<div class="row m-0">
<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6 p-3">
<!-- 		profileHeader start -->
	<div class="fullFrame col-12">
		<div class="col-12">
			<div class="text-center fw-bold fs-1 col-12 py-3">${ user.memberNickname } 님의 프로필</div>
		</div>	
<!-- 			profileHeader end -->
<!-- 			profileFrame1 start -->
		<div class="profileFrame1  border-2 border-top border-dark row m-0">
			<div class=" d-table-cell col-4 p-0">
				<img alt="프로필 사진" class="col-8 m-0 p-0" src="resources/IMG/mypage/likeIMG.PNG">
			</div><div class="col-8 p-0">
				<div class="row m-0">
					<div class="border-2 border-bottom border-dark fw-bold fs-5 col-12">좋아하는 음식 종류 BEST 3</div>
					<div class="row pt-2 m-0 text-center">
					<c:if test="${ not empty memberFavoriteCategory }">
						<c:forTokens var="m" items="${ memberFavoriteCategory }" delims=",">
							<div class="col px-1 py-0"><img  class="col-12" alt="카테고리음식IMG" src="resources/IMG/categoryIMG/${ m }.png"></div>
						</c:forTokens>
					</c:if>
					<c:if test="${ empty memberFavoriteCategory }">
						<div class="col px-1 py-0">좋아하는 음식 종류가 없습니다.</div>
					</c:if>
					</div>
				</div>
			</div>
		</div>
<!-- 		profileFrame1 end -->
<!-- 			profileFrame2 start -->
			<div class="profileFrame2 col-12 mt-3">
			<div class="row">
				<div class="myLocationTh col-4 p-1">동네</div>
				<div class="myLocationTd col-8 p-1">${ user.memberAddress }</div>
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold fs-6 p-1">가입일</div>
				<div class=" col-6 p-1"><fmt:formatDate value="${ user.memberJoinDate }" pattern="yyyy-MM-dd" /></div>	
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold p-1">작성한 리뷰 총 합</div>
				<div class=" col-6 p-1">가게 등록 글 수 : ${ myPagePostCount }개,<br>가게 후기 글 수 : ${ myPageCommunityCount }개<br>총 합 : ${ myPagePostCount + myPageCommunityCount }개</div>
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold p-1">받은 추천 총 합</div>
				<div class=" col-6 p-1">${ sumPostUpCount }개</div>
			</div>
			<div class="row">
			<div class="col-6 fw-semibold p-1 myPagePostButton"><a href="#" onclick="opener.location.href='myPagePost?userId=${ user.memberId }';window.close();">활동내역구경가기 -></a></div>
			<div class="col-6 p-1 text-end">
				<span class="fa-stack fa-lg" onclick="location.href='reportForm?reportTarget=${user.memberId}'">
				  <i class="fa fa-circle fa-stack-2x"></i>
				  <i class="fa fa-bell fa-stack-1x text-white"></i>					
				</span>
			</div>
		</div>
<!-- 			profileFrame2 end -->
		<c:if test="${ sessionScope.memberId == user.memberId }">
			<div class="buttonFrame text-center col-12 mt-3 py-3">
				<button type="button" onclick="window.close()" class="closeButton btn col-6">확&nbsp;&nbsp;인</button>
			</div>
		</c:if>
		<c:if test="${ (sessionScope.memberId != user.memberId) || (user.memberId == 'null') }">
			<div class="buttonFrame text-center col-12 mt-3 py-3">
				<button type="button" onclick="window.close()" class="closeButton btn col-6">확&nbsp;&nbsp;인</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="chatStart btn" data-targetId="${ user.memberId }">채팅신청</a>
			</div>
		</c:if>
	</div>
	</div>
	</div>
</div>
</body>
</html>