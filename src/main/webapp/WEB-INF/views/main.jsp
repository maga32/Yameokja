<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
	<!-- 좌측날개 -->
	<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>

	<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6">
		<div class="row">

			<div class="mb-3 bg-warning py-2">대충 헤더 들어갈곳</div>

			<div class="">
				<select class="form-select-sm rounded-pill">
					<option selected>서울시</option>
					<option value="1">경기도</option>
				</select> <select class="form-select-sm rounded-pill mx-2">
					<option selected>관악구</option>
					<option value="1">동작구</option>
				</select>
			</div>

			<div class="col-10 p-3">
				<input class="col-12 rounded-pill" type="text"
					aria-label=".form-control-sm example">
			</div>
			<div class="col-2 py-3">
				<button class="col-12 btn btn-outline-secondary rounded-pill">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</div>
			
			<div class="col-6 py-2 col-md-3">
				<a href="/storeList">
					전체
				</a>
			</div>
			<c:forEach var="li" items="${ caList }">
				<div class="col-6 py-2 col-md-3">
					<a href="/storeList?category=${ li.cNo }">
						${ li.cName }
					</a>
				</div>
			</c:forEach>
			
			<!--  샘플  -->
			<div class="col-6 py-2 col-md-3">
				<img class="col-12 rounded" src="https://picsum.photos/100">
			</div>
			
		</div>
	</div>

	<!-- 우측날개 -->
	<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>

</div>