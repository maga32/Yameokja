<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="content-language" content="kr">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	
	<!-- 파비콘 -->
	<link rel="shortcut icon" href="/yameokja/resources/IMG/favicon/favicon.ico">
	<link rel="apple-touch-icon" sizes="57x57" href="/yameokja/resources/IMG/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/yameokja/resources/IMG/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/yameokja/resources/IMG/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/yameokja/resources/IMG/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/yameokja/resources/IMG/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/yameokja/resources/IMG/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/yameokja/resources/IMG/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/yameokja/resources/IMG/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/yameokja/resources/IMG/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/yameokja/resources/IMG/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/yameokja/resources/IMG/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/yameokja/resources/IMG/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/yameokja/resources/IMG/favicon/favicon-16x16.png">
	<link rel="manifest" href="/yameokja/resources/IMG/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/yameokja/resources/IMG/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
	<!-- 메타태그 및 오픈그래프 관련 (추후 이미지링크 수정필요)-->
    <meta name="title" content="야먹자">
    <meta name="author" content="야먹자 프로젝트 3팀">
    <meta name="description" content="프로젝트 야먹자 입니다">
    <meta name="keywords" content="야먹자, 지역, 음식, 맛집">
    <meta property="og:locale" content="ko_KR">
    <meta property="og:type" content="website">
    <meta property="og:rich_attachment" content="true">
    <meta property="og:site_name" content="야먹자">
    <meta property="og:title" content="야먹자">
    <meta property="og:description" content="프로젝트 야먹자 입니다">
    <meta property="og:keywords" content="야먹자, 지역, 음식, 맛집">
    <meta property="og:image" content="https://sung-a.duckdns.org/yameokja/resources/IMG/favicon/ms-icon-144x144.png">
    <meta property="og:url" content="" id="meta-location">
    <script>
      document.getElementById('meta-location').setAttribute('content', location.href);
    </script>
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="야먹자">
    <meta name="twitter:title" content="야먹자">
    <meta name="twitter:description" content="프로젝트 야먹자 입니다">
    <meta name="twitter:keywords" content="야먹자, 지역, 음식, 맛집">
    <meta name="twitter:image" content="https://sung-a.duckdns.org/yameokja/resources/IMG/favicon/ms-icon-144x144.png">
    <meta name="twitter:creator" content="야먹자 프로젝트 3팀">
    <meta itemprop="name" content="야먹자">
    <meta itemprop="description" content="프로젝트 야먹자 입니다">
    <meta itemprop="keywords" content="야먹자, 지역, 음식, 맛집">
    <meta itemprop="image" content="https://sung-a.duckdns.org/yameokja/resources/IMG/favicon/ms-icon-144x144.png">
    <meta name="apple-mobile-web-app-title" content="야먹자">
    
	<title>야먹자</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="/yameokja/resources/css/index.css" />
  	<script src="/yameokja/resources/js/jquery-3.2.1.min.js"></script>
  	<script src="/yameokja/resources/js/common.js"></script>
</head>
<body>
<div class="row">
<!-- 좌측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3 m-0 p-0"></div>
	<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6 m-0 p-0">
	<%@ include file="template/header.jsp" %>
	<jsp:include page="${ param.body }" />
	<%@ include file="template/footer.jsp" %>
	</div>
<!-- 우측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3 m-0 p-0"></div>
</div>	
</body>
</html>