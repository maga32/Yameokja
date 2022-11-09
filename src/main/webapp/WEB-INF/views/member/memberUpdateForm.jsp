<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="resources/js/formcheck.js"></script>
<script src="resources/js/member.js"></script>
<article>
	<h1 class="fw-bold mt-3">회원수정</h1>
	* 표시는 필수입력사항
	<hr>

	<form action="memberUpdateProcess" method="POST" id="memberUpdateForm"
		 name="memberUpdateForm" encType="multipart/form-data">
		<div>
			<div class="mt-2">* 이름</div>
			<input type="text" name="memberName" id="memberName" value="${member.memberName }" readonly><br>
		</div>
		<div>
			<div class="mt-2">* 아이디</div>
			<input type="text" name="memberId" id="memberId" value="${member.memberId }" readonly> 
				<br>
		</div>
		
		<div>
			<div class="mt-2">* 닉네임</div>
				<input type="text" name="memberNickname" id="memberNickname"
					placeholder="변경하실 닉네임을 입력해주세요" value="${member.memberNickname }"> <input type="button"
					name="memberNicknameCheck" id="memberNicknameCheck" value="닉네임 중복확인">
				<input type="hidden" name="isNicknameCheck" id="isNicknameCheck" value="false">
				<input type="hidden" name="updateCheck" id="updateCheck" value=True><br>
		</div>
		<div> 
			<div class="mt-2">* 이메일</div>
			<input type="text" name="email" id="email"
				placeholder="이메일 주소를 입력해주세요" value="${email}"> @ <input type="text"
				name="domain" id="domain" value="${domain}"> <select id="domainList">
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
			<div class="mt-2">* 프로필 사진</div>
			<input type="file" name="memberPhoto" size="70" id="memberPhoto" maxlength="50"/>
		</div>
		<div>
			<div class="mt-2">* 우리동네 위치 (기존 위치 : ${largeAddress}, ${smallAddress} )</div>
			<select name="address1" id="address1"
				onchange="addressChange(this)">
				<option>선택</option>
				<option ${largeAddress == "서울" ? 'selected="selected"' : '' } value="서울">서울</option>
				<option ${largeAddress == "경기" ? 'selected="selected"' : '' } value="경기">경기</option>
				<option ${largeAddress == "인천" ? 'selected="selected"' : '' } value="인천">인천</option>
				<option ${largeAddress == "대전" ? 'selected="selected"' : '' } value="대전">대전</option>
				<option ${largeAddress == "대구" ? 'selected="selected"' : '' } value="대구">대구</option>
				<option ${largeAddress == "부산" ? 'selected="selected"' : '' } value="부산">부산</option>
				<option ${largeAddress == "울산" ? 'selected="selected"' : '' } value="울산">울산</option>
				<option ${largeAddress == "광주" ? 'selected="selected"' : '' } value="광주">광주</option>
				<option ${largeAddress == "강원" ? 'selected="selected"' : '' } value="강원">강원</option>
				<option ${largeAddress == "세종" ? 'selected="selected"' : '' } value="세종">세종</option>
				<option ${largeAddress == "충북" ? 'selected="selected"' : '' } value="충북">충북</option>
				<option ${largeAddress == "충남" ? 'selected="selected"' : '' } value="충남">충남</option>
				<option ${largeAddress == "경북" ? 'selected="selected"' : '' } value="경북">경북</option>
				<option ${largeAddress == "경남" ? 'selected="selected"' : '' } value="경남">경남</option>
				<option ${largeAddress == "전북" ? 'selected="selected"' : '' } value="전북">전북</option>
				<option ${largeAddress == "전남" ? 'selected="selected"' : '' } value="전남">전남</option>
				<option ${largeAddress == "제주" ? 'selected="selected"' : '' } value="제주">제주</option>
				
			</select> <select name="address2" id="address2">
				<option value="${smallAddress }">${smallAddress }</option>
			</select>

		</div>

		<div>
			<div class="mt-2">* 선호음식 선택</div>
			<!-- test -->
			<div class="row">
				<div class="col-11 row">
					<c:set var="onload" value="false"/>
					<c:forEach var="li" items="${foodCategoryList}">
						<div class="col-3">
						<c:forEach var="memLi" items="${memberFavoriteCategory}">
							<c:if test="${li.index == memLi }">
								<input type="checkBox" name="foodCategory" id="foodCategory" value="${li.index }"
								${li.index == memLi ? 'checked' : '' }>${li.value }
								<c:set var="onload" value="true"/>
							</c:if>
						</c:forEach>
						<c:if test="${onload == false }">
							<input type="checkBox" name="foodCategory" id="foodCategory" value="${li.index }"
									${li.index == memLi ? 'checked' : '' }>${li.value }
						</c:if>
						<c:set var="onload" value="false"/>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- text end -->
			<input type="hidden" name="memberFavoriteCategory" id="memberFavoriteCategory" value="">
			<input type="hidden" name="memberFavoriteCategoryCount" id="memberFavoriteCategoryCount" value="">
		</div>
		<div class="mb-2">
			<input type="reset" value="다시쓰기">
			<input type="submit" id="memberJoinUpdateFormSubmit" value="회원수정">
		</div>
	</form>
</article>