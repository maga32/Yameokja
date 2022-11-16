<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="resources/js/community.js"></script>
<article>
	<form id="community102UpdateForm" action="community102UpdateProcess"
			 method="post"	enctype="multipart/form-data">
		<input type="hidden" id="co102Id" name="co102Id" value="${ sessionScope.memberId }">
		<input type="hidden" id="communityNo" name="communityNo" value="${ co.communityNo }">

		<div>
			<h2>모집글 등록</h2>
			<hr>
		</div>
		<div>작성자 
			<input type="text" id="co102Nickname" name="co102Nickname" readOnly value="${ sessionScope.memberNickname }">
		</div>
		<br>
		<div>분류
			<input type="text" readOnly value="모집"></div>
		<br>
		<div>
			모집 인원수
			<select name="co102PartyMembers">
				<option ${co.partyMembers == 2 ? "selected" : "" }>2</option>
				<option ${co.partyMembers == 3 ? "selected" : "" }>3</option>
				<option ${co.partyMembers == 4 ? "selected" : "" }>4</option>
				<option ${co.partyMembers == 5 ? "selected" : "" }>5</option>
				<option ${co.partyMembers == 6 ? "selected" : "" }>6</option>
				<option ${co.partyMembers == 7 ? "selected" : "" }>7</option>
				<option ${co.partyMembers == 8 ? "selected" : "" }>8</option>
				<option ${co.partyMembers == 9 ? "selected" : "" }>9</option>
				<option ${co.partyMembers == 10 ? "selected" : "" }>10</option>
			</select>
		</div>
		<br>
		<div>
			모집 일자
			<input type="datetime-local" name="co102PartyDDay" id="co102PartyDDay" value="${co.partyDDay }">
		</div>
		<br>
		<div>
			모집 장소
			<input type="text" name="co102PartyPlace" id="co102PartyPlace" value="${co.partyPlace}">
		</div>
		<br>
		<div>
			제목
			<input type="text" name="co102Title" id="co102Title" placeholder = "제목을 입력해주세요" value="${co.communityTitle }">
		</div>
		<br>
		<div>
			<textarea style="width:500px; height:300px " id="co102Content" name="co102Content">${co.communityContent}</textarea>
		</div>
		<br>
		<div>
			프로필 사진 <input type="file" name="co102File" id="co102File"
				size="70" maxlength="50" />
		</div>
		<br>
		<div>
			<input type="button" onClick="location.href='communityList' "
				value="취소"> 
			<input type="submit" value="등록"	id="community102Submit">
		</div>
		<br>
	</form>
</article>
