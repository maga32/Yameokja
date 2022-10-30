<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" 	href="resources/css/communityDetail.css" />
<script src="resources/js/community.js"></script>
<article>
<div class="row border justifyContent p-1 m-2">
	<!-- 작성자 정보, 제목 -->
	<div class="row border-bottom justifyContent">
		<div class="row communityTitle">
			<div class="col-12">
				<c:if test="${ co.categoryNo == 101 }">[수다]</c:if>
				<c:if test="${ co.categoryNo == 102 }">[모집]</c:if>
				 ${ co.communityTitle }
			</div>
		 </div>
		 <div class=" row my-3">
		 	<div class=" col-2 imageFrame">
				<img class="rounded-circle" alt="..." src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" />
			</div>
			<div class="col-8">
				<div class="col-12 memberNicknameFont">닉네임 : ${ co.memberNickname }</div>
				<div class="col-12 communityRegDateFont">작성일 : ${ co.communityRegDate }</div>
				<div class="col-12 communityReadCountFont">조회수 : ${ co.communityReadCount }</div>
			</div>	
			<div class="col-2">
				<input type="button" onclick="clip(); return false;" value="링크복사">
				<button onclick='window.open("reportForm?categoryNo=${co.categoryNo}&communityNo=${co.communityNo}&reportTarget=${co.memberId}","reportForm","width=500, height=600")'>신고</button>
			</div>
		</div>
	</div>
	<!-- 본문 + 사진 -->
	<div class="row col-12">
		<c:if test="${not empty co.communityFile }">
			<div>
				<img src="resources/IMG/LOGOtemporaryIMG.PNG">	
			</div>
		</c:if>
		<div>
			${ co.communityContent }
		</div>
	</div>
	
<!-- if 모집글 / 모집 정보 출력 -->
	<c:if test="${ co.categoryNo == 102 }">
		<div>
			모집일 : ${ co.partyDDay }<br>
			모집 장소 : ${ co.partyPlace }<br>
			모집 인원 : ${countPartyMembers} / ${ co.partyMembers }
			
			<c:if test="${sessionScope.memberId != co.memberId || result} ">
				<button type="button" onClick="location.href='btn102PartyJoin?communityNo=${co.communityNo}'">참가</button>
			</c:if>
			<br>
			<c:forEach var="u" items="${memberPhotoList }">
				<c:if test="${u.memberNickname == co.memberNickname }">
					<img class="rounded-circle" style="border:5px solid blue; height:50px; width:50px;"alt="${u.memberNickname }" src="resources/IMG/member/${u.memberPhoto }"
						onclick='window.open("userProfile?userId=${u.memberId}","LoginForm","width=500, height=600")'/>
				</c:if>
				<c:if test="${u.memberNickname != co.memberNickname }">
					<img class="rounded-circle" style="height:50px; width:50px;"alt="${u.memberNickname }" src="resources/IMG/member/${u.memberPhoto }"
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
				<div class="col-10 my-2">
					<textarea id="communityContent" name="communityContent" placeholder="댓글을 입력해주세요"></textarea>
				</div>
				<div class="col-2 border-start my-2">
					<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="입력">
				</div>
			</div>
		</form>
		<div class="row border border-top-0">
<!-- 댓글 목록 -->

		<div class="col-12" id="communityReplyList border">
		<c:forEach var="re" items="${ coReplyList }" >
			
			<div class="row border-bottom py-1">
				<div class="col-2 my-auto">
					<img class="rounded-circle" alt="..." src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"/>
					<br><span style="font-size: 10px;">${re.memberNickname}</span>
				</div>
				<div class="col-8 my-auto">
					<!--  댓글 하위 데이터 / 댓글 삭제, 답글 -->
					<div class="fw-bold">
						작성일 : ${re.communityRegDate }
						글 번호 : ${re.communityNo}
						답글 여부 : ${re.communityReReply}
					</div>	
					${re.communityContent}
				</div>
				<div class="col-2 border-start my-auto">
					<button class="btnCommunityReReplyWriteFormOpen" value="${ re.communityNo },${re.memberId}">답글</button>
					<button class="btnCommunityReReplyUpdateFormOpen" value="${ re.communityNo },${re.memberId}">수정</button>
					<input type="button" class="reportButton" id="" value="신고">
					<form id="communityReplyDeleteForm" name="communityReplyDeleteForm" class="inlineBlock">
						<input type="hidden" name="replyCommunityParentNo" value="${ co.communityNo }">
						<input type="hidden" name="replyCommunityNo" value="${ re.communityNo }">
						<input type="submit" name="replyDelete" value="입력">
					</form>					
				</div>
				
				
				
	<!-- 답글 입력폼 -->
				<div class="my-1" id="communityReReplyWriteFormNo${ re.communityNo }" style="display : none">
					<form id="communityReplyWriteForm" name="communityReplyWriteForm" >
						<input type="hidden" name="communityParentNo" id="communityParentNo" value="${co.communityNo}">
						<input type="hidden" name="communityReReply" id="communityReReplyAt${ re.communityNo }" value=0>
						<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt${ re.communityNo }"	 value="">
						<div class="row">
							<textarea class="col-10 p-1" id="communityReplyContent" name="communityContent" placeholder="댓글을 입력해주세요">
							</textarea>
							<div class=col-2>
								<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="입력">
							</div>			
						</div>
					</form>
				</div>
	<!-- 답글 입력폼 end -->
				
				
				</div>
		</c:forEach>
		</div>
		</div>
	</div>
</div>
</article>