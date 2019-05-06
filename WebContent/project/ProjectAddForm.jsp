<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.member.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.model.*"%>
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
    <link rel="shortcut icon" type="image⁄x-icon" href="../image/final_logo(mini_size_2).png">
    
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> <!--제이쿼리-->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script><!--부트스트랩-->

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script><!--썸머노트-->
    
    <script src="<%=request.getContextPath()%>/javascript/city-select.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/css/registration.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->   
   
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker.css" type="text/css"><!--부트스랩 픽커-->
    <script src="<%=request.getContextPath()%>/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/javascript/picker.js" type="text/javascript"></script><!--추가한 픽커--> 

    <title>아울러 : 팀원 모집글 등록</title>
</head>
<script  type="text/javascript">
	function send(){
		var contents=$('#summernote').summernote('code');
		console.log(contents);
		document.register.notecontents.value = contents;
	}
	
	function submitcheck(){
		 if(document.getElementById("file-selector").value!=""){
			    var fileSize = document.getElementById("file-selector").files[0].size;
			    var maxSize  = 10 * 1024 * 1024;
			    if(fileSize > maxSize){
			        alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
			        return false;
			     }
			 return true;
		 }
	}


        $(document).ready(function() {
            $('#summernote').summernote({
                height: 300,
                placeholder: '추가 사항을 자유롭게 추가하세요.',
                minHeight: null,             
                maxHeight: null,             
                focus: true,
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
<script lang="javascript">
$(document).ready(function(){
        $('#browsebutton :file').change(function(e){
            var fileName = e.target.files[0].name; /*이벤트가 발생한 타겟->file의 이름을 가져옴!*/
            $("#file_content").attr('placeholder',fileName) /*file_content의 내용을 파일 이름으로 바꿈!*/
        });
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
            <li ><a href="#">홈 <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="#">팀원모집 </a></li>
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

<main>
        <div class="container">
            <h2 style="margin-top:40px;">모집글 등록</h2>
            <div class="reg_block">
                <form role="form" action="./PostInsert.bo" method="post" enctype="multipart/form-data" name="register" onsubmit="return submitcheck();"> 
                <input type="hidden" name="notecontents" value="">
                    <div class="row">   
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <label class="length_b">게시글 제목</label>
                                     <input type="text" name="reg_title" id="reg_title" class="form-control input-lg" placeholder="제목"  autofoucs required />
                                </div>
                            </div>
                        </div>
                    
                <div class="row">   
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label class="length_b">팀 / 프로젝트 이름</label>
                             <input type="text" name="reg_team_name" id="reg_teamName" class="form-control input-lg" placeholder="팀 / 프로젝트 이름" required />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                                <label class="length_b length_b2">희망 구성</label>
                                <label class="radio-inline length_b3">
                                    <input type="radio" name="reg_member" value="hope_none" ondblclick="this.checked=false"> 무관
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="reg_member" value="hope_individual" ondblclick="this.checked=false"> 개인
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="reg_member" value="hope_team" ondblclick="this.checked=false"> 팀
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="reg_member" value="hope_company" ondblclick="this.checked=false"> 업체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="reg_member" value="hope_outside" ondblclick="this.checked=false"> 기타
                                </label> 
                        </div>
                    </div>
                </div>

                <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                    <label class="length_b length_b2">유사 경험</label>
                                    <label class="radio-inline length_b3">
                                        <input type="radio" name="reg_similar_exp" value="Ex_1" ondblclick="this.checked=false" required> 유
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="reg_similar_exp" value="Ex_0" ondblclick="this.checked=false"> 무
                                    </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group reg" aria-required="true">
                                        <label class="length_b length_b2">연락 방법</label>
                                        <label class="radio-inline length_b3">
                                            <input type="radio" id="contact" name="reg_contact" value="con_directly" required>직접
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" id="contact" name="reg_contact" value="con_phone">전화
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" id="contact" name="reg_contact" value="con_Online">문자/온라인
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" id="contact" name="reg_contact" value="con_outside">기타
                                        </label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group reg" aria-required="true">
                                            <label class="length_b length_b2">모집 분야</label>
                                            <label class="radio-inline length_b3">
                                                <input type="radio" id="reg_field" name="reg_field" value="시나리오작가" required>시나리오 작가
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" id="reg_field" name="reg_field" value="애니메이터">애니메이터
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" id="reg_field"name="reg_field"  value="성우">성우
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" id="reg_field"name="reg_field"  value="작곡가">작곡가
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" id="reg_field"name="reg_field"  value="그외">그외
                                            </label>
                                    </div>
                                </div>
                            </div>

                            
                            <div class="row">   
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <label class="length_b">모집 인원</label>
                                             <input type="number" name="team_number" id="team_number" class="form-control input-lg" placeholder="0" required />
                                             명
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="row">   
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label class="length_b">연락처</label>
                                                 <input type="tel" maxlength="11" name="contact_number" id="contact_number" class="form-control input-lg" placeholder="(-)없이" />
                                            </div>
                                        </div>
                                    </div>

                                
                                    <div class="row">   
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label class="length_b length_b2">진행사항</label>
                                                <input id="ragne_b" name="reg_range" type="range" min="0" max="100" value="0" step="1" onchange="document.getElementById('currentValue').innerHTML=this.value;"> 
                                                <span id="currentValue" class="output">0</span>%                
                                            </div>
                                        </div>
                                </div>
                                    <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                        <label class="length_b">프로젝트 크기</label>
                                                        <label class="radio-inline length_b3" id="radio_size2">
                                                            <input type="radio" name="reg_pro_size" value="Size_Very_Short" ondblclick="this.checked=false" required>초단편
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="reg_pro_size" value="Size_Short" ondblclick="this.checked=false">단편
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="reg_pro_size" value="Size_Middle" ondblclick="this.checked=false">중편
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="reg_pro_size" value="Size_Long" ondblclick="this.checked=false">장편
                                                        </label> 
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">   
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label class="length_b">작업 지역</label>
                                                    <select onchange="categoryChange(this)" class="form-control length_b3" id="reg_select_city" required>
                                                        <option name="reg_city" value="">시/도</option>
                                                        <option name="reg_Seoul" value="reg_Seoul">서울</option>
                                                        <option name="reg_Gyeonggi" value="reg_Gyeonggi">경기</option>
                                                        <option name="reg_Incheon" value="reg_Incheon">인천</option>
                                                        <option name="reg_Gangwon" value="reg_Gangwon">강원</option>
                                                        <option name="reg_Daejeon" value="reg_Daejeon">대전</option>
                                                        <option name="reg_Sejong" value="reg_Sejong">세종</option>
                                                        <option name="reg_Chungcheongnam" value="reg_Chungcheongnam">충남</option>
                                                        <option name="reg_NorthChungcheong" value="reg_NorthChungcheong">충북</option>
                                                        <option name="reg_Busan" value="reg_Busan">부산</option>
                                                        <option name="reg_Ulsan" value="reg_Ulsan">울산</option>
                                                        <option name="reg_Gyeongsangnam" value="reg_Gyeongsangnam">경남</option>
                                                        <option name="reg_Gyeongbuk" value="reg_Gyeongbuk">경북</option>
                                                        <option name="reg_Daegu" value="reg_Daegu">대구</option>
                                                        <option name="reg_Gwangju" value="reg_Gwangju">광주</option>
                                                        <option name="reg_Jeonnam" value="reg_Jeonnam">전남</option>
                                                        <option name="reg_Jeonbuk" value="reg_Jeonbuk">전북</option>
                                                        <option name="reg_Jeju" value="reg_Jeju">제주</option>
                                                  </select>
                                                  <select class="form-control" name="Region" id="reg_select_village" required>
                                                        <option value="">시/도/군</option>
                                                  </select>
                                                </div>
                                            </div>
                                        </div>
                                        

                                        <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                    <div class="form-group" aria-required="true">
                                                            <label class="length_b length_b2">작업 기간</label>
                                                            <label class="radio-inline  length_b3" id="radio_size2">
                                                                <input type="radio" name="reg_period" value="Period_Week" ondblclick="this.checked=false" required>~1주일
                                                            </label>
                                                            <label class="radio-inline" id="radio_size">
                                                                <input type="radio" name="reg_period" value="Period_One" ondblclick="this.checked=false">1주일~1개월
                                                            </label>
                                                            <label class="radio-inline"id="radio_size">
                                                                <input type="radio" name="reg_period" value="Period_Three" ondblclick="this.checked=false">1개월~3개월
                                                            </label>
                                                            <label class="radio-inline"id="radio_size">
                                                                <input type="radio" name="reg_period" value="Period_Six" ondblclick="this.checked=false">3개월~6개월
                                                            </label> 
                                                            <label class="radio-inline"id="radio_size">
                                                                <input type="radio" name="reg_period" value="Period_Year" ondblclick="this.checked=false">6개월~1년
                                                            </label> 
                                                    </div>
                                                </div>
                                            </div>

                            
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <div class="btn-group-toggle" data-toggle="buttons" name="Genre">
                                    <label class="length_b length_b2">제작 장르</label>
                                    <label class="btn btn-info length_b3">
                                        <input type="checkbox" name="reg_genre" value="Genre_Action" required="required"> 액션
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_Romance"> 로멘스
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_Fantasy"> 판타지
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_Thriller"> 스릴러
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_SF"> SF
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_Daily"> 일상
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_Growth"> 성장
                                    </label>
                                    <label class="btn btn-info">
                                        <input type="checkbox" name="reg_genre" value="Genre_different"> 기타
                                    </label>
                                </div>
                          </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">   
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group" aria-required="true">
                                <label for="expireDate" class="length_b length_b2">모집 마감</label>
                                <div class="input-daterange date length_b3" id="datepicker1" style="width: 150px; display: inline-table;"><!--datepicker1 전체컨트롤-->
                                        
                                   

                                        
                                        
                                    <input type="text" name="reg_deadline" class="form-control" id="edate1" style="width: 115px; border-radius: 3px 0 0 3px;" required />
                                        <label class="date-range" for="edate1"><!--id값에 값있음-->
                                          <i class="glyphicon glyphicon-calendar"></i> <!--버튼이미지-->
                                        </label>
                                        
                                </div><!--datepicker-->
                            </div>
                        </div>
                   </div>
                   <hr>
                   
                   <div>
                       <h3>추가 사항</h3>
                       <div>
                           <div id="summernote"></div>                  
                      
                            
                                <div class="input-group">
                                    <label id="browsebutton" class="btn btn-default input-group-addon" for="file-selector" style="background-color:white">
                                        <input id="file-selector" type="file" style="display:none;" name="file_selector">
                                        파일 추가
                                    </label>
                                    <input id="file_content" name="file_content" type="text" class="form-control file_up" readonly=""/>
                                </div>
                                <small style="margin-left: 4px">*다양한 파일을 더 추가할 수 있습니다.</small>
                            
                        </div>

                       <div style="margin-top:30px;">
                           <h3 style="display:inline; margin-right:5px;">태그</h3><small>여러 태그를 추가해주세요.</small>
                           <input type="text" id="tag_form" class="form-control"  placeholder="#태그" name="reg_tag">
                       </div>
                       <div>
                           <button type="submit" class="btn bbtn-warning reg_btn" name="reg_btn" onclick="send()">등록</button>
                       </div>
                   </div><!--추가-->
           
        
            </form><!--form-->
        </div>
    </main>
    
      <footer style="background-color: white;">
        <div id="copyright" class="container-fluid">
          <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
        </div>
    </footer>



</body>
</html>