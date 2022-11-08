<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="resources/js/member.js"></script>
<script src="resources/js/store.js"></script>
<article>
		
	<form name="storeSearchForm" id="storeSearchForm" action="storeList">
				<input type="hidden" name="categoryNo" value="${ categoryNo }">
    
        <div class="row my-2 p-0">
				<select class="row col-3 form-select-sm rounded-pill text-center border border-2 text-secondary bg-white p-1 m-1" 
				name="type1" id="type1" onchange="addressChange(this)">
						<option>선택</option>
						<option>서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>울산</option>
						<option>광주</option>
						<option>강원</option>
						<option>세종</option>
						<option>충북</option>
						<option>충남</option>
						<option>경북</option>
						<option>경남</option>
						<option>전북</option>
						<option>전남</option>
						<option>제주</option>
				</select>
				<select class="col-3 form-select-sm rounded-pill text-center border border-2 text-secondary bg-white p-1 m-1" 
				name="type2" id="type2">
					<option>선택</option>
				</select>
				
				<div class="col-5 align-self-center text-end">
					<a href="storeWriteForm" class="py-1" name="storeWriteForm" id="storeWriteForm">새로운 가게 등록</a>
				</div>
			</div>
			
	        <div class="row m-0 p-0">
				<div class="col-10 p-0">
					<input class="col-12 form-select-sm rounded-pill border border-2 text-secondary bg-white p-1 m-1" 
						type="text" name="keyword" id="keyword" placeholder="가게명을 입력하세요">
				</div>
				
				<div class="col-2 py-1">
					<button class="col-12 btn btn-sm btn-outline-warning col-12 rounded-pill border border-2 border-warning p-1"
						name="storeSearchKeyword" id="storeSearchKeyword">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
			
	        <div>
				<div class="row py-2">
					<div class="col-3">
						<button class="d-block col-12 btn btn-sm btn-outline-warning rounded-pill px-2" name="orderBy" value="sNo">기본순</button>
					</div>
					<div class="col-3">
						<button class="col-12 btn btn-sm btn-outline-warning rounded-pill px-2" name="orderBy" value="sName">이름순</button>
					</div>
					<div class="col-3">
						<button class="col-12 btn btn-sm btn-outline-warning rounded-pill px-2" name="orderBy" value="sReviewCount">리뷰순</button>
					</div>
					<div class="col-3">
						<button class="d-block col-12 btn btn-sm btn-outline-warning rounded-pill px-2" name="orderBy" value="sBookmarks">즐겨찾기순</button>
					</div>
				</div>
			</div>
			
			<!-- 리스트 출력 -->
	        <c:forEach var="s" items="${ sList }">
	        <div class=" border border-2 rounded col-12 p-2 col-md-12 my-1">
	        	<div class="row mb-2">
	        	<div class="col-3 col-md-3 col-sm-3">
	        		<img src="/yameokja/resources/IMG/store/${ s.storeFileMain }" style="width:200; height:200;" class="img-thumbnail rounded float-start">
	        	</div>
	        		<div class="col-6 col-md-7 col-sm-6">
		        		<h4><a href="storeDetail?storeNo=${ s.storeNo }" class="text-muted font-weight-bold text-decoration-none" role="button" tabindex="0">
		        			${ s.storeName }</a></h4>
	        			<p class="text-secondary">${ s.storeAddress }</p>
	        			<p class="text-secondary">${ s.storeStar }</p>
	        		</div>
	        	<div class="col-3 col-md-2 col-sm-3 border-start border-1">
	        		<div class="row">
			        	<div class="col-4 d-flex-column">
			        			<p style="font-size:11px; color:gray"><i class="fa fa-eye" aria-hidden="true"></i></p>
			        			<p style="font-size:11px; color:pink"><i class="fa fa-heart" aria-hidden="true"></i></p>
			        			<p style="font-size:11px; color:gray"><i class="fa fa-pencil" aria-hidden="true"></i></p>
			        	</div>
			        	<div class="col-8 d-flex-column">
			        			<p class="text-end"  style="font-size:11px; color:gray">${ s.storeReadCount }</p>
			        			<p class="text-end"  style="font-size:11px; color:gray">${ s.storeBookmarks }</p>
			        			<p class="text-end"  style="font-size:11px; color:gray">${ s.storeReviewCount }</p>
			        	</div>
			        </div>
	        	</div>
	        	</div>
	        </div>
	       	</c:forEach>
	       	<!-- 리스트 끝 -->
	       	
	       	<!-- 페이징 -->
	       	<div class="row text-end justify-content-center px-3 my-2">
	       		<div class="col-12">
	       			<c:if test="${ listCount > 0 }">
	       				<c:if test="${ startPage > 10 }">
	       					<div class="previousPage inlineBlock">
								<a href="storeList?categoryNo=${ categoryNo }&pageNum=${startPage - pageGroup}&type=${type}&keyword=${keyword}">이전</a>
							</div>
	       				</c:if>
	       				<div class="pageNumber inlineBlock">
						<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							<c:if test="${ i == currentPage }">
								<div class=" inlineBlock" style="color: #F58500; font-weight: 600">&nbsp;${ i }&nbsp;</div>
							</c:if>
							<c:if test="${ i != currentPage }">
								<div class="inlineBlock">
									<a href="storeList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}"
									class="text-decoration-none text-secondary">&nbsp;${ i }&nbsp;</a>
								</div>
							</c:if>
						</c:forEach>
						</div>
	       					<c:if test="${ endPage < pageCount }">
								<div class="nextPage inlineBlock=">
									<a href="storeList?categoryNo=${ categoryNo }&pageNum=${startPage + pageGroup}&type=${type}&keyword=${keyword}">다음</a>
								</div>
						</c:if>
	       			</c:if>
	       		</div>
	       	</div>
	       	<!-- 페이징 끝 -->
	       	
	</form>
</article>
