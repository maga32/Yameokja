<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<form name="postListForm" id="postListForm">
		<input type="hidden" name="mbId" value="${ member.memberId }" />
	</form>
	<div class="row">
		<div class="fullFrame col-md-12">
			<div class="myInformationsFrame col-md-12 ">
				<div class="myInformation1 col-md-3 ">
					<div>프로필 사진</div>
				</div>
				<div class="myInformation2 col-md-6 ">
					<div class="mbIdFont">sessionScope.${ member.memberId }님</div>
					<div class="nbsp;">&nbsp;</div>
					<div class="nbsp;">&nbsp;</div>
					<div class="myInformationFont">
						이메일 : <span>${ member.memberEmail }</span>
					</div>
					<div class="myInformationFont">
						가입일 :<span>${ member.memberJoinDate }</span>
					</div>
				</div>
				<div class="myInformation3 col-md-3 ">
					<div class="buttons_">
						<a href="#">회원 정보 수정</a>
					</div>
					<div class="buttons_">회 원 탈 퇴</div>
					<div class="buttons_">
						<a href="#">나 의 프 로 필</a>
					</div>
					<div class="buttons_">
						<a href="#"
							onclick='window.open("blockList","차단목록","width=500, height=600")'>차
							단 목 록</a>
					</div>
					<div class="buttons_">
						<a href="#">신 고 목 록</a>
					</div>
				</div>
			</div>
			<!--내정보틀 끝 -->
			<div class="nbsp;">&nbsp;</div>
			<div class="postListHeader">
				<div class="postListbutton">맛집 리뷰</div>
				<div class="replyListbutton">댓글 리뷰</div>
				<div class="communityListbutton">동네글</div>
				<div class="likeListbutton">찜 목록</div>
			</div>
			<!--postListHeader 끝 -->

			<div class="postListFrame">

				<c:if test="${ not empty communityList }">
					<c:forEach var="c" items="${communityList}">
							<div class=" border border-2 rounded col-12 p-2 col-md-12">
								<div class="row">
<%-- 									<c:if test="${ empty c.communityFile }"></c:if> --%>
<%-- 									<c:if test="${ not empty c.communityFile }"> --%>
										<div class="col-3 col-md-3 col-sm-3">
											<img src="resources/IMG/deleteIMG.PNG"
												class="img-thumbnail rounded float-start" alt="...">
										</div>
<%-- 									</c:if> --%>
									<div class="col-6 col-md-7 col-sm-6">
										<h4 class="text-muted font-weight-bold" tabindex="0">
											<a href="#"> 
											<c:if test="${ c.categoryNo == 1 }">[수다]</c:if> 
											<c:if test="${ c.categoryNo == 2 }">[모집]</c:if> 
											${ c.communityTitle }
											</a>
										</h4>
										<p class="text-secondary" id="communityMemberNickname">${ c.memberId }</p>
										<p class="text-secondary" id="communityRegDate">${ c.communityRegDate }</p>
									</div>
									<div class="col-3 col-md-2 col-sm-3 border-start border-1">
										<div class="row">
											<div class="col-4 d-flex-column">
												<p style="color: gray">
													<i class="fa fa-eye" aria-hidden="true"></i>
												</p>
											</div>
											<div class="col-8 d-flex-column">
												<p class="text-end" style="font-size: 11px; color: gray">${ c.communityReadCount }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
					</c:forEach>
				</c:if>
			</div>
			<!--postListFrame 끝 -->
			<div class="페이지그룹">
				<div class="페이지그룹버튼"><</div>
				<div class="페이지그룹버튼">1 2 3 4 5 6 7 8 9 10</div>
				<div class="페이지그룹버튼">></div>
			</div>
			<!--페이지그룹 끝 -->
		</div>
	</div>
	<!--전체틀 끝 -->
</article>