<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="resources/css/reportDetail.css" />
<article>
	<div class="row justify-content-center pt-4">
		<h1 class="col-6 border-3 border-bottom center bold pb-1">신고 상세보기</h1>
	</div>
	<br>
	<div class="row">
		<div class="col-8 row">
			<div class="col-3 border-end bold">분류</div>
			<div class="col-9">${ report.reportType }</div>
			<div class="col-3 border-end bold">제목</div>
			<div class="col-9">${ report.reportTitle }</div>
			<div class="col-3 border-end bold">신고자</div>
			<div class="col-9">${ report.memberId }</div>
			<div class="col-3 border-end bold">신고대상</div>
			<div class="col-9">
				<c:if test="${ report.categoryNo == 301 }">${ report.reportTarget }</c:if>
				<!-- storeTitle 불러올 수 있는 방법 모색해보기 -->
				<c:if test="${ report.categoryNo != 301 }">${ report.reportTarget }</c:if>
			</div>
			<div class="col-3 border-end bold">신고 작성일</div>
			<div class="col-9">${ report.reportDate }</div>
		</div>
		<div class="col-4">
			<img alt="신고첨부이미지" height="100px"
				src="/yameokja/resources/IMG/LOGOtemporaryIMG.PNG">
		</div>
		<div class="col-12 px-3 pt-2">
			<div class="col-12 border reportContent">
				${ report.reportContent }
			</div>
		</div>
		
		<div class="col-12 px-3 file">
			<c:if test="${ empty report.reportFile }">
				첨부파일 없음
			</c:if>
			<c:if test="${ not empty report.reportFile }">
				<a href="fileDownload?fileName=${ report.reportFile }">file1 다운로드</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="fileDownload?fileName=${ fileName }">fileName 다운로드</a>
			</c:if>
		</div>	
	</div>
	<br>
	
	<div class="row px-3 justify-content-center">
		<div class="col-12 bold ps-1">
			<h3>신고 처리 결과</h3>
		</div>
		<textarea class="col-12"></textarea>
	</div>
	<br>
	
	<div class="row px-3 justify-content-center">
		<div class="col-12 bold ps-1">
			<h3>신고 대상 처리</h3>
		</div>
		<div class="col-6 align-self-center ps-1">
			<select id="reportPunishCheck" name="reportPunishCheck">
				<option value=0 >처리 대기</option>
				<option value=1 >처리 중</option>
				<option value=2 >처리 보류</option>
				<option value=3 >처리 완료</option>
			</select>
		</div>
		<div class="col-6">
			<div class="row justify-content-end">
			<div class="col-6 align-self-center pe-3 text-red w-auto">
				처벌 유저 아이디
			</div>
			<button class="col-3 btn btn-danger">영구정지</button>
		</div>
		</div>
		<textarea class="col-12"></textarea>
	</div>
	
	<div class="row justify-content-end px-3 py-2">
		<input type="button" class="col-2 w-auto btn btn-secondary" value="목록으로">
		<input type="button" class="col-2 w-auto btn btn-secondary mx-2 " value="수정하기">
		<input type="button" class="col-2 w-auto btn btn-secondary" value="삭제하기">
	</div>
</article>