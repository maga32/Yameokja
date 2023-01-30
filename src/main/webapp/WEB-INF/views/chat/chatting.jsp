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
		<div class="border" style="overflow:scroll; height:400px" id="chatting">
			<div class="row px-3">
				<c:forEach var="li" items="${ chatTargetList }">
					<c:if test="${ memberId == li.chatSender }">
						<div class="col-4"></div>
						<div class="col-8 py-2">
							<div class="row">
								<div class="d-flex flex-row-reverse">
									<div class="text-warning pt-3 px-0 float-end">▶</div>
									<div class="d-inline px-3 py-2 bg-warning border border-warning rounded float-end">
										<span style="white-space:pre-line;">${ li.chatContent }</span>
									</div>
									<div class="d-inline text-center mx-2">
										<span class="text-warning readCount">
											${ li.chatReadCheck == 0 ? "1" : "" }
										</span>
										<br>
										<a href="javascript:;" onclick="chatDelete('${ li.chatNo }')">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</a>
									</div>
								</div>
								<div class="col-12 text-small text-end">
									<fmt:formatDate value="${ li.chatSendDate }" pattern="YY/MM/dd HH:mm"/>
									&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${ memberId == li.chatReceiver }">
						<div class="col-8 py-2">
							<div class="row">
								<div class="d-flex flex-row">
									<div class="text-info pt-3 float-start">◀</div>
									<div class="d-inline px-3 py-2 bg-info border border-info rounded float-start">
										<span style="white-space:pre-line;">${ li.chatContent }</span>
									</div>
									<div class="d-inline text-center mx-2">
										<br>
										<a href="javascript:;" onclick="chatDelete('${ li.chatNo }')">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</a>
									</div>
								</div>
								<div class="col-12 text-small text-start">
									&nbsp;&nbsp;&nbsp;
									<fmt:formatDate value="${ li.chatSendDate }" pattern="YY/MM/dd HH:mm"/>
								</div>
							</div>
						</div>
						<div class="col-4"></div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<script>
			window.onload=function(){
				document.getElementById("chatting").scrollTop = document.getElementById("chatting").scrollHeight;
			}
		</script>
	</body>
</html>