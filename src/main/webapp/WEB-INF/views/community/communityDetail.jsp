<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="resources/js/community.js"></script>
<article>
	<!-- 작성자 정보, 제목 -->
	<div>
		<h4>
		<c:if test="${ co.categoryNo == 101 }">[수다]</c:if>
		<c:if test="${ co.categoryNo == 102 }">[모집]</c:if>
		 ${ co.communityTitle }
		 </h4>
		<img class="rounded-circle"
			src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
			alt="..." />
		<div>닉네임 : ${ co.memberNickname }</div>
		<div>작성일 : ${ co.communityRegDate }</div>
		<div>조회수 : ${ co.communityReadCount }</div>
		<div>
			<input type="button" name="" vlaue="링크복사">
			<input type="button" name="" vlaue="신고">
		</div>
	</div>
	<!-- 본문 + 사진 -->
	<div>
		<c:if test="${not empty co.communityFile }">
			<div>
				<img src="#">	
			</div>
		</c:if>
		<div>
			${ co.communityContent }
		</div>
	</div>
	
<!-- 댓글 입력 -->
	<div>
		<form id="communityReplyWriteForm" name="communityReplyWriteForm" >
			<input type="hidden" name="communityParentNo" id="communityParentNo" value="${co.communityNo}">
			<input type="hidden" name="communityReReply" id="communityReReply" value=0>
			<input type="hidden" name="communityReplyTarget" id="communityReplyTarget"
					 value="">
			<input type="hidden" name="memberId" id="memberId" value="${sessionScope.memberId}">
			<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
			<div>
				<textarea id="communityContent" name="communityContent" placeholder="댓글을 입력해주세요">
				</textarea>
				<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="확인">
			</div>
		</form>
	</div>
	
<!-- 댓글 목록 -->
	<div id="communityReplyArea">
		<div id="communityReplyList">
		<c:forEach var="re" items="${ coReplyList }" >
			
			<div style="border: 1px solid black">
				<div class="flex-shrink-0">
					<img class="rounded-circle"
						src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
						alt="..." />
				</div>
				<div class="ms-3">
					<!--  댓글 하위 데이터 / 댓글 삭제, 답글 -->
					<div class="fw-bold">
						닉네임 : ${re.memberNickname}
						작성일 : ${re.communityRegDate }
						글 번호 : ${re.communityNo}
						답글 여부 : ${re.communityReReply}
						<button class="btnCommunityReReplyWriteFormOpen" value="${ re.communityNo },${re.memberId}">답글</button>
						<input type="button" id="" value="수정">
						<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">
							<input type="hidden" name="replyCommunityParentNo" value="${ co.communityNo }">
							<input type="hidden" name="replyCommunityNo" value="${ re.communityNo }">
							<input type="submit" name="replyDelete">
						</form>
						<input type="button" id="" value="신고">
					</div>
					${re.communityContent}
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
	<!-- jquery로 추가할 내용들 -->
							
	<!-- 답글 입력폼 end -->
				
				
				</div>
		</c:forEach>
		</div>
	</div>
</article>