<%--
	회원 가입시 아이디 중복검사 요청에 대한 처리 결과를 출력할 View 페이지
	이 페이지는 새창으로 실행되고 중복 아이디 체크를 할 수 있는 폼을 제공한다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript" src="resources/js/member.js"></script>
<article>
	<div id="nicknameCheckForm">
	<c:choose>
		<c:when test="${ overlap }" >
			<c:if test="${memberNickname == sessionScope.memberNickname}">
				<h3>닉네임 유지</h3>
				<div class="memberInputText">
					입력하신 ${ memberNickname }는 변경 전 닉네임입니다.</div>
				<div class="memberInputText">
					<input type="hidden" name="updateCheck" id="updateCheck" value="${updateCheck}">
					<input type="button" value="${ memberNickname }을(를) 닉네임으로 사용하기" 
						id="btnNicknameCheckClose" data-id-value="${ memberNickname }"/>
				</div>
			</c:if>
			<c:if test="${memberNickname != sessionScope.memberNickname}">
				<h3>사용할 수 없는 닉네임</h3>
				<div class="memberInputText">
					입력하신 ${ memberNickname }는 이미 사용 중인 닉네임 입니다.
				</div>
				<div class="memberInputText">다른 닉네임을 선택해 주세요</div>		
				<form action="overlapNicknameCheck.mvc?" name="NicknameCheckForm" 
					method="post" id="NicknameCheckForm">
					<div class="memberInputText">
						<span class="checkFormSpan">닉네임 : </span>
						<input type="text" name="memberNickname" id="checkNickname" size="15"/>
						<input type="hidden" name="updateCheck" id="updateCheck" value="${updateCheck}">
						<input type="submit" value="중복확인" />
					</div>
				</form>
			</c:if>
			
		</c:when>
		<c:otherwise>
			<h3>사용할 수 있는 닉네임</h3>
			<div class="memberInputText">
				입력하신 ${ memberNickname }는 사용할 수 있는 닉네임 입니다.</div>
			<div class="memberInputText">
				<input type="hidden" name="updateCheck" id="updateCheck" value="${updateCheck}">
				<input type="button" value="${ memberNickname }을(를) 닉네임으로 사용하기" 
					id="btnNicknameCheckClose" data-id-value="${ memberNickname }"/>
			</div>
		</c:otherwise>		
	</c:choose>
	</div>
</article>