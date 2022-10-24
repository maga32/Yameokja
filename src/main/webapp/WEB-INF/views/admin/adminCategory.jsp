<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<article>
	<%@ include file="adminWing.jsp" %>
	<div>
		
	</div>
	<div class="p-2">
	
		<div class="row bg-light">
			<div class="col-4 py-2">
				카테고리명
			</div>
			<div class="col-4 py-2">
				출력순서
			</div>
			<div class="col-2 py-2">
				수정
			</div>
			<div class="col-2 py-2">
				삭제
			</div>
		</div>
		
		<div class="row">
			<c:forEach var="li" items="${ categoryList }">
				<div class="col-4 py-2">
					<a href="/yameokja/storeList?category=${ li.categoryNo }"> ${ li.categoryName }</a>
				</div>
				<div class="col-2 py-2">
					${ li.categoryOrder } &nbsp;
				</div>
				<div class="col-2 py-2">
					<c:if test="${ li.categoryNo != 1 }">
						<a href=""><i class="fa fa-angle-up" aria-hidden="true"></i></a>
					</c:if>
					<c:if test="${ li.categoryNo == 1 }">&nbsp;&nbsp;&nbsp;</c:if>
					
					<c:if test="${ li.categoryNo != fn:length(categoryList) }">
						<a href=""><i class="fa fa-angle-down" aria-hidden="true"></i></a>
					</c:if>
				</div>
				<div class="col-2 py-2">
					<a href="" class="btn"><i class="fa fa-pencil" aria-hidden="true"></i></a>
				</div>
				<div class="col-2 py-2">
					<a href="javascript:;" onclick="categoryDelete('${ li.categoryNo }', 'store')"><i class="fa fa-trash" aria-hidden="true"></i></a>
				</div>
			</c:forEach>
		</div>
		
		
		<form action="addCategory" method="post">
			<div class="row">
				<div class="col-3">
					새 카테고리 :
				</div>
				<div class="col-6">
					<input type="hidden" name="type" value="${ type }">
					<input type="text" name="categoryName" class="form-control form-control-sm">
				</div>
				<div class="col-3">
					<button class="btn btn-secondary btn-sm">확인</button>
				</div>
			</div>
		</form>
	</div>
	
</article>