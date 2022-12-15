<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String id = (String)session.getAttribute("sId");
%>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Board Write</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 내용 -->
	<main class="container-sm">	
		<form action="board_writePro.jsp" method="post" style="margin-top: 50px;">
			<div>
				<input type="text" name="name" class="form-control" required="required" value="<%=id %>" placeholder="글쓴이"> 
				<input type="password" name="pass" class="form-control" required="required" placeholder="비밀번호">
			</div>
			<br>
			<div class="mb-3">
				<input type="text" name="subject" class="form-control" required="required" placeholder="제목을 입력해주세요">
			</div>	
			<div class="mb-3">
				<textarea class="form-control" name="content" rows="10" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<input type="submit" class="w-100 btn btn-secondary btn-lg" value="등록" >
		</form>
	</main>
	<!-- 푸터 들어가는곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는곳 -->
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>