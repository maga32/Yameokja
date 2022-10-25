<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Report</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css" />
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<BODY>
	<h3>신고 결과</h3>
	<hr>
		<button onclick="window.opener.location.href='main'; window.close();">메인으로</button>
		<button onclick="window.opener.location.href='mypage'; window.close();">나의 신고목록 보기</button>
</BODY>
</html>