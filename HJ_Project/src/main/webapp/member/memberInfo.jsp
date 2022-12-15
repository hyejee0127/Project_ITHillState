<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body class="d-flex flex-column min-vh-100">
<%
request.setCharacterEncoding("UTF-8");

String sId = (String)session.getAttribute("sId");

String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/hj_semi"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

// 1단계. 드라이버 클래스 로드
Class.forName(driver);
	
// 2단계. DB 연결
// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
Connection con = DriverManager.getConnection(url, user, password);
	
// 3단계. SQL 구문 작성 및 전달
// => idx 가 일치하는 레코드 조회
String sql = "SELECT * FROM member WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, sId);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();

if(rs.next()) { // 조회 결과가 존재할 경우
%>    
<!-- 다음 주소 API 사용을 위한 코드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // => 간단하게 도로명 주소를 무조건 사용
                document.getElementById('post_code').value = data.zonecode; // 우편번호
                document.getElementById("address1").value = data.roadAddress; // 주소(도로명 주소)
                
				document.getElementById("address2").focus();                
            }
        }).open();
    }
</script>
<!-- ============================== -->
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 시작 -->
	<h3 style="margin-top: 30px; margin-left: 350px;">내 정보 보기</h3>
	<main class="form-signin w-45 m-auto">
		<div class="col-md-7 col-lg-8">
			<form action="memberInfoPro.jsp" method="post" id="join" name="fr">
			<fieldset>
				<div class="row g-3">
		            <div class="col-sm-6">
						<label class="form-label">아이디</label>
						<div style="width:300px; float:left;">
			 			<input type="text" name="id" class="form-control" id="id" value="<%=rs.getString("id")%>">
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
						<input type="text" class="form-control" name="name" id="name" value="<%=rs.getString("name") %>">
						</div>
					</div>
				</div>
				<div class="row g-3">
		            <div class="col-sm-6">
					<label class="form-label">이메일</label>
					<div style="width:300px; float:left;">
						<input type="email" class="form-control" name="email" id="email" value="<%=rs.getString("email") %>">
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset>
		 		<div class="row g-3">
					<div class="col-sm-6">
			 			<label class="form-label">우편번호</label>
				 		<div style="width:300px; float:left;">
				 			<input type="text" class="form-control" name="post_code" id="post_code" value="<%=rs.getString("post_code") %>" onclick="execDaumPostcode()">
				 		</div>
			 		</div>
		 		</div>				
				<div class="row g-3">
		            <div class="col-sm-6">
		 				<label class="form-label" style="padding-top: 5px;">주소</label>
		 				<div style="width:300px; float:left;">
			 			<input type="text" class="form-control" name="address1" id="address1" value="<%=rs.getString("address1") %>"> 
			 			<input type="text" class="form-control" name="address2" id="address2" value="<%=rs.getString("address2") %>">
			 			</div>
			 		</div>
		 		</div>
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="phone" value="<%=rs.getString("phone") %>">
	 					</div>
	 				</div>
				</div>
		 		
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">휴대전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="mobile" value="<%=rs.getString("mobile") %>">
						</div>
	 				</div>
				</div>
			</fieldset>
			<div class="clear"></div>
			<br>
			<div id="buttons" style="text-align: center;">
				<input type="submit" value="수정" class="btn btn-secondary">
				<input type="reset" value="취소" class="btn btn-secondary">
				<input type="button" value="탈퇴" class="btn btn-secondary" onclick="location.href='deleteId.jsp'">
			</div>
		</form>
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
<%
}
%>	
</body>
</html>