<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.model.*"%>
 <%@page import="com.board.model.*" %>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<%
	
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
	}
	
	ProBoardDto ProBoardDto = (ProBoardDto)request.getAttribute("Detail");
	ArrayList<ApplicationDto> list =null;
	ArrayList<Integer> sc_list =(ArrayList<Integer>)request.getAttribute("sc_list");
	
	if(request.getAttribute("ApplicationList")!=null){
		 list = (ArrayList<ApplicationDto>)request.getAttribute("ApplicationList");	
	}
	
	
	String con_address="";
	if(ProBoardDto.getBoa_con_address()!=null){
		if(ProBoardDto.getBoa_con_address().equals("null")==false){
			con_address = ProBoardDto.getBoa_con_address();
			}
	}
	String[] genre = ProBoardDto.getGenre_contents();
	int writercheck=0;
	if(MemberDto!=null){
		if(ProBoardDto.getMem_no()==MemberDto.getMem_no()){
			writercheck=1;
		}	
	}
	
	int no = Integer.parseInt(request.getParameter("no"));
	int result=-1;
	if(request.getAttribute("InsertResult")!=null){
		result = ((Integer)request.getAttribute("InsertResult")).intValue();
	}
	int jsp_app_no=0;
	
	ArrayList<ProBoardDto> re_list = (ArrayList<ProBoardDto>)request.getAttribute("re_list");
	
	int roop =-1;
	%>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/logo1.png">
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script><!--썸머노트-->

    <link href="<%=request.getContextPath()%>/css/project_content.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/javascript/project_content.js" type="text/javascript"></script>

    <title>아울러:게시글 제목</title>
</head>
<script type="text/javascript">
$(document).ready(function () {
    $('.dropdown-toggle').dropdown();
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
	var app_no;

	function fileclick(_app_no){
		app_no=_app_no
		console.log(app_no+"ddd"+_app_no);
	}
	
	/*파일업로드 수정 */
    $(document).ready(function(){
    	
		var real_app_no='#appbutton_modify_'+app_no+' :file'
		console.log(real_app_no);
		
        $(real_app_no).change(function(e){
            var fileName = e.target.files[0].name; /*이벤트가 발생한 타겟->file의 이름을 가져옴!*/
            var name=$(this).attr('name');
            console.log(name+"ddd");
            $("#file_content_m_"+name).attr('placeholder',fileName) /*file_content의 내용을 파일 이름으로 바꿈!*/
        });
        
        
    });
	
	function send(){
		var contents=$('#summernote2').summernote('code');
		console.log(contents);
		document.register.notecontents.value = contents;
	}
	function app_send(app_no){
		var contents=$('#summernote_app_'+app_no).summernote('code');
		console.log(contents);
		$('#notecontents_'+app_no).val(contents);
		var dd =$('#notecontents_'+app_no).val();
		console.log(dd);
		
	}
	
	var result =<%=result%>
	if(result==0){
		alert("지원에 실패하였습니다.");
	}
	
	function app_delete(mem_no,boa_no,filename){
		 var result = confirm("정말 지원글을 삭제하겠습니까?");
		 if(result){
			 var path = './AppDelete.bo?mem_no='.concat(mem_no,'&boa_no=',boa_no,'&filename=',filename);
			 window.location.href= path;
		 }else{
			 
		 }
	}
	
	
	function YesOrNo(mem_no,boa_no,state){
		
		var link='./YesOrNo.bo?mem_no='.concat(mem_no,'&boa_no=',boa_no,'&state=',state);
		window.location.href = link;
	}
	
    $(document).ready(function() {
        $('.summernote').summernote({
        	callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
			    	console.log("업로드이벤트발생");
				    sendFile(files[0], this);
				}
			}
        });
        
        
    });
    
    /* summernote에서 이미지 업로드시 실행할 함수 */
 	function sendFile(file, editor) {
        // 파일 전송을 위한 폼생성
 		data = new FormData();
 	    data.append("uploadFile", file);
 	    $.ajax({ // ajax를 통해 파일 업로드 처리
 	        data : data,
 	        type : "POST",
 	        url : "./ImageUpload.bo",
 	        cache : false,
 	        contentType : false,
 	        processData : false,
 	        success : function(data) { // 처리가 성공할 경우
 	        	console.log("성공");
 	        	console.log(data.url);
                // 에디터에 이미지 출력
 	        	$(editor).summernote('editor.insertImage', data.url);
                
 	        }
 	    });
 	}

</script>
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
            <li class="active"><a href="./Project.bo">팀원모집 </a></li>
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

    <div id="wb"><!--전체감싸기-->
        <div class="w3-sidebar w3-bar-block" id="sidebar">
            <div id="sideber_block">
                <a href="#proCon_D-day" class="w3-bar-item w3-button" style="margin-top:20px;">기본사항</a>
                <a href="#proCon_add" class="w3-bar-item w3-button">추가사항</a>
                <a href="#support" class="w3-bar-item w3-button">지원</a>
                <a href="#plus" class="w3-bar-item w3-button" style="margin-bottom:20px;">추천</a>
                <%if(writercheck==1){%>
                <hr>
                <a href="./PostUpdateForm.bo?boa_no=<%=no%>" class="w3-bar-item w3-button sidebar_login">모집글 수정</a>
                <a href="./PostDelete.bo?boa_no=<%=no%>&filename=<%=ProBoardDto.getFile_name()%>" onclick="return confirm('정말 모집글을 삭제하겠습니까?');" class="w3-bar-item w3-button sidebar_login">모집글 삭제</a>
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
                                <a href="./UserPageApp.do?mem_no=<%=ProBoardDto.getMem_no()%>">
                                <%if(ProBoardDto.getMem_icon().equals("profile.jpg")){ %>
                                <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="proCon_User_img img-circle" data-toggle="tooltip" title="<%=ProBoardDto.getMem_nickname()%> 페이지 보기" data-original-title="Default tooltip">
                                <%}else{
                              	  System.out.println("아이콘경로있음");%>
                                	<img src="<%=request.getContextPath()%>/usericon/<%=ProBoardDto.getMem_icon()%>" alt="User-img" class="proCon_User_img img-circle" data-toggle="tooltip" title="<%=ProBoardDto.getMem_nickname()%> 페이지 보기" data-original-title="Default tooltip">
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
								<div class="add_con_file">
                               		   첨부파일| &nbsp; 
                               		   <% if(ProBoardDto.getFile_name()!=null){%>
                               		   <a href="./FileDownload.bo?filename=<%=ProBoardDto.getFile_name()%>"><%=ProBoardDto.getFile_name()%></a>
                               		   <%}%>
                                </div>
								
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
                      
                       <%if(list!=null){
                    	   if(list.size()<1){%>
                    		   <div style="text-align: center;  font-size: x-large; margin-top: 15px; " >지원글이 없습니다.</div>
                    	   <%}else{
                       		for(int i =0; i<list.size(); i++){ %>
 <!--1지원자-->     	  <div class="panel panel-default">
                          <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#app_<%=list.get(i).getBoa_app_no()%>" aria-expanded="false" aria-controls="support_1">
                               <div class="sp_number">
                                   <%=++jsp_app_no%>
                               </div>
                                <ul id="support_content_<%=list.get(i).getBoa_app_no()%>" class="c_support_content">
                                   <li><b><%=list.get(i).getMem_nickname()%></b></li>
                                   <li><b><%=list.get(i).getMem_email()%></b></li>
                                   <li><b style="color:#282aa9; border-right: none;"><%=list.get(i).getBoa_app_state()%></b></li>
                               </ul>
                               <!-- 승인거부-->
                               <%if(writercheck==1){%>
                               
                               <button class="btn btn-default" type="button" id="show_<%=list.get(i).getBoa_app_no()%>" onclick="change(<%=list.get(i).getBoa_app_no()%>)">변경</button>
                            	 <div id="sp_button_yesno_<%=list.get(i).getBoa_app_no()%>" style="display:none">
                            		 <button class="btn btn-default" type="submit" id="sp_yes" value="yes" onclick="YesOrNo(<%=list.get(i).getMem_no()%>,<%=no%>,'승인')">승인</button>
                                  <button class="btn btn-default" type="submit" id="sp_no" value="no" onclick="YesOrNo(<%=list.get(i).getMem_no()%>,<%=no%>,'거부')">거부</button>
                                  <button class="btn btn-default" type="button" id="hide" onclick="cancel(<%=list.get(i).getBoa_app_no()%>)">취소</button>
                                  </div>
                               <%
                               } %>
                               
                              </a>
                            </h4>
                          </div>
                          
                          <%if(MemberDto!=null){
                          if(writercheck==1 || list.get(i).getMem_no()==MemberDto.getMem_no()){%>
                          
                          <div id="app_<%=list.get(i).getBoa_app_no()%>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div id="support_pro" class=""><!--지원자 프로필-->
                                    <a href="#">
                                    
                                    <img src="<%=request.getContextPath()%>/image/<%=list.get(i).getMem_icon()%>" alt="User-img" class="support_img img-circle" data-toggle="tooltip" title="<%=ProBoardDto.getMem_nickname()%> 페이지 보기" data-original-title="Default tooltip">

                                    </a>
                                    <p class="support_text"><%=list.get(i).getMem_nickname()%><br><small><%=list.get(i).getMem_job()%></small></p>
                                    <%
                                    if(MemberDto!=null){
                                		if(list.get(i).getMem_no()==MemberDto.getMem_no()){%>
                                			<button class="btn sp_revise" type="submit" name="app_<%=list.get(i).getBoa_app_no()%>" id="sp_revise">수정하기</button>
                                    		<button class="btn sp_deletion" type="submit" name="sp_deletion" onclick="app_delete(<%=list.get(i).getMem_no()%>,<%=no%>,'<%=list.get(i).getApp_file()%>');">삭제하기</button>
                                    		<!-- onclick함수에 boa_app_no만 가져와서 인자로 넘기면 되는데 바보같이 모든 정보 넘겨버림 근데 또 바꾸기는 귀찮아서 걍 냅둠 -->
                                	<%		
                                		}	
                                	}
                                    %>
                                    
                                    
                                </div>
                                <div id="support_content_ask" class="con_app_<%=list.get(i).getBoa_app_no()%>"><!--지원자가 작성한 내용-->
                                  <div id="lone_true_app_<%=list.get(i).getBoa_app_no()%>">  
                                        <div id="lone" class="lone1_app_<%=list.get(i).getBoa_app_no()%>">
                                            <%=list.get(i).getBoa_app_contents()%>
                                        </div>
                                        <div id="lone_add">
                                        첨부파일|&nbsp; 
										<%if(list.get(i).getApp_file()!=null){%>
										<a id="app_download" href="./FileDownload.bo?filename=<%=list.get(i).getApp_file()%>"><%=list.get(i).getApp_file()%></a>	
										<%} %>
                                        
                                        </div>
                                       </div><!--/lone_true-->
                                
                                  <div id="lone_modify" style="display:none;" class="lone_app_<%=list.get(i).getBoa_app_no()%>">
                                          <div class="summernote" id="summernote_app_<%=list.get(i).getBoa_app_no()%>"></div>
                                          <form class="form-inline center-block_m" name="app_update_<%=list.get(i).getBoa_app_no()%>" method="POST" action="./AppUpdate.bo?app_no=<%=list.get(i).getBoa_app_no()%>&boa_no=<%=no%>" enctype="multipart/form-data">
                                            <input type="hidden" name="notecontents" id="notecontents_<%=list.get(i).getBoa_app_no()%>" value="" >
                                               
                                               <!--  <div class="input-group">
                                                   <label id="appbutton_modify_<%=list.get(i).getBoa_app_no()%>" class="btn btn-default input-group-addon" for="file_modify" style="background-color:white; padding-top: 5px !important;" >
                                                       <input id="file_modify" type="file" style="display:none;" name="app_<%=list.get(i).getBoa_app_no()%>">
                                                             파일 추가
                                                   </label>
                                                   <input id="file_content_m_app_<%=list.get(i).getBoa_app_no()%>" type="text" class="form-control file_up_m" readonly=""/>
                                               </div> -->
                                              <button class="btn-modify" type="submit" name="lone_modify" onclick="app_send(<%=list.get(i).getBoa_app_no()%>)" id="lone_modify_finish"><b>수정완료</b></button>
                                           </form>
                                        </div><!--/lone_modify-->
                              
                                        </div><!--/support_content_ask-->
                            </div><!--/panel-body-->
                        </div><!--/support-body-->
                        <%
                               } }%>
                        
                    </div>  
                    	   
                    	   
                       <%}
                       	}
                       } %> 
  

                       
                       

                        
                 
                      </div>
                    
                </div>
            </div>
        </div>
  
		<%
		boolean app_user=false;
		for(int i=0; i<list.size(); i++){
			if(MemberDto!=null){
				if(MemberDto.getMem_no()==list.get(i).getMem_no()){
					app_user=true;		
				}	
			}
		}
		
		
		if(writercheck!=1){
			if(app_user==false){%>
		
        <div class="container">
            <div id="application">
                <h2>지원하기</h2>
                <div id="app_sum">
               <%if(MemberDto!=null){ %>
                    <div class="summernote" id="summernote2">
                      <p>자유롭게 지원글을 작성해주세요.</p>
                      <p>이름 :</p>
                      <p>연락처 :</p>
                      <p>지원이유 :</p>
                    </div>
                     <form class="form-inline center-block" action="./AppInsert.bo?boa_no=<%=no%>&mem_no=<%if(MemberDto!=null){ %><%=MemberDto.getMem_no()%><%}%>
                     " method="POST" enctype="multipart/form-data" name="register">
                 <input type="hidden" name="notecontents" value="">
                        <div class="input-group">
                            <label id="appbutton" class="btn btn-default input-group-addon" for="file-selector" style="background-color:white;">
                                <input id="file-selector" type="file" style="display:none;" name="file_selector">
                                		파일 추가
                            </label>
                            <input id="file_content" type="text" class="form-control file_up" readonly=""/>
                        </div>
                        
                    <button class="btn-change7" type="submit" name="app_btn" onclick="send()"><b>지원하기</b></button>
                    </form>
                 <%}else{%>
                	
                	<div class="summernote">
                      <p>로그인을 하면 지원을 하실 수 있습니다.</p>
                    </div>
                    <form class="form-inline center-block" action="#" method="POST" enctype="multipart/form-data">
                        <div class="input-group">
                            <label id="appbutton" class="btn btn-default input-group-addon" for="file-selector" style="background-color:white;">
                                <input id="file-selector" type="file" style="display:none;" name="file_selector">
                                		파일 추가
                            </label>
                            <input id="file_content" type="text" class="form-control file_up" readonly=""/>
                        </div>
                        </form>
                 <%} %>
                </div>
            </div>
        </div>
	<%}else{
		
	}
			}else{%>
		
	<!-- 여기다가 그  높이값 넣으면 될듯? -->			
		
	<% } %>
	
	<div class="container" id="plus">
            <span class="glyphicon glyphicon-plus" style="text-align: center; width: 100%; margin-top: 35px;"></span>
        </div>
        
          <div class="container">
            <div id="recommen">
                <h2>추천<small>&nbsp;&nbsp;*최대 3개를 볼 수 있습니다.</small></h2>
                
                <%System.out.println(re_list.size());
                if(re_list.size()<1){%>
                	<div style="text-align: center;  font-size: x-large; margin-top: 35px; " >추천 게시글이 없습니다.</div>
                <%}else{
                
               		 for(int i=0; i< re_list.size(); i++){%>
                	
                
                <div class="recommen_card">
                    <div class="row">
                        <div class="col-sm-12">
                          <div id="dede">
                            <div id="card_User">
                              <a href="./UserPageApp.do?mem_no=<%=re_list.get(i).getMem_no()%>">
                              <%if(re_list.get(i).getMem_icon().equals("profile.jpg")){ %>
                              <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="<%=ProBoardDto.getMem_nickname()%> 페이지 보기" data-original-title="Default tooltip">
                               <%}else{ %>
                            	  <img src="<%=request.getContextPath()%>/image/<%=re_list.get(i).getMem_icon()%>" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="<%=ProBoardDto.getMem_nickname()%> 페이지 보기" data-original-title="Default tooltip"> 
								<%} %>

                              </a>
                              <p class="projact_card_U_font"><%=re_list.get(i).getMem_nickname()%><br><small><%=re_list.get(i).getBoa_job()%></small></p>
                            </div>
                           
                            <div id="card_content">
                              <div class="oneline">
                                <ul>
                                  <li class="oneline_team"><%=re_list.get(i).getBoa_region()%></li>
                                  <li><a href="./ProDetail.bo?no=<%=re_list.get(i).getBoa_no()%>"><%=re_list.get(i).getBoa_title()%></a>  
                                    <button class='star' type="button" title="스크랩" data-toggle="tooltip" title="스크랩" data-original-title="Default tooltip" onclick="star(<%=re_list.get(i).getBoa_no()%>)">
                                    
                                   <%
               						for(int j=0; j<sc_list.size(); j++){
               							if(sc_list.get(j)==re_list.get(i).getBoa_no()){%>
               								<img id="i_<%=re_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/yellowstar.png">
               					 
               							<%roop=1;}
               						}if(roop!=1){%>
               							<img id="i_<%=re_list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/graystar.png">		
               						<%}roop=0; %>
                                    
                                    
                                    </button>
                                    
                                                
                                  </li>
                                  <li><small style="float:right; margin:22px 20px 0px 0px;">등록일|&nbsp;&nbsp;<%=re_list.get(i).getBoa_reg_date()%></small></li>
                                </ul> 
                              </div>
                              <div class="twoline">
                                <table class="table">
                                  <tr>
                                    <td id="twoline_title">모집분야</td>
                                    <td ><b id="twoline_content"><%=re_list.get(i).getBoa_job()%></b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">작업기간</td>
                                    <td><b id="twoline_content">
                                    <%if(re_list.get(i).getBoa_pro_period().equals("Period_Week")){%>
                        				~1주일
                        			<%}else if(re_list.get(i).getBoa_pro_period().equals("Period_One")){ %>
                        				1주일 ~ 1개월
                        			<%}else if(re_list.get(i).getBoa_pro_period().equals("Period_Three")){ %>
                        				1개월 ~ 3개월
                        			<%}else if(re_list.get(i).getBoa_pro_period().equals("Period_Six")){ %>
                        				3개월 ~ 6개월
                        			<%}else if(re_list.get(i).getBoa_pro_period().equals("Period_Year")){ %>
                        				6개월 ~ 1년
                        			<%} %>
                                    </b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">마감날짜</td>
                                    <td><b id="twoline_content">
                                     <%if(re_list.get(i).getBoa_d_day()>0){ %>
                      					D - <%=re_list.get(i).getBoa_d_day()%>
                      				<%}else if(re_list.get(i).getBoa_d_day()==0){ %>
                      					TODAY
                      				<%}else if(re_list.get(i).getBoa_d_day()<0){  
                      					int d_day=Math.abs(re_list.get(i).getBoa_d_day()); %>
                      					D + <%=d_day%>
                      				<%} %>
                                    </b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">모집인원</td>
                                    <td><b id="twoline_content"><%=re_list.get(i).getApp_number()%>/<%=re_list.get(i).getBoa_num()%> &nbsp;명</b></td>
                                  </tr>
                                </table>
                              </div>
                              <div class="threeline">
                                <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                <ul>
                                <%for(int j=0; j<re_list.get(i).getBoa_hashtag().size(); j++ ){%>
                                  <li><a href="./Project.bo?TagSearch=<%=re_list.get(i).getBoa_hashtag().get(j)%>">
                                  #<%=re_list.get(i).getBoa_hashtag().get(j)%>
                                  </a></li>
                                  <%}%>
                                </ul>
                                <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                              </div>
                            </div><!--카드상세내용-->
                          </div><!--전체카드dede-->
            
                          <!--전체카드dede-->
                         
                      
                        </div><!--col-->
                      </div><!--row-->
              
                </div>
                
                <% }
                } %>
            </div>
        </div>
        
        
	  </main>
	  </div>
<footer style="clear:both;">
    <div id="copyright" class="container">
      <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
    </div>
  </footer>

</body>
</html>