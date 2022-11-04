<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/report.css" />
<article>
<form name="reportUpdateForm" id="reportUpdateForm"  action="reportUpdate" method="post" >
<input type="hidden" name="reportNo" value="${ report.reportNo }">
	<div class="row justify-content-center pt-4 m-0">
		<h1 class="col-6 border-3 border-bottom text-center fw-bold pb-1">신고 상세보기</h1>
	</div>
	<div class="row m-0">
		<div class="col-8 row text-start m-0 p-0 ps-2">
			<div class="col-3 border-end fw-bold">분류</div>
			<div class="col-9"><input type="text" name="reportType" value="${ report.reportType }"></div>
			<div class="col-3 border-end fw-bold">제목</div>
			<div class="col-9"><input type="text" name="reportTitle" value="${ report.reportTitle }"></div>
			<div class="col-3 border-end fw-bold">신고자</div>
			<div class="col-9"><input type="text" class="border-0" value="${ report.memberId }" readonly="readonly"></div>
			<div class="col-3 border-end fw-bold">신고대상</div>
			<div class="col-9"><input type="text" name="reportTarget" class="border-0" value="${ report.reportTarget }" readonly="readonly"></div>
			<div class="col-3 border-end fw-bold">신고 작성일</div>
			<div class="col-9"></div><input type="text" name="reportDate" class="border-0" value="${ report.reportDate }" readonly="readonly"></div>
		</div>
		<div class="col-4 d-flex align-items-center">
			<img alt="신고첨부이미지" width="100%"
				src="/yameokja/resources/IMG/LOGOtemporaryIMG.PNG">
		</div>
		<div class="col-12 pt-2 p-0">
			<textarea class="col-12 border border-dark reportContent" name="reportContent">${ report.reportContent }</textarea>
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
	
	<div class="row m-0 d-flex justify-content-center">
		<div class="col-12 fw-bold ps-1">
			<h3>신고 처리 결과</h3>
		</div>
		<div class="col-12 text-start d-flex align-items-center ps-4">
			<select id="reportPunishCheck" name="reportPunishCheck">
				<option value=0 >처리 대기</option>
				<option value=1 >처리 중</option>
				<option value=2 >처리 보류</option>
				<option value=3 >처리 완료</option>
			</select>
		</div>
	</div>
	<br>
	
	<c:if test="${ sessionScope.member.memberLevel > 6 }">
	<div class="row m-0 d-flex justify-content-center">
		<div class="col-12 fw-bold ps-1">
			<h3>신고 대상 처리</h3>
		</div>
		<textarea class="col-12" name="reportPunishContent">${ report.reportPunishContent }</textarea>
	</div>
	</c:if>
	
<div class="row m-0 justify-content-end px-3 py-2">
	<input type="button" onclick="location.href='reportList'" class="col-2 w-auto btn btn-secondary" value="목록으로">
	<input type="submit" class="col-2 w-auto btn btn-secondary mx-2 " value="처리완료">
</div>
</form>
</article>