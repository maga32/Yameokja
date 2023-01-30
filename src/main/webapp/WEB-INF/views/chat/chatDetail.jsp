<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>야먹자</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
		 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  	<script src="/yameokja/resources/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/yameokja/resources/css/chat.css" />
		<script type="text/javascript" src="/yameokja/resources/js/chat.js"></script>
		<script src="/yameokja/resources/js/common.js"></script>
	</head>
	<body>
		<div class="fixed-top fs-1 d-flex justify-content-between">
				<!-- 헤더 생기면 대체 -->
			<div class="col-12 bg-warning py-4 mb-2"></div>
		</div>
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
			<div class="col-12 py-4 mb-2"></div>
			<div class="px-4">			
				<div class="pt-2 px-2">
					<h1>대화창</h1>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">
						<div class="border rounded-circle d-flex align-items-center" style="width:120px; height:120px; overflow:hidden;">
							<img src="/yameokja/resources/IMG/member/${ target.memberPhoto }" style="width:120px;">
						</div>
					</div>
					<div class="col-8">
						<div class="col-12">
							<button class="btn memberInfo" data-memberId="${ target.memberId }"><h1>${ target.memberNickname }</h1></button>
						</div>
						<div class="col-12 pt-5 text-end">
							<button onclick="chatLeave('${ chatIds }')" class="btn text-large">채팅방나가기</button>
							|
							<c:if test="${ isBlockedTarget }">
								<button class="btn unblockTarget" data-targetId="${ target.memberId }"><span class="text-danger">차단해제</span></button>
							</c:if>
							<c:if test="${ not isBlockedTarget }">
								<button class="btn blockTarget" data-targetId="${ target.memberId }"><span class="text-danger">차단</span></button>
							</c:if>
							&nbsp;
						</div>
					</div>
					<div class="p-3">
						<iframe src="chatting?chatIds=${ chatIds }" width="100%" height="400px" id="chattingFrame"></iframe>
						<c:if test="${ not isBlockedMe }">
							<form id="chatSend" name="chatSend">
								<input type="hidden" name="chatIds" id="chatIds" value="${ chatIds }">
								<div class="input-group pt-1">
									<textarea class="form-control" rows="4" cols="50" name="chatContent" id="chatContent"></textarea>
									<button id="chatSendConfirm" class="input-group-text btn btn-secondary px-4">입력</button>
								</div>
							</form>
						</c:if>
						<c:if test="${ isBlockedMe }">
							<div class="text-center py-4">
								나를 차단한 상대입니다.
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<script>
			var url = "wss://" + window.location.host + "/yameokja/chatserver/${ chatIds }";
			var ws = new WebSocket(url);
			ws.onopen = function (evt) {
		   		console.log('서버 연결 성공');
			};
			
			ws.onmessage = function (evt) {
				console.log(evt.data); 
				if(evt.data == "${ target.memberId }#read"){
					$("#chattingFrame").contents().find(".readCount").css("display", "none");
				}
				if(evt.data == "${ target.memberId }#send"){
					setTimeout(function() {
						$("#chattingFrame").attr("src", $("#chattingFrame").attr("src"));
						setTimeout(function() {
							ws.send("${ memberId }#read");
						}, 1000);
					}, 1000);
				}
			};
	
			setTimeout(function() {
				ws.send("${ memberId }#read");
			}, 1000);
			
			ws.onclose = function (evt) {
				console.log('소켓이 닫힙니다.');
			};
			
			ws.onerror = function (evt) {
				alert(evt.data);
			};
			
			$("#chatSendConfirm").click(function(){
				ws.send("${ memberId }#send");
			});
		</script>
	</body>
</html>