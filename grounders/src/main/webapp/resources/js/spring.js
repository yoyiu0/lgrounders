$(document).ready(function(){
  // 내비게이션(GNB)
  // 만약 윈도우의 가로길이가 1280이상이면 pc버전으로 메뉴가 나타나고,
  // 윈도우의 가로 길이가 1280미만이면 모방리 버전 메누가 나타남
  if($(window).width() >=1280){
    // PC버전

    // 메인 내비게이션의 서브메뉴 숨김
    $('nav .container .sub').hide();

    // 주메뉴에 마우스 오버하면 서브메뉴와 배경 나타남
    $('.navCenter > ul > .tog').hover(function(){
      $('.sub').stop().slideUp();
      $(this).find('.sub').stop().slideDown();   //서브메뉴
      $('.sub_bg').stop().slideDown();   //서브메뉴배경
    });
    // nav에서 마우스 아웃하면 서브메뉴와 배경 사라짐
    $('nav  .tog ').mouseleave(function(){
      $('.sub').stop().slideUp();      //서브메뉴
      $('.sub_bg').stop().slideUp();   //서브메뉴배경
    });

  }

});