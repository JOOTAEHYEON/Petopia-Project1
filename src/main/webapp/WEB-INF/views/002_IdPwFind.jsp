<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/002_IdPwFind.css">
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
	%>
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>

	</div>
	</nav>


<!-- ---------------------------body------------------------------------- -->
 <div class="topm_idpw ">
  
  <div style="margin: 100px 0px 0px 0px;" >
    <ul class="nav nav-pills mb-3 display" id="pills-tab" role="tablist">
      <li class="nav-item display" role="presentation">
        <a class="nav-link active tap_idpw " id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">아이디 찾기</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link tap_idpw" id="pills-profile-tab" data-bs-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">비밀 번호 찾기</a>
      </li>
    </ul>

    <div class="tab-content textalign__IdPw" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
      
        <form action="emailFind.do" method="post">
          <input class="input_phone text_IdPw" type="text" name="tel" placeholder="전화번호를 기재해주세요."><br>
          <c:if test="${message == 'noEmail'}">
            <div style="color: red;">전화번호와 일치하는 이메일이 존재하지 않습니다.</div>
         </c:if>
          <input class="button_idpw mt10_login"  type="submit" value="이메일디찾기">
        </form>
      </div>
      
      
      
      <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
        
        <form action="IdPwFind.do" method="post">  
       <div class="textbox">
        <input class="text_IdPw "  id="email" name=email placeholder="이메일을 기재해주세요." type="email" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" />
<!--         <label for="email">이메일</label>
 -->        <div class="textbox">
          <input class="input_phone text_IdPw" type="text" name="tel" placeholder="전화번호를 기재해주세요."><br>     
    </div>
   </div><br><br>
   <c:if test="${message == 'error'}">
      <div style="color: red;">이메일과 전화번호가 일치하지 않습니다.</div>
   </c:if>
   
      <input  class="button_idpw mt10_login" type="submit" id="check" value="비밀번호찾기">
	</form>
        
      </div>
    </div>
  </div>
</div>

<!-- ---------------------------------------------------------------------- -->
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
				
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p> <br>
				<div class="secon-last">© 2024 😻PET,TopiA🐶</div>
			</div>
		</div>
	</footer>

	<script	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!-- ======================================================== -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	 <% if(request.getAttribute("email") != null) { %>
        <script>
            var email = '<%= request.getAttribute("email") %>';
            alert("찾은 이메일 주소는 " + email + " 입니다.");
        </script>
    <% }%>
   


</body>
</html>