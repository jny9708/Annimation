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
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link href="<%=request.getContextPath()%>/css/guide.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_2).png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!--부트스트랩-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!--부트스트랩-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <title>함께 만들어가다. : 아울러</title>
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
          <a href="./Main.do"><img src="<%=request.getContextPath()%>/image/final_logo(header).png" alt="아울러" class="logo" style="padding:0px;"></a> <!--로고-->
        </div>

        <div class="collapse navbar-collapse" id="header_nav">
          <ul class="nav navbar-nav header_title" style="margin:10px;">
            <li><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li><a href="./Contest.co">공모전 정보</a></li>
            <li class="active"><a href="./Guide.do">가이드</a></li>
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
        <div class="container">
                <div class="tabs"> 
                    <input type="radio" name="tabs" id="tabone" checked="checked">     
                    <label for="tabone">검색</label> 
                        <div class="tab"> 
                            <h1><span>1.</span> 상세검색</h1>
                            <p>상세검색에 찾고자하는 팀원모집글의 조건 입력하고 검색 버튼을 클릭해 줍니다.</p>
                            <img alt="select_1_img" src="<%=request.getContextPath()%>/image/guide_img/select_1.jpg">
                            <img alt="select_3_img" src="<%=request.getContextPath()%>/image/guide_img/select_3.jpg" class="guide_img">
                            <h1><span>2.</span> 해시검색</h1> 
                            <p>해시검색에 찾고자하는 해시태그를 입력합니다.</p>
                            <img alt="hash_2_img" src="<%=request.getContextPath()%>/image/guide_img/hash_2.jpg" class="guide_img">
                        </div> 

                    <input type="radio" name="tabs" id="tabtwo">     
                    <label for="tabtwo">등록</label> 
                        <div class="tab"> 
                            <h1><span>1.</span> 모집글 등록</h1>
                            <p>팀원모집 페이지에 있는 모집글 등록 버튼을 클릭합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registration_1.jpg" class="guide_img2">
                            <p>모집글 등록페이지에서 기본적인 사항과 추가사항을 입력합하고 등록버튼을 클릭해 줍니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registration_2.jpg" class="guide_img2">
                            <p>자신의 모집글이 등록되었는지 확인합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registration_3.jpg" class="guide_img2">
                        </div> 
                        
                    <input type="radio" name="tabs" id="tabthree">     
                    <label for="tabthree">지원</label> 
                        <div class="tab"> 
                            <h1><span>1.</span> 지원자 모집글 지원하기</h1>
                            <p>지원하고자하는 팀원 모집글을 클릭합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Volunteer_1.jpg" class="guide_img2">
                            <p>해당 모집글의 지원하기란에 지원 내용을 입력하고 지원하기 버튼을 클릭하여 등록합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Volunteer_2.jpg" class="guide_img2">
                            <p>해당 모집글의 지원현황에서 자신의 지원 현황을 확인할 수 있습니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Volunteer_3.jpg" class="guide_img2">

                            <h1><span>2.</span> 등록자 지원 여부 결정하기</h1>
                            <p>마이페이지에서 자신이 등록한 팀원 모집 글을 클릭합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registrar_1.jpg" class="guide_img2">
                            <p>등록한 모집글의 지원현황에서 지원자의 지원내용을 확인합니다.</p>
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registrar_2.jpg" class="guide_img2">
                            <p>변경 버튼을 클릭하여 지원자의 승인여부를 결정합니다.
                            <br>*<small>미승인 - 아직 승인여부를 결정하지 않음.</small></p>  
                            <img alt="" src="<%=request.getContextPath()%>/image/guide_img/Registrar_3.jpg" class="guide_img2">
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