<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// URL 파라미터로 전달되는 아이디(id) 와 중복체크결과(isDuplicate) 가져와서 변수에 저장
String id = request.getParameter("id");
boolean isDuplicate = Boolean.parseBoolean(request.getParameter("isDuplicate"));
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Check Id</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head> 
<title>IT HILLSTATE - Check Id</title>
<script type="text/javascript">
	function getCheckId() {
		// 만약, 파라미터로 전달받은 id 가 null 이 아니면 아이디 입력란에 해당 아이디 표시
		<%if(id != null) {%>
			document.fr.id.value = "<%=id%>";
			// if 문을 사용하여 중복 여부 판별
			// 만약, 파라미터로 전달받은 isDuplicate 값이 true 일 경우 = 아이디 중복
			// => "checkIdResult" 선택자에 "이미 사용중인 아이디" 출력(색상 : RED)
			// 아니면, "사용 가능한 아이디" 출력(색상 : GREEN)
			<%if(isDuplicate == true) {%>
				document.getElementById("checkIdResult").innerHTML = "이미 사용중인 아이디 입니다";
				document.getElementById("checkIdResult").style.color = "RED";
			<%} else {%>
				var btn = "<input type='button' class='btn btn-secondary btn-sm' value='사용하기' onclick='useId()'>";
				document.getElementById("checkIdResult").innerHTML = "사용 가능한 아이디입니다<br>" + btn;
				document.getElementById("checkIdResult").style.color = "GREEN";
			<%}%>
			
		<%}%>	
	}
	// 사용 가능한 아이디일 때 아이디 사용 버튼 클릭 시 호출되는 메서드
	function useId() {
		// 부모창(join.jsp)의 ID 입력란에 중복 확인이 완료된 ID 값 표시
		//window.opener.document.fr.id.value = document.fr.id.value;
		window.opener.document.fr.id.value = "<%=id%>";
		// 현재 자식창(check_id.jsp) 닫기
		window.close();
	}
</script>
<body class="d-flex flex-column min-vh-100" onload="getCheckId()">
	<main class="form-signin w-45 m-auto" style="text-align: center; ">
		<form action="check_idPro.jsp" name="fr">
			<p>아이디를 입력해주세요</p>
			<input type="text" class="form-control form-control-sm" name="id" required="required"><br>
			<input type="submit" value="중복확인" class="btn btn-secondary btn-sm"><br>
			<div id="checkIdResult"></div>
		</form>
	</main>   
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>