<%@page import="board.ProposalBoardDTO"%>
<%@page import="board.ProposalBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 글번호(num) 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));

// BoardDAO 객체 생성 후 게시물 상세 정보 조회를 위해 selectBoard() 메서드 호출(메서드 재사용)
// => 파라미터 : 글번호    리턴타입 : BoardDTO(board)
ProposalBoardDAO dao = new ProposalBoardDAO();
ProposalBoardDTO board = dao.selectProposalBoard(num);
%>	    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Proposal Update</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
<%
// 세션에 저장된 아이디가 null 이면 자바스크립트를 통해 "회원만 접근 가능합니다" 출력 후 돌아가기
String id = (String)session.getAttribute("sId");

if(id == null || !id.equals("admin") && !id.equals(board.getName())) {
	// 관리자 아이디가 아니고 세션 아이디가 일치하지 않으면 권한 없음
	// <-> 관리자 아이디이거나 세션 아이디가 일치하면 권한 있음
	%>
	<script>
		alert("접근 권한이 없습니다!");
		history.back();
	</script>
	<%
}
%>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 내용 -->
	<main class="container-sm">
		<form action="proposal_updatePro.jsp" method="post" style="margin-top: 50px;">
			<!-- 입력받지 않은 글번호도 함께 전달 -->
			<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
			<div>
				<input type="text" name="name" class="form-control" value="<%=board.getName()%>" required="required" placeholder="글쓴이"> 
				<input type="password" name="pass" class="form-control" required="required" placeholder="비밀번호">
			</div>
			<br>
			<div class="mb-3">
				<input type="text" name="subject" class="form-control" required="required" value="<%=board.getSubject()%>" placeholder="제목을 입력해주세요">
			</div>	
			<div class="mb-3">
				<textarea class="form-control" name="content" rows="10" placeholder="내용을 입력해주세요"><%=board.getContent()%></textarea>
			</div>
			<input type="submit" value="수정하기" class="w-100 btn btn-secondary btn-lg">
		</form>
		<div class="clear"></div>
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