var button1 = $( '#change' ).html(); // 버튼 내용일단 넣어둬
      

$(function loginChack(){
        if(session.getAttribute("id")!=null){// 로그인이 됬을때
          $( '#change' ).html('<img src="../image/profile.jpg" alt="사용자 아이디" class="profile navbar-right">'); 
          //id가 change인 div로 가서 데베에 있는 사용자 프로필 기본이미지 나중에는 이게 사용자가 원하는 이미지로 교체
          //이 이미지 클릭후 로그아웃과 마이페이지 넘어가는 팝오버를 할것인지 아니면 클릭하면 다른 창으로 넘어갈것인지 정하기.

        }
        else{
          //로그인 안될때 그냥 그대로 가고
        }
      }) // 이거는 나중에 스크립트로 뺄거임

