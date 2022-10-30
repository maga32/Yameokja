<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/reportForm.css" />
<article>
	<h3>신고하기</h3>
	<hr>
	<form id="reportForm" name="reportForm" action="addReport" method="post" enctype="multipart/form-data">
	<input type="text" id="postNo" name="postNo" value="${ postNo }postNo(임시용)">
	<input type="text" id="categoryNo" name="categoryNo" value="${ categoryNo }">
		<select id="reportType" name="reportType">
		<c:if test="${categoryNo == '301'}">
				<option value="위치이전 및 폐업">위치이전 및 폐업</option>
				<option value="가게정보 변경(영업시간, 가게번호)">가게정보 변경(영업시간, 가게번호)</option>
				<option value="허위 가게">허위 가게</option>
				<option value="메뉴판 변경">메뉴판 변경</option>
				<option value="기타(가게)">기타(가게)</option>
			</c:if>
			<c:if test="${categoryNo == '302'}">
				<option value="부적절한 게시글 및 댓글">부적절한 게시글 및 댓글</option>
				<option value="반복적인 게시글">반복적인 게시글</option>
				<option value="허위정보 게시글">허위정보 게시글</option>
				<option value="기타(맛집리뷰)">기타(맛집리뷰)</option>
			</c:if>
			<c:if test="${categoryNo == '303' or categoryNo == '101' or categoryNo == '102'}">
				<option value="부적절한 커뮤니티글">부적절한 커뮤니티글</option>
				<option value="반복적인 게시글">반복적인 게시글</option>
				<option value="기타(동네글)">기타(동네글)</option>
			</c:if>
			<c:if test="${categoryNo == '304'}">
				<option value="불건전한 사용자">불건전한 사용자</option>
				<option value="기타(사용자)">기타(사용자)</option>
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
		<button type="submit">작성완료</button>
	</form>
</article>