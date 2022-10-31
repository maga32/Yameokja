<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/reportDetail.css" />
<article>
<input type="text" name="reportNo" value="${ report.reportNo }">
<hr>신고상세보기
<hr>
<div>제목 : ${ report.reportTitle }
<br>신고자 : ${ report.memberId }
<br>분류 : ${ report.reportType }
<br>신고 대상 : <c:if test="${ report.categoryNo == 301 }">${ report.reportTarget }</c:if>
<!-- storeTitle 불러올 수 있는 방법 모색해보기 -->
<c:if test="${ report.categoryNo != 301 }">${ report.reportTarget }</c:if>
<br>신고 작성일 : ${ report.reportDate }
</div>
<div class="border">
<div><img alt="신고첨부이미지" height="100px" src="/yameokja/resources/IMG/LOGOtemporaryIMG.PNG"></div>
${ report.reportContent }
</div>
<c:if test="${ empty report.reportFile }">"첨부파일이 없습니다."</c:if>
<c:if test="${ not empty report.reportFile }">${ report.reportFile }</c:if>
<br>신고처리결과
<div class="border">${ report.reportPunishContent }</div>
신고 대상 처리?
유저아이디  <input type="button" value="영구정지">
<br><input type="button" onclick="location.href='reportList'" value="목록으로">
<a href="reportUpdateForm?reportNo=${ report.reportNo }"><input type="button" value="수정하기"></a>
<a href="deleteReport?reportNo=${ report.reportNo }"><input type="button" value="삭제하기"></a>
</article>