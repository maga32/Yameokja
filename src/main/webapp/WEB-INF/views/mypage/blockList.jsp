<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>야먹자</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<link rel="stylesheet" type="text/css" href="resources/css/blockList.css" />
<!-- <script type="text/javascript" src="resources/js/chat.js"></script> -->
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form name="blockListForm" id="blockListForm">
	<input type="hidden" name="memberId" value="${ member.memberId }"/>
</form>
<div class="row">
<!-- 좌측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
	<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6 p-5">

	<div class="headerFrame p-3">
		<h2 class="header pb-3">차단 대상 목록</h2>
		<div class="id m-2">아이디</div>
		<div class="blockListFrame">
		<div class="blockList my-1 p-2 col-12">
			<div class="blockId col-8">test_id</div>
			<div class="UnblockId col-4">
				<button type="button" class="UnblockIdButton btn">차단 해제</button>
			</div>
		</div>
<!-- 		blockList 반복구간 -->
		<div class="blockList my-1 p-2 col-12">
			<div class="blockId col-8">test_id</div>
			<div class="UnblockId col-4">
				<button type="button" class="UnblockIdButton btn">차단 해제</button>
			</div>
		</div>		
		<div class="blockList my-1 p-2 col-12">
			<div class="blockId col-8">test_id</div>
			<div class="UnblockId col-4">
				<button type="button" class="UnblockIdButton btn">차단 해제</button>
			</div>
		</div>
		<div class="blockList my-1 p-2 col-12">
			<div class="blockId col-8">test_id</div>
			<div class="UnblockId col-4">
				<button type="button" class="UnblockIdButton btn">차단 해제</button>
			</div>
		</div>
		<div class="blockList my-1 p-2 col-12">
			<div class="blockId col-8">test_id</div>
			<div class="UnblockId col-4">
				<button type="button" class="UnblockIdButton btn">차단 해제</button>
			</div>
		</div>
		
<!-- 	끝	blockList 반복구간 -->		
	</div>
	<div class="buttonFrame col-12 my-3">
		<a class="closeButton btn" onclick='window.close()'>확인</a>
	</div>
</div><!--전체틀 끝 -->
</div>

	</div>
<!-- 우측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
</body>
</html>


