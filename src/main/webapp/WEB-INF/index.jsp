<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  <link rel="stylesheet" type="text/css" href="resources/css/myPostList.css">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/formcheck.js"></script>	
  <meta charset="UTF-8">
  <title>MyPage</title>
</head>
<body>
  <div class="row frame">
    
    <div class="d-none d-sm-block col-sm-2 col-lg-3">
      left Bar
    </div>
    
    <div class="col-12 col-sm-8 col-lg-6">
    	<div class="col-12">
    		<%@ include file="template/header.jsp" %>
    	</div>
		<div class="col-12">
			<jsp:include page="${ param.body }"/>
		</div>
		<div class="col-12">
			<jsp:include page="template/footer.jsp"/>
		</div>
    </div>
    
    <div class="d-none d-sm-block col-sm-2 col-lg-3">
      right Bar
    </div>
    
  </div>
</body>
</html>

<%-- <%@ include file="template/header.jsp" %> --%>
<%-- 	<jsp:include page="${ param.body }" /> --%>
<%-- 	<%@ include file="template/footer.jsp" %> --%>