<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<article class="p-sm-2 px-4">
	<%@ include file="adminWing.jsp" %>
	<div class="btn-group btn-group-sm py-2">
		<a href="adminCategory?type=store" class="btn btn${ type eq 'store' ? '' : '-outline'}-secondary" aria-current="page">스토어</a>
		<a href="adminCategory?type=community" class="btn btn${ type eq 'community' ? '' : '-outline'}-secondary">커뮤니티</a>
		<a href="adminCategory?type=report" class="btn btn${ type eq 'report' ? '' : '-outline'}-secondary">신고</a>
	</div>
	
	<div class="px-2 pb-2">
		<div class="row bg-light">
			<div class="col-4 py-2">
				카테고리명
			</div>
			<div class="col-2 py-2 text-center">
				출력순서
			</div>
			<div class="col-4 py-2 text-center">
				수정
			</div>
			<div class="col-2 py-2 text-center">
				삭제
			</div>
		</div>
		
		<div class="row">
			<c:forEach var="li" items="${ categoryList }">
				<!-- 카테고리명 -->
				<div class="col-4 py-2">
					<a href="/yameokja/${ type }List?categoryNo=${ li.categoryNo }" id="categoryName_${ li.categoryNo }"> ${ li.categoryName }</a>
					<div id="updateName_${ li.categoryNo }" style="display:none;">
						<input class="form-control" type="text" value="${ li.categoryName }" id="updateCategoryName_${ li.categoryNo }">
					</div>
				</div>
				<!-- 출력순서 -->
				<div class="col-2 py-2 text-center">
					<div id="categoryOrder_${ li.categoryNo }">${ li.categoryOrder }</div>
					<div id="updateOrder_${ li.categoryNo }" style="display:none;">
						<input class="form-control" type="text" value="${ li.categoryOrder }" id="updateCategoryOrder_${ li.categoryNo }">
					</div>
				</div>
				<!-- 카테고리 수정 -->
				<div class="col-4 py-2 text-center">
					<!-- 수정버튼 -->
					<div id="categoryUpdatePrepare_${ li.categoryNo }">
						<a href="javascript:;" class="btn" onclick="categoryUpdatePrepare('${ li.categoryNo }')">
							<i class="fa fa-pencil" aria-hidden="true"></i>
						</a>
					</div>
					<!-- 완료/취소 -->
					<div id="categoryUpdateCancel_${ li.categoryNo }" style="display:none;">
						<div class="btn-group">
							<a href="javascript:;" class="btn btn-outline-secondary" onclick="updateCategoryName('${ li.categoryNo }','${ type }')">완료</a>
							<a href="javascript:;" class="btn btn-secondary" onclick="categoryUpdateCancel('${ li.categoryNo }')">
								취소
							</a>
						</div>
					</div>
				</div>
				<!-- 카테고리 삭제 -->
				<div class="col-2 py-2 text-center">
					<a href="javascript:;" onclick="categoryDelete('${ li.categoryNo }', '${ type }')"><i class="fa fa-trash" aria-hidden="true"></i></a>
				</div>
			</c:forEach>
		</div>
		
		
		<form action="addCategory" method="post">
			<div class="row py-4">
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