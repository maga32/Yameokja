<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="../resources/css/chat.css" />

<article>
	<div class="fixed-top fs-1 d-flex justify-content-between">
		<div class="text-start">
			&nbsp;
			<a href="chatList">
				<i class="fa fa-arrow-left" aria-hidden="true"></i>
			</a>
		</div>
		<div class="text-end">
			<a href="#" onclick="javascript:window.close();">
				<i class="fa fa-times" aria-hidden="true"></i>
			</a>
			&nbsp;&nbsp;
		</div>
	</div>
	
	<div class="row">
		<!-- 헤더 생기면 대체 -->
		<div class="col-12 bg-warning py-4 mb-2"></div>
		<div class="px-4">			
			<div class="pt-2 px-2">
				<h1>대화창</h1>
			</div>
			<hr>
			<div class="row">
				<div class="col-4">
					<!--  추후 src를 memberPhoto 링크로 변경필요 ${ target.memberPhoto } -->
					<img class="border rounded-circle" src="https://picsum.photos/120/120">
				</div>
				<div class="col-8">
					<div class="col-12">
						<h1>${ target.memberNickname }</h1>
					</div>
					<div class="col-12 pt-5 text-end">
						<span class="text-large">채팅방나가기</span> | <span class="text-danger">차단</span>
						&nbsp;
					</div>
				</div>
				<div class="p-3">
					<div class="border" style="overflow:scroll; height:400px" id="chatting">
						<div class="row px-3">
							<c:forEach var="li" items="${ chatTargetList }">
								<c:if test="${ memberId == li.chatSender }">
									<div class="col-4 text-end text-warning">
										${ li.chatReadCheck == 0 ? "1" : "" }
									</div>
									<div class="col-8 py-2">
										<div class="bg-warning p-2">
											${ li.chatContent }
										</div>
										<div class="text-small">
											<fmt:formatDate value="${ li.chatSendDate }" pattern="MM/dd HH:mm"/>
										</div>
									</div>
								</c:if>
								<c:if test="${ memberId == li.chatReceiver }">
									<div class="col-8 py-2">
										<div class="bg-info p-2">
											${ li.chatContent }
										</div>
										<div class="text-small text-end">
											<fmt:formatDate value="${ li.chatSendDate }" pattern="MM/dd HH:mm"/>
										</div>
									</div>
									<div class="col-4"></div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="input-group pt-1">
						<textarea class="form-control" rows="4" cols="50"></textarea>
						<button class="input-group-text btn btn-secondary px-4">입력</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		window.onload=function(){
			document.getElementById("chatting").scrollTop = document.getElementById("chatting").scrollHeight;
		}
	</script>
</article>