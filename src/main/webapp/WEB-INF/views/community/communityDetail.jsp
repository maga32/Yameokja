<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" 	href="resources/css/communityDetail.css" />
<script src="resources/js/community.js"></script>
<article>
<div class="row border justifyContent p-1 m-0">
	<!-- 작성자 정보, 제목 -->
	<div class="row border-bottom justifyContent">
		<div class="row communityTitle">
			<div class="col-12 border-bottom pb-2">
				<c:if test="${ co.categoryNo == 101 }">[수다]</c:if>
				<c:if test="${ co.categoryNo == 102 }">[모집]</c:if>
				 ${ co.communityTitle }
				 (${ co.communityReplyCount })
			</div>
		 </div>
		 <div class=" row my-3">
		 	<div class=" col-2 imageFrame">
		 		<img class="rounded-circle communityImg" alt="${co.memberNickname}" src="resources/IMG/member/${co.memberPhoto }"
						onclick='window.open("userProfile?userId=${co.memberId}","LoginForm","width=500, height=600")'/>
			</div>
			<div class="col-8">
				<div class="col-12 memberNicknameFont">${ co.memberNickname }</div>
				<div class="col-12 communityRegDateFont">(<fmt:formatDate value="${co.communityRegDate}" pattern="yyyy-MM-dd hh:mm:ss"/>)</div>
				<div class="col-12 communityReadCountFont"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;${ co.communityReadCount }</div>
			</div>	
			<div class="col-2 p-0 text-end">
				<span class="fa-stack fa-lg"  onclick='clip(); return false;'>
				  <i class="fa fa-circle fa-stack-2x text-warning"></i>
				  <i class="fa fa-link fa-stack-1x text-white" aria-hidden="true"></i>
				</span>
				<span class="fa-stack fa-lg"  onclick='window.open("reportForm?categoryNo=${co.categoryNo}&communityNo=${co.communityNo}&reportTarget=${co.memberId}","reportForm","width=500, height=600")'>
				  <i class="fa fa-circle fa-stack-2x text-warning"></i>
				  <i class="fa fa-bell fa-stack-1x text-white"></i>
				</span>
			</div>
		</div>
	</div>
	<!-- 본문 + 사진 -->
	<div class="row col-12 border mb-3">
		<c:if test="${not empty co.communityFile }">
			<div class="imageFrame border-bottom py-2 mb-1">
				<img style="max-width: 100%; height: auto;" src="resources/IMG/community/${co.communityFile }">	
			</div>
		</c:if>
		<div class="p-1 coContent ">${ co.communityContent }</div>
	</div>
	
<!-- if 모집글 / 모집 정보 출력 -->
	<c:if test="${ co.categoryNo == 102 }">
		<div>
			모집일 : ${ co.partyDDay }<br>
			모집 장소 : ${ co.partyPlace }<br>
			모집 인원 : ${countPartyMembers} / ${ co.partyMembers }
			<c:if test="${ (sessionScope.memberId != co.memberId) && result}">
				<button type="button" onClick="location.href='btn102PartyJoin?communityNo=${co.communityNo}'">참가</button>
			</c:if>
			<br>
			<c:forEach var="u" items="${memberPhotoList }">
				<c:if test="${u.memberNickname == co.memberNickname }">
					<img class="rounded-circle" style="border:5px solid orange; height:50px; width:50px;"alt="${u.memberNickname }" src="resources/IMG/member/${u.memberPhoto }"
						onclick='window.open("userProfile?userId=${u.memberId}","LoginForm","width=500, height=600")'/>
				</c:if>
				<c:if test="${u.memberNickname != co.memberNickname }">
					<img class="rounded-circle" style="border:1px solid gray; height:50px; width:50px;"alt="${u.memberNickname }" src="resources/IMG/member/${u.memberPhoto }"
						onclick='window.open("userProfile?userId=${u.memberId}","LoginForm","width=500, height=600")'/>
				</c:if>
			</c:forEach>
		</div>
	</c:if>	
	
	
<!-- 댓글 입력 -->
	<div class="col-12" id="communityReplyArea">
		<form id="communityReplyWriteForm" name="communityReplyWriteForm">
			<input type="hidden" name="communityParentNo" id="communityParentNo" value="${co.communityNo}">
			<input type="hidden" name="communityReReply" id="communityReReply" value=0>
			<input type="hidden" name="communityReplyTarget" id="communityReplyTarget" value="">
			<div class="row border">
				<div class="col-10 py-2">
					<textarea id="communityContent" name="communityContent" placeholder="댓글을 입력해주세요"></textarea>
				</div>
				<div class="col-2 border-start my-2">
					<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="입력">
				</div>
			</div>
		</form>
		
<!-- hidden 영역 -->
		<input type="hidden" id="memberId" value="${sessionScope.member.memberId}">
		<input type="hidden" id="communityNo" value="${co.communityNo}">
<!-- hidden 영역 end-->	
		
<!-- 댓글 목록 -->
		<div class="row border border-top-0">
		<div class="col-12" id="communityReplyList">
		<c:forEach var="re" items="${ coReplyList }" >
			<c:if test="${re.communityReReply == '0' }">
			<div class="row border-bottom pt-1">	
				<div class="col-2 my-auto text-center">
					<img class="rounded-circle userImg" alt="${re.memberNickname}" src="resources/IMG/member/${re.memberPhoto }"
						onclick='window.open("userProfile?userId=${re.memberId}","LoginForm","width=500, height=600")'/>
					<br><span style="font-size: 10px;">${re.memberNickname}</span>
				</div>
				<div class="col-8 my-2">
					<!--  댓글 하위 데이터 / 댓글 삭제, 답글 -->
					<div class="fw-bold">
						(<fmt:formatDate value="${re.communityRegDate}" pattern="yyyy-MM-dd hh:mm:ss"/>)
					</div>	
					<div class="replyContent" id="communityReplyContentResultAt${re.communityNo }">${re.communityContent}</div>
				</div>
				<div class="col-2 border-start text-center">
					<button class="btnCommunityReReplyWriteFormOpen btnReply" value="${ re.communityNo },${re.memberNickname}">답글</button><br>
					<c:if test="${sessionScope.member.memberId != re.memberId }"></c:if>
					<c:if test="${sessionScope.member.memberId == re.memberId }">
						<button class="btnCommunityReReplyUpdateFormOpen btnReply" value="${ re.communityNo },${re.memberNickname}">수정</button><br>
						<form id="communityReplyDeleteForm" name="communityReplyDeleteForm" class="">
							<input type="hidden" name="replyCommunityParentNo" value="${ co.communityNo }">
							<input type="hidden" name="replyCommunityNo" value="${ re.communityNo }">
							<button class="replyDelete btnReply">삭제</button>
						</form>
					</c:if>
					<button class="reportButton btnReply" onclick='window.open("reportForm?categoryNo=${re.categoryNo}&communityNo=${re.communityNo}&reportTarget=${re.memberId}","reportForm","width=500, height=600")'>신고</button>
				</div>
				
	<!--  댓글 목록 end -->	
	<!-- 답글 입력폼 -->
				<div class="my-1" id="communityReReplyWriteFormNo${ re.communityNo }" style="display : none">
					<form class="communityReReplyWriteFormNo${ re.communityNo }" id="communityReplyWriteForm" name="communityReplyWriteForm" >
						<input type="hidden" name="communityParentNo" id="communityParentNoAt${re.communityNo }" value="${co.communityNo}">					
						<input type="hidden" name="communityReReply" id="communityReReplyAt${ re.communityNo }" value=0>
						<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt${ re.communityNo }"	 value="">
						<input type="hidden" name="communityReReplyParentNo" id="communityReReplyParentNoAt${ re.communityNo }"	value="${re.communityReReply}">
						<!-- <input type="hidden" name="communityReplyUpdateNo" value="${re.communityNo }"> -->
						<!-- 1105 수정 line1 -->
						<input type="hidden" name="communityNo2" id="communityNo${re.communityNo }" value="">
						<div class="row">
							<textarea class="col-10 p-1" id="communityReplyContent" name="communityContent" placeholder="댓글을 입력해주세요"></textarea>
							<div class="col-2">
								<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="입력">
							</div>			
						</div>
					</form>
				</div>
				
	<!-- 답글 입력폼 end -->
	<!-- 답글 목록 -->
				<c:forEach var="rere" items="${ coReplyList }">
					<c:if test="${re.communityNo == rere.communityReReply }">
						<div class="col-1 d-flex align-items-center d-flex justify-content-end pe-2">
							<div class="fs-3">↳</div>
						</div>
						<div class="col-2 pt-1  text-center border-top reReply">
							<div class="col-12 align-self-center">
								<img class="rounded-circle userImg" alt="${rere.memberNickname}" src="resources/IMG/member/${rere.memberPhoto }"
									onclick='window.open("userProfile?userId=${rere.memberId}","LoginForm","width=500, height=600")'/>
								<br><span style="font-size: 10px;">${rere.memberNickname}</span>
							</div>
						</div>
						<div class="col-7 border-top py-2 reReply">
							<div class="col-12 my-auto">
								<!--  댓글 하위 데이터 / 댓글 삭제, 답글 -->
								<div class="fw-bold">
									(<fmt:formatDate value="${rere.communityRegDate}" pattern="yyyy-MM-dd hh:mm:ss"/>)
								</div>
								<div class="replyContent" id="communityReplyContentResultAt${rere.communityNo }"><span class="text-primary">@${rere.communityReplyTarget }</span>&nbsp;${rere.communityContent}</div>
							</div>
						</div>
						<div class="col-2 border-start border-top text-center reReply">
							<button class="btnCommunityReReplyWriteFormOpen btnReReply" value="${ re.communityNo },${rere.memberNickname}">답글</button><br>
							<c:if test="${sessionScope.member.memberId != rere.memberId }"></c:if>
							<c:if test="${sessionScope.member.memberId == rere.memberId }">
								<button class="btnCommunityReReplyUpdateFormOpen btnReReply" value="${ re.communityNo },${rere.memberNickname},${ rere.communityNo }">수정</button><br>								
								<form id="communityReplyDeleteForm" name="communityReplyDeleteForm" class="">
									<input type="hidden" name="replyCommunityParentNo" value="${ co.communityNo }">
									<input type="hidden" name="replyCommunityNo" value="${ rere.communityNo }">	
									<button class="replyDelete btnReReply">삭제</button>
								</form>
							</c:if>
								<button class="reportButton btnReReply" onclick='window.open("reportForm?categoryNo=${rere.categoryNo}&communityNo=${rere.communityNo}&reportTarget=${rere.memberId}","reportForm","width=500, height=600")'>신고</button>		
						</div>
					</c:if>
				</c:forEach>
	<!-- 답글 목록 end -->						
				</div>
				</c:if>

		</c:forEach>
		</div>
		</div>
	</div>
</div>
<div class="text-end my-1 m-0">
	<form class=" inlineBlock" action="community${co.categoryNo}UpdateForm?communityNo=${co.communityNo}" method="post">
	<button class="btn btn-warning shadow btnCommunityDetail">수정하기</button>
	</form>
	<button class="btn btn-warning shadow inlineBlock btnCommunityDetail" id="btnCommunityDelete" onclick="">삭제하기</button>
</div>
</article>