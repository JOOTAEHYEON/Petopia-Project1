<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/003_OrderDetails.css">
 
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>
<body>
   <!-- ====================================================== -->
<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    
	response.setDateHeader("Expires", 1L);              
	request.setCharacterEncoding("utf-8");;
	
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
			<div class="container-fluid d-flex align-items-center mx-4">
	    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="140px" height="80px">   </a>
		<div class=" display ml-4"  style="margin-left: 45px;">
	    <div class="mr-2" style="margin-right: 15px;"> <a class="nav-link active b jua_nav" aria-current="page" href="hospital.do">동물병원 예약</a></div>
		<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="salon.do">미용실 예약</a></div>
		<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="hotel.do">애견호텔 예약</a></div>
		<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="StrayAnimal.do">유기 동물 입양</a></div>
		</div>
		
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
	            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	
	   <div class="collapse navbar-collapse  displaye" style="margin-right: 100px;">
	    <ul class="navbar-nav">
	    <c:choose>
	        <c:when test="${empty result.email}">
	            <li class="nav-itm mr-3"><a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
	        </c:when>
	        <c:otherwise>
	            <li class="nav-itm mr-3 nav-link active b jua_nav">${result.email}</li> 
	          
	            <li class="nav-item dropdown">
	                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                    <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a class="dropdown-item" href="MyInfo.do?email=${result.email}">내정보</a></li>
	                    <li><a class="dropdown-item" href="BookList.do?email=${result.email}">예약 내역</a></li>
	                    <li><a class="dropdown-item" href="MyOrders.do?email=${result.email}">구매 내역</a></li>
	                    <li><a class="dropdown-item" href="cart.do?email=${result.email}">장바 구니</a></li>
	                </ul>
	            </li>
	               <a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/logout.do" onclick="showLogoutAlert()">로그아웃</a>
	        </c:otherwise>
	    </c:choose>
	</ul>
	
	</div>
	
	</div> <!-- 1차 nav bar -->
		</nav>
	<nav class="navbar navbar-expand-lg bg-body-tertiary2 nav_mt align-items-center"> 
	<div class="container-fluid d-flex justify-content-end navbar2">
	    <div class="display nav_mr">
	        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/storeList.do">스토어</a>
	        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/board.do">커뮤니티</a>
	        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/Lovedog.do">유기동물 현황 </a>
	    </div>
	</div>
	</nav>
	<!-- ---------------------------------------------------------------------- -->

	<div class="topm_OrderDetails displaypop  " >
	<div  class="jua_nav Title_orderDetails ">📝  Order Details</div>	
	
	 <div class="displayco ">
	 <div class="displaycos">
	 	<div class=" textcolor_orderDetails sejong_nav"> 주문 번호 : ${PayVO.merchant_uid}</div>	
	 	<hr class="line_orderDetails">
	 </div>	
	<div class="displayc box_OrderDetails ">
	<div class=" displayb box_OrderDetails2 ">	
		  <div class="textcolor_orderDetails sejong_nav" style="color:gray;"> 주문자 : ${PayVO.buyer_name}</div>		 
	 	<form action="payDelete.do" style="margin-right:20px;">
	 	    <input type="hidden" class="conDbox"  name ="email" value="${PayVO.buyer_email}">
	 	    <input type="hidden" class="conDbox"  name ="merchant_uid" value="${PayVO.merchant_uid}">
	 		<input type="submit" class="box_OrderDetails3" value="내역삭제">
	 	</form>
         </div>	 
	  <hr class="line2_orderDetails">
	  <div class="displays margin_OrderDetails " >
	  
	  <div class=" displayb " style="width:100%;" id="orderlist">	  	 
	  <div class="margin2_OrderDetails ">
	    <div class="text_orderDetails sejong_nav"> <span style="font-weight:bold;"> [상품명] </span>${PayVO.name}</div>
	    <div style="margin-bottom:8px;"> 구매 수량 : ${PayVO.priceCnt} </div>
	  	 <div style="margin-bottom:8px;">상품 가격 : ${originprice} 원 </div>	  	
	  	  <div style="margin-bottom:8px;"> 선택 옵션 : ${PayVO.option1} </div>	
	   </div>
	   <div>
	   <img src="./resources/pic/${PayVO.productID}.jpg" class="photo_orderdetails">	  
	   </div>  
	   </div>    
	  </div>
	   
	   <hr class="line2_orderDetails">
	   
	   
	   <div class="box_OrderDetails4" style="margin:20px 10px;">
	  <div class="text2_orderDetails do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">결제 정보 </div>
	  <hr class="line2_orderDetails">
	  <div class="displays box_OrderDetails4 ">
	  
	  <div class="margin2_OrderDetails">
	  
	   	<div >결제 완료일 :  ${PayVO.paydate}</div>
	  	<div> 주문 금액 : ${originamount}원</div>
	  	<div> 사용 포인트  : ${PayVO.point} 원</div>
	  	<div> 결제 완료 금액  :${PayVO.amount}원</div>
	  	<div> 배송지 : ${PayVO.buyer_addr} </div>
	  	
	   </div>
	  </div>
	 </div>
	 </div>
	  <div>
	  
	<form action="MyOrders.do" class="mt-3 displaye" style="width:1000px; padding-right:100px;">
	 	    <input type="hidden" class="conDbox"  name ="email" value="${PayVO.buyer_email}">
	 	   
	 		<input type="submit" class="btn btn-dark" value="돌아가기">
	</form>
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
	<!-- ---------------------------------------------------------------------- -->
	<script>
		function goToMyOrders() {
			window.location.href = "MyOrders.do";
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>  
	

</body>
</html>