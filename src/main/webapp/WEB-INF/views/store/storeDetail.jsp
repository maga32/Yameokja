<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<script src="resources/js/store.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2"></script>	
<article>

<div class="row py-3">
		<!-- 히든 영역 -->
		<input type="hidden" id="detailCheck" value="true">
		<input type="hidden" id="memberId" value="${sessionScope.memberId}">
		<input type="hidden" id="storeNo" name="storeNo" value="${ store.storeNo }">
		<input type="hidden" id="categoryNo" value="${ store.categoryNo }">
		<!-- 히든 영역 end-->
		
<!-- 	fullFrame start-->
	<div class="col-12 p-2">
	
<!-- 	store info start -->
	<div class="row border rounded-3 p-1 text-center d-flex justify-content-center m-0">
		<div class="row border-bottom pb-2 mb-2">
			<div class="col-4 text-start p-0">
				<div class="col-12 fs-4 fw-semibold text-secondary" id="storeName">${store.storeName }</div>
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

				<input type="hidden" id="storeLatitude" value="${store.storeLatitude }">
				<input type="hidden" id="storeLongitude" value="${store.storeLongitude }">
							
				<!-- 지도 영역 -->
					<div class="col border rounded-3 p-1 m-1">
						<div id="map" style="height:100%;"></div>
					</div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2&libraries=services,clusterer,drawing"></script>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2"></script>	
				<!-- 지도 영역 end-->	

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
					
					<c:if test = "${result}">
						<button class="fa fa-heart bookmarks-on text-danger" id="btnStoreBookmarks" name="btnStoreBookmarks"
								 onclick="location.href = 'http://localhost:8080/yameokja/bookmarksUpdate?memberId=${sessionScope.memberId}&storeNo=${store.storeNo }' "></button>
					</c:if>
					<c:if test = "${!result}">
						<button class="fa fa-heart-o bookmarks-off" id="btnStoreBookmarks" name="btnStoreBookmarks"
								 onclick="location.href = 'http://localhost:8080/yameokja/bookmarksUpdate?memberId=${sessionScope.memberId}&storeNo=${store.storeNo }' "></button>
					</c:if>
					
						<i class="fa fa-link" aria-hidden="true" onclick="clip(); return false;"></i>
						<i class="fa fa-bell" aria-hidden="true" onclick='window.open("reportForm?categoryNo=${store.categoryNo}&reportTarget=${store.memberId}","reportForm","width=500, height=600")'></i>
					<div>
						<c:if test="${sessionScope.member.memberLevel >= 7 }">
							<a href="storeUpdateForm?storeNo=${store.storeNo}" class="fs-7">관리자만 보이는 가게수정</a>
						</c:if>	
					</div>
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
	<c:if test="${ not empty bestOnePost }">
		<div class="border text-start p-2 rounded col-12 mb-2">
			<div class="col-12 fw-bold fs-5 text-secondary">${ store.storeName }</div>
			<div class="col-12 fw-bold fs-3 text-secondary"><a href="storeDetailContent?storeNo=${ store.storeNo}&postNo=${ bestOnePost.postNo }">[BEST] ${ bestOnePost.postTitle }</a></div>
			<div class="row my-2 mx-0 justify-content-center">
				<div class="col-2 p-0 m-0">
					<img src="/yameokja/resources/IMG/member/${ bestMemberPhoto }" class="img-thumbnail rounded-circle text-center profileIMG" alt="...">
				</div>
				<div class="col-5 p-2 m-0">
					<div class="col">${ bestOnePost.memberNickname }</div>
					<div class="col">${ bestOnePost.postRegDate }</div>
				</div>
				<div class="col-5 p-0 m-0">
					<div class="col"><i class="fa fa-thumbs-up" aria-hidden="true"></i>&nbsp;&nbsp;${ bestOnePost.postUpCount }</div>
					<div class="col"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${ bestOnePost.postReadCount }</div>
				</div>
			</div>
			<div class="row border-top py-4 m-1">
				<div class="col-5">
					<img src="/yameokja/resources/IMG/post/${ bestOnePost.postFile1 }" class="img-thumbnail rounded float-start" alt="...">
				</div>
				<div id="storeDetailBestOneContent" class="col-7">${ bestOnePost.postContent }</div>
			</div>
			<div class="col-12 text-end">
				<input type="button" class="updateButton text-secondary bg-white" value="수정">
				<input type="button" class="deleteButton text-secondary border-start border-3 bg-white" value="삭제">
			</div>
		</div>
	</c:if>
	<c:if test="${ empty bestOnePost }">
		<div class="col-12 text-center">아직 작성된 글이 없습니다.</div>
	</c:if>
	<c:if test="${ empty bestTwoPost or empty bestThreePost }">
		<div class="col-12 text-center"></div>
	</c:if>
		
<!-- 	best2 -->
	<c:if test="${ not empty bestOnePost and not empty bestTwoPost }">
	<c:forEach var="p" items="${ bestTwoPost }">
			<div class="postFrame border text-center py-2 rounded col-12 mb-2">
				<div class="col-3 mx-2">
						<a href="#"><img src="/yameokja/resources/IMG/post/${ p.postFile1 }" class="img-thumbnail rounded float-start" alt="...">
					</a>
				</div>
				<div class="col-9 postContent text-start mx-2">
					<div class="fs-3 fw-bold">
						<a href="storeDetailContent?storeNo=${ store.storeNo}&postNo=${ p.postNo }">${ p.postTitle }</a>
					</div>
					<div class="">
						<a href="#">${ p.memberNickname }</a>
					</div>
					<div class="">
						<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
						${ p.postRegDate }
					</div>
					<div class="">
						<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postReadCount }
					</div>
					<div class="">
						<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpCount }
					</div>
				</div>
			</div>
	</c:forEach>
	</c:if>

	<c:if test="${ not empty bestOnePost and not empty bestTwoPost and not empty bestThreePost}">
	<c:forEach var="p" items="${ bestThreePost }">
			<div class="postFrame border text-center py-2 rounded col-12 mb-2">
				<div class="col-3 mx-2">
					<a href="#"><img src="/yameokja/resources/IMG/post/${ p.postFile1 }" class="img-thumbnail rounded float-start" alt="...">
					</a>
				</div>
				<div class="col-9 postContent text-start mx-2">
					<div class="fs-3 fw-bold">
						<a href="storeDetailContent?storeNo=${ store.storeNo}&postNo=${ p.postNo }">${ p.postTitle }</a>
					</div>
					<div class="">
						<a href="#">${ p.memberNickname }</a>
					</div>
					<div class="">
						<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
						${ p.postRegDate }
					</div>
					<div class="">
						<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postReadCount }
					</div>
					<div class="">
						<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpCount }
					</div>
				</div>
			</div>
	</c:forEach>
	</c:if>					
	
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