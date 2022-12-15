<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	<title>IT HILLSTATE - adminMain Search</title>
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
	<!-- 본문 내용 -->
	<main class="container-sm">
	<br>
	<h3>회원 목록</h3>
	<br>
		<form style="width: 60%; float: right;" action="adminMain_search.jsp" method="get">
			<div class="input-group w-50">
				<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchSelect">
					<option selected>검색조건</option>
	      			<option value="id">아이디</option>
	         		<option value="name">이름</option>
	      			<option value="address2">동호수</option>
	  			</select>
				<input type="text"  style="width: 40%;" class="form-control" placeholder="검색어를 입력하세요" name="keyword" class="input_box" required="required">
				<button type="submit" class="btn btn-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
					</svg>
				</button>
			</div>
		</form>	
		<table class="table table-hover">
		    <tr class="table-secondary">
		      <th scope="col" style="text-align: center;">아이디</th>
		      <th scope="col" style="text-align: center;">비밀번호</th>
		      <th scope="col" style="text-align: center;">이름</th>
		      <th scope="col" style="text-align: center;">이메일</th>
		      <th scope="col" style="text-align: center;">우편번호</th>
		      <th scope="col" style="text-align: center;">주소1</th>
		      <th scope="col" style="text-align: center;">주소2</th>
		      <th scope="col" style="text-align: center;">전화</th>
		      <th scope="col" style="text-align: center;">휴대전화</th>
		      <th scope="col" style="text-align: center;">가입일자</th>
		    </tr>
<%
// 데이터베이스 작업 수행을 위한 BoardDAO 객체 생성
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> memberList = dao.selectMemberList(searchSelect, keyword);
// 데이터베이스 조회 작업을 수행하기 위해 BoardDAO 객체의 select() 메서드 호출
// => 파라미터 : 없음    리턴타입 : java.util.ArrayList(boardList)
// for 문을 사용하여 ArrayList 객체 크기만큼 반복
for(int i = 0; i < memberList.size(); i++) {
	// ArrayList 객체의 get(index) 메서드를 호출하여 ArrayList 객체 내의 데이터 꺼내기
	// 주의! 데이터 저장 시 BoardDTO -> Object 업캐스팅이 일어났으므로
	// 데이터를 꺼내는 시점에서 리턴타입도 Object 타입이다!
//		Object o = boardList.get(i);
	// 주의! 업캐스팅 된 객체는 상속받은 멤버(공통 멤버)에만 접근 가능
//		int idx = o.getIdx(); // BoardDTO 객체의 getter 호출 불가능!
	// ---------------------------------------------------------------
	// BoardDTO 객체의 고유멤버에 접근하기 위해서는 다운캐스팅 필수!
	MemberDTO member = (MemberDTO)memberList.get(i); // Object -> BoardDTO 다운캐스팅
%>    
	    	<tr>
				<th scope="row"><%=member.getId() %></th>
				<td><%=member.getPass() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getEmail() %></td>
				<td><%=member.getPost_code() %></td>
				<td><%=member.getAddress1() %></td>
				<td><%=member.getAddress2() %></td>
				<td><%=member.getPhone() %></td>
				<td><%=member.getMobile() %></td>
				<td><%=member.getDate() %></td>
<%
} 
%>
			</tr>
		</table>







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