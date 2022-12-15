<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 아이디("sId" 속성값) 가져오기
String id = (String)session.getAttribute("sId"); // Object -> String 다운캐스팅(= 형변환)
%>
	<link href="../css/styles.css" rel="stylesheet" />
	<!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script>
function confirm_logout() {
	// confirm dialog 를 활용하여 "로그아웃 하시겠습니까?" 질문 처리
	var result = confirm("로그아웃 하시겠습니까?");
	// 예(true)일 경우 logout.jsp 페이지로 이동
	if(result) {
		location.href = "../member/logout.jsp";
	}
}
</script>
<!-- navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container px-5">
		<a class="navbar-brand" href="../main/main.jsp"><img src="../images/top_logo.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="../main/main.jsp">홈</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="../board/board.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">아파트 소개</a>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="../information/brandInfo.jsp">브랜드 소개</a></li>
						<li><a class="dropdown-item" href="../information/storeInfo.jsp">상가 소개</a></li>
						<li><a class="dropdown-item" href="../information/locationInfo.jsp">오시는 길</a></li>
					</ul>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="../board/board.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="../board/notice.jsp">공지사항</a></li>
						<li><a class="dropdown-item" href="../board/board.jsp">자유게시판</a></li>
						<li><a class="dropdown-item" href="../board/album.jsp">내반소</a></li>
						<li><a class="dropdown-item" href="../board/download.jsp">자료실</a></li>
						<li><a class="dropdown-item" href="../board/proposal.jsp">건의함</a></li>
					</ul>
				</li>
				<!-- 
				세션 아이디("sId") 가 존재하지 않을 경우(= null) login 과 join 링크 표시하고
				아니면, 세션 아이디와 logout 링크 표시
				(단, 세션 아이디가 관리자일 경우 logout 링크 옆에 관리자페이지 링크 표시)
				-->
				<%if(id == null) { %>
				<li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="../member/join.jsp">회원가입</a></li>
				<%} else { %>
				<!-- 로그아웃(logout) 링크 클릭 시 자바스크립트 함수 호출 -->
				<li class="nav-item"><a class="nav-link" href="../member/memberInfo.jsp"><%=id %>님 |</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:confirm_logout()">로그아웃</a></li>
				<!-- 아이디가 "admin" 일 경우 관리자 페이지 링크 표시 -->
				<%if(id.equals("admin")) { %>
				<li class="nav-item"><a class="nav-link" href="../admin/adminMain.jsp">| 관리자페이지</a></li>
				<%} %>
				<%} %>
           	</ul>
       	</div>
   	</div>
</nav>    





