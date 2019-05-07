<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.model.*"%>
 <%@page import="com.board.model.*" %>
<!DOCTYPE html>
<%
	
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
	}
	
	ProBoardDto ProBoardDto = (ProBoardDto)request.getAttribute("Detail");
	String con_address="";
	if(ProBoardDto.getBoa_con_address()!=null){
		if(ProBoardDto.getBoa_con_address().equals("null")==false){
			con_address = ProBoardDto.getBoa_con_address();
			}
	}
	String[] genre = ProBoardDto.getGenre_contents();
	System.out.println("장르"+genre[0]+genre[1]);
	int writercheck=0;
	if(ProBoardDto.getMem_no()==MemberDto.getMem_no()){
		writercheck=1;
	}
	%>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_2).png">
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script><!--썸머노트-->

    <link href="<%=request.getContextPath()%>/css/project_content.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/javascript/project_content.js" type="text/javascript"></script>

    <title>아울러:게시글 제목</title>
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
            <li><a class="active" href="./Project.bo">팀원모집 </a></li>
            <li><a href="#">공모전 정보</a></li>
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

    <div id="wb"><!--전체감싸기-->
        <div class="w3-sidebar w3-bar-block" id="sidebar">
            <div id="sideber_block">
                <a href="#proCon_D-day" class="w3-bar-item w3-button" style="margin-top:20px;">기본사항</a>
                <a href="#proCon_add" class="w3-bar-item w3-button">추가사항</a>
                <a href="#support" class="w3-bar-item w3-button">지원</a>
                <a href="#plus" class="w3-bar-item w3-button" style="margin-bottom:20px;">추천</a>
                <%if(writercheck==1){%>
                <hr>
                <a href="#" class="w3-bar-item w3-button sidebar_login">모집글 수정</a>
                <a href="#" class="w3-bar-item w3-button sidebar_login">모집글 삭제</a>
                <hr>	
                	
                <%} %>
                
            </div>   
        </div> 

    <main style="margin-left:115px;">
        <div class="container">
            <p style="margin:0px; display: inline-block;">등록날짜|<%=ProBoardDto.getBoa_reg_date()%>,</p><p class="con_number">조회| <%=ProBoardDto.getBoa_hit()%>회</p>
            <div class="proContent_block">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="proCon_title">
                            <h1><%=ProBoardDto.getBoa_title()%></h1>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div id="proCon_User" class="col-xs-12 col-sm-12 col-md-12">
                        <div id="proCon_User_1">
                            <div id="proCon_U_1_block">
                                <a href="#">
                                <%if(ProBoardDto.getMem_icon().equals("profile.jpg")){ %>
                                <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="proCon_User_img img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                                <%}else{
                              	  System.out.println("아이콘경로있음");%>
                                	<img src="<%=request.getContextPath()%>/image/<%=ProBoardDto.getMem_icon()%>" alt="User-img" class="proCon_User_img img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                                <% } %>
                                </a>
                                <p class="proCon_User_text"><%=ProBoardDto.getMem_nickname()%></p>
                            </div>
                            
                        </div>
                        <div id="proCon_User_2">
                            <div id="proCon_User_2_b">
                                <table>
                                    <tr>
                                        <td>직업</td>
                                        <td><b><%=ProBoardDto.getMem_job() %></b></td>
                                    </tr>
                                    <tr>
                                        <td>이메일</td>
                                        <td><b style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><%=ProBoardDto.getMem_email()%></b></td>
                                    </tr>
                                    <tr>
                                        <td>연락처</td>
                                        <td><b><%=con_address%></b></td>
                                    </tr>
                                </table>
                            </div>
                            
                        </div>
                        <div id="proCon_D-day">
                            <h2>
                             <%if(ProBoardDto.getBoa_d_day()>0){ %>
                      				D - <%=ProBoardDto.getBoa_d_day()%>
                      		 <%}else if(ProBoardDto.getBoa_d_day()==0){ %>
                      				TODAY
                      		 <%}else if(ProBoardDto.getBoa_d_day()<0){  int d_day=Math.abs(ProBoardDto.getBoa_d_day()); %>
                      				D + <%=d_day%>
                      		 <%} %>
                            </h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div id="proCon_basic">
                            <h2>기본사항</h2>
                            <div id="proCon_basic_w">
                                <table>
                                    <tr>
                                        <td>팀 / 프로젝트 이름</td>
                                        <td class="basic_font"><%=ProBoardDto.getBoa_teamname()%></td>
                                    </tr>
                                    <tr>
                                        <td>희망구성</td>
                                        <td class="basic_font">
                                        <%if(ProBoardDto.getBoa_format().equals("hope_none")){%>
                                        	무관
                                        <%}else if(ProBoardDto.getBoa_format().equals("hope_individual")){%>
                                        	개인
                                        <%}else if(ProBoardDto.getBoa_format().equals("hope_team")){%>
                                        	팀
                                        <%}else if(ProBoardDto.getBoa_format().equals("hope_company")){%>
                                        	업체
                                        <%}else if(ProBoardDto.getBoa_format().equals("hope_outside")){%>
                                        	기타
                                        <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>유사경험</td>
                                        <td class="basic_font">
                                        <%if(ProBoardDto.getBoa_experi().equals("Ex_1")){%>
                                        	유
                                        <%}else if(ProBoardDto.getBoa_experi().equals("Ex_0")){%>
                                        	무
                                        <%}%>
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>연락 방법</td>
                                        <td class="basic_font">
                                        <%if(ProBoardDto.getBoa_con_method().equals("con_directly")){%>
                                        	직접
                                        <%}else if(ProBoardDto.getBoa_con_method().equals("con_phone")){%>
                                        	전화
                                        <%}else if(ProBoardDto.getBoa_con_method().equals("con_Online")){%>
                                        	문자/온라인
                                        <%}else if(ProBoardDto.getBoa_con_method().equals("con_outside")){%>
                                        	기타
                                        <%}%>
                                        	</td>
                                    </tr>
                                    <tr>
                                        <td>작업 지역</td>
                                        <td class="basic_font"><%=ProBoardDto.getBoa_region()%></td>
		
                                    </tr>
                                    <tr>
                                        <td>작업 기간</td>
                                        <td class="basic_font">
                                        <%if(ProBoardDto.getBoa_pro_period().equals("Period_week")){%>
                                        	~ 1주일
                                        <%}else if(ProBoardDto.getBoa_pro_period().equals("Period_One")){%>
                                        	1주일 ~ 1개월
                                        <%}else if(ProBoardDto.getBoa_pro_period().equals("Period_Three")){%>
                                        	1개월 ~ 3개월
                                        <%}else if(ProBoardDto.getBoa_pro_period().equals("Period_Six")){%>
                                        	3개월 ~ 6개월
                                        <%}else if(ProBoardDto.getBoa_pro_period().equals("Period_Year")){%>
                                        	6개월 ~ 1년
                                        <%}%>
                                       
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>프로젝트 크기</td>
                                        <td class="basic_font">
                                       <%if(ProBoardDto.getBoa_size().equals("Size_Very_Short")){%>
                                        	초단편
                                        <%}else if(ProBoardDto.getBoa_size().equals("Size_Short")){%>
                                        	단편
                                        <%}else if(ProBoardDto.getBoa_size().equals("Size_Middle")){%>
                                        	중편
                                        <%}else if(ProBoardDto.getBoa_size().equals("Size_Long")){%>
                                        	장편
                                        <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td>제작 장르</td>
                                      <td class="basic_font">
                                     <%
                                      for(int i=0;i<genre.length; i++){
                                    	  switch(genre[i]){
                                    	  	case "Genre_Action":%>
                                    	  	 	액션 
                                    	  		<%break;
                                    	  	case "Genre_Romance":%>
                                    	  		 로맨스 
                                    	  		<%break;
                                    	  	case "Genre_Fantasy":%>
                                    	  		 판타지 
                                    	  		<%break;
                                    	  	case "Genre_Thriller":%>
                                    	  		 스릴러 
                                    	  		<%break;
                                    	  	case "Genre_SF":%>
                                    	  		 SF 
                                    	  		<%break;
                                    	  	case "Genre_Daily":%>
                                    	  		일상 
                                    	  		<% break;
                                    	  	case "Genre_Growth":%>
                                    	  		성장 
                                    	  		<% break;
                                    	  	case "Genre_Different":%>
                                    	  		기타 
                                    	  		<%break;	
                                    	  		default:
                                    	  			break;
                                    	  }
                                      }
                                      %>
                                      </td>
                                  </tr>
                                    <tr>
                                        <td style="padding-bottom:10px;">현 진행 사항</td>
                                        <td class="basic_font" style="padding-bottom:10px;"><%=ProBoardDto.getBoa_progress()%> %</td>
                                    </tr>
                                    <tr>
                                      <td class="basic_point"><span class="glyphicon glyphicon-asterisk"></span><b>모집 분야</b></td>
                                      <td class="basic_font basic_point"><%=ProBoardDto.getBoa_job()%></td>
                                    </tr>
                                    <tr>
                                      <td><span class="glyphicon glyphicon-asterisk"></span><b>모집 인원</b></td>
                                      <td class="basic_font"><%=ProBoardDto.getBoa_num()%>명</td>
                                    </tr>
                                </table>
                             
                            </div>     
                        </div>
                        <div id="proCon_add">
                            <h2>추가사항</h2>
                            <div class="add_content">
								<%=ProBoardDto.getBoa_contents()%>
                            </div>
                        </div>
                        <div id="proCon_hash">
                            <h2>해시태그</h2>
                            <div class="hash_content">
                                <%for(int j=0; j<ProBoardDto.getBoa_hashtag().size(); j++ ){%>
                      				<a href="./Project.bo?TagSearch=<%=ProBoardDto.getBoa_hashtag().get(j)%>">
                      				#<%=ProBoardDto.getBoa_hashtag().get(j)%>
                      				</a>
                      			<%}%>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
               
            </div><!--/proContent_block-->
        </div><!--/container-->
     

  
        <div class="container">
            <div id="support">
                <h2>지원현황 <small>현재 지원자 수 : <%=ProBoardDto.getApp_number()%>명</small></h2>
                <div id="support_block">
                    <div class="panel-group" id="accordion" role="support" aria-multiselectable="true">
                        
<!--1지원자-->       <div class="panel panel-default">
                          <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#support_1" aria-expanded="false" aria-controls="support_1">
                               <div class="sp_number">
                                   1
                               </div>
                                <ul id="support_content">
                                   <li><b>와퍼주니어</b></li>
                                   <li><b>010-****-****</b></li>
                                   <li><b style="color:#282aa9; border-right: none;">미승인</b></li>
                               </ul>
                               <!-- 승인거부
                               <div class="sp_button_yesno">
                                <button class="btn_sp_yes btn btn-default" type="submit" id="sp_yes" value="yes">승인</button>
                                <button class="btn_sp_no btn btn-default" type="submit" id="sp_no" value="no">거부</button>
                               </div>-->
                              </a>
                            </h4>
                          </div>
                          <div id="support_1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div id="support_pro"><!--지원자 프로필-->
                                    <a href="#"><img src="../image/profile.jpg" alt="User-img" class="support_img img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                                    <p class="support_text">닉네임<br><small>애니메이터</small></p>
                                    <button class="btn sp_revise" type="submit" name="sp_revise">수정하기</button>
                                    <button class="btn sp_deletion" type="submit" name="sp_deletion">삭제하기</button>
                                </div>
                                <div id="support_content_ask"><!--지원자가 작성한 내용-->
                                        <div id="lone">
                                            <img src="../image/루루1.png">
                                            <p>ddd</p>
                                            <b>ss</b>
                                        </div>
                                        <div id="lone_add">
                                        첨부파일|&nbsp; <a href="#" download="">ddd.javascript</a>
                                        </div>
                                </div>
                            </div><!--/panel-body-->
                        </div><!--/support-body-->
                    </div>

                       
                       

                        
                 
                      </div>
                    
                </div>
            </div>
        </div>
  

        <div class="container">
            <div id="application">
                <h2>지원하기</h2>
                <div id="app_sum">
                    <div id="summernote">
                      <p>자유롭게 지원글을 작성해주세요.</p>
                      <p>이름 :</p>
                      <p>연락처 :</p>
                      <p>지원이유 :</p>
                    </div>
                    <form class="form-inline center-block" action="/" method="POST" enctype="multipart/form-data">
                        <div class="input-group">
                            <label id="appbutton" class="btn btn-default input-group-addon" for="file-selector" style="background-color:white;">
                                <input id="file-selector" type="file" style="display:none;" name="file_selector">
                                파일 추가
                            </label>
                            <input id="file_content" type="text" class="form-control file_up" readonly=""/>
                        </div>
                    </form>                     
                    <button class="btn-change7" type="submit" name="app_btn"><b>지원하기</b></button>
                </div>
            </div>
        </div>


</body>
</html>