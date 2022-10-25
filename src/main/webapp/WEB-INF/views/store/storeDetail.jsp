<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<article>
<div class="row p-3">
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${store.storeNo }">
	</form>
<!-- 	fullFrame start-->
	<div class="col-12 p-2">
<!-- 	store info start -->
	<div class="row border border-secondary rounded-3 p-1 text-center d-flex justify-content-center m-0">
		<div class="row border-bottom border-secondary pb-2 mb-2">
			<div class="col-4 text-start">
				<div class="col-12 fs-7 fw-semibold text-secondary">${store.storeName }</div>
				<div class="col-12 fs-7 fw-semibold text-secondary">
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					(4.0)
				</div>
				<div class="col-12"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReadCount }</div>
				<div class="col-12"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReviewCount }</div>	
				<div class="col-12"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeBookmarks }</div>		
			</div>
			<div class="col-8">
			<div class="row">
				<div class="col border border-primary rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border border-primary rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border border-primary rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>		
			</div>
			</div>
		</div>
		<div class="row text-start">
			<div class="col-6">
				<div class="row">
					<div class="col-4 text-secondary fs-7">주소</div>
					<div class="col-8 text-secondary fs-7">${ store.storeAddress }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7">전화번호</div>
					<div class="col-8 text-secondary fs-7">${ store.storePhone }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7">음식종류</div>
					<div class="col-8 text-secondary fs-7">${ store.categoryNo }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7">주차</div>
					<div class="col-8 text-secondary fs-7">${ store.storeParking }</div>
				</div>
			</div>
			<div class="col-6 border-start border-secondary ps-4">
				<div class="row">
					<div class="col-4 text-secondary fs-7">영업시간</div>
					<div class="col-8 text-secondary fs-7">
						<div class="row">${ store.storeTime }</div>
						<div class="row">${ store.storeTime }</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7">휴무일</div>
					<div class="col-8 text-secondary fs-7">${ store.storeDayOff }</div>
				</div>
				<div class="row">
					<div class="col-12 text-secondary fs-7">가게 사정에 따라 변경 될 수 있음</div>
				</div>
				<div class="row text-end d-inline-block">
					<i class="fa fa-heart-o text-end d-inline" aria-hidden="true"></i>
					<i class="fa fa-link text-end d-inline" aria-hidden="true"></i>
					<i class="fa fa-bell text-end d-inline" aria-hidden="true"></i>
				</div>
			</div>
		</div>
	</div>
<!-- 	store info end -->
	<div class="text-center col-12 mt-3">
		<span class="postListbutton d-table-cell fs-6 fw-bold px-3 py-2">맛집 리뷰</span>
		<span class="starListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="#">별점 리뷰</a></span> 
	</div>
	<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">
		<div class="border text-start p-2 rounded col-12 mb-2">
			<div class="col-12 fw-bold fs-5 text-secondary">가게 이름</div>
			<div class="col-12 fw-bold fs-3 text-secondary">리뷰제목은 한 줄로 보여주게 됩니다.</div>
			<div class="row">
				<div class="col-6">김핑구 짱짱맨</div>
				<div class="col-6">12,456,78</div>
			</div>
			<div class="row border-top border-secondary m-1">
				<div class="col-5">
					<img src="resources/IMG/LOGOtemporaryIMG.PNG" class="img-thumbnail rounded float-start" alt="...">
					리뷰 관련 사진
				</div>
				<div class="col-7">장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.</div>
			</div>
			<div class="col-12 text-end">
				<input type="button" class="updateButton text-secondary bg-white" value="수정">
				<input type="button" class="deleteButton text-secondary border-start border-3 bg-white" value="삭제">
			</div>
		</div>
		
		
		<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">

<%-- 				<c:if test="${ not empty postList }"> --%>
<%-- 					<c:forEach var="p" items="${ postList }"> --%>

						<div class="postFrame border text-center py-2 rounded col-12 mb-2">
							<div class="col-3 mx-2">
								<img src="resources/IMG/LOGOtemporaryIMG.PNG"
										class="img-thumbnail rounded" alt="...">
							</div>
							<div class="col-6 postContent text-start mx-2">
								<div class="postTitle">
									<a href="#">${ p.postTitle }postTitle</a>
								</div>
								<div class="" id="postNo">
									<a href="#">postNo=${ p.postNo }</a>
								</div>
								<div class="">
									<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
									${ p.postRegDate }postRegDate
								</div>
								<div class="">
									<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postUpCount }postUpCount
								</div>
								<div class="">
									<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpList }postUpList
								</div>
							</div>
							<div class="upAndDel col-3">
								<div class="updateButton">
									프사
								</div>
								<div class="deleteButton" id="deleteButton">
									김짱구짱짱맨
								</div>
							</div>
						</div>
						<div class="row text-end">
							<div class="col-12 py-3">
								<div class="d-inline-block storeWhiteFormButton text-start"><a href="community101WriteForm" class="py-1 px-3">글 쓰기</a></div>
								<div class="d-inline-block storeDetailPostButton text-end"><a href="community102WriteForm" class="py-1 px-3">리뷰 전체보기</a></div>
								<div class="d-inline-block storeListButton text-end"><a href="community102WriteForm" class="py-1 px-3">가게 목록으로</a></div>
							</div>
						</div>

<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${ empty postList }"> --%>
<!-- 					<div class="col-12 text-center"> 작성한 글이 없습니다.</div> -->
<%-- 				</c:if> --%>
			</div>
	</div>









				

<!-- 				<div class="row d-flex border border-primary mt-1">이제 여기에 -->
<!-- 					리뷰목록/댓글목록을 불러올것임</div> -->
<!-- 	</div> -->
<!-- 	fullFrame end-->			
	</div>
</article>