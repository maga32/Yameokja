<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<article>
<div class="row m-0 p-2 justify-content-center">
<!-- search start -->
	<div class="row m-0 p-0">
	<div class="row m-0 p-0">
		<select class="row col-3 form-select-sm rounded-pill text-center border border-2 text-secondary bg-white p-1 m-1" name="address1" id="address1" onchange="addressChange(this)">
			<option>선택</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="부산">부산</option>
			<option value="울산">울산</option>
			<option value="광주">광주</option>
			<option value="강원">강원</option>
			<option value="세종">세종</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="제주">제주</option>
		</select>
		<select class="col-3 form-select-sm rounded-pill text-center border border-2 text-secondary bg-white p-1 m-1" name="address2" id="address2">
			<option>선택</option>
		</select>
		<div class="col-6"></div>
	</div>
	<div class="row m-0 p-0">
		<div class="col-10 p-0">
			<input class="col-12 form-select-sm rounded-pill border border-2 text-secondary bg-white p-1 m-1" type="text">
		</div>
		<div class="col-2 py-1">
			<button class="col-12 btn btn-sm btn-outline-secondary col-12 rounded-pill border border-2 p-1">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button>
		</div>
	</div>
	</div>
<!-- search end -->
<!-- category IMG start -->
	<div class="row my-3 p-0">
		<div class="col-6 py-2 col-md-3">
			<a href="storeListAll">
				<img width="100%" class="rounded" alt="전체" src="/yameokja/resources/IMG/categoryIMG/All.png">
			</a>
		</div>
		<c:forEach var="li" items="${ categoryList }">
			<div class="col-6 py-2 col-md-3">
				<a href="storeList?categoryNo=${ li.categoryNo }">
					<img width="100%" class="rounded" alt="${ li.categoryName }" src="/yameokja/resources/IMG/categoryIMG/${ li.categoryNo }.png">
				</a>
			</div>
		</c:forEach>
	</div>
</div>
</article>