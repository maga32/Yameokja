<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<article>
<form name="postListForm" id="postListForm">
	<input type="hidden" name="mbId" value="${ member.mbId }"/>
</form>
<div class="row">
<div class="fullFrame col-md-12">
	<div class="myInformationsFrame col-md-12 ">
		<div class="myInformation1 col-md-3 m-md-2">
			<div>프로필 사진</div>
		</div>
		<div class="myInformation2 col-md-6 m-md-2">
			<div class="mbIdFont">sessionScope.${ member.mbId }님</div>
			<div class="nbsp;">&nbsp;</div>
			<div class="nbsp;">&nbsp;</div>
			<div class="myInformationFont">이메일 : <span>${ member.mbEmail }</span></div>
			<div class="myInformationFont">가입일 :<span>${ member.mbJoinDate }</span></div>
		</div>
		<div class="myInformation3 col-md-3 m-md-2">				
			<div class="buttons_">회원 정보 수정</div>
			<div class="buttons_">회 원&nbsp;&nbsp;&nbsp;&nbsp;탈 퇴</div>
			<div class="buttons_">나 의&nbsp;&nbsp;프 로 필</div>
			<div class="buttons_">차 단&nbsp;&nbsp;&nbsp;&nbsp;목 록</div>
			<div class="buttons_">신 고&nbsp;&nbsp;&nbsp;&nbsp;목 록</div>
		</div>
	</div><!--내정보틀 끝 -->
	<div class="nbsp;">&nbsp;</div>
	<div class="postListHeader">
		<div class="postListbutton">맛집 리뷰</div>
		<div class="replyListbutton">댓글 리뷰</div>
		<div class="communityListbutton">동네글</div>
		<div class="likeListbutton">찜 목록</div>
	</div><!--postListHeader 끝 -->
	
	<div class="postListFrame">
	<c:if test="${ not empty postList }">
	<c:forEach var="p" items="${ postList }">
	
		<div class="postFrame">
			<div class="mainImg">
				<div class="buttons_">mainImg</div>
			</div>
			<div class="postContent">
				<div class="postTitle">${ p.pTitle }pTitle</div>
				<div class="myInformationFont">
					<img alt="regDateIMG" src="resources/IMG/regDateIMG.PNG"/> 
<%-- 					${ p.pRegDate }2022-09-20 --%>
				</div>
				<div class="myInformationFont">
					<img alt="readCountIMG" src="resources/IMG/readCountIMG.PNG"/> 
<%-- 					${ p.pUpCount }12,345 --%>
				</div>
				<div class="myInformationFont">
					<img alt="likeIMG" src="resources/IMG/likeIMG.PNG"/> 
<%-- 					${ p.pUpList }245 --%>
				</div>
			</div>
			<div class="upAndDel">
				<div class="nbsp;">&nbsp;</div>
				<div class="nbsp;">&nbsp;</div>
				<div class="myInformationFont">
					<img alt="updateIMG" src="resources/IMG/updateIMG.PNG"/>
				</div>
				<div class="myInformationFont">
					<img alt="deleteIMG" src="resources/IMG/deleteIMG.PNG"/>
				</div>
			</div>
		</div>
	
	</c:forEach>
	</c:if>
	</div><!--postListFrame 끝 -->
	<div class="페이지그룹">
		<div class="페이지그룹버튼"><</div>
		<div class="페이지그룹버튼">1 2 3 4 5 6 7 8 9 10</div>
		<div class="페이지그룹버튼">></div>		
	</div><!--페이지그룹 끝 -->
</div>
</div><!--전체틀 끝 -->
</article>