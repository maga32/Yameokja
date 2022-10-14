<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="resources/css/myPostList.css">
<link rel="stylesheet" type="text/css" href="resources/css/blockList.css">
<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/mypage.js"></script>

<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">좌 여백
			</div>

			<div class="col-lg-6 col-md-8 col-sm-10 col-12">
				<!--     ------------------------------------------ -->
				<div class="col-12">
					<div class="col-12">
						<%@ include file="template/header.jsp"%>
					</div>
					<div class="col-12">
						<jsp:include page="${ param.body }" />
					</div>
					<div class="col-12">
						<jsp:include page="template/footer.jsp" />
					</div>
				</div>

				<!--     ------------------------------------------ -->
			</div>
			<div class="col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">우 여백
			</div>
		</div>

	</div>
</body>
</html>

