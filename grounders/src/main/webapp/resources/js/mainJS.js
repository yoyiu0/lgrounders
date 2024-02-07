
$(document).ready(function(){
//체크박스가 바뀔 때 실행되는 함수
$('input[name=gameDate]').off().on('change', function() {
	
	//변경된 체크박스의 value값
    var checkValue=$(this).val();
    if($("label[for="+checkValue+"]").hasClass("active") == true){
    	$("label[for="+checkValue+"]").removeClass("active");
    }else{
    	$("label[for="+checkValue+"]").addClass("active");
    }
    
    
	
});

    const swiper = new Swiper('.main', {
        // Optional parameters
        loop: true,

        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            
        },
        autoplay: {
            delay: 5000,
        },
    });

    const swiper2 = new Swiper('.club', {
      // 슬라이드 보이는 가짓수
      //slidesPerView:5,
      //spaceBetween:20,
      // 3초마다 자동실행
      autoplay:{
          delay:5000,
          disableOnInteraction: false,
      },
      // 1,2,3,1,2,3...무한루프
      loop: true,
      // 페이지네이션(동그란버튼)
      pagination: {
        el: '.club .swiper-pagination',
        type: 'progressbar'
      },
      // prev, next버튼
      navigation: {
        nextEl: ".fourthSec .swiper-button-next",
        prevEl: ".fourthSec .swiper-button-prev",
      },
      //반응형 breakpoints
      breakpoints:{
        200:{
          slidesPerView:1.5,
          spaceBetween:20
        },
        500:{
          slidesPerView:3,
          spaceBetween:20
        },
        1280:{
          slidesPerView:4.5,
          spaceBetween:20
        },
        1400:{
          slidesPerView:4.5,
          spaceBetween:20
        }
      }
    });

    const swiper3 = new Swiper('.notice', {
      // 슬라이드 보이는 가짓수
      //slidesPerView:5,
      //spaceBetween:20,
      // 3초마다 자동실행
      autoplay:{
          delay:5000,
          disableOnInteraction: false,
      },
		speed:800,
      // 1,2,3,1,2,3...무한루프
      loop: true,
      // 페이지네이션(동그란버튼)
      pagination: {
        el: '.notice .swiper-pagination',
        type: 'progressbar'
      },
      // prev, next버튼
      navigation: {
        nextEl: ".sixthSec .swiper-button-next",
        prevEl: ".sixthSec .swiper-button-prev",
      },
      //반응형 breakpoints
      breakpoints:{
        200:{
          slidesPerView:1.3,
          spaceBetween:10
        },
        500:{
          slidesPerView:3,
          spaceBetween:20
        },
        1280:{
          slidesPerView:4,
          spaceBetween:20
        },
        1400:{
          slidesPerView:4,
          spaceBetween:20
        }
      }
    });


});

