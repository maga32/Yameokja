<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<article>
	<%@ include file="adminWing.jsp" %>
	<div class="p-sm-3 py-2 px-4">
		
		<!-- 검색 -->
		<div class="d-flex">
			<div class="py-3">
				<select class="form-select-sm rounded-pill" id="searchBy">
					<option value="id" ${ searchBy eq id ? 'selected' : ''}>아이디</option>
					<option value="nickname" ${ searchBy eq 'nickname' ? 'selected' : ''}>닉네임</option>
					<option value="level" ${ searchBy eq 'level' ? 'selected' : ''}>등급</option>
				</select>
			</div>
			
			<div class="flex-fill p-3">
				<input class="col-12 rounded-pill px-2" type="text" id="keyword" value="${ keyword }">
			</div>
			<div class="py-3">
				<a class="px-4 btn btn-sm btn-outline-secondary rounded-pill" href="javascript:;" onclick="searchMember()">
					<i class="fa fa-search" aria-hidden="true"></i>
				</a>
			</div>
		</div>
		
		<!-- 회원 리스트 -->
		<div class="row bg-light">
			<div class="col-5 py-2">
				<span>
					<c:if test="${ sort eq 'nickname' && order eq 'desc'}"><a class="text-warning" href="adminMember?sort=nickname&order=asc&searchBy=${ searchBy }&keyword=${ keyword }">닉네임▼</a></c:if>
					<c:if test="${ sort eq 'nickname' && order eq 'asc'}"><a class="text-warning" href="adminMember?sort=nickname&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">닉네임▲</a></c:if>
					<c:if test="${ sort ne 'nickname'}"><a href="adminMember?sort=nickname&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">닉네임</a></c:if>
				</span>
				<span>
					<c:if test="${ sort eq 'id' && order eq 'desc'}"><a class="text-warning" href="adminMember?sort=id&order=asc&searchBy=${ searchBy }&keyword=${ keyword }">( 아이디▼ )</a></c:if>
					<c:if test="${ sort eq 'id' && order eq 'asc'}"><a class="text-warning" href="adminMember?sort=id&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">( 아이디▲ )</a></c:if>
					<c:if test="${ sort ne 'id'}"><a href="adminMember?sort=id&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">( 아이디 )</a></c:if>
				</span>	
			</div>
			<div class="col-3 py-2 text-center">
				<span>
					<c:if test="${ sort eq 'joindate' && order eq 'desc'}"><a class="text-warning" href="adminMember?sort=joindate&order=asc&searchBy=${ searchBy }&keyword=${ keyword }">가입일▼</a></c:if>
					<c:if test="${ sort eq 'joindate' && order eq 'asc'}"><a class="text-warning" href="adminMember?sort=joindate&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">가입일▲</a></c:if>
					<c:if test="${ sort ne 'joindate'}"><a href="adminMember?sort=joindate&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">가입일</a></c:if>	
				</span>
				<span>
					<c:if test="${ sort eq 'deldate' && order eq 'desc'}"><a class="text-warning" href="adminMember?sort=deldate&order=asc&searchBy=${ searchBy }&keyword=${ keyword }">( 탈퇴일▼ )</a></c:if>
					<c:if test="${ sort eq 'deldate' && order eq 'asc'}"><a class="text-warning" href="adminMember?sort=deldate&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">( 탈퇴일▲ )</a></c:if>
					<c:if test="${ sort ne 'deldate'}"><a href="adminMember?sort=deldate&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">( 탈퇴일 )</a></c:if>
				</span>	
			</div>
			<div class="col-4 py-2 text-center">
				<c:if test="${ sort eq 'level' && order eq 'desc'}"><a class="text-warning" href="adminMember?sort=level&order=asc&searchBy=${ searchBy }&keyword=${ keyword }">멤버권한▼</a></c:if>
				<c:if test="${ sort eq 'level' && order eq 'asc'}"><a class="text-warning" href="adminMember?sort=level&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">멤버권한▲</a></c:if>
				<c:if test="${ sort ne 'level'}"><a href="adminMember?sort=level&order=desc&searchBy=${ searchBy }&keyword=${ keyword }">멤버권한</a></c:if>
			</div>
		</div>
		
		<div class="row text-break">
			<c:forEach var="li" items="${ memberList }">
				<div class="col-5 py-2 d-flex">
					<div class="align-self-center">
						<div class="border rounded-circle d-flex align-items-center" style="width:40px; height:40px; overflow:hidden;">
							<img src="/yameokja/resources/IMG/member/${ li.memberPhoto }" style="width:40px;">
						</div>
					</div>
					<div class="px-2">
						<a class="memberInfo" data-memberId="${ li.memberId }">
							${ li.memberNickname }
						</a><br>						
						<span class="text-small">( ${ li.memberId } )</span>
					</div>
				</div>
				<div class="col-3 py-2 text-center align-self-center">
					<span>
						<fmt:formatDate value="${ li.memberJoinDate }" pattern="YY/MM/dd"/>
					</span><br>
					<span class="text-small">
						<fmt:formatDate value="${ li.memberDelDate }" pattern="( YY/MM/dd )"/>
					</span>
				</div>
				<div class="col-4 py-2 text-center align-self-center">
					<c:if test="${ li.memberLevel == 10 }">
						<div class="text-success">
							<i class="fa fa-graduation-cap" aria-hidden="true"></i> 최고관리자
						</div>
					</c:if>
					<c:if test="${ li.memberLevel != 10 }">
						<select class="form-select-sm my-1" id="${ li.memberId }Level">
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
						<a href="javascript:;" class="btn btn-sm btn-secondary" onclick="changeLevel('${ li.memberId }','${ page }','${ sort }','${ order }','${ searchBy }','${ keyword }')">변경</a>
					</c:if>
				</div>
			</c:forEach>
		</div>
		
		<!-- 페이징 -->
		<div class="row">
			<div class="text-center">
				<div class="btn-group">
					<a class="btn btn-secondary ${ startPage == 1 ? 'disabled' : '' }" href="/yameokja/admin/adminMember?page=${ startPage -1 }&sort=${ sort }&order=${ sort }&searchBy=${ searchBy }&keyword=${ keyword }">
			  			<i class="fa fa-angle-left" aria-hidden="true"></i>
		  			</a>
					<c:forEach var="li" begin="${ startPage }" end="${ endPage }">
						<a class="btn btn${ li == page ? '-outline' : '' }-secondary" href="/yameokja/admin/adminMember?page=${ li }&sort=${ sort }&order=${ order }&searchBy=${ searchBy }&keyword=${ keyword }">${ li }</a>
					</c:forEach>
					<a class="btn btn-secondary ${ endPage == pageCount ? 'disabled' : '' }" href="/yameokja/admin/adminMember?page=${ endPage + 1 }&sort=${ sort }&order=${ order }&searchBy=${ searchBy }&keyword=${ keyword }">
			  			<i class="fa fa-angle-right" aria-hidden="true"></i>
		  			</a>
				</div>
			</div>
		</div>
		
	</div>
</article>