<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="resources/css/loginForm.css" />
<article>
	<form id="loginForm" action="login" method="post">
		<h2>Login</h2>
		<div class="col-12">	
			<div class="legend col-12">회원 로그인</div>
			<div id="login" class="inlineBlock login col-7">
				<div>
					<label for="userId" class="labelStyle">아이디</label><br>
					<input type="text" id="memberId" name="memberId"/>
				</div>
				<div>
					<label for="userPass" class="labelStyle">비밀번호</label><br>
					<input type="password" id="memberPassword" name="memberPassword"/>
				</div>
			</div><div class="inlineBlock login col-5">
				<input type="submit" value="로그인" id="btnLogin" class="loginButton btn"/>
			</div>
			<p id="btn1" class="col-12">
				<input type="checkbox" id="saveId" value="savedIdYes" />
				<label for="saveId">아이디저장</label>	
				<input type="checkbox" id="secure" value="secureYes" />
				<label for="secure">보안접속</label>	
			</p>
			<p id="btn2" class="col-12">
				<input type="button" value="회원가입" id="btnJoin" />
				<input type="button" value="아이디/비밀번호 찾기" id="btnSearch" />
			</p>
		</div>
	</form>
</article>