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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/008_boardwrite.css">

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

<!-- =========================  게시글 작성 폼 =====================================  -->


<form action="insertBoard.do" method="post" enctype="multipart/form-data" class="topm_boardwrite displaycos " > 
	<div class="m-3  jua_nav Title_boardwrite" style="display: inline-block;">📝 커뮤니티 글쓰기</div>
	<div class="" style="width:80%">
	<div class="m-3 displays">
	
		<!-- 카테고리 -->	
		<div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px"> 카테고리  </div>
			<div class="m-3 displays"  id="catebtn">
				<input class="btn01"  type="button" value="Q & A" onclick="setCategoryValue(this.value)">    
   				 <input class="btn01"  type="button" value="라운지" onclick="setCategoryValue(this.value)">
   				 <input class="btn01"  type="button" value="기타" onclick="setCategoryValue(this.value)">
   				 <input id="cate" type="hidden" name="bbscategory" value="" >
			</div>
	    </div>
	
	<!-- 견종 -->
	<div class="m-3 displays">		
			<div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">견종목록</div> 
			<div class="select" data-role="selectBox" style="margin-right:50px;">
 			<span data-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
				 <ul class="hide">
				<li><i><img src="./resources/dogpic/골든리트리버.png" alt="골든리트리버"></i>골든리트리버</li>
				<li><i><img src="./resources/dogpic/닥스훈트.png" alt="닥스훈트"></i>닥스훈트</li>    
    			<li><i><img src="./resources/dogpic/말티즈.png" alt="말티즈"/></i>말티즈</li>
     			<li><i><img src="./resources/dogpic/불독.png" alt="불독"/></i>불독</li>   
      			<li><i><img src="./resources/dogpic/비숑프리제.png" alt="비숑프리제"/></i>비숑 프리제</li>   
         	    <li><i><img src="./resources/dogpic/슈나우저.png" alt="슈나우저"/></i>슈나우저</li>    
     			<li><i><img src="./resources/dogpic/스피츠.png" alt="스피츠"/></i>스피츠</li>    
      			<li><i><img src="./resources/dogpic/시바견.png" alt="시바견"/></i>시바견</li>    
     			<li><i><img src="./resources/dogpic/시츄.png" alt="시츄"/></i>시츄</li>    
     			<li><i><img src="./resources/dogpic/요크셔테리어.png" alt="요크셔테리어"/></i>요크셔테리어</li>    
     			<li><i><img src="./resources/dogpic/웰시코기.png" alt="웰시코기"/></i>웰시코기</li>   
     			<li><i><img src="./resources/dogpic/치와와.png" alt="치와와"/></i>치와와</li>    
     			<li><i><img src="./resources/dogpic/푸들.png" alt="푸들"/></i>푸들</li>   
     			<li><i>기타</i></li>   
     			<li><i> <input id="dog" type="hidden" name="bbsdog" value="" ></i></li> 
				 </ul>
			</div>
		<div id="dogImageContainer"></div>
	</div>

     <!-- bbsid로 넘겨 받기 -->
     <%-- <input type="hidden" id="suerid" name="userid" value="${bto.userid}"> --%>
     <!-- <input type="hidden" id="currentDate" name="bbsdate"> -->
     <input type="hidden" name="bbsid" value="">


    <!-- 게시글 제목, 내용 입력 -->
	<div class="m-3 displaycos " style="height:500px;">
			<div class="text3_boardwrite do_nav">  <img src="./resources/pic/mypage.png" width="30px" height="30px"> 내용작성  </div>
			<div class="displaycos box3_boardwrite" >
				<input type="text" class="box_boardwrite" name="bbstitle" placeholder="제목을 작성해주세요.">
				<input type="text" class="box2_boardwrite" name="bbscontent" placeholder="5자 이상의 내용을 입력해주세요" >
				<div class="text_boardwrite"> * 내용은 5-7000자로 입력해주세요</div>
			</div>
	</div>
	
	<!-- 이미지 업로드 -->
	<div class=" displays mx-2">		
			<div class="text2_boardwrite do_nav">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">이미지 등록 </div> 
			
			<div class="displays ">
 			 <label for="file"> <div class="upload"></div></label>
  			<input type="file" class="real-upload" name="file" accept="image/*">
 			 <ul class="image-preview"></ul>
  			</div>
	</div> 
	
	<div class="displays">
	   <input type="submit" class="btn3_boardwrite" value="게시글 등록하기">
	   <!-- <button type="submit" class="btn3_boardwrite"> 게시글 등록 하기 </button> -->
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
const body = document.querySelector('body');
const select = document.querySelector(`[data-role="selectBox"]`);
const values = select.querySelector(`[data-value="optValue"]`);
const option = select.querySelector('ul');
const opts = option.querySelectorAll('li');

/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
function selects(e){
    e.stopPropagation();
    option.setAttribute('style',`top:${select.offsetHeight}px`)
    if(option.classList.contains('hide')){
        option.classList.remove('hide');
        option.classList.add('show');
    }else{
        option.classList.add('hide');
        option.classList.remove('show');
    }
    selectOpt();
}

/* 옵션선택 */
function selectOpt(){
    opts.forEach(opt=>{
        const innerValue = opt.innerHTML;
        function changeValue(){
            values.innerHTML = innerValue;
        }
        opt.addEventListener('click',changeValue)
    });
}

/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
function selectFirst(){
    const firstValue = opts[0].innerHTML;
    values.innerHTML = `${firstValue}`
}

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('hide');
        option.classList.remove('show');
    }
}

selectFirst();
select.addEventListener('click',selects);
body.addEventListener('click',hideSelect);


 function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();


      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

        // 파일 갯수 검사
        if ([...files].length < 6) {
          uploadFiles.push(file);
          const reader = new FileReader();
          reader.onload = (e) => {
            const preview = createElement(e, file);
            imagePreview.appendChild(preview);
          };
          reader.readAsDataURL(file);
        }
      });
    }

    function createElement(e, file) {
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());

    realUpload.addEventListener('change', getImageFiles);
</script>


<!-- 견종 insert하는 함수부분 -->
<script>
$(document).ready(function() {
	
    // 옵션 선택 시 이벤트 핸들러
    $(".select ul li").click(function() {
        var selectedText = $(this).text().trim(); // 선택된 텍스트 가져오기
        var selectedValue = $(this).data('value'); // 선택된 값 가져오기
        $("#dog").val(selectedText); // input 필드의 value를 업데이트
        $("#dogImageContainer").html(`<img src="./resources/dogpic/${selectedValue}.png" alt="${selectedText}">`);
    });
    
    
    $('.btn3_boardwrite').click(function () {
        // 현재 날짜를 받아와서 hidden input에 설정
        var currentDate = new Date().toISOString().slice(0, 10);
        $('#currentDate').val(currentDate);
    });
    
});
</script>



<script>
    // 이미지 미리보기 기능
    document.getElementById('imageUpload').addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const imgElement = document.createElement('img');
                imgElement.src = event.target.result;
                imgElement.width = 200;  // 이미지 너비 조정
                document.getElementById('previewImageContainer').innerHTML = '';
                document.getElementById('previewImageContainer').appendChild(imgElement);
            }
            reader.readAsDataURL(file);
        }
    });

    $(document).ready(function() {
        // 옵션 선택 시 이벤트 핸들러
        $(".select ul li").click(function() {
            var selectedText = $(this).text().trim();
            var selectedValue = $(this).data('value');
            $("#dog").val(selectedText);
            $("#dogImageContainer").html(`<img src="./resources/dogpic/${selectedValue}.png" alt="${selectedText}">`);
        });

        $('.btn3_boardwrite').click(function () {
            var currentDate = new Date().toISOString().slice(0, 10);
            $('#currentDate').val(currentDate);
        });
    });
</script>



<script>
$(document).ready(function () {
    // 버튼에 대한 클릭 이벤트 처리
    $('.btn01').click(function () {
        // 모든 버튼의 클래스를 'btn01'으로 초기화
        $('.btn01').removeClass('cbtn01');
        // 클릭된 버튼에 'cbtn01' 클래스 추가
        $(this).addClass('cbtn01');
    });
});

function setCategoryValue(value) {
    document.getElementById('cate').value = value;
}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<!-- ========================================== -->
<!-- ========================================== -->
</body>
</html>