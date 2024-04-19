
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/viewError.css">


</head>

<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="140px" height="80px">   </a>
	<div class=" display ml-4"  style="margin-left: 45px;">
     <div class="mr-2" style="margin-right: 15px;"> <a class="nav-link active b jua_nav" aria-current="page" href="hospital.do">동물병원 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="#">미용실 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="#">애견호텔 예약</a></div>
	</div>
	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

   <div class="collapse navbar-collapse  displaye" style="margin-right: 100px;">
    <ul class="navbar-nav ">
        <li class="nav-item mr-3"><a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
        <li class="nav-item dropdown ">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="MyInfo.do">내정보</a></li>
                <li><a class="dropdown-item" href="BookList.do">예약 내역</a></li>
                <li><a class="dropdown-item" href="MyOrders.do">구매 내역</a></li>
                <li><a class="dropdown-item" href="cart.do">장바 구니</a></li>
            </ul>
        </li>
    </ul>
</div>

</div> <!-- 1차 nav bar -->
	</nav>
<%-- <nav class="navbar navbar-expand-lg bg-body-tertiary2 nav_mt align-items-center"> 
<div class="container-fluid d-flex justify-content-end navbar2">
    <div class="display nav_mr">
         <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/storeList.do">스토어</a>
        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/board.do">커뮤니티</a>
        <a class="nav-link active b sejong_nav nav_mr" href="#">유기동물 현황 </a>
    </div>
</div>
</nav> --%>

<div class="display" style="margin-top:180px; height:500px;">
<img src="./resources/pic/Error.png"  width=300px;" height="300px;" display />
<br><br><br>
</div>

<div class="display" style="margin-top:-130px;">
요청 처리 과정에서 에러가 발생했습니다. <br>
빠른 시간 내에 문제를 해결하도록 하겠습니다.
</div>
<%-- 에러 타입 : <%= exception.getClass().getName() %>  <br>
에러 메시지 : <b><%= exception.getMessage() %></b> --%>
<!-- <hr> -->
<br><br>

<div class="display">
<a href="${pageContext.request.contextPath}/main.do">
    <img src="./resources/pic/home.png" alt="Home">
</a>

</div>

<br><br><br><br>





<footer>
		<div class="container ">
			<div class="footer-menu">
				<!-- ------------------------------- 상자1 시작-------------------------------- -->
				<div class="first-box">
					<div class="column">
						<div class="sub-title">Category</div>
						<form >
							<input class="menu-item" type="submit" value="병원 예약하기" >
						</form>

						<form >
							<input class="menu-item" type="submit" value="미용실 예약하기" >
						</form>
						
						<form >
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Category</div>
						<form >
							<input class="menu-item" type="submit" value="스토어" >
						</form>
						<form >
							<input class="menu-item" type="submit" value="커뮤니티" >
						</form>
						
						<form >
							<input class="menu-item" type="submit" value="유기동물 통계" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Customer Service</div>
						<div class="menu-item-1">운영시간: 09:00~18:00</div>
						<div class="menu-item-1">Tel: 02-1234-5667</div>
				
						
					</div>
				</div>
				<div class="second-box">
					<div class="icon-box"><img class="icon" src="${pageContext.request.contextPath}/resources/pic/00_insta.png" width="30px" height="24px"></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_twiter.png" width=30px height=24px></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_face.png" width=30px height=24px></div>
				</div>
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p> <br>
				<div class="secon-last">© 2024 😻PET,TopiA🐶</div>
			</div>
		</div>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>