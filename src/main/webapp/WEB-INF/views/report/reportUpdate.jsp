<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/reportDetail.css" />
<article>
신고수정하기
<hr>
<div>신고자 : ${ report.memberId }
<br>분류 : <input type="text" value="${ report.reportType }">
<br>신고 대상 : <input type="text" value="${ report.reportTarget }">
<br>신고 작성일 : <input type="text" value="${ report.reportDate }">
</div>
<div class="border">
<div><img alt="신고첨부이미지" height="100px" src="/yameokja/resources/IMG/LOGOtemporaryIMG.PNG"></div>
<input type="text" value="${ report.reportContent }">
</div>
<c:if test="${ empty report.reportFile }">"첨부파일이 없습니다."</c:if>
<c:if test="${ not empty report.reportFile }">${ report.reportFile }</c:if>
<br>신고처리결과
<div class="border"><input type="text" value="${ report.reportPunishContent }"></div>
신고 대상 처리?
유저아이디  <input type="button" value="영구정지">
<br><input type="button" value="목록으로"><input type="button" value="처리완료">
</article>