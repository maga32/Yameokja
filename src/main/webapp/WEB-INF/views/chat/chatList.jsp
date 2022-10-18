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
	</head>
	<body>
		<div class="fixed-top fs-1 d-flex justify-content-between">
				<!-- 헤더 생기면 대체 -->
			<div class="col-12 bg-warning py-4 mb-2"></div>
		</div>
		<div class="fixed-top text-end fs-1">
			<a href="#" onclick="javascript:window.close();">
				<i class="fa fa-times" aria-hidden="true"></i>
			</a>
			&nbsp;&nbsp;
		</div>
		
		<div class="row">
			<div class="col-12 py-4 mb-2"></div>
			<div class="px-4">			
				<c:forEach var="li" items="${ chats }">
					<c:set var="i" value="${ i+1 }"/>
					<div class="border rounded my-2 p-2">
						<div class="row">
						
							<div class="col-4">
								<a href=""><!-- 추후 memberId로 프로필 보는 링크 삽입 ${ members[ i-1 ].memberId } -->
									<!--  추후 src를 memberPhoto 링크로 변경필요 ${ members[ i-1 ].memberPhoto } -->
									<img class="border rounded-circle" src="https://picsum.photos/100/100">
								</a>
							</div>
							
							<div class="col-8">
								<a href="chatDetail?chatIds=${ li.chatIds }">
									<div class="row">
										<div class="d-flex justify-content-between">
											<div class="fs-3">
												${ members[ i-1 ].memberNickname }
											</div>
											<c:if test="${ li.chatReceiver == sessionScope.memberId && li.chatReadCheck == 0 }">
												<!-- 안읽은경우 표시 -->
												<i class="fa fa-circle fa-lg text-danger" aria-hidden="true"></i>
											</c:if>
										</div>
										<div class="col-8 text-truncate text-large pt-2">
											${ li.chatContent }
										</div>
										<div class="col-4">
											<div class="text-middle text-end">마지막 대화</div>
											<div class="text-middle text-end">
												<fmt:formatDate value="${ li.chatSendDate }" pattern="yy/MM/dd HH:mm:ss"/>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>