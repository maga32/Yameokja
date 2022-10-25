<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<article>
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${ store.storeNo }">
	</form>
<div class="container-fluid">
			<div class="row">
				<div class="col-12 border border-4 my-1">
				
					<div class="row justify-content-center">
						<div class="row">
							<div class="col-12">
								<h4>${store.storeName }</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-12 border">
								<div class="row">
									<div class="col-3">
										<div class="row">
											<div class="col-4 border"><i class="fa fa-eye" aria-hidden="true"></i></div>
											<div class="col-8 border">${store.storeReadCount }</div>
										</div>
										<div class="row">
											<div class="col-4 border"><i class="fa fa-pencil" aria-hidden="true"></i></div>
											<div class="col-8 border">${store.storeReviewCount }</div>
										</div>
										<div class="row">
											<div class="col-4 border"><i class="fa fa-heart" aria-hidden="true"></i></div>
											<div class="col-8 border">${store.storeBookmarks }</div>
										</div>
										
									</div>
									<div class="col-3 border"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
									<div class="col-3 border"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
									<div class="col-3 border"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>
								</div>
							</div>
						</div>
						
					</div>
					
						<div class="row border border-dark">
							<div class="col-6 border border-primary">
								<div class="row">
									<div class="col-4">주소</div>
									<div class="col-8">${ store.storeAddress }</div>
								</div>
								<div class="row">
									<div class="col-4">전화번호</div>
									<div class="col-8">${ store.storePhone }</div>
								</div>
								<div class="row">
									<div class="col-4" id="foodType">음식종류</div>
									<div class="col-8">${ store.categoryNo }</div>
								</div>
								<div class="row">
									<div class="col-4">주차</div>
									<div class="col-8">${ store.storeParking }</div>
								</div>
							</div>
										
							<div class="col-6 border border-danger">
								<div class="row">
									<div class="col-4">영업시간</div>
									<div class="col-8">${ store.storeTime }</div>
								</div>
								<div class="row">
									<div class="col-4">휴무일</div>
									<div class="col-8">${ store.storeDayOff }</div>
								</div>
								<div class="row">
									<div class="col-12">가게 사정에 따라 변경 될 수 있음</div>
								</div>
							</div>
							
							
							
						</div>
						<div class="row d-flex justify-content-end border border-success mt-1">
							<div class="col-3">
								상위리뷰
							</div>
							<div class="col-3">
								포스트 리뷰
							</div>
							<div class="col-3">
								<a href="storeDetailReply?storeNo=${ store.storeNo }">별점 리뷰</a>
							</div>
							<div class="col-3">
							
							</div>
							
						</div>
						
						<div class="row justify-content-center border border-primary mt-1">
							<c:forEach var="p" items="${ pList }">
									
							
								<div class="row">
								
									<div class="col-md-3">
										<img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="...">
									</div>
									
									<div class="col-md-9">
									
										<div class="row">
											<div class="col-md-12 mb-3">
											<h4 class="fw-bold">

													<a href="storeDetailContent?storeNo=${ store.storeNo }?postNo= ${p.postNo}">
													${ p.postTitle }</a></h4>

											</div>
										</div>
										
										<div class="row">
										
											<div class="col-md-8">
												<p class="fa fa-pencil-square-o" aria-hidden="true">
													<fmt:formatDate value="${ p.postRegDate }" pattern="yyyy-MM-dd"/>
												</p><br>
												<p class="fa fa-eye" aria-hidden="true"> ${ p.postReadCount }</p><br>
												<p class="fa fa-thumbs-up" aria-hidden="true"> ${ p.postUpCount }</p>
											</div>
											
											<div class="col-md-4">
												<img src="https://picsum.photos/50" class="img-thumbnail rounded-circle" alt="...">
												${ p.memberNickname }
											</div>
											
										</div>
										
									</div>
									
								</div>
							</c:forEach>
							
						</div>
							
						
				</div>
				
			</div>
</div>
</article>