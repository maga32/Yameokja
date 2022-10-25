<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<article>
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${store.storeNo }">
	</form>
	<div class="container-fluid">
		
			<div class="row">
			
			<div class="bg-primary col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">좌 여백
	        </div>
			
			<div class="col-lg-6 col-md-8 col-sm-10 col-12">
			
			<div class="row d-flex justify-content-center">
				<div class="col-12 bg-warning py-2">헤더</div>
				
			<div class="row">
				<div class="col-12 border border-4 p-2">
				
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
						<div class="row d-flex justify-content-end border border-success mt-1">
							<div class="col-3">
							상위리뷰
							</div>
							<div class="col-3">
							맛집리뷰
							</div>
							<div class="col-3">
							댓글리뷰
							</div>
							<div class="col-3">
							
							</div>
							
						</div>
						
						<div class="row d-flex border border-primary mt-1">
						이제 여기에 리뷰목록/댓글목록을 불러올것임	
						
						
						</div>
						
						
						
						
						
						
						
						
						
				</div>
				
			</div>
				
				
			</div>
			
			</div>
			
			
			 <div class="bg-primary col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">우 여백
	         </div>
	         
	         
	         
	         
	         
			</div>
		</div>
	
	
</article>