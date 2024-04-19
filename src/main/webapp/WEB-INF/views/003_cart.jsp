
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
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
	href="${pageContext.request.contextPath}/resources/css/003_cart.css">
<!-- ======================================================== -->
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

</head>
<body>
	<!-- ======================================================= -->
	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	request.setCharacterEncoding("utf-8");
	DecimalFormat df = new DecimalFormat("###,###");
	%>

	<!-- ======================================================= -->



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
				<div class="container-fluid d-flex align-items-center mx-4">
					<a class="navbar-brand mr-3"
						href="${pageContext.request.contextPath}/main.do"> <img
						src="${pageContext.request.contextPath}/resources/pic/LOGO1.png"
						width="140px" height="80px">
					</a>
					<div class=" display ml-4" style="margin-left: 45px;">
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
												href="cart.do?email=${result.email}">장바 구니</a></li>
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
	<!--================================================ -->
	<div class="topm_cart">
		<div class=" displayco ">
			<div class="" style="width: 70%;">
				<div class="jua_nav Title_cart">Cart</div>
			</div>

			<div class="displaye  " style="width: 1052px; margin-bottom: 30px;">
				<form action="CartDelete.do">
					<img
						src="${pageContext.request.contextPath}/resources/pic/mypage.png"
						width="30px" height="30px" id="deleteButton"
						style="cursor: pointer;" onclick="Button" /> <input type="hidden"
						id="email" name="email" value="${result.email}"> <input
						type="submit" id="submitButton" class="btn btn-warning text-dark"
						style="background-color: white; border-color: white;"
						value="상품 삭제">
				</form>
			</div>




			<!-- <div class="displayco mt-3 ">
				<form class=" m-3" action="#" name="form" method="post"
					id="multidelete">
					<input type="hidden" name="selectedItems" id="selectedItems"
						value=""> -->




			<table class="table_cart" style="width: 1000px">
				<thead>
					<tr style="font-size: 18px;">
						<th scope="col"><input type="checkbox" id="all"
							class="form-check-input custom-checkbox"
							onclick="selectAllCheck(this.checked); itemSum(this);" checked>
						</th>
						<th scope="col">번호</th>
						<th scope="col">상품명</th>
						<th scope="col">옵션</th>
						<th scope="col">수량</th>
						<th scope="col">가격</th>
						<th scope="col">총 금액</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty purchase_list}">
						<tr>
							<td colspan="5"
								style="text-align: center; font-size: 18px; padding: 60px 0;">
								예약 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="alist" items="${purchase_list}"
						varStatus="loopStatus">
						<c:set var="subtotal" value="${alist.price * alist.priceCnt}" />
						<tr style="font-size: 18px; height: 10px;">
							<td><input type="checkbox"
								class="form-check-input custom-checkbox" name="chkbox"
								onClick="itemSum(this.form);" checked></td>

							<td scope="col" style="vertical-align: middle;"><c:out
									value="${loopStatus.index + 1}" /></td>
							<!-- 기존 코드 -->
							<td scope="col" style="vertical-align: middle;" id="productName">${alist.name}</td>
							<td scope="col" style="vertical-align: middle;" id="productoption3">${alist.option3}</td>
							<td scope="col" style="vertical-align: middle;" id="productpriceCnt">${alist.priceCnt}</td>
							<td scope="col" style="vertical-align: middle;" id="productprice">${alist.price}</td>
							<td scope="col" style="vertical-align: middle;" id="productsubtotal"><span class="subtotal">${subtotal}</span></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>




			<div class="  displaye mt-5" style="font-size: 23px;">

				<div class="do_cart" style="text-align: right;">
					총 <input id="subtotal1" value="" style="border: none;"
						class="do_cart" type="text" size="20" readonly>
				</div>

				<form name="form2" id="form2" method="post" action="Orderconfirm.do">
					<input type="hidden" name="selectedItems" id="selectedItems"value=""> 
					<input type="hidden" name="name" id="name" value=""> 
					<input type="hidden" name="option" id="option" value="">  
					<input type="hidden" name="quantity" id="quantity" value=""> 
					<input type="hidden" name="price" id=price value="">
					<input type="hidden" name="shippingFee" id=shippingFee value="2500">


					<button type="submit" id="cnt2" class="btn btn-dark"
						style="width: 170px; height: 53px;" onclick="purchase()">구매하기</button>

				</form>


				<!-- 	</div>
				</form> -->
			</div>
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
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하기">
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


	<!-- ========================================================== -->
	<script>
		function selectAllCheck(checked) {
			var checkboxes = document.getElementsByName('chkbox');
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = checked;
			}
			itemSum();
		}

		function itemSum() {
			var checkboxes = document.getElementsByName('chkbox');
			var subtotalElements = document.querySelectorAll('.subtotal');
			var total = 0;

			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					var subtotal = parseFloat(subtotalElements[i].textContent); // 해당 품목의 현재 subtotal 가져오기
					total += subtotal; // 총 가격에 추가
				}
			}

			document.getElementById('subtotal1').value = total.toFixed(0) + "원";
		}

		//var name = document.getElementById("productName").innerText;

		// 테이블 셀의 값들을 hidden input에 설정하는 함수
		function setTableCellValues() {
			// 각 테이블 셀의 값들을 가져옴
			var name = document.getElementById("productName").innerText;
			var option = document.getElementById("productoption3").innerText;
		    var quantity = document.getElementById("productpriceCnt").innerText;
		    var price = document.getElementById("productprice").innerText;

			// hidden input 요소들의 값을 각 테이블 셀의 값으로 설정
			document.getElementById("name").value = name;
			document.getElementById("option").value = option;
		    document.getElementById("quantity").value = quantity;
		    document.getElementById("price").value = price;
		}

		// 페이지 로드 시 setTableCellValues 함수 호출하여 hidden input에 값 설정
		window.onload = function() {
			setTableCellValues();
		};
	</script>












	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<!-- ---------------------------------------------------------------------- -->

</body>
</html>