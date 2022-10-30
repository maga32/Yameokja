<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/reportList.css" />
<article>
	<h1>신고 목록</h1>
	<div>
		<form name="reportSearchForm" id="reportSearchForm" action="reportList">
			<select id="categoryNo" name="categoryNo">
				<option value=300>분류 전체</option>
				<option value=301>가게</option>
				<option value=302>리뷰</option>
				<option value=303>동네게시판</option>
				<option value=304>회원</option>
			</select>
			<select id="reportPunishCheck" name="reportPunishCheck">
				<option value=0 >처리상태 전체</option>
				<option value=1 >처리 중</option>
				<option value=2 >처리 보류</option>
				<option value=3 >처리 완료</option>
			</select>			
			<select id="type" name="type">
				<option value="all">검색 전체</option>
				<option value="title">제목</option>
				<option value="memberId">아이디</option>
			</select>
			<br>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색">
		</form>
	</div>
	<div class="divTable">
		<div class="divTableRow">
				<div class="divTableHead hdNo">분류</div>
				<div class="divTableHead hdImg">신고 제목</div>
				<div class="divTableHead hdName">처리결과/categoryNo</div>
				<div class="divTableHead hdPrice">신고자</div>
				<div class="divTableHead hdBrand">작성일</div>
		</div>

<!-- 		(일반글)keyword == '' and not empty reportList -->
		<c:if test="${ keyword == '' and not empty reportList }">
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
</article>