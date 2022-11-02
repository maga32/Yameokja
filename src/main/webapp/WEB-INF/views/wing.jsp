<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 윙 버튼 -->
<a id="wingButton" class="d-block d-lg-none btn">
	<span class="fa-stack fa-lg">
		<i class="fa fa-circle fa-stack-2x headerColor"></i>
		<i class="fa fa-bars fa-stack-1x fa-inverse"></i>
	</span>
</a>

<!-- 윙 배경 -->
<div id="wingMask" style="display:none;"></div>

<!-- 윙 -->
<div id="wing">
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 text-center pt-5 pb-5">
					<img alt="프로필 사진" class="rounded-circle col-12" src="/yameokja/resources/IMG/mypage/likeIMG.PNG">
				</div>
				<div class="col-3"></div>
			</div>
	
			<!-- 비로그인 상태 -->
			<c:if test="${ empty sessionScope.memberId }">
				<div class="col-12 text-white fs-3 fw-semibold text-center">
					로그인을 해주세요
				</div>
				<div class="row px-2 pt-3 pb-4">
					<div class="col-6">
						<a class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1" onclick="window.open('/yameokja/loginForm','LoginForm','width=500, height=600')">
							로그인
						</a>
					</div>
					<div class="col-6">
						<a href="/yameokja/memberJoinForm" class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							회원가입
						</a>
					</div>
				</div>
			</c:if>
			<!-- 로그인 상태 -->
			<c:if test="${ not empty sessionScope.memberId }">
				<div class="col-12 text-white fs-3 fw-semibold text-center">
					${ memberNickname }님<br>
					환영합니다
				</div>
				<div class="row px-2 pt-3 pb-4">
					<div class="col-6">
						<a href="/yameokja/logout" class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							로그아웃
						</a>
					</div>
					<div class="col-6">
						<a href="/yameokja/myPagePost" class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							마이페이지
						</a>
					</div>
				</div>
				
				<c:if test="${ sessionScope.member.memberLevel >= 7}">
					<div class="col-12 pb-2">
						<a class="text-warning" href="/yameokja/admin/adminMember">
							<i class="fa fa-cog" aria-hidden="true"></i> 관리자 페이지
						</a>
					</div>
				</c:if>
			</c:if>
			
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="main">메인 페이지</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="communityList">커뮤니티</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="javascript:;" onclick="window.open('/yameokja/chat/chatList','채팅목록','width=500, height=810')">채팅 목록</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="#">내가 찜한 가게</a>
			</div>
			
			<div class="col-12 fs-6 text-white fw-semibold mt-4 p-1">
				설정된 위치
			</div>
			<div class="col-12">
				<c:if test="${ not empty sessionScope.memberId }">
					<div class="fw-semibold ps-3 text-warning">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
						&nbsp;&nbsp;${ sessionScope.member.memberAddress }
					</div>
				</c:if>
				<c:if test="${ empty sessionScope.memberId }">
					<input
						class="col-12 rounded-pill border border-2 border-E3E5E9 text-secondary bg-white p-1 mb-3"
						type="text" value="&nbsp;&nbsp;">
				</c:if>
			</div>
			
			<div class="col-12 text-white fs-6 fw-semibold text-start mt-4 mb-1">
				다른 지역 설정
			</div>
			<div class="row">
				<span class="col-4">
					<select class="text-center rounded-pill border border-2 border-E3E5E9 text-secondary p-1">
						<option>서울시</option>
					</select>
				</span>
				<span class="col-4">
					<select class="text-center rounded-pill border border-2 border-E3E5E9 text-secondary p-1">
						<option>관악구</option>
					</select>
				</span>
				<span class="col-4 pe-0">
					<a class="btn btn-light btn-sm rounded-pill border border-2 border-E3E5E9 text-secondary px-3">
						찾기
					</a>
				</span>
			</div>
			
		</div>
	</div>
</div>

