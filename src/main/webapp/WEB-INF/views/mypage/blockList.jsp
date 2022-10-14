<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/blockList.css" />
<!-- <script type="text/javascript" src="resources/js/chat.js"></script> -->
<article>
<form name="blockListForm" id="blockListForm">
	<input type="hidden" name="memberId" value="${ member.memberId }"/>
</form>
<div class="row">
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
		<button type="button" class="closeButton btn">확인</button>
	</div>
</div><!--전체틀 끝 -->
</div>
</article>