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
<	<% if(request.getAttribute("message").equals("injeung")) { %>
        <script>
            alert("인증번호 발송하였습니다.");
        </script>
    <% } %> 
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>

	</div>
	</nav>
	
 <div class="topm_idpw  display " style="height:300px;">
 <form action="pw_set.do" method="post">
   <input type="hidden" name ="num" value="${num }">    
       
         <input type="text" class="text_IdPw" name="email_injeung" placeholder="인증번호를 입력하세요">      
     <br>
      <c:if test="${message == 'error'}">
         <div style="color: red;">인증번호가 일치하지 않습니다.</div>
      </c:if> 
      <br>
          <input type="hidden" name="email" value="${email}">
         <input type="submit" class="button_idpw " id="check" value="확인">
       
</form>
 
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
    <script src="./js/jquery-3.7.1.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


</body>

    
</html>