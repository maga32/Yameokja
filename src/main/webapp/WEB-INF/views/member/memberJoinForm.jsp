<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="resources/js/member.js"></script>
<article>
	<h1 class="fw-bold mt-3">회원가입</h1>
	* 표시는 필수입력사항
	<hr>

	<form action="memberJoinProcess" method="POST" id="memberJoinForm"
		 name="memberJoinForm" encType="multipart/form-data">
		<div>
			<div class="mt-2">* 이름</div>
			<input type="text" name="memberName" id="memberName"><br>
		</div>
		<div>
			<div class="mt-2">* 아이디</div>
			<input type="text" name="memberId" id="memberId"> <input type="button"
				name="memberIdCheck" id="memberIdCheck" value="아이디 중복확인">
				<input type="hidden" name="isIdCheck" id="isIdCheck" value="false">
				<br>
		</div>
		
		<div>
			<div class="mt-2">* 닉네임</div>
			<input type="text" name="memberNickname" id="memberNickname"> <input type="button"
				name="memberNicknameCheck" id="memberNicknameCheck" value="닉네임 중복확인">
				<input type="hidden" name="isNicknameCheck" id="isNicknameCheck" value="false"><br>
				<input type="hidden" name="updateCheck" id="updateCheck" value=False>
		</div>
		<div>
			<div class="mt-2">* 비밀번호</div>
			<input type="password" name="pass1" id="pass1"><br>
		</div>
		<div>
			<div class="mt-2">* 비밀번호 확인</div>
			<input type="password" name="pass2" id="pass2">
			<input type="hidden" name="passCheck" id="passCheck" value="false">
			<div id="memberPasswordWarning" style="color:red">비밀번호를 입력해주세요.</div>
		</div>
		<div>
			<div class="mt-2">* 이메일</div>
			<input type="text" name="email" id="email">@ <input type="text"
				name="domain" id="domain"> <select id="domainList">
				<option>직접 입력</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>google.co.kr</option>
				<option>daum.net</option>
			</select>
		</div>
		<div>
			<div class="mt-2">* 휴대폰 번호</div>
			<select id="phone1" name="phone1" id="phone1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
			</select> - <input type="text" name="phone2" id="phone2"> - <input
				type="text" name="phone3" id="phone3">
		</div>

		<div>
			<div class="mt-2">* 프로필 사진</div>
			<input type="file" name="memberPhoto" size="70"
				id="memberPhoto" maxlength="50" />
		</div>
		<div>
			<div class="mt-2">* 우리동네 위치</div>
			<select name="address1" id="address1" class="address1"
				onchange="addressChange(this)">
				<option>선택</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="광주">광주</option>
				<option value="강원">강원</option>
				<option value="세종">세종</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
				<option value="제주">제주</option>
				
			</select> <select name="address2" id="address2" class="address2">
				<option>선택</option>
			</select>

		</div>

		<div>
			<div class="mt-2">* 선호음식 선택</div>
			<div class="row">
				<div class="col-11 row">
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="1">한식		
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="2">양식		
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="3">중식
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="4">일식
					</div>
					
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="5">아시안
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="6">술집	
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="7">카페,디저트
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="8">분식
					</div>
					
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="9">고기	
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="10">채식
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="11">패스트푸드
					</div>
					<div class="col-3">
						<input type="checkBox" name="foodCategory" id="foodCategory" value="12">기타<br>
					</div>
				</div>
			</div>
			<input type="hidden" name="memberFavoriteCategory" id="memberFavoriteCategory" value="">
			<input type="hidden" name="memberFavoriteCategoryCount" id="memberFavoriteCategoryCount" value="">
		</div>
		<div class="mb-2">
			<input type="reset" value="다시쓰기"> 
			<input type="submit" id="memberJoinUpdateFormSubmit" value="회원가입">
		</div>
	</form>
</article>