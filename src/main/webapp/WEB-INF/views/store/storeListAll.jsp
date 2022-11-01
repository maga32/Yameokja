<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<article>
	<form name="storeListForm" id="storeListForm">
		<input type="hidden" name="categoryNo" value="${ store.categoryNo }">
	</form>
	<div class="row">
    
    <div class="col-12 col-sm-10 col-lg-12">
      <div class="row">
        
        <div class="d-flex flex-row p-2 mt-4">
          <select class="form-select-sm rounded-pill mx-2 px-4" aria-label=".form-select-sm">
            <option selected>서울시</option>
            <option value="1">경기도</option>
          </select>
          <select class="form-select-sm rounded-pill mx-2 px-4" aria-label=".form-select-sm">
            <option selected>관악구</option>
            <option value="1">동작구</option>
          </select>
  		<a href="storeWriteForm">글쓰기</a>
	        </div>
	        
	        <div class="col-10 p-2">
          		<input class="col-12 rounded-pill" type="text" aria-label=".form-control-sm example">
        	</div>
        	<div class="col-2 p-2">
          		<button class="col-12 btn btn-sm btn-outline-warning rounded-pill">
              		<i class="fa fa-search" aria-hidden="true"></i>
          		</button>
       		 </div>  
	        
			<div class="row py-2">
				<div class="col-3">
					<button class="d-block col-12 btn btn-sm btn-outline-warning rounded-pill px-2"><a href="#">별점순</a></button>
				</div>
				<div class="col-3">
					<button class="col-12 btn btn-sm btn-outline-warning rounded-pill px-2"><a href="#">조회수순</a></button>
				</div>
				<div class="col-3">
					<button class="col-12 btn btn-sm btn-outline-warning rounded-pill px-2"><a href="#">리뷰순</a></button>
				</div>
				<div class="col-3">
					<button class="d-block col-12 btn btn-sm btn-outline-warning rounded-pill px-2"><a href="#">즐겨찾기순</a></button>
				</div>
			</div>
			
			</div>
			
	        <c:forEach var="s" items="${ sList }">
	        <div class=" border border-2 rounded col-12 p-2 col-md-12 my-1">
	        	<div class="row mb-2">
	        	<div class="col-3 col-md-3 col-sm-3">
	        		<img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="...">
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
	        
	       		</div>
	        </div>
	        
</article>