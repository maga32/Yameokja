<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/community.js"></script>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>수다글 등록</title>
</head>
<body>
	<form id="community101WriteForm" action="community101WriteProcess"
			 method="post"	enctype="multipart/form-data">
		<input type="hidden" id="co101Id" name="co101Id" value="${ sessionScope.memberId }">


		<div>
			<h2>수다글 등록</h2>
			<hr>
		</div>
		<div>작성자 
			<input type="text" id="co101Nickname" name="co101Nickname" readOnly value="${ sessionScope.memberNickname }">
		</div>
		<br>

		<div>분류
			<input type="text" readOnly value="수다"></div>
		<br>
		<div>
			제목
			<input type="text" name="co101Title" id="co101Title" placeholder = "제목을 입력해주세요">
		</div>
		<br>
		</div>
		<div>
			<textarea style="width:500px; height:300px " id="co101Content" name="co101Content">
	    		
	    	</textarea>
		</div>
		<br>
		<div>
			프로필 사진 <input type="file" name="co101File" id="co101File"
				size="70" maxlength="50" />
		</div>
		<br>
		<div>
			<input type="button" onClick="location.href='communityList' "
				value="취소"> 
			<input type="submit" value="등록"	id="community101Submit">
		</div>
		<br>
		</div>
	</form>
</body>
</html>
