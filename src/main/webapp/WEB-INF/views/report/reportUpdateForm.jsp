<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/reportDetail.css" />
<article>
<form name="reportUpdateForm" id="reportUpdateForm"  action="reportUpdate" method="post" >
<input type="text" name="reportNo" value="${ report.reportNo }">
신고수정하기
<hr>

<div>제목 :<input type="text" name="reportTitle" value="${ report.reportTitle }">
<br>신고자 : ${ report.memberId }
<br>분류 : <input type="text" name="reportType" value="${ report.reportType }">
<br>신고 대상 : <input type="text" name="reportTarget" value="${ report.reportTarget }">
<br>신고 작성일 : <input type="text" name="reportDate" value="${ report.reportDate }" readonly="readonly">
</div>
<div class="border">
<div><img alt="신고첨부이미지" height="100px" src="/yameokja/resources/IMG/LOGOtemporaryIMG.PNG"></div>
<input type="text" name="reportContent" value="${ report.reportContent }">
</div>
<input type="text" name="reportFile" value="${ report.reportFile }" readonly="readonly">
<br>신고처리결과
<div class="border"><input type="text" name="reportPunishContent" value="${ report.reportPunishContent }"></div>
신고 대상 처리?
유저아이디  <input type="button" value="영구정지">


<br><input type="button" onclick="location.href='reportList'" value="목록으로">
<input type="submit" value="처리완료">

</form>
</article>