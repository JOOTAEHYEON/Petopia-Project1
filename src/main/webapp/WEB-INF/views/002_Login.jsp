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
	 <% if(request.getAttribute("insertSuccess")!=null) { %>
        <script>
            alert("회원가입 성공하였습니다.");
        </script>
    <% } %> 
    <% if(request.getAttribute("pwChangeOk")!=null) { %>
        <script>
            alert("비밀번호 변경 완료하였습니다.");
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
	<h2 class="mid  jua_nav">Login</h2>

	<form class="box_login " action="login_check.do" method="post" align="center">
		<table  style="margin-bottom:40px;">
			<tr >
				<td><input class="Ltext " type="text" name="email" id="email" required autofocus placeholder="Email"></td>
			</tr>
			<tr>
				<td><input class="Ltext " type="password" name="password" id="password"required 	placeholder="password"></td>
			</tr>

		</table>
		
		
		           <c:if test="${message == 'error'}">
                  <div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
               </c:if> 
                <c:if test="${message2 == 'error'}">
                  <div style="color: red;">회원 가입을 먼저 해주세요 :) </div>
               </c:if>
               <c:if test="${message == 'logout'}">
                  <div style="color: red;">로그아웃되었습니다.</div>
               </c:if>

		<div class="display ">
		<div id="naver_id_login" class="mb-2">
            <a href="${url}"> <img width="228"
               src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
      </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div>
      <input class="box_Login" style="width:228px;" type="submit" value="Login">
      </div>
			
			
			
			
		</div>
		</form>
		
		<div class="display mb-3 ">
			<a href="${pageContext.request.contextPath}/IdPwFindp.do" > 아이디 | 비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/register.do"> 회원가입 </a>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<script>

function sample6_execDaumPostcode() {
   new daum.Postcode(
         {
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== ''
                        && /[동|로|가]$/g.test(data.bname)) {
                     extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== ''
                        && data.apartment === 'Y') {
                     extraAddr += (extraAddr !== '' ? ', '
                           + data.buildingName
                           : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraAddr !== '') {
                     extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("sample6_extraAddress").value = extraAddr;

               } else {
                  document.getElementById("sample6_extraAddress").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("sample6_address").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("sample6_detailAddress")
                     .focus();
            }
         }).open();
}
</script>
	
</body>
</html>