<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/community.js"></script>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta charset="UTF-8">
  <title>동네 게시판</title>
</head>
<body>
  <div class="row">
    
    <div class="d-none d-sm-block col-sm-1 col-lg-3">
    </div>
    
    <div class="col-12 col-sm-10 col-lg-6">
      <div class="row">
      
        <div class="col-12 bg-warning py-2">대충 헤더 들어갈곳</div>
        <div>
        	<a href="communityList?categoryNo=all">전체</a>
        	<a href="communityList?categoryNo=101">수다</a>
        	<a href="communityList?categoryNo=102">모집</a>
        </div>
        <form id="communitySearchForm" name="communitySearchForm" action="communityList?categoryNo=${ categoryNo }" method="post">
	        <div class="d-flex flex-row p-2 mt-4">
	          <select class="form-select-sm rounded-pill mx-2 px-4" aria-label=".form-select-sm" name="communitySearchType" id="communitySearchType">
	            <option ${type == "전체" ? 'selected="selected"' : '' }>전체</option>
	            <option ${type == "제목" ? 'selected="selected"' : ''}>제목</option>
	            <option ${type == "닉네임" ? 'selected="selected"' : ''}>닉네임</option>
	            <option ${type == "내용" ? 'selected="selected"' : ''}>내용</option>
	          </select>
		        </div>
		        
		        <div class="col-10 p-2">
		        <c:if test='${ keyword == "null" }'>
	          		<input class="col-12 rounded-pill" type="text" aria-label=".form-control-sm example" name="communitySearchKeyword" id="communitySearchKeyword">
	          	</c:if>
       			<c:if test='${ keyword != "null"}'>
       				<input class="col-12 rounded-pill" type="text" aria-label=".form-control-sm example" name="communitySearchKeyword" id="communitySearchKeyword" value="${ keyword }">
       			</c:if>
	        	</div>
	        	<div class="col-2 py-2">
	              <input type="submit" class="col-12 btn btn-primary rounded-pill" name="communitySearch" id="communitySearch">
	       		 </div>  
	        </form>
			</div>
			
			
			
<!-- 동네글 시작지점 / 분류 전체 -->
	${categoryNo }
		<c:if test="${ categoryNo == 'all' }">
			<c:forEach var="p" items="${coList}">	
	        	<div class=" border border-2 rounded col-12 p-2 col-md-12">
	        	<div class="row">
	        	
	        		<c:if test="${ empty p.communityFile }"></c:if>
	        		<c:if test="${ not empty p.communityFile }">
	        		<div class="col-3 col-md-3 col-sm-3">
	        		<img src="upload/community/${ p.communityFile }" class="img-thumbnail rounded float-start" alt="...">
	        		</div>
	        		</c:if>
	        			<div class="col-6 col-md-7 col-sm-6">
	        			<h4 class="text-muted font-weight-bold"tabindex="0"><a href="communityDetail?communityNo=${ p.communityNo }">
		        		<c:if test="${ p.categoryNo == 101 }">
		        			[수다]
		        		</c:if>
		        		<c:if test="${ p.categoryNo == 202 }">
		        			[모집]
		        		</c:if>
		        		${ p.communityTitle }</a></h4>
	        			<p class="text-secondary" id="communityMemberNickname">${ p.memberId }</p>
	        			<p class="text-secondary" id="communityRegDate">${ p.communityRegDate }</p>
	        		</div>
	        	<div class="col-3 col-md-2 col-sm-3 border-start border-1">
	        		<div class="row">
			        	<div class="col-4 d-flex-column">
			        			<p style="color:gray"><i class="fa fa-eye" aria-hidden="true"></i></p>
			        	</div>
			        	<div class="col-8 d-flex-column">
			        			<p class="text-end"  style="font-size:11px; color:gray">${ p.communityReadCount }</p>
			        	</div>
			        	</div>
	        	</div>
	        	</div>
	        </div>
	        </c:forEach>
	       </c:if>          
<!-- 동네글 종료지점 / 분류 전체 -->


<!-- 동네글 시작지점 / 분류 수다글 -->
		<c:if test="${ categoryNo == '101' }">
			<c:forEach var="p" items="${coList}">
				<c:if test="${ p.categoryNo == '101' }">	
	        	<div class=" border border-2 rounded col-12 p-2 col-md-12">
	        	<div class="row">
	        	
	        		<c:if test="${ empty p.communityFile }"></c:if>
	        		<c:if test="${ not empty p.communityFile }">
	        		<div class="col-3 col-md-3 col-sm-3">
	        		<img src="upload/community/${ p.communityFile }" class="img-thumbnail rounded float-start" alt="...">
	        		</div>
	        		</c:if>
	        			<div class="col-6 col-md-7 col-sm-6">
	        			<h4 class="text-muted font-weight-bold"tabindex="0"><a href="communityDetail?communityNo=${ p.communityNo }">
		        		<c:if test="${ p.categoryNo == 101 }">
		        			[수다]
		        		</c:if>
		        		<c:if test="${ p.categoryNo == 102 }">
		        			[모집]
		        		</c:if>
		        		${ p.communityTitle }</a></h4>
	        			<p class="text-secondary" id="communityMemberNickname">${ p.memberId }</p>
	        			<p class="text-secondary" id="communityRegDate">${ p.communityRegDate }</p>
	        		</div>
	        	<div class="col-3 col-md-2 col-sm-3 border-start border-1">
	        		<div class="row">
			        	<div class="col-4 d-flex-column">
			        			<p style="color:gray"><i class="fa fa-eye" aria-hidden="true"></i></p>
			        	</div>
			        	<div class="col-8 d-flex-column">
			        			<p class="text-end"  style="font-size:11px; color:gray">${ p.communityReadCount }</p>
			        	</div>
			        	</div>
	        	</div>
	        	</div>
	        </div>
	        </c:if>
	        </c:forEach>
	       </c:if>          
<!-- 동네글 종료지점 / 분류 수다글 -->


<!-- 동네글 시작지점 / 분류 모집글 -->
		<c:if test="${ categoryNo == '102' }">
			<c:forEach var="p" items="${coList}">
				<c:if test="${ p.categoryNo == '102' }">	
	        	<div class=" border border-2 rounded col-12 p-2 col-md-12">
	        	<div class="row">
	        	
	        		<c:if test="${ empty p.communityFile }"></c:if>
	        		<c:if test="${ not empty p.communityFile }">
	        		<div class="col-3 col-md-3 col-sm-3">
	        		<img src="upload/community/${ p.communityFile }" class="img-thumbnail rounded float-start" alt="...">
	        		</div>
	        		</c:if>
	        			<div class="col-6 col-md-7 col-sm-6">
	        			<h4 class="text-muted font-weight-bold"tabindex="0"><a href="communityDetail?communityNo=${ p.communityNo }">
		        		<c:if test="${ p.categoryNo == 101 }">
		        			[수다]
		        		</c:if>
		        		<c:if test="${ p.categoryNo == 102 }">
		        			[모집]
		        		</c:if>
		        		${ p.communityTitle }</a></h4>
	        			<p class="text-secondary" id="communityMemberNickname">${ p.memberId }</p>
	        			<p class="text-secondary" id="communityRegDate"><fmt:formatDate value="${p.communityRegDate}"
                    		pattern="YYYY-MM-dd  HH:MM" /></p>
	        			
	        		</div>
	        	<div class="col-3 col-md-2 col-sm-3 border-start border-1">
	        		<div class="row">
			        	<div class="col-4 d-flex-column">
			        			<p style="color:gray"><i class="fa fa-eye" aria-hidden="true"></i></p>
			        	</div>
			        	<div class="col-8 d-flex-column">
			        			<p class="text-end"  style="font-size:11px; color:gray">${ p.communityReadCount }</p>
			        	</div>
			        	</div>
	        	</div>
	        	</div>
	        </div>
	        </c:if>
	        </c:forEach>
	       </c:if>          
<!-- 동네글 종료지점 / 분류 모집글 -->
	        	
<!-- 동네글 검색결과 empty -->
		<c:if test="${ empty coList}">
			<div class=" border border-2 rounded col-12 p-2 col-md-12">
				등록된 게시글이 없습니다.
			</div>
	     </c:if>
<!-- 동네글 검색결과 empty -->

  	<div>
		<input type="button" onClick="location.href='community101WriteForm'" value="수다글 쓰기">
		<input type="button" onClick="location.href='community102WriteForm'" value="모집글 쓰기">
	</div>

<!-- 페이징 시작지점 -->
	<div>
		<c:if test="${listCount > 0 }">
			<div class="col-12">
			<c:if test="${ startPage > '10' }">
				<div class="col-1 col-sm-1 col-lg-1">
					<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage - pageGroup}&type=${type}&keyword=${keyword}">이전</a>
				</div>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					<div class="col-1 col-sm-1 col-lg-1">${ i }</div>
				</c:if>
				<c:if test="${ i != currentPage }">
					<div class="col-1 col-sm-1 col-lg-1">
						<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">${ i }</a>
					</div>
				</c:if>
			</c:forEach>
			<c:if test="${ endPage < pageCount }">
				<div class="col-1 col-sm-1 col-lg-1">
					<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage + pageGroup}&type=${type}&keyword=${keyword}">다음</a>
				</div>
			</c:if>
			</div>
		</c:if>
	</div>
<!-- 페이징 종료지점 -->



	        <div class="col-12 bg-primary">가게 리스트 들어갈 곳</div>
	        </div>
        </div>

    <div class="d-none d-sm-block col-sm-1 col-lg-3">
    </div>
    
</body>
</html>