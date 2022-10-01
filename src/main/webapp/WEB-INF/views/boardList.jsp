<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
<table class="listTable">
	<tr>
		<td class="boardTitle" colspan="5">
			<h2>게시 글 리스트</h2>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<form name="searchForm" id="searchForm" action="#">
				<select name="type">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="keyword" />
				<input type="submit" value="검색" />
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="5" class="listWrite"><a href="writeForm">글쓰기</a></td>
	</tr>
	<tr>
		<th class="listThNo">NO</th>
		<th class="listThTitle">제목</th>
		<th class="listThWriter">작성자</th>
		<th class="listThRegDate">작성일</th>
		<th class="listThReadCount">조회수</th>
	</tr>	
<c:if test="${ not empty bList }">
<c:forEach var="b" items="${ bList }" varStatus="status">		
	<tr class="listTr">
		<td class="listTdNo">${ b.no  }</td>
		<td class="listTdTitle">
			<a href="boardDetail?no=${ b.no }" >${ b.title }</a></td>
		<td class="listTdWriter">${ b.writer }</td>
		<td class="listTdRegDate"><fmt:formatDate value="${ b.regDate }" 
			pattern="yyyy-MM-dd HH:mm:ss" /></td>
		<td class="listTdReadCount">${ b.readCount }</td>
	</tr>
</c:forEach>
</c:if>	
<c:if test="${ empty bList }">
	<tr>
		<td colspan="5" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
	</tr>
</c:if>
</table>
</article>



