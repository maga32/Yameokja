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
				<div class="divTableCell">${re.reportDate }</div>
		</div>
		</c:forEach>
		<br>

	</div>
			<a href="writeForm.jsp">상품 등록 하기</a>
</BODY>
</HTML>
