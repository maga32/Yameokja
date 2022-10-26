<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<article>
	<%@ include file="adminWing.jsp" %>
	<div class="px-2 p-sm-3 p-2">
		<div class="row bg-light text-center">
			<div class="col-2 py-2">아이디</div>
			<div class="col-2 py-2">닉네임</div>
			<div class="col-2 py-2">가입일</div>
			<div class="col-2 py-2">탈퇴일</div>
			<div class="col-4 py-2">멤버권한</div>
		</div>
		<div class="row">
			<c:forEach var="li" items="${ memberList }">
				<div class="col-2 py-2">${ li.memberId }</div>
				<div class="col-2 py-2 text-center">${ li.memberNickname }</div>
				<div class="col-2 py-2 text-center">
					<fmt:formatDate value="${ li.memberJoinDate }" pattern="YY/MM/dd"/>
				</div>
				<div class="col-2 py-2 text-center">
					<fmt:formatDate value="${ li.memberDelDate }" pattern="YY/MM/dd"/>
				</div>
				<div class="col-4 py-2 text-center">
					<c:if test="${ li.memberLevel == 10 }">
						<i class="fa fa-graduation-cap" aria-hidden="true"></i> 최고관리자
					</c:if>
					<c:if test="${ li.memberLevel != 10 }">
						<select class="form-select-sm" id="${ li.memberId }Level">
							<option ${ li.memberLevel == 1 ? 'selected' : ''}>1</option>
							<option ${ li.memberLevel == 2 ? 'selected' : ''}>2</option>
							<option ${ li.memberLevel == 3 ? 'selected' : ''}>3</option>
							<option ${ li.memberLevel == 4 ? 'selected' : ''}>4</option>
							<option ${ li.memberLevel == 5 ? 'selected' : ''}>5</option>
							<option ${ li.memberLevel == 6 ? 'selected' : ''}>6</option>
							<option ${ li.memberLevel == 7 ? 'selected' : ''} value="7">lv7 관리자</option>
							<option ${ li.memberLevel == 8 ? 'selected' : ''} value="8">lv8 관리자</option>
							<option ${ li.memberLevel == 9 ? 'selected' : ''} value="9">lv9 관리자</option>
							<option ${ li.memberLevel == 0 ? 'selected' : ''} value="0">정지</option>
						</select>
						<a href="javascript:;" class="btn btn-sm btn-secondary" onclick="changeLevel('${ li.memberId }','${ page }','${ sort }','${ order }')">변경</a>
					</c:if>
				</div>
			</c:forEach>
			
			<!-- 페이징 -->
			<div>
				<div class="text-center">
					<div class="btn-group">
						<a class="btn btn-secondary ${ startPage == 1 ? 'disabled' : '' }" href="/yameokja/admin/adminMember?page=${ startPage -1 }&sort=${ sort }&order=${ sort }">
				  			<i class="fa fa-angle-left" aria-hidden="true"></i>
			  			</a>
						<c:forEach var="li" begin="${ startPage }" end="${ endPage }">
							<a class="btn btn${ li == page ? '-outline' : '' }-secondary" href="/yameokja/admin/adminMember?page=${ li }&sort=${ sort }&order=${ order }">${ li }</a>
						</c:forEach>
						<a class="btn btn-secondary ${ endPage == pageCount ? 'disabled' : '' }" href="/yameokja/admin/adminMember?page=${ endPage + 1 }&sort=${ sort }&order=${ order }">
				  			<i class="fa fa-angle-right" aria-hidden="true"></i>
			  			</a>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</article>