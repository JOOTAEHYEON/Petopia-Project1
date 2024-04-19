<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- ======================================================== -->
<!-- ======================================================== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/000_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/003_MyOrders.css">

<!-- ======================================================== -->
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

</head>
<body>
	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store"); // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L); //응답결과의만료일지정
	request.setCharacterEncoding("utf-8");
	%>

	<c:choose>
		<c:when test="${empty result.email}">
			<!-- result.email이 비어있을 때 -->
			<script>
				// JavaScript를 사용하여 alert 창을 띄우고 login.do로 리다이렉트합니다.
				alert("로그인 후 이용 가능합니다.");
				window.location.href = "${pageContext.request.contextPath}/login.do";
			</script>
		</c:when>
		<c:otherwise>
			<!-- result.email이 비어있지 않을 때 -->
			<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
				<div class="  container-fluid d-flex align-items-center mx-4">
					<a class="navbar-brand mr-3"
						href="${pageContext.request.contextPath}/main.do"> <img
						src="${pageContext.request.contextPath}/resources/pic/LOGO1.png"
						width="210px" height="80px">
					</a>
					<div class=" display" style="margin-left: 4px;">
						<div class="mr-2" style="margin-right: 15px;">
							<a class="nav-link active b jua_nav" aria-current="page"
								href="hospital.do">동물병원 예약</a>
						</div>
						<div class="mr-2" style="margin-right: 15px;">
							<a class="nav-link active b jua_nav" aria-current="page"
								href="salon.do">미용실 예약</a>
						</div>
						<div class="mr-2" style="margin-right: 15px;">
							<a class="nav-link active b jua_nav" aria-current="page"
								href="hotel.do">애견호텔 예약</a>
						</div>
						<div class="mr-2" style="margin-right: 15px;">
							<a class="nav-link active b jua_nav" aria-current="page"
								href="StrayAnimal.do">유기 동물 입양</a>
						</div>
					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
						aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse  displaye"
						style="margin-right: 100px;">
						<ul class="navbar-nav">
							<c:choose>
								<c:when test="${empty result.email}">
									<li class="nav-itm mr-3"><a
										class="nav-link active b jua_nav" aria-current="page"
										href="${pageContext.request.contextPath}/login.do">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-itm mr-3 nav-link active b jua_nav">${result.email}</li>

									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"> <img
											src="${pageContext.request.contextPath}/resources/pic/mypage.png"
											width="30px" height="30px">
									</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item"
												href="MyInfo.do?email=${result.email}">내정보</a></li>
											<li><a class="dropdown-item"
												href="BookList.do?email=${result.email}">예약 내역</a></li>
											<li><a class="dropdown-item"
												href="MyOrders.do?email=${result.email}">구매 내역</a></li>
											<li><a class="dropdown-item"
												href="Cartmain.do?email=${result.email}">장바 구니</a></li>
										</ul></li>
									<a class="nav-link active b jua_nav" aria-current="page"
										href="${pageContext.request.contextPath}/logout.do"
										onclick="showLogoutAlert()">로그아웃</a>
								</c:otherwise>
							</c:choose>
						</ul>

					</div>

				</div>
				<!-- 1차 nav bar -->
			</nav>
			<nav
				class="navbar navbar-expand-lg bg-body-tertiary2 nav_mt align-items-center">
				<div class="container-fluid d-flex justify-content-end navbar2">
					<div class="display nav_mr">
						<a class="nav-link active b sejong_nav nav_mr"
							href="${pageContext.request.contextPath}/storeList.do">스토어</a> <a
							class="nav-link active b sejong_nav nav_mr"
							href="${pageContext.request.contextPath}/board.do">커뮤니티</a> <a
							class="nav-link active b sejong_nav nav_mr"
							href="${pageContext.request.contextPath}/Lovedog.do">유기동물 현황
						</a>

					</div>
				</div>
			</nav>

		</c:otherwise>
	</c:choose>
	<!-- ---------------------------------------------------------------------- -->
	<div class=" topm_myorders ">
		<div class="displayco ">
			<div class=" mb-5" style="width: 70%;">
				<div class="jua_nav Title_myorders ">My Orders</div>
			</div>

			<table class="table_myorders" style="width: 1000px">
				<thead>
					<tr style="font-size: 18px;">
						<th scope="col">주문 번호</th>
						<th scope="col">이미지</th>
						<th scope="col">상품 명</th>
						<th scope="col">결제완료일</th>
						<th scope="col" style="">상세 보기</th>
					</tr>
					<c:if test="${empty payVO}">
						<tr>
							<td colspan="5"
								style="text-align: center; font-size: 18px; padding: 60px 0;">
								예약 내역이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach var="payVO" items="${payVO}">
						<tr style="font-size: 18px; height: 10px;">
							<td scope="col" id="date" style="vertical-align: middle;">${payVO.merchant_uid}</td>
							<td scope="col" style="vertical-align: middle;"><img
								src="./resources/hospic/.jpg" class="photo_book"></td>
							<td scope="col" style="vertical-align: middle;">${payVO.name}</td>
							<td scope="col" id="date" style="vertical-align: middle;">${payVO.paydate}</td>
							<td scope="col" style="vertical-align: middle;">
							
								<form action="OrderDetails.do" method="post">
									<input type="hidden" name="merchant_uid" value="${payVO.merchant_uid}">
									<button type="submit"
										style="background-color: transparent; border: none; cursor: pointer;">
										<img src="./resources/pic/003_cart.png" width="30px"
											height="30px" alt="상세보기">
									</button>
								</form>

							</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</div>
	</div>



	<!-- ---------------------------------------------------------------------- -->
	<footer>
		<div class="container ">
			<div class="footer-menu">
				<!-- ------------------------------- 상자1 시작-------------------------------- -->
				<div class="first-box">
					<div class="column">
						<div class="sub-title">Category</div>
						<form>
							<input class="menu-item" type="submit" value="병원 예약하기">
						</form>

						<form>
							<input class="menu-item" type="submit" value="미용실 예약하기">
						</form>

						<form>
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하">
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Category</div>
						<form>
							<input class="menu-item" type="submit" value="스토어">
						</form>
						<form>
							<input class="menu-item" type="submit" value="커뮤니티">
						</form>

						<form>
							<input class="menu-item" type="submit" value="유기동물 통계">
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Customer Service</div>
						<div class="menu-item-1">운영시간: 09:00~18:00</div>
						<div class="menu-item-1">Tel: 02-1234-5667</div>


					</div>
				</div>
				<div class="second-box">
					<div class="icon-box">
						<img class="icon"
							src="${pageContext.request.contextPath}/resources/pic/00_insta.png"
							width="30px" height="24px">
					</div>
					<div class="icon-box">
						<img class="icon" src="./pic/00_twiter.png" width=30px height=24px>
					</div>
					<div class="icon-box">
						<img class="icon" src="./pic/00_face.png" width=30px height=24px>
					</div>
				</div>
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p>
				<br>
				<div class="secon-last">© 2024 😻PET,TopiA🐶</div>
			</div>
		</div>
	</footer>




	x
	<!— ——————————————————————————————————— ———————————————————————————————————>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!——————————————————————————————————— ——————————————————————————————————— ———————————————————————————————————>
</body>
</html>