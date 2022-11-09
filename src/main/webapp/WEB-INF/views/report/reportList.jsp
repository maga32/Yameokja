<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/report.css" />
<article class="text-center">
	<div class="row justify-content-center pt-4">
		<h1 class="col-6 border-3 border-bottom fw-bold pb-1">신고 목록</h1>
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

<!-- 		(일반글)keyword == '' and not empty reportList -->
	<c:if test="${ keyword == '' and not empty reportList }">
<!-- 	table start -->
	<table class="row m-0 text-center" style="border-collapse: collapse;">
		<tr class="col-12 bg-gray">
			<th class="col-2">분류</th>
			<th class="col-5">신고 제목</th>
			<th class="col-1">처리<br>결과</th>
			<th class="col-2">신고자</th>
			<th class="col-2">작성일</th>
		</tr>
		<c:forEach var="re" items="${reportList}">
		<tr class="col-12">
			<td class="col">${re.reportType }</td>
			<td class="col"><a href="reportDetail?reportNo=${ re.reportNo }" >${re.reportTitle}/${ re.reportTarget }</a></td>
			<td class="col">
				<c:if test="${ re.reportPunishCheck == 0 }">처리 대기</c:if>
				<c:if test="${ re.reportPunishCheck == 1 }">처리 중</c:if>
				<c:if test="${ re.reportPunishCheck == 2 }">처리 보류</c:if>
				<c:if test="${ re.reportPunishCheck == 3 }">처리 완료</c:if>
			</td>
			<td class="col">${re.memberId}</td>
			<td class="col"><fmt:formatDate value="${ re.reportDate }" pattern="yyyy-MM-dd" /></td>
		</tr>
		</c:forEach>
	</table>
<!-- 	페이지그룹 시작 -->
	<div class="col-12 text-end my-2">
		<div class="col pe-4">
			<c:if test="${ startPage > pageGroup }">
				<span class="previousPage text-secondery">
					<a href="reportList?pageNum=${ startPage - pageGroup }"><</a>
				</span>
			</c:if>
			<span class="pageNumber text-secondery">
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					<div class=" d-inline-block fw-bold" style="color: #F58500;">&nbsp;${ i }&nbsp;</div>
				</c:if>
				<c:if test="${ i != currentPage }">
					<div class=" d-inline-block">
						<a href="reportList?pageNum=${ i }">&nbsp;${ i }&nbsp;</a>
					</div>
				</c:if>
			</c:forEach>
			</span>						
			<c:if test="${ endPage < pageCount }">
				<span class="nextPage text-secondery">
					<a href="reportList?pageNum=${ startPage + pageGroup }">></a>
				</span>
			</c:if>
		</div>
	</div>
<!-- 	페이지그룹 끝 -->
	</c:if>
<!-- 		(빈 일반글)keyword == '' and empty reportList -->
	<c:if test="${ keyword == '' and empty reportList }">작성된 신고글이 없습니다.</c:if>
<!-- 		(검색글)keyword != '' and not empty reportList -->
	<c:if test="${ keyword != '' and not empty reportList }">
	<table class="row m-0 text-center" style="border-collapse: collapse;">
		<tr class="col-12 bg-gray">
			<th class="col-2">분류</th>
			<th class="col-5">신고 제목</th>
			<th class="col-1">처리<br>결과</th>
			<th class="col-2">신고자</th>
			<th class="col-2">작성일</th>
		</tr>
		<c:forEach var="re" items="${reportList}">
		<tr class="col-12">
			<td class="col">${re.reportType }</td>
			<td class="col"><a href="reportDetail?reportNo=${ re.reportNo }" >${re.reportTitle}/${ re.reportTarget }</a></td>
			<td class="col">
				<c:if test="${ re.reportPunishCheck == 0 }">처리 대기</c:if>
				<c:if test="${ re.reportPunishCheck == 1 }">처리 중</c:if>
				<c:if test="${ re.reportPunishCheck == 2 }">처리 보류</c:if>
				<c:if test="${ re.reportPunishCheck == 3 }">처리 완료</c:if>
			</td>
			<td class="col">${re.memberId}</td>
			<td class="col"><fmt:formatDate value="${ re.reportDate }" pattern="yyyy-MM-dd" /></td>
		</tr>
		</c:forEach>
	</table>
<!-- 	페이지그룹 시작 -->
	<div class="col-12 text-end my-2">
		<div class="col pe-4">
			<c:if test="${ startPage > pageGroup }">
				<div class="previousPage text-secondery d-inline-block">
					<a href="reportList?pageNum=${ startPage - pageGroup }&type=${type}&keyword=${keyword}"><</a>
				</div>
			</c:if>
			<div class="pageNumber text-secondery d-inline-block">
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					<div class=" d-inline-block fw-bold" style="color: #F58500;">&nbsp;${ i }&nbsp;</div>
				</c:if>
				<c:if test="${ i != currentPage }">
					<div class=" d-inline-block">
						<a href="reportList?pageNum=${ i }&type=${type}&keyword=${keyword}">&nbsp;${ i }&nbsp;</a>
					</div>
				</c:if>
			</c:forEach>
			</div>						
			<c:if test="${ endPage < pageCount }">
				<div class="nextPage text-secondery d-inline-block">
					<a href="reportList?pageNum=${ startPage + pageGroup }&type=${type}&keyword=${keyword}">></a>
				</div>
			</c:if>
		</div>
	</div>
<!-- 					페이지그룹 끝 -->
	</c:if>
<!-- 		(빈 검색글)keyword != '' and empty reportList -->
		<c:if test="${ keyword != '' and empty reportList }">
			"${ keyword }"로 작성된 신고글이 없습니다.
		</c:if>			
</article>