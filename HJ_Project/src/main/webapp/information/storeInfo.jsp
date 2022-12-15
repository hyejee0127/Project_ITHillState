<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Store Information</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap) -->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100"> 
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 본문 시작 -->
	<main class="container-sm" style="margin-top: 50px;">
     <h3>상가 소개</h3>       
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<!-- 스타벅스 -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_starbucks.png" alt="..." onclick="window.open('https://www.starbucks.co.kr/index.do')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">스타벅스</h5>
									영업시간<br>
									07:00 - 23:00<br>
									<hr>
									1522-1111
								</div>
							</div>
						</div>
					</div>
					<!-- COS -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_cos.png" alt="..." onclick="window.open('https://www.cos.com/ko-kr/')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">COS</h5>
									영업시간<br>
									10:00 - 20:00<br>
									<hr>
									1522-2222
								</div>
							</div>
						</div>
					</div>
					<!-- 나이키 -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_nike.png" alt="..." onclick="window.open('https://www.nike.com/kr/ko_kr/')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
                                    <h5 class="fw-bolder">나이키</h5>
									영업시간<br>
									10:00 - 20:00<br>
									<hr>
									1522-3333
								</div>
							</div>
						</div>
					</div>
					<!-- 쉐이크쉑 -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_shake.png" alt="..." onclick="window.open('http://shakeshack.kr/main.jsp')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">쉐이크쉑</h5>
									영업시간<br>
									09:00 - 22:00<br>
									<hr>
									1522-4444                     
								</div>
							</div>
	                    </div>
					</div>
					<!-- 핫트랙스 -->
					<div class="col mb-5">
						<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="../images/storeInfo_hottracks.png" alt="..." onclick="window.open('https://www.hottracks.co.kr/ht/biz/welcomeMain')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
                                    <h5 class="fw-bolder">핫트랙스</h5>
									영업시간<br>
									09:00 - 20:00<br>
									<hr>
									1522-5555
								</div>
							</div>
						</div>
					</div>
					<!-- CGV -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_cgv.png" alt="..." onclick="window.open('https://www.cgv.co.kr/')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">CGV</h5>
									영업시간<br>
									07:00 - 24:00<br>
									<hr>
									1522-6666
								</div>
							</div>
						</div>
					</div>
					<!-- 다이소 -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_daiso.png" alt="..." onclick="window.open('https://daiso.co.kr/')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">다이소</h5>
									영업시간<br>
									10:00 - 22:00<br>
									<hr>
									1522-7777                                
								</div>
							</div>
						</div>
					</div>
					<!-- 알라딘 -->
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/storeInfo_aladin.png" alt="..." onclick="window.open('https://www.aladin.co.kr/home/welcome.aspx')"/>
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">알라딘 중고서점</h5>
									영업시간<br>
									09:00 - 22:00<br>
									<hr>
									1522-8888
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>	            
 	</main>           
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>