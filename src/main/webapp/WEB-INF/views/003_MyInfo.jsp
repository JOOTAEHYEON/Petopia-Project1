<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/003_Myinfo.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- ======================================================== -->
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>

<body>

	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L);              //응답결과의만료일지정
	%>
	<% if(request.getAttribute("message")!=null) { %>
        <script>
            alert("정보수정 완료");
        </script>
    <% } %>
		<!-- ==========================nav============================= -->	
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
<div class="topm_information">

<div class=" display" > 
<div class="" style=" width: 70% ;">
<div class="jua_nav Title_information ">My Information</div>
		<br>
	
		 <form action="userUpdate.do" method="post">
			<table>
				<tr>
					<td  colspan="2"class="subtitle_register"style="font-weight:bold;">기본 정보</td>	
				</tr>

				<tr>
					<td colspan=2><hr></td>
				</tr>

 		<tr>
               <td style="font-weight:bold;">E-mail*</td>
               <td>
               <input type="text"  class="text2_register input_email" value= "${result.email}"  readonly>
               <br>
               </td>
            </tr>

				<tr>
					<td style="font-weight:bold;"> PW *</td>
					<td><input class="text2_register input_pw" type="password" value= "${result.password}"  minlength = "3"  name = "password" required>
					   <span id="checkPw" style="font-size: 12px;"></span><br>
					<br>
					</td>
				</tr>

				<tr>
					<td style="font-weight:bold;">PW*</td>
					<td>
					<input class="text2_register input_pw2" type="password" placeholder="password" name = "password2"value="${result.password}"  minlength = "3" required >
					 <span id="checkPw2" style="font-size: 12px;"></span><br>
					</td>
					
				<tr>
					<td style="font-weight:bold;">전화번호</td>
					<td>
					<input class="text2_register input_phone2" type="text" placeholder="010-1111-2222"  minlength = "11"  maxlength = "11" name = "tel"value="${result.tel}" required >
					<span id="checkPhone" style="font-size: 12px;"></span><br>
					</td>	
					
				</tr>
				<tr>
					<td style="font-weight:bold;">Address *</td>
					<td>
			
					<input type="text" value="${result.adp}" name="adp"  class="text2_register"  id="sample6_postcode" placeholder="우편번호" required>
					 <input class="btn btn-warning text-dark" style="background-color: white; border-color: #ffc107" type="button"  onclick="sample6_execDaumPostcode()" value="우편번호🔎"><br></td>
					
					
				</tr>


				<tr>
					<td style="font-weight:bold;"></td>
					<td>
					<input class="text2_register" id="sample6_address" type="text"value= "${result.ad}" name = "ad" required oninput="changeClass()">
					<br>
					</td>
				</tr>

				<tr>
					<td class="td1"></td>
					<td>
					<input class="text2_register" id="sample6_detailAddress" type="text" value= "${result.ad1}" name = "ad1" oninput="changeClass()">
					<br>
					</td>
				</tr>
				
				
				
				<tr>
					<td class="td1">
					<input type = "hidden" value= "#" name = "tid">
					</td>
					<td>
					<input class="text_register" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					<br>
					</td>
				</tr>
				
				<tr>
    			  <td ><input type="hidden" class="input_phone1" name = "tel1" value="${result.tel}" >   </td>
    			  <td><input type ="hidden" class="input_email" name = "email" value = "${result.email}"><br></td>
  				 </tr>
			</table>

				<div style="text-align:center;">
				 <input id="infoSubmit" class="infobox3" type="submit" value=" 정보 수정">
				<a class="infobox2" type="button"  href="/main.do">돌아가기</a>
				</div>
		</form> 
		
	<form  class=" displaye mt-5"action="userDelete.do?email=${result.email}" method="post">
    <input type="checkbox" class="deleteCheck">
    <label for="deleteCheck">회원탈퇴 동의</label><br>
    <input class="  btCheck infobox4" type="submit" id="deleteButton" value="회원탈퇴" disabled>
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
		

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>	
    <script  src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var inputBoxes = document.querySelectorAll('input[type="text"]');
        
        inputBoxes.forEach(function(inputBox) {
            inputBox.addEventListener('click', function() {
                var infoSubmitButton = document.getElementById('infoSubmit');
                infoSubmitButton.classList.remove('infobox2');
                infoSubmitButton.classList.add('infobox6');
            });
        });
    });
</script>


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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
		<script>
		$('.deleteCheck').on('change', function() {
		    if ($(this).is(':checked')) {
		       $(".btCheck").prop('disabled', false);
		    }else {
		      $(".btCheck").prop('disabled', true);
		        }
		});
		</script>
		<script>
		   $('.input_pw, .input_pw2').focusout(function() {
		       let password1 = $(".input_pw").val();
		       let password2 = $(".input_pw2").val();
		
		       if (password1 !== "" && password2 !== "") { 
		           $.ajax({
		               url: "checkPw.do",
		               type: "post",
		               data: {
		                   password1: password1,
		                   password2: password2
		               },
		               dataType: 'json',
		               success: function(result) {
		                   if (result == 1) {
		                       $("#checkPw").html("비밀번호가 일치합니다.").css("color", "green");
		                       $("#checkPw2").html("비밀번호가 일치합니다.").css("color", "green");
		                   } else {
		                       $("#checkPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
		                       $("#checkPw2").html("비밀번호가 일치하지 않습니다.").css("color", "red");
		                   }
		               },
		               error: function(e) {
		                  alert('checkPw 서버 요청 실패: ' + e);
		               }
		           });
		       }
		   });
		</script>
		<script>
		   $('.input_phone2').on('input',function() {
		      let userPhone = $(this).val();
		      
		      let formattedPhone = userPhone.replace(/[^0-9]/g, '');
		
		      if (formattedPhone.length === 11) {
		         formattedPhone = formattedPhone.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
		      }
		         $(this).val(formattedPhone);
		    });
		   $('.input_phone2').focusout(function() {
		      let userPhone2 = $(this).val();
		      let userEmail = $(".input_email").val();
		      let userPhone1 = $(".input_phone1").val();
		   $.ajax({
		      url : "infoCheckPhone.do",
		      type : "post",
		      data : {userPhone1 : userPhone1,
		             userPhone2 : userPhone2,
		             userEmail : userEmail
		             },
		      dataType : 'json',
		      success : function(result) {
		          if (result==1 && userPhone2.startsWith('010')&& userPhone2.length === 13) {
		             $("#checkPhone").html('사용할 수 있는 전화번호입니다.');
		            $("#checkPhone").css('color', 'green');
		      } else {
		            $("#checkPhone").html('사용할 수 없는 전화번호입니다.');
		            $("#checkPhone").css('color', 'red');
		             }
		      },
		      error : function(e) {
		            alert('checkPhone 서버 요청 실패: ' + e);
		         }
		      });
		   });
		</script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
		<script>
		$('.deleteCheck').on('change', function() {
		    if ($(this).is(':checked')) {
		       $(".btCheck").prop('disabled', false);
		    }else {
		      $(".btCheck").prop('disabled', true);
		        }
		});
		</script>
		
		<script>
		   $('.input_pw, .input_pw2').focusout(function() {
		       let password1 = $(".input_pw").val();
		       let password2 = $(".input_pw2").val();
		
		       if (password1 !== "" && password2 !== "") { 
		           $.ajax({
		               url: "checkPw.do",
		               type: "post",
		               data: {
		                   password1: password1,
		                   password2: password2
		               },
		               dataType: 'json',
		               success: function(result) {
		                   if (result == 1) {
		                       $("#checkPw").html("비밀번호가 일치합니다.").css("color", "green");
		                       $("#checkPw2").html("비밀번호가 일치합니다.").css("color", "green");
		                       $(".btCheck").prop('disabled', false);
		                   } else {
		                       $("#checkPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
		                       $("#checkPw2").html("비밀번호가 일치하지 않습니다.").css("color", "red");
		                       $(".btCheck").prop('disabled', true);
		                   }
		               },
		               error: function(e) {
		                  alert('checkPw 서버 요청 실패: ' + e);
		               }
		           });
		       }
		   });
		</script>
		<script>   
		$('.input_phone2').on('input',function() {
		      let userPhone = $(this).val();
		      
		      let formattedPhone = userPhone.replace(/[^0-9]/g, '');
		
		      if (formattedPhone.length === 11) {
		         formattedPhone = formattedPhone.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
		      }
		         $(this).val(formattedPhone);
		    });
		$('.input_phone2').focusout(function() {
		      let userPhone2 = $(this).val();
		      let userEmail = $(".input_email").val();
		      let userPhone1 = $(".input_phone1").val();
		   $.ajax({
		      url : "infoCheckPhone.do",
		      type : "post",
		      data : {userPhone1 : userPhone1,
		             userPhone2 : userPhone2,
		             userEmail : userEmail
		             },
		      dataType : 'json',
		      success : function(result) {
		          if (result==1 && userPhone2.startsWith('010')&& userPhone2.length === 13) {
		            $("#checkPhone").html('사용할 수 있는 전화번호입니다.');
		            $("#checkPhone").css('color', 'green');
		            $(".btCheck").prop('disabled', false);
		          } else {
		            $("#checkPhone").html('사용할 수 없는 전화번호입니다.');
		            $("#checkPhone").css('color', 'red');
		           $(".btCheck").prop('disabled', true);
		
		             }
		      },
		      error : function(e) {
		            alert('checkPhone 서버 요청 실패: ' + e);
		         }
		      });
		   });
		</script>
</body>
</html>