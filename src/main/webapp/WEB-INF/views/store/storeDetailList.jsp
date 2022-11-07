<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<article>
<div class="row py-3">
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${ store.storeNo }">
	</form>
	
<!-- 	fullFrame start-->
	<div class="col-12 p-2">
	
<!-- 	store info start -->
	<div class="row border rounded-3 p-1 text-center d-flex justify-content-center m-0">
		<div class="row border-bottom pb-2 mb-2">
			<div class="col-4 text-start p-0">
				<div class="col-12 fs-4 fw-semibold text-secondary">${store.storeName }</div>
				<div class="col-12 fs-7 fw-semibold text-secondary">
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					(5.0)
				</div>
				<div class="col-12"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReadCount }</div>
				<div class="col-12"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReviewCount }</div>	
				<div class="col-12"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeBookmarks }</div>		
			</div>
			<div class="col-8">
			<div class="row">
				<div class="col border rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>		
			</div>
			</div>
		</div>
		<div class="row text-start">
			<div class="col-6">
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">주소</div>
					<div class="col-8 text-secondary fs-7">${ store.storeAddress }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">전화번호</div>
					<div class="col-8 text-secondary fs-7">${ store.storePhone }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">음식종류</div>
					<div class="col-8 text-secondary fs-7">${ store.categoryNo }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">주차</div>
					<div class="col-8 text-secondary fs-7">${ store.storeParking }</div>
				</div>
			</div>
			<div class="col-6 border-start ps-4">
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">영업시간</div>
					<div class="col-8 text-secondary fs-7">
						<div class="col">${ store.storeTime }</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">휴무일</div>
					<div class="col-8 text-secondary fs-7">${ store.storeDayOff }</div>
				</div>
				<div class="row">
					<div class="col-12 text-secondary fs-7">가게 사정에 따라 변경 될 수 있음</div>
					<div class="col-12 text-end m-0 p-0 d-inline">
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						<i class="fa fa-link" aria-hidden="true"></i>
						<i class="fa fa-bell" aria-hidden="true"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	store info end -->

	<div class="text-center col-12 mt-3">
		<span class="postListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetail?storeNo=${ store.storeNo }">맛집 리뷰</a></span>
		<span class="starListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetailReply?storeNo=${ store.storeNo }">별점 리뷰</a></span> 
	</div>

<!-- 	review start -->	
	<div class="rounded-end rounded-bottom d-inline-block border col-12 p-2">
	<c:if test="${ not empty pList }">
		<c:forEach var="p" items="${ pList }">
			<div class="row border rounded-1 m-1 p-1">
					<div class="col-3 align-self-center">
						<img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="...">
					</div>
					<div class="col-9">
						<div class="row py-1">
							<h4><a href="storeDetailContent?storeNo=${ store.storeNo}&postNo=${ p.postNo }">${ p.postTitle }</a></h4>
						</div>
						<div class="row pb-1">
							<a href="#">${ p.memberNickname }</a>
						</div>
						<div class="row">
							<span class=" fs-7 text-secondary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							 <fmt:formatDate value="${ p.postRegDate }" pattern="yyyy-MM-dd"/></span>
						</div>
						<div class="row">
							<span class=" fs-7 text-secondary"><i class="fa fa-eye" aria-hidden="true"></i>
							 ${ p.postReadCount }</span>
						</div>
						<div class="row">
							<span class=" fs-7 text-secondary"><i class="fa fa-thumbs-up" aria-hidden="true"></i>
							 ${ p.postUpCount }</span>
						</div>
					</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${ empty pList }">
		<div class="row rounded-1 m-1 p-1">
			<p class="text-center">아직 작성된 글이 없습니다.</p>
		</div>
	</c:if>			
	
	</div>
	<div class="row text-end">
		<div class="col-12 py-3">
			<div class="d-inline-block storeWhiteFormButton text-start"><a href="postWriteForm?storeNo=${ store.storeNo }" class="py-1 px-3">글 쓰기</a></div>
			<div class="d-inline-block storeDetailPostButton text-end"><a href="storeDetailList?storeNo=${ store.storeNo }" class="py-1 px-3">리뷰 전체보기</a></div>
			<div class="d-inline-block storeListButton text-end"><a href="#storeList?categoryNo=?&pageNum=?" class="py-1 px-3">가게 목록으로</a></div>
		</div>
	</div>
<!-- 	fullFrame end-->			
	</div>
</div>
</article>