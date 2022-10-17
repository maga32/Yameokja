<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>야먹자</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="row">
<!-- 좌측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
	<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6">
	<%@ include file="template/header.jsp" %>
	<jsp:include page="${ param.body }" />
	<%@ include file="template/footer.jsp" %>
	</div>
<!-- 우측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
</div>	
</body>
</html>