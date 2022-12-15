<%@page import="board.NoticeBoardDTO"%>
<%@page import="board.NoticeBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 날짜 및 시각 정보 표시 형식을 변경하기 위해 SimpleDateFormat 클래스 활용
// => 생성자 파라미터로 표시 형식 문자열을 사용한 패턴 지정
// => ex) "yy-MM-dd HH:mm" 지정 시 "22-08-19 16:15" 형식으로 변환됨
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
// => 패턴이 지정된 SimpleDateFormat 객체의 format() 메서드를 호출하여 변환할 날짜 객체 전달

// 파라미터로 전달받은 검색어(keyword) 가져와서 변수에 저장
String keyword = request.getParameter("keyword");
String searchSelect = request.getParameter("searchSelect");

// 만약, 검색어 파라미터가 없을 경우 기본값을 널스트링("")으로 설정
if(keyword == null) {
	keyword = "";
}
if(searchSelect == null) {
	searchSelect = "";	
}
%>	    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Notice Search</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<!-- <link href="../css/bootstrap.css" rel="stylesheet" /> -->
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 내용 -->
	<main class="container-sm">
		<br>
		<h3>공지사항</h3>
		<article>	
			<form style="width: 60%; float: right;" action="notice_search.jsp" method="get">
				<div class="input-group w-50">
					<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchSelect">
						<option selected>검색조건</option>
		      			<option value="subject">제목</option>
		         		<option value="content">내용</option>
		      			<option value="name">글쓴이</option>
		  			</select>
					<input type="text"  style="width: 40%;" class="form-control" placeholder="검색어를 입력하세요" name="keyword" class="input_box" required="required">
					<button type="submit" class="btn btn-secondary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
						</svg>
					</button>
				</div>
			</form>
			<br>
			<table class="table table-striped">
				<tr>
					<th scope="col" class="tno">번호</th>
					<th scope="col" class="ttitle">제목</th>
					<th scope="col" class="twrite">글쓴이</th>
					<th scope="col" class="tdate">작성일</th>
					<th scope="col" class="tread">조회</th>
				</tr>
<%
// -----------------------------------------------------------------------
// 페이징 처리를 위한 계산 작업
// 1. 한 페이지에서 표시할 게시물 목록 수와 페이지 목록 수 설정
int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
// 2. 현재 페이지 번호 설정(pageNum 파라미터)
int pageNum = 1; // 현재 페이지 번호 기본값을 1로 설정
// 만약, pageNum 파라미터가 존재할 경우 가져와서 저장
if(request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
// 3. 현재 페이지에서 목록으로 표시할 첫 게시물의 행 번호 계산
//    => (현재페이지 - 1) * 페이지 당 게시물 목록 갯수
int startRow = (pageNum - 1) * listLimit;
				
// 4. 현재 페이지에서 목록으로 표시할 마지막 게시물 행 번호 계산
//    => 시작 행번호 + 페이지 당 게시물 목록 갯수 - 1
//    => 현재 과정에서는 불필요한 작업(시작행부터 목록 갯수만큼 조회하므로)
// -----------------------------------------------------------------------
// 게시물 목록 조회를 위해 BoardDAO 객체 생성
NoticeBoardDAO dao = new NoticeBoardDAO();

// BoardDAO 객체의 selectBoardList() 메서드를 호출하여 게시물 목록 조회
// => 파라미터 : 시작 행번호, 페이지 당 게시물 목록 수    
//    리턴타입 : ArrayList<BoardDTO>(boardList)
ArrayList<NoticeBoardDTO> boardList = dao.selectBoardList(startRow, listLimit, searchSelect, keyword);
// 반복문을 통해 ArrayList 객체를 차례대로 접근하여
// BoardDTO 객체를 꺼낸 후 테이블에 출력
// for(int i = 0; i < boardList.size(); i++) {
// ArrayList 객체의 제네릭타입이 BoardDTO 타입으로 지정되어 있으므로
// ArrayList 객체로부터 꺼낸 데이터는 BoardDTO 타입이 확정된다.
// 즉, 별도로 Object -> BoardDTO 타입 다운캐스팅(= 강제형변환)이 불필요
// 향상된 for문을 사용하여 반복문을 동일하게 구현 가능
// for(객체를 저장할 변수 선언 : 객체가 저장되어 있는 변수) {}
// => 좌변의 객체에 저장된 데이터를 꺼내서 우변의 변수에 저장 반복
for(NoticeBoardDTO board : boardList) {
%>
				<!-- 반복문 내에서 각 레코드를 각 행에 표시 -->
				<tr onclick="location.href='notice_content.jsp?num=<%=board.getNum()%>'">
					<th scope="row"><%=board.getNum() %></th>
					<td class="left" style="text-align: left;"><%=board.getSubject() %></td>
					<td><%=board.getName() %></td>
					<td><%=sdf.format(board.getDate()) %></td>
					<td><%=board.getReadcount() %></td>
<%
}
%>
				</tr>
			</table>
			<div>
				<input type="button" value="글쓰기" class="btn btn-secondary" onclick="location.href='notice_write.jsp'" style="float: right;">
			</div>
		</article>
	<br><br>
	<div style="text-align: center;">
		<ul class="pagination" style="display: inline-block;">
			<%
			// 한 페이지에서 보여줄 페이지 갯수 계산
			// 1. BoardDAO 객체의 selectBoardListCount() 메서드를 호출하여 전체 게시물 수 조회
			// => 파라미터 : 없음    리턴타입 : int(boardListCount)
			int boardListCount = dao.selectBoardListCount(searchSelect, keyword);
			
			// 2. 한 페이지에서 표시할 페이지 갯수 설정
			int pageListLimit = 10; // 한 페이지에서 표시할 페이지 목록을 10개로 제한
			
			// 3. 전체 페이지 수 계산
			// => 전체 게시물 수를 페이지 당 페이지 갯수로 나눈 나머지가 0이면 몫을 그대로 사용하고
			//    아니면 나눗셈 결과 + 1
			int maxPage = boardListCount / pageListLimit 
							+ (boardListCount % pageListLimit == 0 ? 0 : 1);
			// 위의 삼항연산자 부분 대신 사용 가능한 if문
			//if(boardListCount / pageListLimit > 0) {
			//maxPage++;
			//}
			
			// 4. 시작 페이지 번호 계산
			// => (현재 페이지 - 1) / 페이지목록갯수 * 페이지목록갯수 + 1
			// ex) 현재 페이지 : 1 => 시작 페이지 = (1 - 1) / 10 * 10 + 1 = 1 페이지
			//     현재 페이지 : 2 => 시작 페이지 = (2 - 1) / 10 * 10 + 1 = 1 페이지 
			//     현재 페이지 : 10 => 시작 페이지 = (10 - 1) / 10 * 10 + 1 = 1 페이지
			//     현재 페이지 : 15 => 시작 페이지 = (15 - 1) / 10 * 10 + 1 = 11 페이지
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			// 5. 끝 페이지 번호 계산
			// => 시작 페이지 + 페이지목록갯수 - 1
			int endPage = startPage + pageListLimit - 1;
			
			// 6. 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
			//    끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			%>
			<!-- 이전 페이지 버튼(Prev) 클릭 시 현재 페이지 번호 - 1 값 전달 -->
			<!-- 단, 현재 페이지번호가 1 페이지보다 클 경우 하이퍼링크 표시(아니면 제거) -->
			<%if(pageNum == 1) { %>
				<li class="page-item" style="display: inline-block;">
				<a class="page-link" href="javascript:void(0)" style="color: black;">&laquo;</a>
				</li>
			<%} else { %>
				<li class="page-item" style="display: inline-block;">				
					<a class="page-link" href="notice_search.jsp?keyword=<%=keyword%><%=pageNum - 1%>" style="color: black;">&laquo;</a>
				</li>
			<%} %>
			<!-- for문을 사용하여 startPage ~ endPage 까지 목록 표시 -->
			<%for(int i = startPage; i <= endPage; i++) { %>
				<!-- 현재 페이지 번호(pageNum) 가 i 값과 같을 경우 하이퍼링크 제거 -->
				<li class="page-item" style="display: inline-block;">
				<%if(pageNum == i) { %>
					<a class="page-link" href="javascript:void(0)" style="color: black;"><%=i %></a>
				<%} else { %>
					<a class="page-link" href="notice_search.jsp?keyword=<%=keyword%><%=i %>" style="color: black;"><%=i %></a>
				<%} %>
					</li>
			<%} %>
			<!-- 다음 페이지 버튼(Next) 클릭 시 현재 페이지 번호 + 1 값 전달 -->
			<!-- 단, 현재 페이지번호가 최대 페이지 번호보다 작을 경우 하이퍼링크 표시(아니면 제거) -->
			<%if(pageNum == maxPage) { %>
				<li class="page-item" style="display: inline-block;">
					<a class="page-link" href="javascript:void(0)" style="color: black;">&raquo;</a>
				</li>
			<%} else { %>
				<li class="page-item" style="display: inline-block;">
					<a class="page-link" href="notice_search.jsp?keyword=<%=keyword %><%=pageNum + 1%>" style="color: black;">&raquo;</a>
				</li>
			<%} %>
		</ul>
	</div>
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