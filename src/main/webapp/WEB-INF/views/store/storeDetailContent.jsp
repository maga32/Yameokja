<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/yameokja/resources/js/post.js"></script>
<script src="resources/js/store.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<article>

	<div class="row py-3">
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${ store.storeNo }">
		<input type="hidden" name="postNo" value="${post.postNo }">
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
				<div class="col border rounded-3 p-1 m-1"><img src="/yameokja/resources/IMG/store/${ store.storeFileMain }" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1"><img src="/yameokja/resources/IMG/store/${ store.storeFileMenu }" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1">
					
					<!-- 지도 영역 -->
					<div id="map" style="height:100%;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2"></script>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(35.8189345, 128.516267),
								level: 2
							};
					
							var map = new kakao.maps.Map(container, options);
							
							var marker = new kakao.maps.Marker({
							    position: new kakao.maps.LatLng(35.8189345, 128.516267), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});
							
							var items = ${store.storeName}

							// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
							kakao.maps.event.addListener(marker, 'click', function() {
								window.open('https://map.kakao.com/link/search/스테이블모먼트')
							});
						</script>
				<!-- 지도 영역 end-->

				</div>		
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
		<span class="postListbutton d-table-cell fs-6 fw-bold px-3 py-2">맛집 리뷰</span>
		<span class="starListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetailReply?storeNo=${ store.storeNo }">별점 리뷰</a></span> 
	</div>

<!-- 	review start -->	
	<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">
	
		<div class="row text-start">
			<h4 class="fw-bold text-secondary">${post.postTitle}</h4>
		</div>
		<div class="row justify-content-center">
		
			<div class="col-6 border-bottom justify-content-center">
				<div class="row border-end ps-1">
					<div class="col-3 align-self-center">
					<img src="resources/IMG/member/${ memberPhoto }" class="img-thumbnail rounded-circle float-start" alt="..."></div>
					<div class="col-9 text-start text-secondary">
						<p class="fs-6">
							<a class="btn memberInfo" data-memberId="${ post.memberId }"> ${ post.memberNickname } </a>
						</p>
						<p class="fs-7">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							<fmt:formatDate value="${ post.postRegDate }" pattern="yyyy-MM-dd"/></p>
					</div>
				</div>
				
			</div>
			<div class="col-6 border-bottom justify-content-center">
				<div class="row border-start text-start text-secondary">
					<p><i class="fa fa-eye" aria-hidden="true"></i> ${ post.postReadCount }</p>
					<p><i class="fa fa-thumbs-up" aria-hidden="true"></i> ${ post.postUpCount }</p>
				</div>
			</div>
			
			<div class="row border-top py-4 m-1">
				<div id="storeDetailContentContent">
					${ post.postContent }
				</div>
			</div>
			<c:if test="${ sessionScope.memberId eq post.memberId }">
				<div class="col-12 text-end">
					<a href="postUpdateForm?postNo=${ post.postNo }" class="text-secondary bg-white pe-1">수정</a>
					<a href="javascript:;" class="text-secondary border-start border-3 ps-2" onclick="deletePost('${ post.postNo }')">삭제</a>
				</div>
			</c:if>
			
		</div>
		
	</div>
	<div class="row text-end">
		<div class="col-12 py-3">
			<div class="d-inline-block storeWhiteFormButton text-start"><a href="postWriteForm?storeNo=${ store.storeNo }" class="py-1 px-3">글 쓰기</a></div>
			<div class="d-inline-block storeDetailPostButton text-end"><a href="storeDetailList?storeNo=${ store.storeNo }" class="py-1 px-3">리뷰 전체보기</a></div>
			<div class="d-inline-block storeListButton text-end"><a href="#storeList?categoryNo=?&pageNum=?" class="py-1 px-3">가게 목록으로</a></div>
		</div>
	</div>
<!-- 	review end -->

<!-- 	fullFrame end-->			
	</div>
</div>
</article>