<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap) -->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100"> 
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 본문 시작 -->
	<main class="form-signin w-45 m-auto">
		<div class="container-sm" style="margin-top: 50px; margin-bottom: 50px;">
			<div style="text-align: center;">
				<h4 style="margin-bottom: 30px">상담 가능 시간 (평일 09:00 - 18:00)</h4>
				<p>000동 000호 입력 후 입장하세요.</p>
			</div>
			<iframe src="https://service.dongledongle.com/hjhj" frameborder="0" width="100%" height="600vh"></iframe>
			<input type="button" class="btn btn-secondary" style="margin: auto; display: block;" value="메인으로" onclick="location.href='../main/main.jsp'">
		</div>	
	</main>
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>