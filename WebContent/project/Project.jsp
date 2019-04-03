<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.*"%>
<!DOCTYPE html>
<%
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
	}	

%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
     <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
 <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_1).png">
</head>
<body>
 <header>
    <!------------- Navbar -------------->
    <nav class="navbar navbar-default bs-white navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
          <a href="#"><img src="<%=request.getContextPath()%>/image/final_logo(header).png" alt="아울러" class="logo" style="padding:0px;"></a> <!--로고-->
        </div>

        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav" style="margin:10px;">
            <li ><a href="#">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">프로젝트 </a></li>
            <li><a href="#">공모전</a></li>
          </ul>


          <form class="navbar-form form-inline  navbar-right" role="search">
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="#해시">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              
              <% if(MemberDto==null){%>
              
                 <div class="input-group">
                     <a href="./LoginForm.do">로그인</a>
                </div></div>
                <%}else if(MemberDto!=null){ %>
                
                
    	  <ul class="nav navbar-nav navbar-right" id="change">
            <li class="dropdown">
              <a href="#"  class="dropdown-toggle navbar-img" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <h5 style="display: inline-block;"><%=MemberDto.getMem_id() %></h5>
              <%if(MemberDto.getMem_icon()==null){ %>
              <img src="<%=request.getContextPath()%>/image/profile.jpg" class="img-circle" alt="Profile Image"/>
              <%}else if(MemberDto.getMem_icon()!=null){System.out.println("아이콘경로있음");} %>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#">마이페이지</a></li>
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

  <main><!--메인-->
    <section class="container"> <!--검색표-->
      <div class="con-block">
          <h2 id="project-name">프로젝트</h2>
          <button class="btn btn-warning btn-lg" onclick="location.href='../html/registration.html'" name="project_Registration">프로젝트 등록</button>
          <table class="table">
           <tr>
             <td style="border-top:white 1px solid;">
                <div class="input-group act">
                  <input type="search" class="form-control" placeholder="프로젝트 검색" name="project_search">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="project_search_btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                  </span>
                </div><!-- /input-group -->  
            </td>
            <td style="border-top:white 1px solid;">
              <select class="form-control act" name="occupation">
                  <option>직군</option>
                  <option>애니메이터</option>
                  <option>작가</option>
                  <option>성우</option>
                  <option>기타</option>
              </select>
            </td>
            <td style="border-top:white 1px solid;">
              <select class="form-control act" name="Team">
                  <option>분류</option>
                  <option>팀원구해요</option>
                  <option>팀구해요</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><b>장르</b></td>
            <td colspan="2" class="text-content">
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre1" value="Genre_Action">액션
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre2" value="Genre_Romance"> 로맨스
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre3" value="Genre_Fantasy"> 판타지
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre4" value="Genre_Thriller"> 스릴러
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre5" value="Genre_SF"> SF
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre6" value="Genre_Daily">일상
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre7" value="Genre_Growth">성장
                </label>
                  <label class="checkbox-inline">
                  <input type="checkbox" id="Genre8" value="Genre_different">기타</label>
            </td>
          </tr>
          <tr>
            <td><b>협업 기간</b></td>
            <td colspan="2" class="text-content">
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period1" value="Period_No">관련사항 없음
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period1" value="Period_week">~1주일
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period2" value="Period_One">1주일~1개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period3" value="Period_Three">1개월~3개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period4" value="Period_Six">3개월~6개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period4" value="Period_Year">6개월~1년
              </label>
            </td>
         </tr>
          <tr>
            <td><b>프로젝트 크기</b></td>
            <td colspan="2" class="text-content">
              <label class="radio-inline">
                <input type="radio" name="size" id="size1" value="size_no">관련사항 없음
              </label>
              <label class="radio-inline">
                <input type="radio" name="size" id="size1" value="size_very_short">초단편
              </label>
              <label class="radio-inline">
                <input type="radio" name="size" id="size2" value="size_short">단편
              </label>
              <label class="radio-inline">
                <input type="radio" name="size" id="size3" value="size_middle">중편
              </label>
              <label class="radio-inline">
                <input type="radio" name="size" id="size4" value="size_Long">장편
              </label>
          </td>
        </tr>
      
        <tr>
          <td><b>유사 경험</b></td>
          <td colspan="2" class="text-content">
            <label class="radio-inline">
              <input type="radio" name="experience" id="experience1" value="ex_1"> 유
            </label>
            <label class="radio-inline">
              <input type="radio" name="experience" id="experience0" value="ex_0"> 무
            </label>
         </td>
       </tr>
      
       <tr>
        <td colspan="3"><button type="submit" id="search" class="btn" name="content_search_btn">검색</button></td>
      </tr>
    </table>
  </div>
</section><!--검색끝-->


<!--hash-->
<div id="hash" class="container">
    <div id="hash_font">
      <a href="#" rel="hash">#해시go</a>
      <a href="#" rel="hash">#해시</a>
      <a href="#" rel="hash">#해시</a>
      <a href="#" rel="hash">#해시</a>
      <a href="#" rel="hash">#해시</a>
    </div>
</div>
<!--/hash-->

    <section>
      <div class="container">
        <div class="row">
        <div class="col-sm-12">
            <nav>
                <ul id="maun_card">
                    <li class="active"><a href="#" rel="maun_card_Latest">최신순</a></li>
                    <li><a href="#" rel="maun_card_popularity">인기순</a></li>
                    <li><a href="#" rel="maun_card_Deadline">마감순</a></li>
                </ul>    
            </nav>    
              </nav>
            <div id="dede" style = "position:relative;">
              <div id="card_User">
                <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle"></a>
                <p class="projact_card_U_font">닉네임</p>
              </div>
             
              <div id="card_content">
                <div class="oneline">
                    <button type="submit" id="btn_scrap" class="btn pull-left"><span class="glyphicon glyphicon-asterisk" id="scrap"></span></button>
                    <a href="../html/index.html" id="card_title" rel="card_U_Title"><h3 name="User_title">프로젝트 제목</h3></a>
                    <div class="D-Day-box">
                      <p class="D-font">D-3</p>
                      <p style="text-align: center;">3.30 ~ </p>
                    </div>
                </div>
                <div class="project-content">
                  <div id="card_hash">
                      <a href="#" rel="hash">#해시</a>
                  </div>
                  
                 <p>분류</p>
                 <p>직군</p>
                  
                <p>지원자 수</p>
               </div>
              </div>
            </div>

            <div id="dede" style = "position:relative;">
              <div id="card_User">
                <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle"></a>
                <p class="projact_card_U_font">닉네임</p>
              </div>
             
              <div id="card_content">
                <div class="oneline">
                    <button type="submit" id="btn_scrap" class="btn pull-left"><span class="glyphicon glyphicon-asterisk" id="scrap"></span></button>
                    <a href="../html/index.html" id="card_title" rel="card_U_Title"><h3 name="User_title">프로젝트 제목</h3></a>
                    <div class="D-Day-box">
                      <p class="D-font">D-3</p>
                      <p style="text-align: center;">3.30 ~ </p>
                    </div>
                </div>
                <div class="project-content">
                  <div id="card_hash">
                      <a href="#" rel="hash">#해시</a>
                  </div>
                  
                 <p>분류</p>
                 <p>직군</p>
                  
                <p>지원자 수</p>
               </div>
              </div>
            </div>

            <div id="dede" style = "position:relative;">
              <div id="card_User">
                <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle"></a>
                <p class="projact_card_U_font">닉네임</p>
              </div>
             
              <div id="card_content">
                <div class="oneline">
                    <button type="submit" id="btn_scrap" class="btn pull-left"><span class="glyphicon glyphicon-asterisk" id="scrap"></span></button>
                    <a href="../html/index.html" id="card_title" rel="card_U_Title"><h3 name="User_title">프로젝트 제목</h3></a>
                    <div class="D-Day-box">
                      <p class="D-font">D-3</p>
                      <p style="text-align: center;">3.30 ~ </p>
                    </div>
                </div>
                <div class="project-content">
                  <div id="card_hash">
                      <a href="#" rel="hash">#해시</a>
                  </div>
                  
                 <p>분류</p>
                 <p>직군</p>
                  
                <p>지원자 수</p>
               </div>
              </div>
            </div>
        
            <!--
            <nav>
                <ul class="pagination" style=" text-align: center;">
                  <li>
                    <a href="#" aria-label="왼">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="active"><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li>
                    <a href="#" aria-label="오">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
-->
            </div><!--col-sm-->   
       </div>
    </div>
    </section>

    <footer style="clear:both; background-color: white;">
        <div id="copyright" class="container-fluid">
          <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
        </div>
    </footer>
  </main>
</body>
</html>