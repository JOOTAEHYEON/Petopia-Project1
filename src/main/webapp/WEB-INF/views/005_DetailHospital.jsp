 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->

 <link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">

<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/005_Detail.css">
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
		<!-- ==========================nav============================= -->	
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

	<!-- ---------------------------------------------------------------------- -->
	<div class="topm_Details  ">
		<div class="  displays innertop_Details ">
			<div class="displaycos ">
				<div class="innerbox_Details">productID:${dto2.hsoo}</div>
				<div class=""><img src="${pageContext.request.contextPath}/resources/hospic/${dto2.hsoo}.jpg" class="img-fluid img_Details"></div>
			</div>
			<div class="innerbox3_Details col-5 ">
				<div class="displays">
					 <h5><span class="badge text-bg-secondary "> ${dto2.haddress2} </span></h5>
					 <h5><span class="badge text-bg-secondary"> 강아지,고양이 </span></h5>
					 <h5><span class="badge text-bg-secondary"> ${dto2.hhuemoo}  </span></h5>
				</div>	 
					<hr>
			<div class="boxtop text_Details">[동물병원 예약] ${dto2.hname} </div>		     
			 <div class="text_Details sejong_nav" style="margin-top:20px">진료 분야: <span class="text_Details">${dto2.harea}</span></div>
				<div class="displays " >					   
					<div class="detailbox2_Details">											
						<div class="text2_Details sejong_nav">영업 시간:  <span  class="text3_Details">${dto2.htime}</span></div>	
						<div class="text2_Details sejong_nav" > 전화 번호: <span class="text3_Details">${dto2.htel}</span></div>
						
						<div class="displays" style="width:600px;" >				
   							<div class="text2_Details sejong_nav " >가게 주소: <span class="text3_Details" >${dto2.haddress}</span></div>
   						 </div>
						<div class="displays" style="width:600px;">
							<div class="text2_Details sejong_nav"> 이용 날짜: 	</div>					
   							<input class="text3_Details"type="date" id="Ddate" max="2077-06-20" min="2024-04-03" value="날짜를 선택해주세요" onchange="setDate()">
   						 </div>
						
						<div class="displays"  style="width:600px;" >
						<div class="text2_Details sejong_nav">반려동물:</div>		
						<div class="select" data-role="selectBox" style="margin-right:50px;">						
 							<span data-value="optValue" class="selected-option" id="setCate"onchange="setCate()"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
						 <ul class="hide">
						 <li><i>유기견 또는 유기묘를 보호중입니다. </i></li>   
						<li><i><img src="./resources/dogpic/golden.png" alt="골든리트리버"></i>골든리트리버</li>
						<li> <i><img src="./resources/dogpic/daks.png" alt="닥스훈트"></i>닥스훈트</li>    
    					<li><i><img src="./resources/dogpic/mol.png" alt="말티즈"/></i>말티즈</li>
     					<li><i><img src="./resources/dogpic/bull.png" alt="불독"/></i>불독</li>   
      					<li><i><img src="./resources/dogpic/bee.png" alt="비숑 프리제"/></i>비숑 프리제</li>   
         	  		  	<li><i><img src="./resources/dogpic/shu.png" alt="슈나우저"/></i>슈나우저</li>    
     					<li><i><img src="./resources/dogpic/spitz.png" alt="스피츠"/></i>스피츠</li>    
      					<li><i><img src="./resources/dogpic/shiba.png" alt="시바견"/></i>시바견</li>    
     					<li><i><img src="./resources/dogpic/shichu.png" alt="시츄"/></i>시츄</li>    
     					<li><i><img src="./resources/dogpic/york.png" alt="요크셔테리어"/></i>요크셔테리어</li>    
     					<li><i><img src="./resources/dogpic/well.png" alt="웰시코기"/></i>웰시코기</li>   
     					<li><i><img src="./resources/dogpic/wawa.png" alt="치와와"/></i>치와와</li>    
     					<li><i><img src="./resources/dogpic/poo.png" alt="푸들"/></i>푸들</li>   
     					<li><i>기타 반려동물</i></li>   
     					
						</ul>
						</div> 
						</div>
					</div>
				 </div>	
					<div class=" displays  detailbox3_Details  ">				
							<form name="form2" id="form2" method="post" action="Bookingconfirm.do" onsubmit="return validateForm()">
   							<input type="hidden" name="rname" value="${dto2.hname}">
            				<input type="hidden" name="rtel" value="${dto2.htel}">
            				<input type="hidden" name="raddress" value="${dto2.haddress}">
            				<input type="hidden" name="rsoo" value="${dto2.hsoo}">
            				
            				<input type="hidden" name="rdate" id="hDate" value="">
            				<input type="hidden" name="rcate" id="hCate" value="">
							<input type="submit" class="btn btn-warning"style="width: 450px; height: 60px;" value="예약하기">
							</form>
						</div>
			</div>					
			</div>
		</div>
		<!-- ==============================이미지============================================================= -->
	<br class="br mt-4">
	  <div class="lowm_Details">
	  <div class="m-4 text_Details do_nav"> 🛍️ 함께 보면 좋은상품</div>
	  <div class="swiper  ">
    <div class="swiper-wrapper ">
     <a class="swiper-slide swiperbox" href="${pageContext.request.contextPath}/detailhospital.do?hname=탑케어동물의료원"><img src="./resources/hospic/H77.jpg" width="350" height="280"></a>
      <a  class="swiper-slide swiperbox"  href="${pageContext.request.contextPath}/detailhospital.do?hname=다니엘 동물병원"><img src="./resources/hospic/H78.jpg" width="350" height="280"></a>
      <a class="swiper-slide swiperbox "  href="${pageContext.request.contextPath}/detailhospital.do?hname=올리브동물병원"><img src="./resources/hospic/H80.jpg" width="350" height="280"></a>
      <a  class="swiper-slide swiperbox"  href="${pageContext.request.contextPath}/detailhospital.do?hname=이솝동물병원"><img src="./resources/hospic/H79.jpg" width="350" height="280"></a>
     <a  class="swiper-slide swiperbox"  href="${pageContext.request.contextPath}/detailhospital.do?hname=새로이동물병원"><img src="./resources/hospic/H82.jpg" width="350" height="280"></a>
    </div>
    <div class="swiper-button-next "></div>
    <div class="swiper-button-prev "></div>
  </div>
  </div>
	
	<br class="br mt-4 ">	
	
	 <div class="lowm_Details">
	<div class="m-4 text_Details do_nav"> 📍 ${dto2.hname} 위치 보기</div>
	<div id="map" class=" displaycos ">
	<div id="map" style="width:100%;height:550px;"> 
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dddf6d5373373b1943e071a19d860b49"></script>
     <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div       
         mapOption = { 
             center: new kakao.maps.LatLng(${dto2.hxdo}, ${dto2.hydo}), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
         };

         var map = new kakao.maps.Map(mapContainer, mapOption);

         //마커가 표시될 위치입니다 
         var markerPosition  = new kakao.maps.LatLng(${dto2.hxdo}, ${dto2.hydo}); 

         //마커를 생성합니다
         var marker = new kakao.maps.Marker({
         position: markerPosition
         });

         //마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);

         var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;"> 도착지입니다', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
         iwPosition = new kakao.maps.LatLng(${dto2.hxdo}, ${dto2.hydo}); //인포윈도우 표시 위치입니다

         //인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
         position : iwPosition, 
         content : iwContent 
         });

         //마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
         infowindow.open(map, marker); 
  </script>    
	</div>
	</div>
	</div>
	
	<br class="br mt-4 ">	
	
	
	
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
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>

function setDate() {
    // 선택된 옵션의 값을 가져와서 텍스트 입력란에 설정
    var selectedDdate = document.getElementById("Ddate").value;
    document.getElementById("hDate").value = selectedDdate;
}
window.onload = function() {
    // 각 리스트 아이템에 클릭 이벤트를 추가
    const listItems = document.querySelectorAll('.select li');
    listItems.forEach(item => {
        item.addEventListener('click', function() {
            const selectedValue = item.innerText.trim(); // 선택된 값 가져오기
            document.getElementById('setCate').innerText = selectedValue; // span에 선택된 값 표시
            document.getElementById('hCate').value = selectedValue; // 히든 필드에 선택된 값 설정
        });
    });
};
</script>



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

<script>
    var swiper = new Swiper('.swiper', {
      slidesPerView: 3,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        resize: function () {
          swiper.changeDirection(getDirection());
        },
      },
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

      return direction;
    }

    function validateForm() {
        var hDate = document.getElementById("hDate").value;
        var hCate = document.getElementById("hCate").value;

        if (hDate === "" || hCate === "") {
            alert("날짜와 카테고리를 선택하세요.");
            return false; // 제출 중지
        }

        // 만약에 모든 조건이 충족되면 폼을 제출
        return true;
    }
    
</script>
 <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>