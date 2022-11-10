<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/yameokja/resources/css/myPage.css" />
<script type="text/javascript" src="/yameokja/resources/js/mypage.js"></script>
<article>
<div class="row m-0 bg-white justify-content-center">
	<form name="postListForm" id="postListForm">
		<input type="hidden" name="userId" value="${ user.memberId }" />
		<input type="hidden" name="pageNum" value="${ pageNum }" />
		<input type="hidden" name="postNo" value="${ postNo }" />
	</form>
	
		<div class="row py-2 px-0">
			<div class="row p-0 m-0 pb-2 border border-3 rounded-3">
				<div class="col-3 p-4">				
					<img alt="프로필 사진" class=" rounded-circle text-center col-12"
						src="/yameokja/resources/IMG/member/${ user.memberPhoto }">
				</div>
				<div class="text-start col-6 ps-3 p-0 d-flex align-items-center">
					<div class="col-12">
						<div class="fw-bold fs-2">${ user.memberNickname }님</div>
						<div>이메일 : ${ user.memberEmail }</div>
						<div>가입일 : <fmt:formatDate value="${ user.memberJoinDate }" pattern="yyyy-MM-dd" /></div>
					</div>
				</div>
<!-- 				로그인 일 때 보이는 버튼들 시작 -->
				<c:if test="${ sessionScope.memberId == user.memberId }">
				<div class="col-3 p-0 d-flex align-items-center">
					<div class="row text-center fs-6 text-secondary fw-semibold m-1">
						<div class="buttons_">
							<a href="memberUpdateForm?memberId=${ sessionScope.memberId }">회원정보수정</a>
						</div>
						<div class="buttons_">
							<a href="memberDelete">회 원 탈 퇴</a>
						</div>
						<div class="buttons_">
							<a href="#"
								onclick='window.open("userProfile?userId=${ sessionScope.memberId }","프로필","width=520, height=600")'>나
								의 프 로 필</a>
						</div>
						<div class="buttons_">
							<a href="#"
								onclick='window.open("blockList","차단목록","width=500, height=600")'>차
								단 목 록</a>
						</div>
						<div class="buttons_">
							<a href="reportList?userId=${ sessionScope.memberId }">신 고 목 록</a>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${ sessionScope.memberId != user.memberId }">
					<div class="col-3 p-0 d-flex align-items-center">
					<div class="col-12 text-center fs-6 text-secondary fw-semibold m-1">
						<div class="buttons_">
							<a href="#"
								onclick='window.open("userProfile?userId=${ user.memberId }","프로필","width=500, height=600")'>
								${ user.memberNickname }의<br>프로필 보기</a>
						</div>
					</div>
				</div>
				</c:if>
<!-- 				로그인 일 때 보이는 버튼들 끝 -->
			</div>
			<!--내정보틀 끝 -->
			<div class="text-center p-0 mt-3">
				<span class="currentPage fw-bold px-3 py-2">맛집 리뷰</span>
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPageReply?userId=${ user.memberId }">댓글 리뷰</a></span>
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPageCommunity?userId=${ user.memberId }">동네글</a></span>
				<span class="otherPage border border-secondery border-2 text-secondery fw-bold px-3 py-2"><a href="myPageLike?userId=${ user.memberId }">찜 목록</a></span>
			</div>
<!-- 			postListHeader 끝 -->
<!-- 			postList 시작 -->
			<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">

				<c:if test="${ not empty myPagePost }">
					<c:forEach var="p" items="${ myPagePost }">
						<div class="d-flex align-items-center border text-center py-2 rounded col-12 mb-2">
							<div class="col-3 px-2">
								<img alt="postFile1" class=" img-thumbnail rounded"
									src="/yameokja/resources/IMG/post/${ p.postFile1 }">
							</div>							
							<div class="postTitle text-start col-6 px-2">
							<a href="storeDetailContent?storeNo=${ p.storeNo }&postNo=${ p.postNo }">
								<div class="fs-2 fw-bold">${ p.postTitle }</div>
								<div><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i><fmt:formatDate value="${ p.postRegDate }" pattern="yyyy-MM-dd" /></div>
								<div><i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postUpCount }</div>
								<div><i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpList }</div>
							</a>
							</div>
							<c:if test="${ sessionScope.memberId == user.memberId }">
							<div class="col-3  text-end pe-3">
								<div class="updateButton">
									<a href=""><i class="fa fa-pencil fa-2x my-3" aria-hidden="true"></i></a>
								</div>
								<div class="deleteButton" id="deleteButton">
									<a href="deleteMyPagePost?postNo=${p.postNo}"><i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></a>
								</div>
							</div>
							</c:if>
							<c:if test="${ sessionScope.memberId != user.memberId }">
								<div class="col-3 text-end pe-3">
								</div>
							</c:if>
						</div>
					</c:forEach>
<!-- 					페이지그룹 시작 -->
					<div class="row text-end">
					<div class="col-12 pe-4">
						<c:if test="${ startPage > pageGroup }">
							<div class="previousPage text-secondery d-inline-block">
								<a href="myPagePost?pageNum=${ startPage - pageGroup }&userId=${ user.memberId }"><</a>
							</div>
						</c:if>
						<div class="pageNumber text-secondery d-inline-block">
							<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
								<c:if test="${ i == currentPage }">
									<div class=" d-inline-block fw-bold" style="color: #F58500;">&nbsp;${ i }&nbsp;</div>
								</c:if>
								<c:if test="${ i != currentPage }">
									<div class=" d-inline-block">
										<a href="myPagePost?pageNum=${ i }&userId=${ user.memberId }">&nbsp;${ i }&nbsp;</a>
									</div>
								</c:if>
							</c:forEach>
						</div>						
						<c:if test="${ endPage < pageCount }">
							<div class="nextPage text-secondery d-inline-block">
								<a href="myPagePost?pageNum=${ startPage + pageGroup }&userId=${ user.memberId }">></a>
							</div>
						</c:if>
					</div>
					</div>
<!-- 					페이지그룹 끝 -->
				</c:if>
				<c:if test="${ empty myPagePost }">
					<div class="col-12 text-center"> 작성한 글이 없습니다.</div>
				</c:if>
			</div>
<!-- 			postList 끝 -->
		</div>
	</div>
	<!--전체틀 끝 -->
</article>