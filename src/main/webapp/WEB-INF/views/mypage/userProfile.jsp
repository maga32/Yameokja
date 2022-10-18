<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css" />
<!-- <script type="text/javascript" src="resources/js/chat.js"></script> -->
<article>
	<form name="blockListForm" id="blockListForm">
		<input type="hidden" name="memberId" value="${ member.memberId }" />
	</form>
	<div class="row">
	<!-- 	profileHeader -->
	<div class="col-12 p-4">
		<div class="profileHeaderFrame col-12">
			<div class="profileheader col-12 py-3">김핑구짱짱맨 님의 프로필</div>
		</div>	
		<!-- 	profileHeader 끝-->
		<!-- 	profileFrame1 -->
		<div class="profileFrame1 col-12 py-3">
			<div class=" inlineBlock col-4">
				<img alt="프로필 사진" class="profileIMG col-12" src="resources/IMG/mypage/likeIMG.PNG">
			</div>
			<div class="profileCategoryFrame inlineBlock col-7">
				<div class="col-12">
					<div class="profileheader col-12">좋아하는 음식 종류</div>
				<div class="col-12">
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>한식</div>
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>양식</div>
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>중식</div>
				</div>
				</div>
			</div>
		</div><!-- 	profileFrame1 끝-->
		<!-- 	profileFrame2 -->
		<div class="profileFrame2 col-12">
			<div class="내위치 col-12 m-2">
				<div class="내위치동네 inlineBlock col-4">동네</div>			
				<div class="내위치구 inlineBlock col-8">서울시 관악구</div>			
			</div>
			<div class="가입일틀 col-12">
				<div class="가입일 inlineBlock">가입일</div>			
				<div class="D+100 inlineBlock">D+100</div>			
			</div>
			<div class="작성한리뷰총합틀 col-12">
				<div class="작성한리뷰총합 inlineBlock">작성한리뷰총합</div>			
				<div class="500개 inlineBlock">500개</div>			
			</div>
			<div class="받은추천총합틀 col-12">
				<div class="받은추천총합 inlineBlock">받은추천총합</div>			
				<div class="1,000개 inlineBlock">1,000개</div>			
			</div>
			<div class="활동내역틀 col-12">
				<div class="활동내역 inlineBlock"><a>활동내역구경가기 -></a></div>
				<div class="종모양 inlineBlock">종모양이미지</div>
			</div>
			<div>________</div>	
		</div>
		<!-- 	profileFrame2 끝-->
		<div class="buttonFrame col-12 my-3">
			<button type="button" class="closeButton btn">확인</button>
			<button type="button" class="closeButton btn">채팅확인</button>
<!-- 			<button type="button" class="UnblockIdButton btn">차단 해제</button> -->
		</div>
	</div>
	</div>
</article>