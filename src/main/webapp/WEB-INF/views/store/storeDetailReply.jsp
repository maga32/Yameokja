<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/js/store.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c82d8d4799a3f7c97d26b169aae75c5e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c82d8d4799a3f7c97d26b169aae75c5e"></script>		
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<article>
<div class="row py-3">

	<form name="storeDetailReply" id="storeDetailReply" action="storeDetailReply">
		<input type="hidden" name="storeNo" value="${store.storeNo }">
		<input type="hidden" id="detailCheck" value="true">
	</form>
	
	<div class="col-12 p-2">
		
			<div class="row border rounded-3 p-1 text-center d-flex justify-content-center m-0">
		<div class="row border-bottom pb-2 mb-2">
			<div class="col-4 text-start p-0">
				<div class="col-12 fs-3 fw-semibold text-secondary" id="storeName">${store.storeName }</div>
				<div class="col-12 fs-7 fw-semibold text-secondary">
					<c:if test="${ store.storeStar == 5 }">
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:if>
					<c:if test="${ store.storeStar == 4 }">
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:if>
					<c:if test="${ store.storeStar == 3 }">
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:if>
					<c:if test="${ store.storeStar == 2 }">
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:if>
					<c:if test="${ store.storeStar == 1 }">
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:if>
					<c:if test="${ store.storeStar == 0 }">
					</c:if>
					(${ store.storeStar}.0)
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
				<!-- 지도 영역 end-->	
	
			</div>
				
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
					<div class="col-8 text-secondary fs-7">
						<c:if test="${ store.categoryNo == 1 }">
						한식
						</c:if>
						<c:if test="${ store.categoryNo == 2 }">
						양식
						</c:if>
						<c:if test="${ store.categoryNo == 3 }">
						중식
						</c:if>
						<c:if test="${ store.categoryNo == 4 }">
						일식
						</c:if>
						<c:if test="${ store.categoryNo == 5 }">
						아시안
						</c:if>
						<c:if test="${ store.categoryNo == 6 }">
						술집
						</c:if>
						<c:if test="${ store.categoryNo == 7 }">
						카페, 디저트
						</c:if>
						<c:if test="${ store.categoryNo == 8 }">
						분식
						</c:if>
						<c:if test="${ store.categoryNo == 9 }">
						고기
						</c:if>
						<c:if test="${ store.categoryNo == 10 }">
						채식
						</c:if>
						<c:if test="${ store.categoryNo == 11 }">
						패스트푸드
						</c:if>
					
					</div>
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
								 onclick="location.href = 'bookmarksUpdate?memberId=${sessionScope.memberId}&storeNo=${store.storeNo }' "></button>
					</c:if>
					<c:if test = "${!result}">
						<button class="fa fa-heart-o bookmarks-off" id="btnStoreBookmarks" name="btnStoreBookmarks"
								 onclick="location.href = 'bookmarksUpdate?memberId=${sessionScope.memberId}&storeNo=${store.storeNo }' "></button>
					</c:if>
	
						<i class="fa fa-link" aria-hidden="true"></i>
						<i class="fa fa-bell" aria-hidden="true"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	store info end -->
<!-- 	storeDetailHeader start -->
	<div class="text-center col-12 mt-3">
		<span class="starListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetail?storeNo=${ store.storeNo }">맛집 리뷰</a></span>
		<span class="postListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetailReply?storeNo=${ store.storeNo }">별점 리뷰</a></span> 
	</div>
<!-- 	storeDetailHeader end -->	
									
<!-- 	postList 시작 -->
			<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">
			
			<form class="row m-0 d-flex align-items-center border text-center py-2 rounded mb-2" action="storeDetailReplyProcess"
			 id="storeDatailReply" name="storeDatailReply" method="post" enctype="multipart/form-data">
				<input type="hidden" name="storeNo" value="${ store.storeNo }">
				<input type="hidden" id="postStar" name="postStar" value="5">
				
				<div class="col-12 text-secondary text-start">
				        <div class="fs-3 fw-bold text-start m-0 p-0" id="postStarSelect" style="direction:rtl;">별점 리뷰 작성
				        <br>
					        <input type="radio" name="rating" value="5" id="rate5">
					        <label for="rate5"><i class="fa fa-star" aria-hidden="true"></i></label>
					        
					        <input type="radio" name="rating" value="4" id="rate4">
					        <label for="rate4"><i class="fa fa-star" aria-hidden="true"></i></label>
					        
					        <input type="radio" name="rating" value="3" id="rate3">
					        <label for="rate3"><i class="fa fa-star" aria-hidden="true"></i></label>
					        
					         <input type="radio" name="rating" value="2" id="rate2">
					         <label for="rate2"><i class="fa fa-star" aria-hidden="true"></i></label>
					       
					        <input type="radio" name="rating" value="1" id="rate1">
					        <label for="rate1"><i class="fa fa-star" aria-hidden="true"></i></label>
					        
				    </div>
					| <input type="file" name="postFile1" size="70" id="postFile1" maxlength="50" />
				</div>
				
				<div class="row m-0 p-0">
					<div class="col-10 border-end">
						<textarea class="form-control" name="postContent" placeholder="댓글을 입력하는 곳입니다">${ postContent }</textarea>
					</div>
					<div class="col-2 border-start d-flex">
						<button class="col-12 btn btn-outline-secondary" type="submit" name="postReplyForm" id="postReplyForm">입력</button>
					</div>
				</div>
			</form>

				<c:if test="${ not empty rList }">
					<c:forEach var="p" items="${ rList }">
						<div class="d-flex align-items-center border text-center py-2 rounded col-12 mb-2">
							<div class="col-3 px-2">
								<img src="resources/IMG/post/${ p.postFile1 }" class="img-thumbnail" style="width:100%;">
							</div>

							<div class="postTitle text-start col-6 px-2">
								<input type="hidden" name="storeNo" value="${ p.storeNo }" />
								<input type="hidden" name="postNo" value="${ p.postNo }" />
									<div class="fs-6">
										
										<span class="py-2 px-0 btn memberInfo" data-memberId="${ p.memberId }"> ${ p.memberNickname }</span><br>
										<span class="py-1"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
										<fmt:formatDate value="${ p.postRegDate }" pattern="yyyy-MM-dd" /></span>
									</div>
									<div class="fs-5 my-2">
										<c:if test="${p.postStar == 5 }">
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
										</c:if>
										<c:if test="${p.postStar == 4}">
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
										</c:if>
										<c:if test="${p.postStar == 3 }">
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
										</c:if>
										<c:if test="${p.postStar == 2 }">
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
										</c:if>
										<c:if test="${p.postStar == 1 }">
											<i class="fa fa-star text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
											<i class="fa fa-star-o text-warning" aria-hidden="true"></i>
										</c:if>
										
									</div>
									<div class="fs-5 text-secondary mt-3">
										 ${ p.postContent }
									</div>
							</div>
							
							<div class="col-3 text-end pe-3">
								<c:if test="${ p.memberId == sessionScope.memberId }">
									<div class="deleteButton" id="deleteButton">
										<a href="deleteReplyProcess?postNo=${p.postNo}">
											<i class="fa fa-trash-o fa-2x" aria-hidden="true"></i>
										</a>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
					
					<!-- 페이징 -->
		       	<div class="row text-end justify-content-center px-3 my-2">
		       		<div class="col-12">
		       			<c:if test="${ listCount > 0 }">
		       				<c:if test="${ startPage > 10 }">
		       					<div class="previousPage inlineBlock">
									<a href="storeDetailReply?storeNo=${ storeNo }&pageNum=${i}">이전</a>
								</div>
		       				</c:if>
		       				<div class="pageNumber inlineBlock">
							<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
								<c:if test="${ i == currentPage }">
									<div class=" inlineBlock" style="color: #F58500; font-weight: 600">&nbsp;${ i }&nbsp;</div>
								</c:if>
								<c:if test="${ i != currentPage }">
									<div class="inlineBlock">
										<a href="storeDetailReply?storeNo=${ storeNo }&pageNum=${i}"
										class="text-decoration-none text-secondary">&nbsp;${ i }&nbsp;</a>
									</div>
								</c:if>
							</c:forEach>
							</div>
		       					<c:if test="${ endPage < pageCount }">
									<div class="nextPage inlineBlock=">
										<a href="storeDetailReply?storeNo=${ storeNo }&pageNum=${i}">다음</a>
									</div>
							</c:if>
		       			</c:if>
		       		</div>
		       	</div>
	       		<!-- 페이징 끝 -->
	       		
	       		</c:if>
	       		<!-- 댓글 리스트 0 -->
				
				<!-- 댓글 리스트 X -->
				<c:if test="${ empty rList }">
					<div class="col-12 text-center"> 작성된 댓글이 없습니다.</div>
				</c:if>
			</div>		
<!-- 	postList 끝 -->

			</div>
</article>