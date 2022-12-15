<%@page import="board.NoticeBoardDTO"%>
<%@page import="board.NoticeBoardDAO"%>
<%@page import="java.util.ArrayList"%>
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
<script>
	<!-- 메인 이미지 슬라이드 -->
	var index = 0;   //이미지에 접근하는 인덱스
	window.onload = function(){
	slideShow();
	}
	function slideShow() {
	var i;
	var x = document.getElementsByClassName("img-fluid rounded mb-4 mb-lg-0");  //slide1에 대한 dom 참조
	for (i = 0; i < x.length; i++) {
	   x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
	}
	index++;
	if (index > x.length) {
	    index = 1;  //인덱스가 초과되면 1로 변경
	}   
	x[index-1].style.display = "block";  //해당 인덱스는 block으로
	setTimeout(slideShow, 2000);   //함수를 2초마다 호출
	}
</script>

<body class="d-flex flex-column min-vh-100"> 
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 본문 시작 -->
	<div class="container px-4 px-lg-5">
		<!-- 메인 이미지 (슬라이드 4장) -->
		<div class="row gx-4 gx-lg-5 align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/main_slide_1.jpg" >
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/main_slide_2.jpg">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/main_slide_3.jpg">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/main_slide_4.jpg">
			</div>
		<!-- 메인 이미지 옆 텍스트 -->
			<div class="col-lg-5"><h1 class="font-weight-light">
				품격있는 아파트<br>아이티 힐스테이트</h1>
				<p>대한민국 대표 주거 브랜드인<br> 아이티 힐스테이트가 대한민국 아파트의 어제와 오늘,<br> 그리고 내일을 제시하고, 만들어갑니다.</p>
			</div>
		</div>
		<!-- 텍스트 슬라이드 Notice 게시판 글 불러오기-->
		<div class="card text-white bg-secondary my-5 py-1 text-center">
			<div class="card-body"> 
				<div class ="animated-text">
					<div class="line">
		  			<%
		  			// BoardDAO 객체의 selectRecentBoardList() 메서드 호출하여
		  			// 최근 게시물 5개 목록 조회
		  			// => 파라미터 : 없음    리턴타입 : ArrayList<BoardDTO>(boardList)
		  			NoticeBoardDAO dao = new NoticeBoardDAO();
		  			ArrayList<NoticeBoardDTO> boardList = dao.selectRecentBoardList();
		  			for(NoticeBoardDTO board : boardList) {
		  			%>
					
					<div class="line"><a style="color: white; text-decoration: none;" href="../board/notice_content.jsp?num=<%=board.getNum()%>"><%=board.getSubject() %></a></div>
					<%} %>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 카드뉴스 3개 -->
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">[입주자 대상 증정 Event]</h2>
						<p class="card-text"><br>IT HILLSTATE의 로고가 새겨진<br>high-quality의 tarpaulin bag을<br>선착순 1,000명 한정 증정<br>※재고 소진 시 자동 종료 예정</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-secondary btn-sm" href="../images/main_card_tarpaulin.jpg" target=”_black”>상세 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">[입주자 대표 당선]</h2>
						<p class="card-text"><br><img src="../images/main_card_election_1.jpg"><img src="../images/main_card_election_2.jpg"><br>회장 : 류혜지 | 감사 : 류달봉</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-secondary btn-sm" href="../images/main_card_greeting.png" target=”_black”>상세 보기</a>
					</div>
				</div>
			</div>
		<div class="col-md-4 mb-5">
			<div class="card h-100">
				<div class="card-body">
					<h2 class="card-title">[스타벅스 입점확정]</h2>
					<br> <p class="card-text"><img src="../images/main_card_starbucks.png"></p>
				</div>
					<div class="card-footer">
						<a class="btn btn-secondary btn-sm" href="../images/main_card_starbucksinfo.jpg" target=”_black”>상세 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>