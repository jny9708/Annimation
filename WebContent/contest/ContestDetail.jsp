<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.*"%>
<%@page import="com.contest.model.*"%>
<!DOCTYPE html>
<%
	int logincheck=0;
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
		logincheck=1;
	}	
	ContestDto Detail = null;
	if(request.getAttribute("Detail")!=null){
		Detail = (ContestDto)request.getAttribute("Detail");
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/logo1.png">
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_2).png">
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <link href="<%=request.getContextPath()%>/css/contest_content.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <title>아울러 : 공모전제목</title>
</head>
<body>
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
            <li ><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li class="active"><a href="./Contest.co">공모전 정보</a></li>
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
        <div class="container">
            <div class="con_basics">
              <div class="con_title">
                <div class="title">
                  <h2><%=Detail.getCon_title()%></h2>
                </div>
                <div class="title_small">
                  <p class="small_day">
                  <%if(Detail.getD_day()>0){ %>
                   		D - <%=Detail.getD_day()%>	
                  <% }else if(Detail.getD_day()==0){%>
                        TODAY
                  <% }else if(Detail.getD_day()<0){
                     	int d_day = Math.abs(Detail.getD_day());%>
                        D + <%=d_day%>
                  <% } %>
                  </p>
                  <p class="small_inquiry"><span><img src="<%=request.getContextPath()%>/image/eye.png"></span> <%=Detail.getCon_hit()%></p>
                </div>
              </div> <!--/con_title-->
              <div class="con_poster">
                <img src="<%=Detail.getCon_img()%>">
              </div>
              <div class="con_content">
                <div class="details">
                  <h3>공모전 분야</h3>
                  <p><%=Detail.getCon_field()%></p>
                </div>
                <div class="details">
                  <h3>응모 대상</h3>
                  <p><%=Detail.getCon_target()%></p>
                </div>
                <div class="details">
                  <h3>접수기간</h3>
                  <p><%=Detail.getCon_start_date()%> ~ <%=Detail.getCon_end_date()%></p>
                </div>
                <div class="details">
                  <h3>기관</h3>
                  <h4>주최 / 주관</h4>
                  <p class="details_con"><%=Detail.getCon_host()%></p>
                  <h4>후원 / 협찬</h4>
                  <p class="details_con"><%=Detail.getCon_support()%>.</p>
                  <h4>관련 홈페이지</h4>
                  <p class="details_con"><a href="<%=Detail.getCon_homepage()%>"><%=Detail.getCon_homepage()%></a></p>
                </div>
                <div class="details">
                  <h3>시상</h3>
                  <h4>총 상금</h4>
                  <p class="details_con"><%=Detail.getCon_reward_total()%></p>
                  <h4>1등 상금</h4>
                  <p class="details_con"><%=Detail.getCon_reward_win()%></p>
                </div>
                
              </div><!--/con_content-->
          </div><!--/con_basics-->

            
            
            <div class="con_detail_content">
              <h2>세부 내용</h2>
              <article>
                  <%=Detail.getCon_contents()%>
			  </article>
            </div>
        </div><!--/container-->
    </main>

    <footer style="clear:both; ">
            <div id="copyright" class="container">
              <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
            </div>
    </footer>

</body>
</html>