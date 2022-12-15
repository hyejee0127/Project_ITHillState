<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Join</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
<script>
function checkId() {
	// check_id.jsp 페이지를 새 창으로 열기(가로 : 400, 세로 : 200)
	window.open("check_id.jsp", "ID중복확인", "width=300,height=200");
}	
function checkPasswd(pass) {
	var checkpasswd = document.getElementById('checkPasswdResult');
	if(pass.length >= 4 && pass.length <= 8) {
		checkpasswd.innerHTML = "사용 가능한 패스워드";
		checkpasswd.style.color = "blue";
	} else {
		checkpasswd.innerHTML = "사용 불가능한 패스워드";
		checkpasswd.style.color = "red";
	}
}
function checkPasswd2() {
	var checkpasswd2 = document.getElementById('checkPasswd2Result');
	if(document.getElementById('pass').value == document.getElementById('pass2').value) {
		checkpasswd2.innerHTML = "비밀번호 일치";
		checkpasswd2.style.color = "blue";
	} else {
		checkpasswd2.innerHTML = "비밀번호 불일치";
		checkpasswd2.style.color = "red";
	}
}

</script>
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
	<h3 style="margin-top: 30px; margin-left: 350px;">회원 가입</h3>
 	<main class="form-signin w-45 m-auto">
 	<div class="col-md-7 col-lg-8">
		<form action="joinPro.jsp" method="post" id="join" name="fr">
			<fieldset>	
	 			<div class="row g-3">
		            <div class="col-sm-6">
						<label class="form-label">아이디</label>
						<div style="width:300px; float:left;">
			 				<input type="text" name="id" class="form-control" id="id" placeholder="중복확인" readonly="readonly" onclick="checkId()">
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
							<input type="text" class="form-control" name="name" id="name" required="required">
						</div>
					</div>
				</div>
				<div class="row g-3">
					<div class="col-sm-6">
						<label class="form-label">이메일</label>
						<div style="width:300px; float:left;">
							<input type="email" class="form-control" name="email" id="email" required="required">
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset>
		 		<div class="row g-3">
					<div class="col-sm-6">
			 			<label class="form-label">우편번호</label>
				 		<div style="width:300px; float:left;">
				 			<input type="text" class="form-control" name="post_code" id="post_code" placeholder="우편번호" readonly="readonly" onclick="execDaumPostcode()">
				 		</div>
			 		</div>
		 		</div>		
		 		<div class="row g-3">
					<div class="col-sm-6">
			 			<label class="form-label">주소</label>
				 		<div style="width:300px; float:left;">
				 			<input type="text" class="form-control" name="address1" id="address1" placeholder="기본주소"> 
				 			<input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소">
				 		</div>
			 		</div>
		 		</div>
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="phone" >
		 				</div>
	 				</div>
				</div>
		 		<div class="row g-3">
					<div class="col-sm-6">
		 				<label class="form-label">휴대전화</label>
		 				<div style="width:300px; float:left;">
		 					<input type="text" class="form-control" name="mobile">
		 				</div>
	 				</div>
				</div>
			</fieldset>
			<div class="clear"></div>
			<br>
			<div id="buttons" style="text-align: center;">
				<input type="submit" value="가입" class="btn btn-secondary">
				<input type="reset" value="취소" class="btn btn-secondary">
			</div>
		</form>
	</div>
	<br>
	</main>   
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>