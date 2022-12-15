<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Delete</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 본문 내용 -->
	<main class="form-signin w-45 m-auto">
		<article>
			<form action="board_deletePro.jsp" method="post">
				<!-- 입력받지 않은 글번호도 함께 전달 -->
				<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
				<div>
					<div>
						<h4>글을 삭제 하시겠습니까?</h4><br>
					</div>
					<div>
						<input type="password" name="pass" >
					</div>
				</div>
				<br>
				<div>
					<input type="submit" value="삭제하기" class="btn btn-secondary">
				</div>
			</form>
			<div class="clear"></div>
		</article>
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