<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/myPostList.css" />
<!-- <script type="text/javascript" src="resources/js/chat.js"></script> -->
<article>
<form name="postListForm" id="postListForm">
	<input type="hidden" name="memberId" value="${ member.memberId }"/>
	<input type="hidden" name="pageNum" value="${ pageNum }"/>
</form>
<div class="row">
<div class="fullFrame col-md-12 p-2">
	<div class="myInformationsFrame col-md-12">
	
		<div class="inlineBlock col-md-2.5 mx-1">
			<img alt="프로필 사진" class="myInformation1 col-md-12" src="resources/IMG/mypage/likeIMG.PNG">
		</div>
		<div class="inlineBlock col-md-6 mx-1">
			<div class="myInformation2 col-md-12 ">
<!-- 		sessionScope.memberId -->
				<div class="mbIdFont">${ member.memberId }님</div>
				<div class="myInformationFont">이메일 : ${ member.memberEmail }</div>
				<div class="myInformationFont">가입일 : ${ member.memberJoinDate }</div>
			</div>
		</div>
		<div class="inlineBlock col-md-3 mx-1">
			<div class="myInformation3 col-md-12 ">					
			<div class="buttons_"><a href="#">회원정보수정</a></div>
			<div class="buttons_">회 원 탈 퇴</div>
			<div class="buttons_"><a href="#" onclick='window.open("userProfile","프로필","width=500, height=600")'>나 의 프 로 필</a></div>
			<div class="buttons_"><a href="#" onclick='window.open("blockList","차단목록","width=500, height=600")'>차 단 목 록</a></div>
			<div class="buttons_"><a href="#">신 고 목 록</a></div>
			</div>
		</div>
	</div><!--내정보틀 끝 -->
	<div class="postListHeader col-12 mt-3">
		<span class="postListbutton px-3 py-2">맛집 리뷰</span>
		<span class="replyListbutton px-3 py-2"><a href="#">댓글 리뷰</a></span>
		<span class="communityListbutton px-3 py-2"><a href="#">동네글</a></span>
		<span class="likeListbutton px-3 py-2"><a href="#">찜 목록</a></span>
	</div><!--postListHeader 끝 -->
	
	<div class="postListFrame col-md-12 p-2">
	
	<c:if test="${ not empty postList }">
	<c:forEach var="p" items="${ postList }">
	
		<div class="postFrame col-md-12 mb-2">
			<div class="mainImg col-md-3 mx-2">${ p.postNo }<br/>mainImg</div>
			<div class="postContent col-md-6 mx-2">
				<div class="postTitle"><a href="#">${ p.postTitle }</a></div>
				<div class="myInformationFont">
					<img alt="regDateIMG" src="resources/IMG/mypage/regDateIMG.PNG"/> 
					${ p.postRegDate }
				</div>
				<div class="myInformationFont">
					<img alt="readCountIMG" src="resources/IMG/mypage/readCountIMG.PNG"/> 
					${ p.postUpCount }
				</div>
				<div class="myInformationFont">
					<img alt="likeIMG" src="resources/IMG/mypage/likeIMG.PNG"/> 
					${ p.postUpList }
				</div>
			</div>
			<div class="upAndDel col-md-3">
				<div class="nbsp;">&nbsp;</div>
				<div class="nbsp;">&nbsp;</div>
				<div class="myInformationFont">
					<img alt="updateIMG" src="resources/IMG/mypage/updateIMG.PNG"/>
				</div>
				<div class="myInformationFont">
					<img alt="deleteIMG" src="resources/IMG/mypage/deleteIMG.PNG"/>
				</div>
			</div>
		</div>
		
	</c:forEach>
	<div class="pageGroup col-md-12">
		<div class="페이지그룹버튼">
			<c:if test="${ startPage > pageGroup }">
				<a href="myPagePost?pageNum=${ startPage - pageGroup }">[이전]</a>
			</c:if>
		</div>
		<div class="페이지그룹버튼">
		<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
			<c:if test="${ i == currentPage }">[ ${ i } ]	</c:if>			
			<c:if test="${ i != currentPage }">
				<a href="myPagePost?pageNum=${ i }">[ ${ i } ]</a>
			</c:if>			
		</c:forEach>
		</div>
		<div class="페이지그룹버튼">
		<c:if test="${ endPage < pageCount }">
			<a href="myPagePost?pageNum=${ startPage + pageGroup }">[다음]</a>
		</c:if>	
		</div>		
	</div><!--페이지그룹 끝 -->
	</c:if>
	</div><!--postListFrame 끝 -->	
</div>
</div><!--전체틀 끝 -->
</article>