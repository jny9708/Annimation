<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.member.model.*"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.board.model.*"%>
<!DOCTYPE html>
<%
	int logincheck=0;
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
		logincheck=1;
	}
	ArrayList<ProBoardDto> user_boa_list = null;
	MemberDto UserInfo=(MemberDto)request.getAttribute("useinfo");
	if(request.getAttribute("user_boa_list")!=null){
		user_boa_list = (ArrayList<ProBoardDto>) request.getAttribute("user_boa_list");
	}
	ArrayList<Integer> sc_list=null;
	if(request.getAttribute("sc_list")!=null){
		sc_list =(ArrayList<Integer>)request.getAttribute("sc_list");
	}
	int roop=-1;
	int total = (Integer)request.getAttribute("total");
	int pagenum = (Integer)request.getAttribute("pagenum");
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <link href="<%=request.getContextPath()%>/css/userPage.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/javascript/userPage.js" rel="stylesheet" type="text/javascript">
    <script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script>
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/logo1.png">

    <title>아울러 : 나의 페이지</title>
</head>
<script  type="text/javascript">
$(document).ready(function() {
	$('#page_<%=pagenum%>').addClass('active');
});

function star(boa_id) {
	 console.log($('#i_'+boa_id).attr('src'));
	 if($('#i_'+boa_id).attr('src')=='<%=request.getContextPath()%>/image/graystar.png'){
		 $('#i_'+boa_id).attr('src', '<%=request.getContextPath()%>/image/yellowstar.png');
	 
		 $.ajax({
				type:"POST",
				url:"./ScrapInsert.bo?boa_no="+boa_id,
				success: function(){
				alert("스크랩 되었습니다.");
			},
			error: function() {
				alert('안됨');
			}	
		});
	 
	 
	 
	 }
	 else if($('#i_'+boa_id).attr('src')=='<%=request.getContextPath()%>/image/yellowstar.png'){
		 $('#i_'+boa_id).attr('src', '<%=request.getContextPath()%>/image/graystar.png');
		

		 $.ajax({
				type:"POST",
				url:"./ScrapDelete.bo?boa_no="+boa_id,
				success: function(){
					 alert("스크랩 해제 되었습니다.");
			},
			error: function() {
				alert('안됨');
			}	
		});
	 
		 }	 
	 }
</script>
<body  style="background:white !important;">
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
            <li><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
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

<div class="container my_wb ">
  <div class="wrap">
    <div class="side front">
          <%if(UserInfo.getMem_icon().equals("profile.jpg")){ %>
          <img src="<%=request.getContextPath()%>/image/profile.jpg" class="my_profile img-circle">
           <%}else{
        	   System.out.println("아이콘경로있음");%>
        	   <img src="<%=request.getContextPath()%>/image/<%=UserInfo.getMem_icon()%>" class="my_profile img-circle">
        	   <%} %>
          <p class="my_pro_font"><%=UserInfo.getMem_nickname()%><br><small><%=UserInfo.getMem_job()%></small></p>
          <div class="my_pro_block">
            <%if(UserInfo.getMem_profile_content()!=null){
            	if(!UserInfo.getMem_profile_content().equals("")){%>
            	<%=UserInfo.getMem_profile_content()%>
            	<%}else{
            		
            	}%>
            	<p style="font-size:15px;text-align: center;">자기소개를 적어주세요</p>
            	<%}else{%>
            		<p style="font-size:15px;text-align: center;">자기소개를 적어주세요</p>
            	<% }%>
                        
          </div>
          
          
     </div>
     <%if(logincheck==1){
          		if(MemberDto.getMem_no()==UserInfo.getMem_no()){%>
        	<button class="btn my_modify" type="submit" name="sp_deletion" onclick="location.href='./UserUpdateForm.do'">회원 수정 및 탈퇴</button>  
          <%	} 
          	}%> 
  </div>


<main> <!--스크랩, 지원, 등록 정보 시작-->
    <div role="tab">
        <!-- 해더 tabs -->
        <ul class="tabs">
          <li class="tab"><a href="./UserPageApp.do?mem_no=<%=UserInfo.getMem_no()%>" class="lable">지원글</a></li>
          <li class="tab active"><a href="#Support" class="lable">등록글</a></li>
          <%if(logincheck==1){
          		if(MemberDto.getMem_no()==UserInfo.getMem_no()){%>
        	 <li class="tab"><a href="./UserPageScr.do?mem_no=<%=UserInfo.getMem_no()%>" class="lable">스크랩</a></li> 
          <%	 } 
          	}%>
          
        </ul>
      
        <!-- Tab 내용 -->
        <div class="tab-content">
          <!--지원내용 시작-->
          <div role="tabpanel" class="tab-pane active" id="Support">
              <div class="row">
                  <div class="col-sm-12"><!--지원카드 시작-->
                      
                      <%for(int i =0; i<user_boa_list.size(); i++){%>
                    	  
                      
                      <div id="dede">
                          <div id="card_User">
                            <a href="./UserPageApp.do?mem_no=<%=user_boa_list.get(i).getMem_no()%>">
                            <%if(user_boa_list.get(i).getMem_icon().equals("profile.jpg")){%>
                            	<img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">	
                            <%}else{
                            	System.out.println("아이콘경로있음");%>
                				<img src="<%=request.getContextPath()%>/image/<%=user_boa_list.get(i).getMem_icon()%>" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                            <% } %>
                            
                            </a>
                            <p class="projact_card_U_font"><%=user_boa_list.get(i).getMem_nickname()%><br><small><%=user_boa_list.get(i).getMem_job()%></small></p>
                          </div>
                        
                          <div id="card_content">
                            <div class="oneline">
                              <ul>
                                <li class="oneline_team"><%=user_boa_list.get(i).getBoa_region()%></li>
                                <li><a href="./ProDetail.bo?no=<%=user_boa_list.get(i).getBoa_no()%>"><%=user_boa_list.get(i).getBoa_title()%></a>  
                                  <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star(<%=user_boa_list.get(i).getBoa_no()%>)" title="스크랩" data-original-title="Default tooltip">
                                 <%
                                	 for(int j=0; j<sc_list.size(); j++){
                                			if(sc_list.get(j)==user_boa_list.get(i).getBoa_no()){%>
                                			<img id="i_<%=user_boa_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/yellowstar.png">
                                	 		<% roop=1;}
                                 	}if(roop!=1){%>
                                 		<img id="i_<%=user_boa_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/graystar.png">
                                 	<%}roop=0; %>
                                  
                                              
                                </li>
                                <li><small style="float:right;">등록날짜|&nbsp;&nbsp;<%=user_boa_list.get(i).getBoa_reg_date()%></small></li>
                              </ul> 
                            </div>
                            <div class="twoline">
                              <table class="table">
                                <tr>
                                  <td id="twoline_title">모집분야</td>
                                  <td ><b id="twoline_content"><%=user_boa_list.get(i).getBoa_job()%></b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">작업기간</td>
                                  <td><b id="twoline_content">
                                   <%if(user_boa_list.get(i).getBoa_pro_period().equals("Period_Week")){%>
                        			~1주일
                        			<%}else if(user_boa_list.get(i).getBoa_pro_period().equals("Period_One")){ %>
                        			1주일 ~ 1개월
                        			<%}else if(user_boa_list.get(i).getBoa_pro_period().equals("Period_Three")){ %>
                        			1개월 ~ 3개월
                        			<%}else if(user_boa_list.get(i).getBoa_pro_period().equals("Period_Six")){ %>
                        			3개월 ~ 6개월
                        			<%}else if(user_boa_list.get(i).getBoa_pro_period().equals("Period_Year")){ %>
                        			6개월 ~ 1년
                        			<%} %>
                                  </b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">마감날짜</td>
                                  <td><b id="twoline_content">
                                  <%if(user_boa_list.get(i).getBoa_d_day()>0){ %>
                    				  D - <%=user_boa_list.get(i).getBoa_d_day()%>
                      				<%}else if(user_boa_list.get(i).getBoa_d_day()==0){ %>
                      				TODAY
                      				<%}else if(user_boa_list.get(i).getBoa_d_day()<0){  int d_day=Math.abs(user_boa_list.get(i).getBoa_d_day()); %>
                      				D + <%=d_day%>
                      				<%} %>
                                  </b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">모집인원</td>
                                  <td><b id="twoline_content"><%=user_boa_list.get(i).getApp_number()%>/<%=user_boa_list.get(i).getBoa_num()%> &nbsp;명</b></td>
                                </tr>
                              </table>
                            </div>
                            <div class="threeline">
                                <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                <ul>
                                 <%for(int j=0; j<user_boa_list.get(i).getBoa_hashtag().size(); j++ ){%>
                                  <li><a href="./Project.bo?TagSearch=<%=user_boa_list.get(i).getBoa_hashtag().get(j)%>">
                                  #<%=user_boa_list.get(i).getBoa_hashtag().get(j)%>
                                  </a></li>
                                  <%}%>
                                </ul>
                                <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                              </div>
                        </div><!--카드상세내용-->
                      </div><!--전체카드dede-->

                        <% } %>
                            
                          <!--<p id="my_text">다양한 글들을 등록 해보세요.</p>-->
                      
                        </div><!--col-->
                      </div><!--row-->
                        
                      <nav id="my_next"> <!--페이지 네이션-->
                            <ul class="pagination">
                              <li>
                                <a href="#" aria-label="왼쪽">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                              </li>
                              <%for(int i=0; i< total; i++){%>
                            	 <li id="page_<%=i+1%>"><a href="./UserPageWri.do?mem_no=<%=UserInfo.getMem_no()%>&page=<%=i+1%>" ><%=i+1%></a></li> 
                              <% } %>
                              
                              <li>
                                <a href="#" aria-label="오른쪽">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                           </ul>
                        </nav>
                  </div><!--지원탭 끝-->

     
      
    </div><!--탭전체 끝-->
   </div>
</main>
</div><!--저체 닫기-->


<footer style="clear:both; ">
  <div id="copyright" class="container">
    <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
  </div>
</footer>

</body>
</html>