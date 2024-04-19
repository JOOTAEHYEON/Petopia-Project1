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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/002_Login.css">
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
	 <% if(request.getAttribute("message").equals("injeungOk")) { %>
        <script>
            alert("인증이 완료되었습니다.");
        </script>
    <% } %> 
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>

	</div>
	</nav>


	<!-- ---------------------------------------------------------------------- -->

	 <div class="topm_login ">
	<h2 class="mid  jua_nav"> New Password </h2>
	

	<form class="box_login" action="pw_new.do"  method="post" align="center">

	<div class="textbox">
		<input class="Ltext" id="pw" name="password" minlength = "3" type="password" placeholder="새비밀번호 입력">
		
		
	</div>
	<div class="textbox">
		<input  class="Ltext"  id="pw2" name="password2" minlength = "3" type="password" onchange="isSame();"placeholder="새비밀번호 입력확">
		
		
	</div>
	 <c:if test="${message == 'error'}">
		<div style="color: red;">비밀번호가 일치하지 않습니다.</div>
	</c:if>
		<span id=same></span>
	<br><br>
	<input type="hidden" name="email" value="${email}">
	<input type="submit" class="box_Login" id="check" value="비밀번호변경">
	
</form>
		

	
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
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- ---------------------------------------------------------------------- -->
<script>
$(function() {
   $("#btnLogin").click(function(event) {
      event.preventDefault(); // 기본 제출 이벤트 방지
      var email = $("#email").val();
      var password = $("#password").val();
      if (email == "") {
         alert("아이디를 입력하세요");
         $("#email").focus(); //입력포커스 이동

         return; //함수 종료
      }
      if (password == "") {
         alert("비밀번호를 입력하세요");
         $("#password").focus();
         return;
      }
      //폼 내부의 데이터를 전송할 주소
      document.form1.action = "${path}/login_check.do";
      document.form1.submit(); //제출
   });
});
</script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>