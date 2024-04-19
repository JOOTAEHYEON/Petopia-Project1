<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>


<meta name="theme-color" content="#712cf9">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- =================================================================== --><!-- =================================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/008_board.css">
  
</head>

<!-- =================================================================== --><!-- =================================================================== -->
<body>

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


<main class=" container topm_board">

    	<div class="displaye" style="margin-bottom:20px;" >        
        <a class="btn btn-dark btn_text" href="boardwrite.do">글쓰기</a>
        </div>

  
 <!-- ===================== 인기게시글 & 주간베스트글 ===================== --> 
  
  <div class="row mb-2">
  
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary-emphasis">인기 게시글 </strong> <br>
          <a class="title2_board" href="viewboard.do?bbsid=1"> 저희 강아지는 산책 나가면 움직이지를 않아요</a>  <br>
          <div class="mb-1 text-body-secondary">Fri Mar 23 12:42:45 </div>
          <p class="card-text mb-auto">저희 강아지는 산책 나가면 움직이지를 않아요...</p>          
        </div>
         <div class="col-auto d-none d-lg-block">
          <svg width="160" height="240">
  			<rect width="100%" height="100%" fill="white"/>
  			<image href="./resources/pic/cat1.jpg" width="100%" height="100%" />
		</svg>

        </div> 
      </div>
    </div>
    
    
    
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary-emphasis">주간 베스트 게시글 </strong> <br>  
          <a class="title2_board" href="viewboard.do?bbsid=2">강아지 잇몸이 약한데 스케일링을 해도괜찮을까요? </a>  <br>
          <div class="mb-1 text-body-secondary">Fri Mar 29 09:47:17</div>
          <p class="card-text mb-auto">강아지 잇몸이 약한데 스케일링을 해도괜찮을까요?</p>          
        </div>
         <div class="col-auto d-none d-lg-block">
         <svg width="160" height="240">
  			<rect width="100%" height="100%" fill="white"/>
  			<image href="./resources/pic/dog3.jpg" width="100%" height="100%" />
		</svg>

        </div> 
      </div>
    </div> 
    
  </div>
</main>

<!-- ==========================  게시판 리스트 ===========================================  -->

<hr class="boardline"> 
	<main class="container  displaycos " style=" height:1800px; margin-top:0px;">
     
     <div class="boarders1 ">
     
    <!-- for문  --> 
    <c:forEach var="imsi" items="${boardlist}">
     
        <div class="displaycos ">
         <div class="displays "> 
         <div class=" box_board "> 
                   
          <div class="displays ">  
                   <div class="text2_board do_nav">   ${imsi.bbscategory}  </div>                    
                  <div><img class="photo_board" src="./resources/dogpic/${imsi.bbsdog}.png" alt="${imsi.bbsdog}">${imsi.bbsdog}</div>
                  <!-- <div><img  class="photo_board"src="./resources/dogpic/golden.png" alt="골든리트리버">골든리트리버</div> -->	                    
          </div> 
          <div class="questionbox_board displays">        
              		<div class="questionbox_board ">
              		<a class="title_board" href="viewboard.do?bbsid=${imsi.bbsid}">${imsi.bbstitle}</a>        
              		<div class="text_board">  ${imsi.bbscontent}  </div>              		
              		</div>             		            	  		              		
              
            </div> 
            </div> 
               <div class="displays ">                    
              <div class="mr-2">
              
              <img class="photo2_board" src= "/display.do?filename=${imsi.bbsavailable}">
         <!--      <img class="photo2_board" src="./resources/pic/dog2.jpg"> -->
              
              </div>              
         		</div>
         	        
        </div>
       
        	<div class="displays">
         		<div class="mr-2"><img class="photo3_board" src="./resources/pic/mypage.png"></div> 
         		<div style="width:220px; white-space: nowrap; overflow:hidden;"> 작성시간 : ${imsi.bbsdate} </div>  
         	
         	</div>
        </div>
       <hr>
       
    </c:forEach>  
  <!--   for문 종료  -->
</main>

<!--======================= footer ==========================================-->
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
					<div class="icon-box"> <img class="icon" src="/pic/00_twiter.png" width=30px height=24px></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_face.png" width=30px height=24px></div>
				</div>
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p> <br>
				<div class="secon-last">© 2024 😻PET,TopiA🐶</div>
			</div>
		</div>
	</footer>







<!-- ========================================== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- ========================================== -->
</body>




</html>