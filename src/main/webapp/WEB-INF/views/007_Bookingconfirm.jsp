<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>


<!DOCTYPE html>
<html lang="en">
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/007_Bookingconfirm.css">
 <script src="${pageContext.request.contextPath}/resources/js/002_register.js"></script>
 
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>
<body>
   <!-- ====================================================== -->
<%   
	response.setDateHeader("Expires", 1L);              
	request.setCharacterEncoding("utf-8");
	%>
	<%
Random random = new Random();
String orderId = String.valueOf(Math.abs(random.nextLong())).substring(0, 10);
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
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>
	<div class=" display"  style="margin-left: 4px;">
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
                    <li><a class="dropdown-item" href="Cartmain.do?email=${result.email}">장바 구니</a></li>
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

    </c:otherwise>
</c:choose> 


	<!-- ---------------------------------------------------------------------- -->

	<!-- ---------------------------------------------------------------------- -->
	<div class=" row topm_Orderconfirm displayco ">	
		<div class="col-9 " >
				<div class="title_Orderconfirm jua_nav "> 🚨 예약 전 필수 확인   </div>	
				<div class="mt-3 ">							
					<div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  예약 예정 상품	
					<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; * 방문 예정일 및 시간을  다시 확인 부탁드립니다🙏🏻</div>
					</div>			
				
		     	  
			  <div class=" displayb " style="width:100%;">	  	 
	 			 <div class="margin2_Orderconfirm ">
	    		<div class="sejong_nav subtitle_Orderconfirm" > <span style="font-weight:bold;"> [예약서비스] </span> ${BookListVO.rname} </div>
	    		<div style="margin-bottom:8px;"> <span style="font-weight:bold;"> 방문 예정일 : </span>  ${BookListVO.rdate} </div>
	  	 		<div style="margin-bottom:8px;"> <span style="font-weight:bold;"> 방문 반려동물 : </span> ${BookListVO.rcate}</div>	  	
	  	  		<div style="margin-bottom:8px;"> <span style="font-weight:bold;"> 방문 가게위치 : </span> ${BookListVO.raddress}</div>	
	  	  		<div style="margin-bottom:8px;"> <span style="font-weight:bold;"> 방문 가게전화번호 : </span> ${BookListVO.rtel}</div>	
	  	  		
	  			 </div>
	  		 <div>
	   <img src="./resources/pic/main_dog4.jpg" class="photo_Orderconfirm">	  
	   </div>  
	   </div> 
	   <hr>
		  
	  <div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  기본 정보
	  	<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; * 예약 정보 요청 </div>	  	
	  </div>
	   <hr>	
	<div class="mb-4 displays ">
	<div class="box_orderconfirm4 ">
        <div class="displays"><div class="box_orderconfirm6"> 보호자 성함: </div>  <input class="box_orderconfirm2" id="person1" type="text" placeholder="보호자분  성함을 써주세요"  oninput="displayOrderInfo()" required> </div>       
        <div class="displays"><div class="box_orderconfirm6"> 보호자 연락처: </div>  <input class="box_orderconfirm2" id="tel1" type="text" placeholder="보호자분  전화번호" value="" oninput="displayOrderInfo()"required></div>       
        <div class="displays"><div class="box_orderconfirm6"> 반려동물 이름  :  </div>  <input class="box_orderconfirm2"  id="pet1"type="text" placeholder="방문할 아이의 이름을 써주세요." value="" oninput="displayOrderInfo()" required></div>   
	 </div>
	 
   
</div>

	</div>	
		
	<div class=" mt-4 ">
	<div class="subtitle_Orderconfirm do_nav"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  방문전 전달 사항
	
	</div>
	<hr>
	<textarea  class="requestbox_Orderconfirm" placeholder="요청사항이 있으면 기재해주세요"></textarea>
	<div style="color:gray">* 해당 내용은 예약 상호로 전달 될 예정입니다. </div>
	</div>
	
	<div class="mt-4">
	<div class="subtitle_Orderconfirm do_nav " style="text-align:left; ">  <img src="./resources/pic/mypage.png" width="30px" height="30px">  예약  정보</div>
	<hr>
	<form class="displays" action="insertBookList.do" method="post" onsubmit="return validateForm(event)">
		<div style="width:100%;" class=" displays   paybox_orderconfirm  ">
			<div class="m-4">			
			<div class="lastconfirmbox" > [예약서비스]  <input class="lastconfirmbox" id="rname" name="rname" value=" ${BookListVO.rname}"></div>
		 	<input type="hidden" id="rsoo" name="rsoo" value="${BookListVO.rsoo}">
		 	<input type="hidden" id="hname" name="hname" value="${BookListVO.rname}">
		 	<input type="hidden" id="rorder" name="rorder" value="<%= orderId %>">
		 
			<div class="lastconfirmbox" > 방문 예정일 : <input class="lastconfirmbox" name="rdate" id="rdate"  value="${BookListVO.rdate} "></div>
			<div class="lastconfirmbox"> 반려동물 견종: <input style="width:320px;" class="lastconfirmbox" name="rcate" id="rcate" value="${BookListVO.rcate}" ></div>
			<div class="lastconfirmbox" > 반려동물 이름:<input class="lastconfirmbox" id="rpet" name="rpet" value=""></div>
			</div>
			<div class="m-4">		
			<div class="lastconfirmbox">  보호자명 : <input class="lastconfirmbox" id="rperson" name="rperson" value=""> </div>	
			<div class="lastconfirmbox" > 이메일 <input class="lastconfirmbox" name="email"id="email" value="${result.email}"> </div>
			<div class="lastconfirmbox" > 연락처 :<input class="lastconfirmbox"name="rtel" id="rtel" value="">    </div>
			
			<div class="lastconfirmbox" > 예약지 주소  : <input class="lastconfirmbox2"  name="raddress" id="raddress" value="${BookListVO.raddress}"> </div>
			</div>
		</div>
		<input type="submit" class="btn btn-warning paytext_orderconfirm" style="width:300px; border:none;" value="예약하기">
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

	
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script>
	  function displayOrderInfo() {
		    // 받는 분의 정보 가져오기
		    var person = document.getElementById('person1').value;
		    document.getElementById('rperson').value = person;
		    var tel = document.getElementById('tel1').value;
		    document.getElementById('rtel').value = tel;
		    var pet = document.getElementById('pet1').value;
		    document.getElementById('rpet').value = pet;
 
		}
	
	</script>
	<script>
	  function validateForm(event) {
	        var rpet = document.getElementById("rpet").value.trim();
	        var rperson = document.getElementById("rperson").value.trim();
	        var rtel = document.getElementById("rtel").value.trim();

	        if (rpet === "" || rperson === "" || rtel === "") {
	            alert("모든 정보를 작성해주세요.");
	            event.preventDefault(); // 폼 제출을 막음
	        }
	    }
</script>
</body>
</html>