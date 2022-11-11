<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/loginForm.css" />
  	<script src="/yameokja/resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="row p-5">
<div class="col-12">
<div class="row">
	<form id="loginForm" action="login" method="post">
		<h2>Login</h2>
		<div class="col-12">	
			<div class="legend col-12">회원 로그인</div>
			<div class="row">
			<div id="login" class="login col-7">
				<div>
					<label for="userId" class="labelStyle">아이디</label><br>
					<input type="text" id="memberId" name="memberId"/>
				</div>
				<div>
					<label for="userPass" class="labelStyle">비밀번호</label><br>
					<input type="password" id="memberPassword" name="memberPassword"/>
				</div>
			</div><div class="login col-5">
				<input type="submit" value="로그인" id="btnLogin" class="loginButton btn"/>
			</div>
			</div>
			<div id="btn1" class="col-12  mt-4 textAlignCenter">
				<input type="checkbox" id="saveId" value="savedIdYes" />
				<label for="saveId" class="checkbox">아이디저장</label>	
				<input type="checkbox" id="secure" value="secureYes" />
				<label for="secure" class="checkbox">보안접속</label>	
			</div>
			<div id="btn2" class="col-12 textAlignCenter">
				<input type="button" value="회원가입" id="btnJoin" />
				<input type="button" value="아이디/비밀번호 찾기" id="btnSearch" />
			</div>
		</div>
	</form>
</div>
</div>
</div>
</body>
</html>