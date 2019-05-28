<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.*"%>
<%@page import="com.contest.model.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<%
	int logincheck=0;
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
		logincheck=1;
	}	
	ArrayList<ContestDto> con_list = null;
	ArrayList<ContestDto> pop_list = null;
	if(request.getAttribute("con_list")!=null){
		con_list = (ArrayList<ContestDto>)request.getAttribute("con_list");
	}
	
	if(request.getAttribute("pop_list")!=null){
		pop_list = (ArrayList<ContestDto>)request.getAttribute("pop_list");
	}
	int total = (Integer)request.getAttribute("total");
	int pagenum = (Integer)request.getAttribute("pagenum");
	
%>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_2).png">
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <link href="<%=request.getContextPath()%>/css/contest.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <title>아울러 : 공모전</title>
</head>
<script  type="text/javascript">
$(document).ready(function() {
	$('#page_<%=pagenum%>').addClass('active');
});
</script>
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
            <li ><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li class="active"><a href="./Contest.co">공모전 정보</a></li>
          </ul>


          <form class="navbar-form form-inline  navbar-right" role="search" action="./Project.bo" method="get" id="tag_search" name="tag_search">
          	<input type="hidden" name="sort" value="">
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

  <main class="container">
        <div class="contest_popularity">
            <h3>인기 공모전</h3>
            <div class="contest_pop">
            <%
            	for(int i=0; i<pop_list.size(); i++){%>
                <a href="./ConDetail.co?con_no=<%=pop_list.get(i).getCon_no()%>">
                    <figure>
                        <img src="<%=pop_list.get(i).getCon_img()%>">
                        <h3><%=pop_list.get(i).getCon_title()%></h3>
                        <p>
                            <span class="con_day">
                            <%if(pop_list.get(i).getD_day()>0){ %>
                            D - <%=pop_list.get(i).getD_day()%>	
                            <% }else if(pop_list.get(i).getD_day()==0){%>
                            	TODAY
                            <% }else if(pop_list.get(i).getD_day()<0){
                                 int d_day = Math.abs(pop_list.get(i).getD_day());%>
                            	D + <%=d_day%>
                            <% } %>
                            </span>
                            <span><img src="<%=request.getContextPath()%>/image/eye.png" class="con_eye"><%=pop_list.get(i).getCon_hit()%></span>
                        </p>
                    </figure>
                </a>
			<% 
            	}
            %>
              
                
            </div>
        </div>
        <div class="contest_recently">
            <h3>최신 공모전</h3>
            <div class="contest_re">
            <%
            	for(int i=0; i<con_list.size(); i++){%>
                <div class="contest_card">
                    <img src="<%=con_list.get(i).getCon_img()%>" onclick="javascript:location.href='./ConDetail.co?con_no=<%=con_list.get(i).getCon_no()%>'">
                    <a href="./ConDetail.co?con_no=<%=con_list.get(i).getCon_no()%>">
                        <figure>
                            <h4><%=con_list.get(i).getCon_title()%></h4>
                            <p class="con_institution"><%=con_list.get(i).getCon_host()%></p>
                            <p>
                                <span class="con_day">
                                <%if(con_list.get(i).getD_day()>0){ %>
                            	D - <%=con_list.get(i).getD_day()%>	
                            <% }else if(con_list.get(i).getD_day()==0){%>
                            	TODAY
                            <% }else if(con_list.get(i).getD_day()<0){
                                 int d_day = Math.abs(con_list.get(i).getD_day());%>
                            	D + <%=d_day%>
                            <% } %>
                                </span>
                                <span><img src="<%=request.getContextPath()%>/image/eye.png" class="re_eye"><%=con_list.get(i).getCon_hit()%></span>
                            </p>
                        </figure>
                    </a>
                </div>
                <% 
            	}
            	%>
            </div>
            
            <nav>
                <ul class="pagination">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <%for(int i=0; i< total; i++){%>
                  <li id="page_<%=i+1%>"><a href="./Contest.co?page=<%=i+1%>"><%=i+1%></a></li>
                  <% } %>
                  <li>
                    <a href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
        </div>
    </main>
    
    
    <footer style="clear:both; background-color: white;">
        <div id="copyright" class="container-fluid">
        <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
        </div>
  </footer>

</body>
</html>