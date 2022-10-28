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
	<input type="text" id="reportType" name="reportType" value="${ categoryNo }categoryNo">
		<select id="categoryNo" name="categoryNo">
		<c:if test="${categoryNo == '301'}">
				<option name = "reportType" value="위치이전 및 폐업">위치이전 및 폐업</option>
				<option name = "reportType" value="가게정보 변경(영업시간, 가게번호)">가게정보 변경(영업시간, 가게번호)</option>
				<option name = "reportType" value="허위 가게">허위 가게</option>
				<option name = "reportType" value="메뉴판 변경">메뉴판 변경</option>
				<option name = "reportType" value="기타(가게)">기타(가게)</option>
			</c:if>
			<c:if test="${categoryNo == '302'}">
				<option name = "reportType" value="부적절한 게시글 및 댓글">부적절한 게시글 및 댓글</option>
				<option name = "reportType" value="반복적인 게시글">반복적인 게시글</option>
				<option name = "reportType" value="허위정보 게시글">허위정보 게시글</option>
				<option name = "reportType" value="기타(맛집리뷰)">기타(맛집리뷰)</option>
			</c:if>
			<c:if test="${categoryNo == '303' or categoryNo == '101' or categoryNo == '102'}">
				<option name = "reportType" value="부적절한 커뮤니티글">부적절한 커뮤니티글</option>
				<option name = "reportType" value="반복적인 게시글">반복적인 게시글</option>
				<option name = "reportType" value="기타(동네글)">기타(동네글)</option>
			</c:if>
			<c:if test="${categoryNo == '304'}">
				<option name = "reportType" value="불건전한 사용자">불건전한 사용자</option>
				<option name = "reportType" value="기타(사용자)">기타(사용자)</option>
			</c:if>

		</select>
		<br>
		신고대상 :
		<input type="text" id="reportTarget" name="reportTarget" value="${reportTarget}" readonly><br>
		신고자 :
		<input type="text" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly>
		<br>
		제목 : 
		<input type="text" name="reportTitle" id="reportTitle">
		<br>
		내용 : 
		<textarea id="reportContent" name="reportContent"></textarea>
		<br>
		<input type="file" name="reportFile" size="70"
					id="reportFile" maxlength="50" />
		<br>
		<button type="reset">취소</button>
		<input type="submit" name="" value="작성완료">
	</form>
</BODY>
</html>