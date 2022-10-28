<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="resources/js/formcheck.js"></script>
<script src="resources/js/member.js"></script>
<article>
	<h1>회원 수정</h1>
	* 표시는 필수입력사항
	<hr>

	<form action="memberUpdateProcess" method="POST" id="memberUpdateForm"
		 name="memberUpdateForm" encType="multipart/form-data">
		<div>
			* 이름 <br> <input type="text" name="memberName" id="memberName"
				value="${member.memberName }" readonly><br>
		</div>
		<div>
			* 아이디 <br> <input type="text" name="memberId" id="memberId"
				value="${member.memberId }" readonly> 
				<br>
		</div>
		
		<div>
			* 닉네임 <br> <input type="text" name="memberNickname" id="memberNickname"
				placeholder="변경하실 닉네임을 입력해주세요" value="${member.memberNickname }"> <input type="button"
				name="memberNicknameCheck" id="memberNicknameCheck" value="닉네임 중복확인">
				<input type="hidden" name="isNicknameCheck" id="isNicknameCheck" value="false">
				<input type="hidden" name="updateCheck" id="updateCheck" value=True><br>
		</div>
		<div> 
			* 이메일<br> <input type="text" name="email" id="email"
				placeholder="이메일 주소를 입력해주세요" value="${email}">@ <input type="text"
				name="domain" id="domain" value="${domain}"> <select id="domainList">
				<option>직접 입력</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>google.co.kr</option>
				<option>daum.net</option>
			</select>
		</div>
		<div>
			* 휴대폰 번호<br>
				<select id="phone1" name="phone1" id="phone1">
				<c:if test='${phone1 == "010" }'>
					<option selected="selected">010</option>
					<option>011</option>
					<option>016</option>
				</c:if>
				<c:if test='${phone1 == "011" }'>
					<option >010</option>
					<option selected="selected">011</option>
					<option>016</option>
				</c:if>
				<c:if test='${phone1 == "016" }'>
					<option>010</option>
					<option>011</option>
					<option selected="selected">016</option>
				</c:if>
			</select> - <input type="text" name="phone2" id="phone2" value="${phone2 }"> - <input
				type="text" name="phone3" id="phone3" value="${phone3 }">
		</div>

		<div>
			* 프로필 사진<br> <input type="file" name="memberPhoto" size="70"
				id="memberPhoto" maxlength="50" />
		</div>
		<div>
			* 우리동네 위치<br>
			<select name="address1" id="address1"
				onchange="addressChange(this)">
				<option>선택</option>
				<option value="seoul">서울</option>
				<option value="kyeonggi">경기</option>
				<option value="incheon">인천</option>
				<option value="daejeon">대전</option>
				<option value="daegu">대구</option>
				<option value="busan">부산</option>
				<option value="ulsan">울산</option>
				<option value="gwangju">광주</option>
				<option value="gangwon">강원</option>
				<option value="sejong">세종</option>
				<option value="chungbuk">충북</option>
				<option value="chungnam">충남</option>
				<option value="gyeongbuk">경북</option>
				<option value="gyeongnam">경남</option>
				<option value="jeonbuk">전북</option>
				<option value="jeonnam">전남</option>
				<option value="jeju">제주</option>
				
			</select> <select name="address2" id="address2">
				<option>선택</option>
			</select>

		</div>

		<div>
			* 선호음식 선택<br> 
			<input type="checkBox" name="foodCategory" id="foodCategory" value="1">한식
			<input type="checkBox" name="foodCategory" id="foodCategory" value="2">양식
			<input type="checkBox" name="foodCategory" id="foodCategory" value="3">중식
			<input type="checkBox" name="foodCategory" id="foodCategory" value="4">일식<br>
			<input type="checkBox" name="foodCategory" id="foodCategory" value="5">아시안
			<input type="checkBox" name="foodCategory" id="foodCategory" value="6">술집
			<input type="checkBox" name="foodCategory" id="foodCategory" value="7">카페,디저트
			<input type="checkBox" name="foodCategory" id="foodCategory" value="8">분식<br>
			<input type="checkBox" name="foodCategory" id="foodCategory" value="9">고기
			<input type="checkBox" name="foodCategory" id="foodCategory" value="10">채식
			<input type="checkBox" name="foodCategory" id="foodCategory" value="11">패스트푸드
			<input type="checkBox" name="foodCategory" id="foodCategory" value="12">기타<br>
			<input type="hidden" name="memberFavoriteCategory" id="memberFavoriteCategory" value="">
			<input type="hidden" name="memberFavoriteCategoryCount" id="memberFavoriteCategoryCount" value="">
		</div>
		<input type="reset" value="다시쓰기"> <input type="submit" id="memberJoinUpdateFormSubmit"
			value="회원수정">

	</form>
</article>