<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="resources/js/community.js"></script>
<article>
	<form id="community101UpdateForm" action="community101UpdateProcess"
			 method="post"	enctype="multipart/form-data">
		<input type="hidden" id="co101Id" name="co101Id" value="${ sessionScope.memberId }">
		<input type="hidden" id="communityNo" name="communityNo" value="${ co.communityNo }">

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
			<input type="text" name="co101Title" id="co101Title" placeholder = "제목을 입력해주세요" value="${co.communityTitle }">
		</div>
		<br>
		<div>
			<textarea style="width:500px; height:300px " id="co101Content" name="co101Content">${co.communityContent }</textarea>
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
	</form>
</article>
