<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<!-- =================================================================== --><!-- =================================================================== -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/008_boardwrite2.css">

</head>

<!-- =================================================================== --><!-- =================================================================== -->
<body>
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
<!-- ===============================   게시글 수정하기 form =================================  -->

<!-- <form class="topm_boardwrite displaycos"  enctype="multipart/form-data"> -->
<form action="updateBoard.do" method="post" class="topm_boardwrite displaycos ">
	<input type="hidden" name="bbsid" value="${update.bbsid} ">
	 <div class="m-3  jua_nav Title_boardwrite" style="display: inline-block;">📝 커뮤니티 글 수정하기</div>
	<div class="" style="width:80%">
	
	
	<!-- 카테고리 -->
	<div class="m-3 displays">
		<div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px"> 카테고리  </div>
			<div class="m-3 displays "  id="catebtn">
			    <input class="btn_board " type="button" name="bbscategory" value="${update.bbscategory}" >
                <input type="hidden" name="bbscategory" value="${update.bbscategory}">
			</div>
	</div>
	
	
	<!-- 견종 -->
	<div class="m-3 displays">      
            <div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">견종목록</div> 
            <div class="select" data-role="selectBox" style="margin-right:50px;"> 
               <img class="photo_board" src="./resources/dogpic/${update.bbsdog}.png" width="30px" height="30px" alt="${update.bbsdog}" > ${update.bbsdog} </div>
    </div>
	

    <!-- 제목 & 내용 -->
	<div class="m-3 displaycos " style="height:500px;">
			<div class="text3_boardwrite do_nav">  <img src="./resources/pic/mypage.png" width="30px" height="30px"> 내용작성  </div>
			<div class="displaycos box3_boardwrite" >
				<input type="text" class="box_boardwrite"  value="${update.bbstitle}" name="bbstitle">
				<input type="text" class="box2_boardwrite"  value="${update.bbscontent}" name="bbscontent">
				<div class="text_boardwrite"> * 내용은 5-7000자로 입력해주세요</div>
			</div>

	</div>
	
	<%-- <div class=" displays mx-2">		
			<div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">이미지 등록 </div> 
			
			<div class="displays ">
 			 <label for="file"> <div class="upload"></div></label>
  			<input type="file" class="real-upload" name="file" accept="image/*">
 			 <ul class="image-preview"></ul>
  			</div>
	</div>  --%>
	<div class="displays">
	<button type="submit" class="btn3_boardwrite"> 게시글 수정 하기 </button>
	</div>
	</div>	
</form>
	


<!-- ================================================================  -->

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
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하기" >
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

<!-- ======================================================== -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/008_boardwrite.js"></script>
<!-- ========================================== -->
<!-- ========================================== -->
</body>
</html>