<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - JoinSuccess</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 본문 시작 -->
	<main class="form-signin w-45 m-auto">
		<div align="center">
			<h1>회원 가입을 축하합니다!</h1><br>
			<!-- 홈으로 버튼 클릭 시 메인페이지(main/main.jsp)로 이동 -->
			<input type="button" class="btn btn-secondary" value="홈으로" onclick="location.href='../main/main.jsp'">
			<!-- 로그인 버튼 클릭 시 로그인 폼 페이지(member/login.jsp) 로 이동 -->
			<input type="button" class="btn btn-secondary" value="로그인" onclick="location.href='login.jsp'">
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