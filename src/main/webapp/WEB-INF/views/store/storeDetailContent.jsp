<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<article>
	<form name="storeDetailContentForm" id="storeDetailContentForm">
		<input type="hidden" name="storeNo" value="${ store.storeNo }">
		<input type="hidden" name="postNo" value="${post.postNo }">
	</form>
	<div class="container-fluid">
		
			<div class="row">
			
			
			<div class="col-lg-12 col-md-8 col-sm-10 col-12">
			
			<div class="row d-flex justify-content-center">
				<div class="col-12 bg-warning py-2">헤더</div>
				
			<div class="row">
				<div class="col-12 border border-4">
				
					<div class="row">
						<div class="row">
							<div class="col-12 border">
								<h4>${store.storeName }</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-12 border">
								<div class="row">
									<div class="col-3 mt-5">
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
									<div class="col-4">음식종류</div>
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
									<div class="col-8">
										<div class="row">${ store.storeTime }</div>
									</div>
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
						<div class="row d-flexjustify-content-center border border-success mt-1">
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
								<div class="row">
									<h6>${ store.storeName }</h6>
									<h4>${ post.postTitle }</h4>
								</div>
								<div class="row justify-content-center">
									<div class="col-6 border-end my-1">
										<div class="col-3">
											<img src="https://picsum.photos/50" class="img-fluid rounded-circle float-start" alt="...">
										</div>
										<div class="col-9">
											<p>${ post.memberNickname }</p>
											<p><fmt:formatDate value="${ post.postRegDate }" pattern="yyyy-MM-dd"/></p>
										</div>
									</div>
									
									<div class="col-6">
											<p>${ post.postUpCount }</p>
											<p>${ post.postReadCount }</p>
									</div>
									
									<div class="row border-top">
										<p>
											${post.postContent }
										</p>
									
									</div>
								
								</div>
								
							</div>
	
						<div class="row justify-content-center">
						
							<div class="col-2">
								수정하기
							</div>
							<div class="col-2">
								<a href="storeDetail?storeNo=${ store.storeNo }">목록으로</a>
							</div>
							<div class="col-2">
							
							</div>
							<div class="col-2">
								
							</div>
							<div class="col-2">
								
							</div>
							<div class="col-2">
								삭제
							</div>
						
						</div>
				</div>
				
			</div>
				
				
			</div>
			
			</div>
 
	         
			</div>
		</div>
	
	
</article>