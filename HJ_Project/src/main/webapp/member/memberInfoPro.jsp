<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//2. 한글처리 & 변수 : 전달된 정보를 저장(아이디,비번,이름,나이,성별,이멜)
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String post_code = request.getParameter("post_code");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/hj_semi"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

Class.forName(driver);

Connection con = DriverManager.getConnection(url, user, password);

//3단계. SQL 구문 작성 및 전달
//=> student 테이블에서 학번과 이름이 일치하는 레코드의 이메일과 전화번호를 수정(UPDATE)
String sql = "UPDATE member SET name=?,email=?,post_code=?,address1=?,address2=?,phone=?,mobile=? WHERE id=? AND pass=?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, name);
pstmt.setString(2, email);
pstmt.setString(3, post_code);
pstmt.setString(4, address1);
pstmt.setString(5, address2);
pstmt.setString(6, phone);
pstmt.setString(7, mobile);
pstmt.setString(8, id);
pstmt.setString(9, pass);

pstmt.executeUpdate();
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - MemberInfo</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 수정 완료 알림 -->
	<script type="text/javascript">
		alert("회원님의 정보가 정상적으로 변경 되었습니다.");
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 시작 -->
	<h3 style="margin-top: 30px; margin-left: 350px;">내 정보 보기</h3>
	<main class="form-signin w-45 m-auto">
		<form action="updatePro.jsp" method="post" id="join" name="fr">
			<fieldset>
				<div class="row g-3">
		            <div class="col-sm-6">
						<label class="form-label">아이디</label>
						<div style="width:300px; float:left;">
			 				<input type="text" name="id" class="form-control" id="id" value="<%=id%>" readonly>
						</div>
					</div>
				</div>
				<div class="row g-3">
		            <div class="col-sm-6">
					<label class="form-label">비밀번호</label>
						<div style="width:300px; float:left;">
							<input type="password" name="pass" class="form-control" id="pass" placeholder="4~8글자 사이 입력" required="required" onblur="checkPasswd(this.value)">
							<span id="checkPasswdResult"></span>
						</div>
					</div>
				</div>			
				<div class="row g-3">
		            <div class="col-sm-6">
					<label class="form-label">비밀번호 재확인</label>
						<div style="width:300px; float:left;">
							<input type="password" name="pass2" class="form-control" id="pass2" placeholder="4~8글자 사이 입력" required="required" onblur="checkPasswd2(this.value)">
							<span id="checkPasswd2Result"></span>
						</div>
					</div>
				</div>	
				<div class="row g-3">
		            <div class="col-sm-6">
					<label class="form-label">이름</label>
					<div style="width:300px; float:left;">
						<input type="text" class="form-control" name="name" id="name" value="<%=name %>" readonly>
						</div>
					</div>
				</div>
				<div class="row g-3">
		            <div class="col-sm-6">
					<label class="form-label">이메일</label>
						<div style="width:300px; float:left;">
							<input type="email" class="form-control" name="email" id="email" value="<%=email %>" readonly>
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset>
			 	<div class="row g-3">
					<div class="col-sm-6">
			 			<label class="form-label">우편번호</label>
				 		<div style="width:300px; float:left;">
				 			<input type="text" class="form-control" name="post_code" id="post_code" value="<%=post_code %>" readonly>
				 		</div>
			 		</div>
		 		</div>			
				<div class="row g-3">
		            <div class="col-sm-6">
		 				<label class="form-label" style="padding-top: 5px;">주소</label>
		 				<div style="width:300px; float:left;">
				 			<input type="text" class="form-control" name="address1" value="<%=address1 %>" readonly> 
				 			<input type="text" class="form-control" name="address2" value="<%=address2 %>" readonly>
			 			</div>
			 		</div>
		 		</div>
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="phone" value="<%=phone %>" readonly>
	 					</div>
	 				</div>
				</div>
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">휴대전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="mobile" value="<%=mobile %>" readonly>
						</div>
	 				</div>
				</div>
			</fieldset>
		<div class="clear"></div>
		<br>
		</form>
		<div id="buttons" style="padding-left: 100px;">
			<input type="button" style="display:block;" value="메인으로" class="btn btn-secondary" onclick="location.href='../main/main.jsp'">
		</div>
		<br>
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