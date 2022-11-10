<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/report.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/yameokja/resources/js/jquery-3.2.1.min.js"></script>
<script src="/yameokja/resources/js/common.js"></script>
 
<article>
	<div class="row yellowBar"></div>
	<div class="row m-0 p-3">
	<div class="row justify-content-left m-0 p-0">
		<div class=" fs-1 border-3 border-bottom center p-0">신고하기</div>
	</div>
	
	<form id="reportForm" name="reportForm" action="reportAdd" method="post" enctype="multipart/form-data">
		<div class="row m-0 p-0">
			<div class="row my-1 m-0 p-0">
				<div class="col-3 ps bold">신고 대상<br>신고자</div>
				<div class="col-3 border-start">
					<input type="text" class=" border-0" id="reportTarget" name="reportTarget" value="${reportTarget}" readonly><br>
					<input type="text" class=" border-0" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly>
				</div>
			</div>
			<div class="col-12 m-0 p-2">
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
				</select><br>
			</div>
			<div class="col-12 p-2">
				<input type="text" name="reportTitle" id="reportTitle" placeholder="제목을 입력하세요">
			</div>
			<div class="col-12 p-2">
				<textarea id="reportContent" name="reportContent" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div class="col-12 p-2">
				<input type="file" name="reportFile" size="70" id="reportFile" maxlength="50" />
			</div>
			<div class="col-12 p-2">
				<button type="reset">취소</button>
				<button type="submit">작성완료</button>
			</div>
			
			<!-- hidden 영역 -->
			<input type="hidden" id="memberId" name="memberId" value="${sessionScope.memberId}" readonly>
			<input type="hidden" id="postNo" name="postNo" value="${ postNo }">
			<input type="hidden" id="categoryNo" name="categoryNo" value="${ categoryNo }">
			<!-- hidden 영역 end-->
		</div>
	</form>
	</div>
</article>