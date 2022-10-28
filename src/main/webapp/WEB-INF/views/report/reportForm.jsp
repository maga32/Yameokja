<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Report</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css" />
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<BODY>
	<h3>신고하기</h3>
	<hr>
	<form id="reportForm" name="reportForm" action="addReport" method="post" enctype="multipart/form-data">
	<input type="hidden" id="reportType" name="reportType" value="${resportType }">
		<select id="categoryNo" name="categoryNo">
			<c:if test="${reportType == 'community'}">
				<option value=301>불량 수다글 작성</option>
				<option value=302>불량 모집글 작성</option>
			</c:if>
			
		</select>
		<br>
		신고대상 :
		<input type="text" id="reportTarget" name="reportTarget" value="${reportTarget}" readonly><br>
		신고자 :
		<input type="text" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly>
		<br>
		<textarea id="reportContent" name="reportContent">
		</textarea>
		<br>
		<input type="file" name="reportFile" size="70"
					id="reportFile" maxlength="50" />
		<br>
		<button>취소</button>
		<input type="submit" name="" value="작성완료">
	</form>
</BODY>
</html>