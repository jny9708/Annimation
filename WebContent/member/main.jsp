<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.model.*"%>
<%@page import="com.member.model.*"%>
<!DOCTYPE html>

<%
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
	}
	//ArrayList<AniBoardDto> list = //(ArrayList<AniBoardDto>)request.getAttribute("anis");
	ArrayList<ProBoardDto> newly_list = (ArrayList<ProBoardDto>)request.getAttribute("newly_list");
	ArrayList<Integer> sc_list =(ArrayList<Integer>)request.getAttribute("sc_list");
	int roop=-1;
%>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_2).png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!--부트스트랩-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!--부트스트랩-->
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/javascript/index.js"></script><!--index js-->
    <script src="<%=request.getContextPath()%>/javascript/ScrollTrigger.min.js"></script><!--애니메이션효과js-->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,500,700" rel="stylesheet"><!--애니메이션효과css-->
    <link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet" type="text/css"> <!--애니메이션효과css-->
    <script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script><!--카드-->
  <title>함께 만들어가다. : 아울러</title>
    <script>
      window.counter = function() {
	// this refers to the html element with the data-scroll-showCallback tag
      var span = this.querySelector('span');
      var current = parseInt(span.textContent);

      span.textContent = current + 1;
    };

    document.addEventListener('DOMContentLoaded', function(){
      var trigger = new ScrollTrigger({
        addHeight: true
      });
    });
    </script>
</head>
<body id="index_body">
 <header>
    <!------------- Navbar -------------->
    <nav class="navbar navbar-default bs-white navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header_nav">

                    <span class="sr-only">Toggle navigation</span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                  </button>
          <a href="./Main.do"><img src="<%=request.getContextPath()%>/image/final_logo(header).png" alt="아울러" class="logo" style="padding:0px;"></a> <!--로고-->
        </div>

        <div class="collapse navbar-collapse" id="header_nav">
          <ul class="nav navbar-nav header_title" style="margin:10px;">
            <li class="active"><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li><a href="./Contest.co">공모전 정보</a></li>
            <li><a href="./Guide.do">가이드</a></li>
          </ul>


          <form class="navbar-form form-inline  navbar-right" role="search" action="./Project.bo" method="get" id="form_box" name="tag_search">
          	
              <div class="input-group">
                 <input type="text" name="TagSearch" id="TagSearch" class="search-box" placeholder="#해시">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              <% if(MemberDto==null){%>
              
                 <div class="input-group" style="clear:both">
                     <a href="./LoginForm.do">로그인</a>
                </div></div>
                <%}else if(MemberDto!=null){ %>
                
                
    	  <ul class="nav navbar-nav navbar-right" id="change">
            <li class="dropdown">
              <a href="#"  class="dropdown-toggle navbar-img" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <h5 style="display: inline-block;"><%=MemberDto.getMem_id() %></h5>
             <%if(MemberDto.getMem_icon().equals("profile.jpg")){ %>
              <img src="<%=request.getContextPath()%>/image/profile.jpg" class="img-circle" alt="Profile Image"/>
              <%}else{
            	  System.out.println("아이콘경로있음");%>
            	  <img src="<%=request.getContextPath()%>/image/<%=MemberDto.getMem_icon()%>" class="img-circle" alt="Profile Image"/>
            	  <%} %>
              </a>
              <ul class="dropdown-menu">
                <li><a href="./UserPageApp.do?mem_no=<%=MemberDto.getMem_no()%>">마이페이지</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="./MemberLogout.do">로그아웃</a></li>
              </ul>
            </li>
          </ul>  
<!--  로그인 햇으면 이걸로! 드롭다운에는 마이페이지와 로그아웃 넘어가는 드롭다운!-->
<%} %>
        </form>
      </div>
    </nav> 
</header>

<main>
  <div class="container-fulid">
    
      <div class="welcome-section content-hidden">
        <div class="content-wrap">
            <div class="container">
            <ul class="fly-in-text fly">
                <li class="image blinking">함께 만들어가다.</li>
                <li class="image blinking">아울러</li>
            </ul>

            <a href="./Project.bo" class="enter-button">팀원 모집</a>&emsp;
            <a href="#" class="enter-button">가이드</a>
        </div>
    </div>
    </div>
      
    
      <div id="introduction">
        <div class="container">

              <h1 data-scroll="toggle(.fromTopIn, .fromTopOut)" class="fromTopIn">아울러란?</h1>
              <div class="inin_con" data-scroll="toggle(.fromBottomIn, .fromBottomOut)" class="fromBottomIn">
                웹 애니메이션을 제작하기 위해서는 다양한 분야의 직군들이 필요합니다. <br>
                하지만 각 분야별 직군의 사람들은 본인의 분야 이외의 작업을 할 경우가 드물며 다른 직군의 제작자들을 찾는 데에도 시간적, 공간적 제약이 따르게 됩니다.<br> 
                이와 같은 불편함을 해소시키기 위해 웹 애니메이션 제작자들이 협업할 사람들을 쉽고 편리하게 구할 수 있는 통합 서비스인 <strong>아울러</strong>가 등장했습니다.
              </div>
            </div>
  
        </div>

      
      <div id="advantage">
        <div class="container">
          <h1 data-scroll="toggle(.fromTopIn, .fromTopOut)" class="fromTopIn">아울러 특징</h1>
          <div class="circle_con">
              <div id="ad_circle1" class="circle" data-scroll="toggle(.scaleDownIn, .scaleDownOut)" class="scaleDownIn" onmouseover="mover1()" onmouseout="mout1()">맞춤형 웹사이트</div>
              <div id="ad_circle2" class="circle" data-scroll="toggle(.scaleDownIn, .scaleDownOut)" class="scaleDownIn" onmouseover="mover2()" onmouseout="mout2()">손쉬운 지원방식</div>
              <div id="ad_circle3" class="circle" data-scroll="toggle(.scaleDownIn, .scaleDownOut)" class="scaleDownIn" onmouseover="mover3()" onmouseout="mout3()">팀원 모집과 공모전 정보를 하나로</div>
          </div>
        </div>
      </div>

      <div id="latest">
        <div class="container">
          <h1 data-scroll="toggle(.fromTopIn, .fromTopOut)" class="fromTopIn"><a href="./Project.bo">최신모집>></a></h1>
          <div data-scroll="toggle(.fromBottomIn, .fromBottomOut)" class="fromBottomIn">
            
            <%for(int i=0; i<newly_list.size(); i++){ %>
            
            
            <div id="dede">
              <div id="card_User">
                <a href="./UserPageApp.do?mem_no=<%=newly_list.get(i).getMem_no()%>">
                
                <%if(newly_list.get(i).getMem_icon().equals("profile.jpg")){ %>
                <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                <%}else{
                	System.out.println("아이콘경로있음");%>
                	<img src="<%=request.getContextPath()%>/image/<%=newly_list.get(i).getMem_icon()%>" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                	<%} %>
                </a>
                <p class="projact_card_U_font"><%=newly_list.get(i).getMem_nickname() %><br><small><%=newly_list.get(i).getMem_job() %></small></p>
              </div>
            
              <div id="card_content">
                <div class="oneline">
                  <ul>
                    <li class="oneline_team"><%=newly_list.get(i).getBoa_region()%></li>
                    <li><a href="./ProDetail.bo?no=<%=newly_list.get(i).getBoa_no()%>"><%=newly_list.get(i).getBoa_title()%></a>  
                      <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star(<%=newly_list.get(i).getBoa_no()%>)" title="스크랩" data-original-title="Default tooltip">
                      <%
               			for(int j=0; j<sc_list.size(); j++){
               				if(sc_list.get(j)==newly_list.get(i).getBoa_no()){%>
               			<img id="i_<%=newly_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/yellowstar.png">
               					 
               				<%roop=1;}
               				}if(roop!=1){%>
               					<img id="i_<%=newly_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/graystar.png">		
               				<%}roop=0; %>
               				
                      </button>            
                    </li>
                    <li><small style="float:right;">등록날짜|&nbsp;&nbsp;2019-04-23</small></li>
                  </ul> 
                </div>
                <div class="twoline">
                  <table class="table">
                    <tr>
                      <td id="twoline_title">모집분야</td>
                      <td ><b id="twoline_content"><%=newly_list.get(i).getBoa_job()%></b></td>
                    </tr>
                    <tr>
                      <td id="twoline_title">작업기간</td>
                      <td><b id="twoline_content">
                      <%if(newly_list.get(i).getBoa_pro_period().equals("Period_Week")){%>
                        ~1주일
                        <%}else if(newly_list.get(i).getBoa_pro_period().equals("Period_One")){ %>
                        1주일 ~ 1개월
                        <%}else if(newly_list.get(i).getBoa_pro_period().equals("Period_Three")){ %>
                        1개월 ~ 3개월
                        <%}else if(newly_list.get(i).getBoa_pro_period().equals("Period_Six")){ %>
                        3개월 ~ 6개월
                        <%}else if(newly_list.get(i).getBoa_pro_period().equals("Period_Year")){ %>
                        6개월 ~ 1년
                        <%} %>
                        </b></td>
                    </tr>
                    <tr>
                      <td id="twoline_title">마감날짜</td>
                      <td><b id="twoline_content">
                       <%if(newly_list.get(i).getBoa_d_day()>0){ %>
                      D - <%=newly_list.get(i).getBoa_d_day()%>
                      <%}else if(newly_list.get(i).getBoa_d_day()==0){ %>
                      TODAY
                      <%}else if(newly_list.get(i).getBoa_d_day()<0){  int d_day=Math.abs(newly_list.get(i).getBoa_d_day()); %>
                      D + <%=d_day%>
                      <%} %>
                      </b></td>
                    </tr>
                    <tr>
                      <td id="twoline_title">모집인원</td>
                      <td><b id="twoline_content"><%=newly_list.get(i).getApp_number()%>/<%=newly_list.get(i).getBoa_num()%> &nbsp;명</b></td>
                    </tr>
                  </table>
                </div>
                <div class="threeline">
                    <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                    <ul>
                       <%for(int j=0; j<newly_list.get(i).getBoa_hashtag().size(); j++ ){%>
                      <li><a href="./Project.bo?TagSearch=<%=newly_list.get(i).getBoa_hashtag().get(j)%>" rel="hash">
                      #<%=newly_list.get(i).getBoa_hashtag().get(j)%>
                      </a></li>
                      <%}%>
                    </ul>
                    <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                  </div>
            </div><!--카드상세내용-->
          </div><!--전체카드dede-->
          <%} %>
          </div>
        </div>
      </div>
  </div>

</main>
<footer style="clear:both; background-color: white;">
    <div id="copyright" class="container">
      <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
    </div>
  </footer>

</body>
</html>