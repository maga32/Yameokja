<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
<script src="resources/js/member.js"></script>
<article>
<div class="row my-3 px-2 px-md-0">
	<div class="col-12">
		<select class="form-select-sm rounded-pill" name="address1" id="address1" onchange="addressChange(this)">
				<option>선택</option>
				<option value="seoul">서울</option>
				<option value="kyeonggi">경기</option>
				<option value="incheon">인천</option>
				<option value="daejeon">대전</option>
				<option value="daegu">대구</option>
				<option value="busan">부산</option>
				<option value="ulsan">울산</option>
				<option value="gwangju">광주</option>
				<option value="gangwon">강원</option>
				<option value="sejong">세종</option>
				<option value="chungbuk">충북</option>
				<option value="chungnam">충남</option>
				<option value="gyeongbuk">경북</option>
				<option value="gyeongnam">경남</option>
				<option value="jeonbuk">전북</option>
				<option value="jeonnam">전남</option>
				<option value="jeju">제주</option>
		</select> <select class="form-select-sm rounded-pill mx-2" name="address2" id="address2">
				<option>선택</option>
		</select>
	</div>

	<div class="col-10 p-3">
		<input class="col-12 rounded-pill px-2" type="text">
	</div>
	<div class="col-2 py-3">
		<button class="col-12 btn btn-sm btn-outline-secondary rounded-pill">
			<i class="fa fa-search" aria-hidden="true"></i>
		</button>
	</div>

	<div class="col-6 py-2 col-md-3">
		<a href="storeList"> 전체 </a>
	</div>
	<c:forEach var="li" items="${ categoryList }">
		<div class="col-6 py-2 col-md-3">
			<a href="storeList?category=${ li.categoryNo }"> ${ li.categoryName }
			</a>
		</div>
	</c:forEach>

	<!--  샘플  -->
	<div class="col-6 py-2 col-md-3">
		<img class="col-12 rounded" src="https://picsum.photos/100">
		(샘플)
	</div>
	<a href="loginForm">로그인</a>
	<a href="#" onclick='window.open("chat/chatList","채팅","width=500, height=800")'>채팅 리스트</a>
</div>
</article>