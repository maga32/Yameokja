<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" type="text/css" href="resources/css/wing.css" />
<article>
<div class="row">
<div class="col-12">
<div class="col-12 headerFontColor text-center p-5">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6 text-center pt-5 pb-5">
			<img alt="프로필 사진" class="rounded-circle col-12" src="resources/IMG/mypage/likeIMG.PNG">
		</div>
		<div class="col-3"></div>
	</div>
	<div class="col-12 text-white fs-1 fw-semibold">로그인을 해주세요</div>
	<div class="row my-3">
		<div class="col"></div>
		<div class="col"><input type="button" class="btn text-center rounded-5 border border-2 border-E3E5E9 text-secondary bg-white py-2 px-4" value="로그인"></div>
		<div class="col"><input type="button" class="btn text-center rounded-5 border border-2 border-E3E5E9 text-secondary bg-white py-2 px-4" value="회원가입"></div>
		<div class="col"></div>
	</div>
	<div class="col-12 text-white fs-3 fw-semibold text-start">메인 페이지</div>
	<div class="col-12 text-white fs-3 fw-semibold text-start">커뮤니티</div>
	<div class="col-12 text-white fs-3 fw-semibold text-start">채팅 목록</div>
	<div class="col-12 text-white fs-3 fw-semibold text-start mb-4">내가 찜한 가게</div>
	<div class="col-12 text-white fs-6 fw-semibold text-start">나의 위치</div>
	<div class="col-12"><input class="col-12 rounded-5 border border-2 border-E3E5E9 text-secondary bg-white p-1 mb-3" type="text" value="&nbsp;&nbsp;서울시 관악구"></div>
	<div class="col-12 text-white fs-6 fw-semibold text-start">다른 지역 찾기</div>
	<div class="row pb-4 mb-4 border-bottom border-2 border-white">
		<select class="col-4 text-center rounded-5 border border-2 border-E3E5E9 text-secondary bg-white p-1"><option>서울시</option></select>
		<div class="col-1"></div>
		<select class="col-4 text-center rounded-5 border border-2 border-E3E5E9 text-secondary bg-white p-1"><option>관악구</option></select>
		<div class="col-1"></div>
		<input class="col-2 text-center rounded-5 border border-2 border-E3E5E9 text-secondary bg-white p-1" value="찾기">
	</div>
</div>
</div>
</div>
</article>