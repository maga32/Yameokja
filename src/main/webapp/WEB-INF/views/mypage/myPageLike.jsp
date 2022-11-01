<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="resources/css/myPage.css" />
<script type="text/javascript" src="resources/js/mypage.js"></script>
<article>
<div class="row m-0 bg-white justify-content-center">
	<form name="postListForm" id="postListForm">
		<input type="hidden" name="userId" value="${ userId }" />
		<input type="hidden" name="pageNum" value="${ pageNum }" />
	</form>
	
		<div class="row py-2 px-0">
			<div class="row p-0 m-0 border border-3 rounded-3">

				<div class="col-3 p-4">
					<img alt="프로필 사진" class=" rounded-circle text-center col-12"
						src="resources/IMG/mypage/likeIMG.PNG">
				</div>
				<div class="text-start col-6 ps-3 p-0 d-flex align-items-center">
					<div class="col-12">
						<div class="fw-bold fs-2">${ user.memberNickname }님</div>
						<div>이메일 : ${ user.memberEmail }</div>
						<div>가입일 : ${ user.memberJoinDate }</div>
					</div>
				</div>
<!-- 				로그인 일 때 보이는 버튼들 시작 -->
				<c:if test="${ sessionScope.memberId == userId }">
				<div class="col-3 p-0 d-flex align-items-center">
					<div class="row text-center fs-6 text-secondary fw-semibold m-1">
						<div class="buttons_">
							<a href="#">회원정보수정</a>
						</div>
						<div class="buttons_">
							<a href="#">회 원 탈 퇴</a>
						</div>
						<div class="buttons_">
							<a href="#"
								onclick='window.open("userProfile","프로필","width=500, height=600")'>나
								의 프 로 필</a>
						</div>
						<div class="buttons_">
							<a href="#"
								onclick='window.open("blockList","차단목록","width=500, height=600")'>차
								단 목 록</a>
						</div>
						<div class="buttons_">
							<a href="#">신 고 목 록</a>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${ sessionScope.memberId != userId}">
					<div class="col-3 p-0 d-flex align-items-center">
					<div class="col-12 text-center fs-6 text-secondary fw-semibold m-1">
						<div class="buttons_">
							<a href="#"
								onclick='window.open("userProfile","프로필","width=500, height=600")'>
								${ user.memberNickname }의 프 로 필</a>
						</div>
					</div>
				</div>
				</c:if>
<!-- 				로그인 일 때 보이는 버튼들 끝 -->
			</div>
			<!--내정보틀 끝 -->
			<div class="text-center p-0 mt-3">
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPagePost">맛집 리뷰</a></span>
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPageReply">댓글 리뷰</a></span>
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPageCommunity">동네글</a></span>
				<span class="currentPage fw-bold px-3 py-2">찜 목록</span>
			</div>
<!-- 			postListHeader 끝 -->
<!-- 			postList 시작 -->
			<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">

				<c:if test="${ not empty postList }">
					<c:forEach var="p" items="${ postList }">

						<div class="d-flex align-items-center border text-center py-2 rounded col-12 mb-2">
							<div class="col-3 mx-2">
								<img src="resources/IMG/LOGOtemporaryIMG.PNG"
										class="img-thumbnail rounded" alt="...">
							</div>
							<div class="text-start col-6 mx-2">
								<div class="postTitle fs-2 fw-bold">
									<a href="#">${ p.postTitle }</a>
								</div>
								<div class="postNo" id="postNo">
									<a href="#">postNo=${p.postNo}</a>
								</div>
								<div class="">
									<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
									${ p.postRegDate }
								</div>
								<div class="">
									<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postUpCount }
								</div>
								<div class="">
									<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpList }
								</div>
							</div>
							<div class="d-inline-block col-3">
								<div class="updateButton">
									<a href=""><i class="fa fa-pencil fa-2x my-3" aria-hidden="true"></i></a>
								</div>
								<div class="deleteButton" id="deleteButton">
									<a href="deleteMyPagePost?postNo=${p.postNo}"><i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>

					</c:forEach>
<!-- 					페이지그룹 시작 -->
					<div class="row text-end">
					<div class="col-12 pe-4">
						<c:if test="${ startPage > pageGroup }">
							<div class="previousPage text-secondery d-inline-block">
								<a href="myPagePost?pageNum=${ startPage - pageGroup }"><</a>
							</div>
						</c:if>
						<div class="pageNumber text-secondery d-inline-block">
							<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
								<c:if test="${ i == currentPage }">
									<div class=" d-inline-block fw-bold" style="color: #F58500;">&nbsp;${ i }&nbsp;</div>
								</c:if>
								<c:if test="${ i != currentPage }">
									<div class=" d-inline-block">
										<a href="myPagePost?pageNum=${ i }">&nbsp;${ i }&nbsp;</a>
									</div>
								</c:if>
							</c:forEach>
						</div>						
						<c:if test="${ endPage < pageCount }">
							<div class="nextPage text-secondery d-inline-block">
								<a href="myPagePost?pageNum=${ startPage + pageGroup }">></a>
							</div>
						</c:if>
					</div>
					</div>
<!-- 					페이지그룹 끝 -->
				</c:if>
				<c:if test="${ empty postList }">
					<div class="col-12 text-center"> 작성한 글이 없습니다.</div>
				</c:if>
			</div>
<!-- 			postList 끝 -->
		</div>
	</div>
	<!--전체틀 끝 -->
</article>