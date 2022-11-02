<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/reportList.css" />
<article>
	<div class="row justify-content-center pt-4">
		<h1 class="col-6 border-3 border-bottom title pb-1">신고 목록</h1>
	</div>
	<div class="row p-1">
		<form name="reportSearchForm" id="reportSearchForm" action="reportList">
			<div class="col-12">
			<select class="col-3 rounded-pill m-1 p-1 w-auto" id="categoryNo" name="categoryNo">
				<option value=300>분류 전체</option>
				<option value=301>가게</option>
				<option value=302>리뷰</option>
				<option value=303>동네게시판</option>
				<option value=304>회원</option>
			</select>
			<select class="col-3 rounded-pill m-1 p-1 w-auto" id="reportPunishCheck" name="reportPunishCheck">
				<option value=0 >처리상태 전체</option>
				<option value=1 >처리 중</option>
				<option value=2 >처리 보류</option>
				<option value=3 >처리 완료</option>
			</select>
			<select class="col-3 rounded-pill m-1 p-1 w-auto" id="type" name="type">
				<option value="all">검색 전체</option>
				<option value="title">제목</option>
				<option value="memberId">아이디</option>
			</select>
			</div>
			<div class="row justify-content-center">
				<input type="text" class="rounded-pill col-6 m-1" id="keyword" name="keyword" placeholder="검색어를 입력해주세요">
				<input type="submit" class="col-3 w-auto btn btn-secondary rounded-pill border border-dark m-1 px-3 search" value="검색">
			</div>
		</form>
	</div>
	<div class="divTable">
		<div class="divTableRow row">
				<div class="divTableHead hdNo col-2">분류</div>
				<div class="divTableHead hdImg col-4">신고 제목</div>
				<div class="divTableHead hdName col-2">처리결과<br>categoryNo</div>
				<div class="divTableHead hdPrice col-2">신고자</div>
				<div class="divTableHead hdBrand col-2">작성일</div>
		</div>

<!-- 		(일반글)keyword == '' and not empty reportList -->
		<c:if test="${ keyword == '' and not empty reportList }">
		<c:forEach var="re" items="${reportList}">
		<div class="divTableRow border-">
			<div class="divTableCell">${re.reportType }</div>
			<div class="divTableCell"><a href="reportDetail?reportNo=${ re.reportNo }" >${re.reportTitle }</a></div>
			<div class="divTableCell">${re.reportPunishCheck}/(임시)${re.categoryNo}</div>
			<div class="divTableCell">${re.memberId}임시reportNo(${ re.reportNo })</div>
			<div class="divTableCell">
				<fmt:formatDate value="${re.reportDate}" pattern="yy/MM/dd hh:mm:ss"/><br />
			</div>
		</div>
		</c:forEach>
		</c:if>
<!-- 		(빈 일반글)keyword == '' and empty reportList -->
		<c:if test="${ keyword == '' and empty reportList }">작성된 신고글이 없습니다.</c:if>
		
<!-- 		(검색글)keyword != '' and not empty reportList -->
		<c:if test="${ keyword != '' and not empty reportList }">
		<c:forEach var="re" items="${reportList}">
		<div class="divTableRow">
			<div class="divTableCell">${re.reportType }</div>
			<div class="divTableCell"><a href="reportDetail?reportNo=${ re.reportNo }" >${re.reportTitle }</a></div>
			<div class="divTableCell">${re.reportPunishCheck}/(임시)${re.categoryNo}</div>
			<div class="divTableCell">${re.memberId}임시reportNo(${ re.reportNo })</div>
			<div class="divTableCell">${re.reportDate }</div>
		</div>
		</c:forEach>
		</c:if>
<!-- 		(빈 검색글)keyword != '' and empty reportList -->
		<c:if test="${ keyword != '' and empty reportList }">
			"${ keyword }"로 작성된 신고글이 없습니다.
		</c:if>
	</div>
	
<!-- 페이징 영역 -->
	<div class="row justify-content-end my-2">
		<div class="col-12 w-auto">
			<div class="previousPage inlineBlock">
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage - pageGroup}&type=${type}&keyword=${keyword}"><</a>
			</div>
			<div class=" inlineBlock" style="color: #F58500; font-weight: 600">&nbsp;1&nbsp;</div>
			<div class="inlineBlock pageNum">
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;2&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;3&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;4&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;5&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;6&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;7&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;8&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;9&nbsp;</a>
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;10&nbsp;</a>
			</div>
			<div class="nextPage inlineBlock">
				<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage + pageGroup}&type=${type}&keyword=${keyword}">></a>
			</div>
		</div>
	</div>
</article>

<!--
	# 체크리스트
	 1. 분류 및 처리상태 로직 확인
-->

