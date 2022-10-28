<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<HTML>
<meta charset="utf-8" lang="ko">
<HEAD>		
<style type="text/css">

	.divTale{ display: table; border-collapse:collapse;}
	.divTableRow{ display: table-row; }
	.divTableHead{ display: table-cell; }
	.divTableCell{ display: table-cell; }

	.divTable{
		width : auto;
		border-collapse: collapse;
		text-align: center;
		border : 1px solid black;
		border-radius: 4px;
	}
	.divTableRow{
		border: 1px solid black;
		padding: 5px;
	}
	.divTableCell{
		border: 1px solid black;
		padding: 5px;
		vertical-align: middle;
	}
	.divTableHead{
		border: 1px solid black;
		background-color: #fff0f0;
		font-weight: bold;
		padding: 5px;
	}
	.hdImg{
		width: 100px;
		text-align: center;
	}
	.hdName{
		width: 200px;
		text-align: center;
	}
	.hdBrand, .hdKcal, .hdPrice {
		width: 80px;
		text-align: center;
	}
	body{
		text-align: center;
		background-image:url("../img/backbread.png");
	}
	.divTableCell{
	 background-color:rgba(255, 255, 255, 0.6); 

	}


</style>
<title>신고 목록</title>
</HEAD>
<BODY>
	<h1>신고 목록</h1>
	<div>
<!-- 		<button onClick="location.href='reportList?reportType=all'">전체</button> -->
<!-- 		<button onClick="location.href='reportList?reportType=store'">가게</button> -->
<!-- 		<button onClick="location.href='reportList?reportType=post'">리뷰</button> -->
<!-- 		<button onClick="location.href='reportList?reportType=community'">동네게시판</button> -->
<!-- 		<button onClick="location.href='reportList?reportType=user'">회원</button> -->
		<button onClick="location.href='reportList?categoryNo=300'">전체</button>
		<button onClick="location.href='reportList?categoryNo=301'">가게</button>
		<button onClick="location.href='reportList?categoryNo=302'">리뷰</button>
		<button onClick="location.href='reportList?categoryNo=303'">동네게시판</button>
		<button onClick="location.href='reportList?categoryNo=304'">회원</button>
		<select id="reportPunishCheck">
			<option value=0>전체</option>
			<option value=1>처리 중</option>
			<option value=2>처리 보류</option>
			<option value=3>처리 완료</option>
		</select>
		<br>
		<select id="type" name="type">
			<option value="all">전체</option>
			<option value="title">제목</option>
			<option value="memberId">아이디</option>
		</select>
		<form name="reportSearchForm" id="reportSearchForm" action="reportList?">
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요">
			<input type="submit" id="reportSearchSubmit" name="reportSearchSubmit" value="검색">
		</form>
	</div>
	
	<div class="divTable">
		<div class="divTableRow">
				<div class="divTableHead hdNo">분류</div>
				<div class="divTableHead hdImg">신고 제목</div>
				<div class="divTableHead hdName">처리결과</div>
				<div class="divTableHead hdPrice">신고자</div>
				<div class="divTableHead hdBrand">작성일</div>
		</div>
		<c:forEach var="re" items="${reportList}">
		<div class="divTableRow">
				<div class="divTableCell">${re.reportType }</div>
				<div class="divTableCell"><a href="#" >${re.reportTitle }</a></div>
				<div class="divTableCell">${re.reportPunishCheck}</div>
				<div class="divTableCell">${re.memberId}임시reportNo(${ re.reportNo })</div>
				<div class="divTableCell">${re.reportDate }</div>
		</div>
		</c:forEach>
		<br>

	</div>
			<a href="writeForm.jsp">상품 등록 하기</a>
</BODY>
