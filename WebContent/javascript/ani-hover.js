$(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );

  $('.multiple-items').slick({
    infinite: true, //양방향 무한 모션
    speed:300, // 슬라이드 스피드
    autoplay: true, //자동플레이 유무( false시 자동플레이 안됨 )
    autoplaySpeed:4000, // 자동플레이 스피드
    slidesToShow: 3, //한 화면에 보여줄 아이템수
    slidesToScroll: 3, // 한번에 슬라이드 시킬 아이템 개수
    arrows: false, //좌우 화살 버튼 노출 여부 ( false 시 안보임 )
  });
  
  