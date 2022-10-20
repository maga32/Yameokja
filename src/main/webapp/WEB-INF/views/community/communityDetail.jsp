<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" 	href="resources/css/communityDetail.css" />
<script src="resources/js/community.js"></script>
<article>
<div class="row border">
	<!-- 작성자 정보, 제목 -->
	<div class="">
		<div class="col-12">
			<c:if test="${ co.categoryNo == 101 }">[수다]</c:if>
			<c:if test="${ co.categoryNo == 102 }">[모집]</c:if>
			 ${ co.communityTitle }
		 </div>
		 <div class=" row col-12">
		 	<div class=" col-2">
				<img class="rounded-circle" alt="..." src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" />
			</div>
			<div class="col-8">
				<div>닉네임 : ${ co.memberNickname }</div>
				<div>작성일 : ${ co.communityRegDate }</div>
				<div>조회수 : ${ co.communityReadCount }</div>
			</div>	
			<div class="col-2">
				<input type="button" name="" value="링크복사">
				<input type="button" name="" value="신고">
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
	
<!-- 댓글 입력 -->
	<div class="row col-12 border">
		<form id="communityReplyWriteForm" name="communityReplyWriteForm" >
			<input type="hidden" name="communityParentNo" id="communityParentNo" value="${co.communityNo}">
			<input type="hidden" name="communityReReply" id="communityReReply" value=0>
			<input type="hidden" name="communityReplyTarget" id="communityReplyTarget"
					 value="">
			<input type="hidden" name="memberId" id="memberId" value="${sessionScope.memberId}">
			<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
			<div class="row">
				<div class="col-10">
					<textarea id="communityContent" name="communityContent" placeholder="댓글을 입력해주세요"></textarea>
				</div>
				<div class="col-2">
					<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="입력">
				</div>
			</div>
		</form>
	</div>
	
<!-- 댓글 목록 -->

	<div class="row" id="communityReplyArea">
		<div class="col-12" id="communityReplyList">
		<c:forEach var="re" items="${ coReplyList }" >
			
			<div class="border row">
				<div class="flex-shrink-0 col-2">
					<img class="rounded-circle" alt="..." src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"/>
					<br>닉네임:<br>${re.memberNickname}
				</div>
				<div class="col-8">
					<!--  댓글 하위 데이터 / 댓글 삭제, 답글 -->
					<div class="fw-bold">
						작성일 : ${re.communityRegDate }
						글 번호 : ${re.communityNo}
						답글 여부 : ${re.communityReReply}
					</div>	
					${re.communityContent}
				</div>
				<div class="col-2">
					<button class="btnCommunityReReplyWriteFormOpen inlineBlock" value="${ re.communityNo },${re.memberId}">답글</button>
	<!-- 변경1 -->
					<button class="btnCommunityReReplyUpdateFormOpen inlineBlock" value="${ re.communityNo },${re.memberId}">수정</button>
					<input type="button" class="reportButton inlineBlock" id="" value="신고">
					<form id="communityReplyDeleteForm" name="communityReplyDeleteForm" class="inlineBlock">
						<input type="hidden" name="replyCommunityParentNo" value="${ co.communityNo }">
						<input type="hidden" name="replyCommunityNo" value="${ re.communityNo }">
						<input type="submit" name="replyDelete" value="삭제">
					</form>					
				</div>
				
				
				
	<!-- 답글 입력폼 -->
				<div id="communityReReplyWriteFormNo${ re.communityNo }" style="display : none">
					<form id="communityReplyWriteForm" name="communityReplyWriteForm" >
						<input type="hidden" name="communityParentNo" id="communityParentNo" value="${co.communityNo}">
						<input type="hidden" name="communityReReply" id="communityReReplyAt${ re.communityNo }" value=0>
						<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt${ re.communityNo }"	 value="">
	
						<div>
							<textarea id="communityReplyContent" name="communityContent" placeholder="댓글을 입력해주세요">
							</textarea>
							<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="확인">
						</div>
					</form>
				</div>
	<!-- 답글 입력폼 end -->
				
				
				</div>
		</c:forEach>
		</div>
	</div>
</div>
</article>