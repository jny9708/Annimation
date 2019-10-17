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
    
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css"> <!--main css-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/logo1.png"><!--로고-->

 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!--제이쿼리-->
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!--부트스트랩CSS-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!--부트스트랩JS-->
    <script src="<%=request.getContextPath()%>/javascript/main.js"></script><!--main js-->
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
          <a href="./Main.do"><img src="<%=request.getContextPath()%>/image/logo3.png" alt="아울러" class="logo" style="padding:0px;"></a> <!--로고-->
        </div>

        <div class="collapse navbar-collapse" id="header_nav">
          <ul class="nav navbar-nav header_title link-header" style="margin:10px;">
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li><a href="./Contest.co">공모전 정보</a></li>
            <li><a href="./Guide.do">가이드</a></li>
          </ul>


          <form class="navbar-form form-inline  navbar-right" role="search" action="./Project.bo" method="get" id="form_box" name="tag_search">
          	
              <div class="input-group">
                 <input type="text" name="TagSearch" id="TagSearch" class="search-box" placeholder="#해시">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              <% if(MemberDto==null){%>
              
                 <div class="input-group link-header" style="clear:both">
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
            	  <img src="<%=request.getContextPath()%>/usericon/<%=MemberDto.getMem_icon()%>" class="img-circle" alt="Profile Image"/>
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
  <div class="main_intro">
          <div id="carousel_intro" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators">
              <li data-target="#carousel_intro" data-slide-to="0" class="active"></li>
              <li data-target="#carousel_intro" data-slide-to="1"></li>
              <li data-target="#carousel_intro" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <img src="<%=request.getContextPath()%>/image/intro_2.png" alt="intro_1">
                <div class="carousel-caption">  
                </div>
              </div>
              <div class="item">
                <img src="<%=request.getContextPath()%>/image/intro_5.png" alt="intro_2">
                <div class="carousel-caption">
                </div>
              </div>
              <div class="item">
                <img src="<%=request.getContextPath()%>/image/intro_img5.png" alt="intro_2">
                <div class="carousel-caption">
                </div>
              </div>
            </div>
          </div>
        </div><!--intro-->
        
        <article>
            <div class="container">
                    <nav class="navbar navbar-default">
                            <ol class="nav navbar-nav nav-indicators">
                                <li data-target="#InCarousel" data-slide-to="0" class="InCarousel-target active" style="display: none"> 
                                    <a href="#">아울러란</a>
                                </li>
                                <li data-target="#InCarousel" data-slide-to="1" class="InCarousel-target">
                                    <a href="#">맞춤형 사이트</a>
                                </li>
                                <li data-target="#InCarousel" data-slide-to="2" class="InCarousel-target in_margin_left">
                                    <a href="#">손 쉬운 지원방식</a>
                                </li>
                                <li data-target="#InCarousel" data-slide-to="3" class="InCarousel-target in_margin_left">
                                    <a href="#">모든 정보를 하나로</a>
                                </li>
                            </ol>
                        </nav>
            </div>
           
                    
            <div id="InCarousel" class="carousel">
                <div class="carousel-inner">
                          <div data-slide-no="0" class="item carousel-item active">
                            <div class="wrapper">
                              <img src="<%=request.getContextPath()%>/image/in_img3.png" class="img-responsive" style="width:50%; float: left;">
                              <div class="in_intro">
                                  <h1>
                                      <span class="in_h1">아울러는</span>
                                        <a class="carousel-control left" href="#InCarousel" data-slide="prev">
                                          <span class="icon-prev"></span>
                                        </a>
                                        <a class="carousel-control right" href="#InCarousel" data-slide="next">
                                          <span class="icon-next"></span>
                                        </a>
                                </h1>
                                  <p>  웹 애니메이션을 제작하기 위해서는 다양한 분야의 직군들이 필요합니다. <br>
                                    하지만 각 분야별 직군의 사람들은 본인의 분야 이외의 작업을 할 경우가 드물며 다른 직군의 제작자들을 찾는 데에도 시간적, 공간적 제약이 따르게 됩니다.<br> 
                                    이와 같은 불편함을 해소시키기 위해 웹 애니메이션 제작자들이 협업할 사람들을 쉽고 편리하게 구할 수 있는 통합 서비스인 <strong>아울러</strong>가 등장했습니다.</p>
                                    <button onclick="location.href = './Project.bo' " class="in_but">같이하기</button>
                                  </div>
                            </div>
                          </div>
                          <div data-slide-no="1" class="item carousel-item">
                            <div class="wrapper">
                              <img src="<%=request.getContextPath()%>/image/Characteristics_1.png" class="img-responsive" style="width:50%; height:auto;float: left;">
                              <div class="in_intro">
                                    <h1>
                                        <span class="in_h1">맞춤형 웹사이트</span>
                                          <a class="carousel-control left" href="#InCarousel" data-slide="prev">
                                            <span class="icon-prev"></span>
                                          </a>
                                          <a class="carousel-control right" href="#InCarousel" data-slide="next">
                                            <span class="icon-next"></span>
                                          </a>
                                  </h1>
                                  <p> 아마추어 웹 애니메이션 제작자들의 웹 애니메이션 제작을 고려한 <br>팀원 모집 사이트</p>
                                  <button onclick="location.href = './Project.bo' " class="in_but">같이하기</button>
                                </div>
                            </div>
                          </div>
                          <div data-slide-no="2" class="item carousel-item">
                            <div class="wrapper">
                                <img src="<%=request.getContextPath()%>/image/Characteristics_2.png" class="img-responsive" style="width:50%; height:auto;float: left;">
                                <div class="in_intro">
                                        <h1>
                                            <span class="in_h1">손 쉬운 지원방식</span>
                                              <a class="carousel-control left" href="#InCarousel" data-slide="prev">
                                                <span class="icon-prev"></span>
                                              </a>
                                              <a class="carousel-control right" href="#InCarousel" data-slide="next">
                                                <span class="icon-next"></span>
                                              </a>
                                      </h1>
                                      <p>댓글 지원 형식을 사용한 간단한 지원방식</p>
                                      <button onclick="location.href = './Project.bo' " class="in_but">같이하기</button>
                                    </div>
                            </div>
                          </div>
                          <div data-slide-no="3" class="item carousel-item">
                            <div class="wrapper">
                                <img src="<%=request.getContextPath()%>/image/Characteristics_3.png" class="img-responsive" style="width:50%; height:auto;float: left;">
                                <div class="in_intro">
                                        <h1>
                                            <span class="in_h1">모든 정보를 하나로</span>
                                              <a class="carousel-control left" href="#InCarousel" data-slide="prev">
                                                <span class="icon-prev"></span>
                                              </a>
                                              <a class="carousel-control right" href="#InCarousel" data-slide="next">
                                                <span class="icon-next"></span>
                                              </a>
                                      </h1> 
                                      <p>팀원 모집과 공모전 정보를 통합적으로 볼수 있는 사이트</p>
                                    <button onclick="location.href = './Project.bo' " class="in_but">같이하기</button>
                            </div>
                          </div>
                </div>
                   
                        
            </div>  
        </article>
        
        <div class="hr-sect"><a href="./Project.bo">최신 모집</a></div>
        <div class="latest_box">
       		<%for(int i=0; i<newly_list.size(); i++){ %>
       		 <div class="small_box">
              <h2><a href="./ProDetail.bo?no=<%=newly_list.get(i).getBoa_no()%>"><%=newly_list.get(i).getBoa_title()%></a></h2>
              <ul>
                <li>모집 분야 : <b><%=newly_list.get(i).getBoa_job()%></b></li>
                <li>작업 기간 : <b>
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
                </b></li>
                <li>마감 날짜 : <b>
                 <%if(newly_list.get(i).getBoa_d_day()>0){ %>
                      D - <%=newly_list.get(i).getBoa_d_day()%>
                      <%}else if(newly_list.get(i).getBoa_d_day()==0){ %>
                      TODAY
                      <%}else if(newly_list.get(i).getBoa_d_day()<0){  int d_day=Math.abs(newly_list.get(i).getBoa_d_day()); %>
                      D + <%=d_day%>
                      <%} %>
                </b></li>
                <li>모집 인원 : <b><%=newly_list.get(i).getApp_number()%>/<%=newly_list.get(i).getBoa_num()%> &nbsp;명</b></li>
              </ul>
          </div>
			<%} %>
        </div>
        
</main>
<footer style="clear:both;">
    <div id="copyright" class="container">
      <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
    </div>
  </footer>

</body>
</html>