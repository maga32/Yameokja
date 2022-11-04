<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row p-4">

	<div class="col-12 pb-3">
		<h1 class="text-secondary">맛집 리뷰 등록</h1>
		<div class="border-bottom border-secondary border-4"></div>
	</div>
	
	<div class="col-4 col-md-3 fw-bold pb-3">
		가게이름
	</div>
	<div class="col-8 col-md-9 pb-3">
		${ store.storeName }
	</div>
	<div class="col-4 col-md-3 fw-bold pb-3">
		작성자
	</div>
	<div class="col-8 col-md-9 pb-3">
		${ sessionScope.memberNickname }
	</div>
	<div class="col-4 col-md-3 fw-bold pb-3">
		제목
	</div>
	<div class="col-8 col-md-9 pb-3">
		<input class="form-control form-control-sm" type="text" placeholder="제목을 입력해주세요">
	</div>
	
	<div class="col-12 mb-4">
		<textarea class="form-control col-12 text-secondary" rows="13">에디터 들어갈 자리</textarea>
	</div>
	
	<div class="col-6">
		<a class="col-12 btn btn-secondary">
			취소
		</a>
	</div>
	<div class="col-6">
		<a class="col-12 btn btn-danger">
			작성완료
		</a>
	</div>
	
</div>

