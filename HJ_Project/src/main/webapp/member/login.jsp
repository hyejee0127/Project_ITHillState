<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - LogIn</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<!-- 본문 내용 -->
	<main class="form-signin w-45 m-auto">
		<form action="loginPro.jsp" method="post" id="join">
			<div class="form-floating">
				<input type="text" class="form-control" name="id" required="required" id="floatingInput" placeholder="user id">
				<label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="pass" required="required" id="floatingPassword" placeholder="Password">
				<label for="floatingPassword">비밀번호</label>
			</div>
			<hr>
			<button class="w-100 btn btn-secondary btn-lg" type="submit">로그인</button>
		</form>
		<!-- 카카오로그인 -->
<!-- 		<a id="custom-login-btn" href="javascript:kakaoLogin()"> -->
<!-- 			<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼"/> -->
<!-- 		</a> -->
<!-- 		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
 <script>
        window.Kakao.init('ed499ab304d53c50b6ef30665fbdf6bd');
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname,account_email,gender', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log("id") // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href='../main/main.jsp' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
</script>

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