<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.model.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<%
	
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
	}	
	ArrayList<ProBoardDto> list = (ArrayList<ProBoardDto>)request.getAttribute("projectlist");
    int sort = 0;
    if(request.getParameter("sort")!=null) {
    	sort =  Integer.parseInt(request.getParameter("sort"));
    }
    Map<String,Object> SearchMap =null;
    String[] Genre= null;
    if(request.getAttribute("SearchMap")!=null){
    	SearchMap = (Map<String,Object>)request.getAttribute("SearchMap");
    	Genre = (String[])SearchMap.get("Genre");
    }
    ArrayList<String> TagList=(ArrayList<String>)request.getAttribute("TagList");
    String TagSearch = "";
    if(request.getParameter("TagSearch")!=null){
    	TagSearch = request.getParameter("TagSearch");
    }
    System.out.println("태그검색어는 "+TagSearch);
%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>아울러 : 프로젝트</title>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script> 
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
 	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_1).png">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	
	<style>
	.oneline button {
	overflow: visible;
    border: 0 none;
    background: transparent;
    cursor: pointer;
    }
	</style>
 <script type="text/javascript">

 function star(boa_id) {
	 console.log($('#i_'+boa_id).attr('src'));
	 if($('#i_'+boa_id).attr('src')=='<%=request.getContextPath()%>/image/graystar.png'){
	 $('#i_'+boa_id).attr('src', '<%=request.getContextPath()%>/image/yellowstar.png');
	 alert("스크랩 되었습니다.");
	 }
	 else if($('#i_'+boa_id).attr('src')=='<%=request.getContextPath()%>/image/yellowstar.png'){
		 $('#i_'+boa_id).attr('src', '<%=request.getContextPath()%>/image/graystar.png');
		 alert("스크랩 해제 되었습니다.");
		 }	 
	 } 
 

 $(document).ready(function(){
	 $("#viewhidden").click(function () {
		    status = $("#hidden").css("display");
		    if (status == "none") {
		      $("#hidden").css("display", "");
		    } else {
		      $("#hidden").css("display", "none");
		    }
		  });
	 <%if(Genre!=null){
		 for(int i=0; i<Genre.length; i++){
		 %>
	 if('<%=Genre[i]%>' == "Genre_Action") $("input:checkbox[id='Genre1']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Romance") $("input:checkbox[id='Genre2']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Fantasy") $("input:checkbox[id='Genre3']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Thriller") $("input:checkbox[id='Genre4']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_SF") $("input:checkbox[id='Genre5']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Daily") $("input:checkbox[id='Genre6']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Growth") $("input:checkbox[id='Genre7']").prop("checked", true);
	 if('<%=Genre[i]%>' == "Genre_Different") $("input:checkbox[id='Genre8']").prop("checked", true);
	 	<%
	 	}
	}
	 if(SearchMap.get("Region")!=null){%>
	 	$("input:radio[value='<%=SearchMap.get("Region")%>']").prop("checked", true);
	 	jQuery("#displayDiv").html('<%=SearchMap.get("Region")%>');
	 <%}
	 if(SearchMap.get("Period")!=null){%>
	 $("input:radio[value='<%=SearchMap.get("Period")%>']").prop("checked", true);
	 <%}
	 if(SearchMap.get("Size")!=null){%>
	 $("input:radio[value='<%=SearchMap.get("Size")%>']").prop("checked", true);
	 <%}
	 if(SearchMap.get("Experience")!=null){%>
	 $("input:radio[value='<%=SearchMap.get("Experience")%>']").prop("checked", true);
	 <%}
	 if(SearchMap.get("Category")!=null){%>
	 if('<%=SearchMap.get("Category")%>'=="팀원구해요"){$("#Category option:eq(1)").prop("selected", true);}
	 else if('<%=SearchMap.get("Category")%>'=="팀구해요"){$("#Category option:eq(2)").prop("selected", true);}
	 <%}
	 if(SearchMap.get("Occupation")!=null){%>
	 if('<%=SearchMap.get("Occupation")%>'=="애니메이터"){$("#Occupation option:eq(1)").prop("selected", true);}
	 else if('<%=SearchMap.get("Occupation")%>'=="작가"){$("#Occupation option:eq(2)").prop("selected", true);}
	 else if('<%=SearchMap.get("Occupation")%>'=="성우"){$("#Occupation option:eq(3)").prop("selected", true);}
	 else if('<%=SearchMap.get("Occupation")%>'=="기타"){$("#Occupation option:eq(4)").prop("selected", true);}
	 <%}
	 if(SearchMap.get("Project_Search")!=null){%>
	 $('#Project_Search').val('<%=SearchMap.get("Project_Search")%>');
	 <%}%>
	 <%if(TagSearch.equals("")==false){%>
	 $('#TagSearch').val('<%=TagSearch%>');
	 <%
	 }
	 %>
	 //var TagSearch="";
	 //document.searchform.TagSearch.value=TagSearch;
	 
	 var sort="0";
	 document.searchform.sort.value = sort;
	 document.tag_search.sort.value = sort;
	 $("#Atag0_click").click(function(){
		  	var sort="0";
		  	<%if(TagSearch.equals("")==false){%>
		  	document.tag_search.sort.value = sort;
		  	document.getElementById('tag_search').submit();
		  	<%}else{%>
		  	document.searchform.sort.value = sort;
		  	document.getElementById('searchform').submit();	
		  	<%}%>
		  	
		});
		$("#Atag1_click").click(function(){
			var sort="1";
			<%if(TagSearch.equals("")==false){%>
		  	document.tag_search.sort.value = sort;
		  	document.getElementById('tag_search').submit();
		  	<%}else{%>
		  	document.searchform.sort.value = sort;
		  	document.getElementById('searchform').submit();	
		  	<%}%>
		});
		$("#Atag2_click").click(function(){
			var sort="2";
			<%if(TagSearch.equals("")==false){%>
		  	document.tag_search.sort.value = sort;
		  	document.getElementById('tag_search').submit();
		  	<%}else{%>
		  	document.searchform.sort.value = sort;
		  	document.getElementById('searchform').submit();	
		  	<%}%>
		});
		
	 });
 </script>
 <script type="text/javascript">
  jQuery(document).ready(function() {

      jQuery("#check_finish").click(function() {

          if(jQuery(".checkList").find(":checked").length == 0) {

              jQuery("#displayDiv").html("한 지역만 선택해주세요.");
              return;
          }
          var txt = " ";
          if(jQuery(".checkList").find(":checked").length<2){
            jQuery(".checkList").find(":checked").each(function(){
              txt += jQuery(this).val() + "&nbsp;";
          });
          }else{
            alert("한 지역만 선택 가능합니다.");
            jQuery("#displayDiv").html("한 지역만 선택해주세요.");
            $("input[id='item_detail']").prop("checked",false); //여기 말해야함
            return;
          }

          jQuery("#displayDiv").html(txt);
      });
  });
</script>
<script type="text/javascript">
$(function(){
   $('#btnReset').click(function(){
         $("form").each(function(){
               if(this.className == "frm_reset") this.reset();
               jQuery("#displayDiv").html("지역을 선택해주세요.");
         });
   })
});
</script>
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
            <li class="active"><a href="#">팀 / 팀원구하기 </a></li>
            <li><a href="#">공모전</a></li>
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

  <main><!--메인-->
    <section class="container"> <!--검색표-->
      <div class="con-block">
          <h2 id="project-name">팀 / 팀원구하기</h2>
          <button class="btn btn-warning btn-lg" onclick="location.href='../html/registration.html'" name="project_Registration"><b>프로젝트 등록</b></button>
          <form class="frm_reset" role="form" action="./Project.bo" method="get" id="searchform" name="searchform">
          <input type="hidden" name="sort" value="">
          <table class="table">
           <tr>
             <td style="border-top:#dedcee 1px solid;">
                <div class="input-group act">
                  <input type="search" class="form-control" placeholder="프로젝트 검색" name="Project_Search" id="Project_Search">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="project_search_btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                  </span>
                </div><!-- /input-group -->  
            </td>
            <td style="border-top:#dedcee 1px solid;">
              <select class="form-control act" name="Occupation" id="Occupation">
                  <option>모집분야</option>
                  <option>애니메이터</option>
                  <option>작가</option>
                  <option>성우</option>
                  <option>기타</option>
              </select>
            </td>
            <td style="border-top:#dedcee 1px solid;">
              <select class="form-control act" name="Category" id="Category">
                  <option>분류</option>
                  <option>팀원구해요</option>
                  <option>팀구해요</option>
              </select>
            </td>
          </tr>
          <!-- 지역별 -->
           <tr>
            <td id="tab_font"><b>지역</b></td>
            <td colspan="2" >
              <a href="#" id="viewhidden" onclick="return false;" class="button">
                <p id="displayDiv"style="display:inline;">지역을 선택해주세요.</p>
                <span class="glyphicon glyphicon-chevron-right" style="display:inline;"></span>
              </a>
            </td>
          </tr>

          <tr id="hidden" style="display:none;">
            <td colspan="3" >
              <div role="tabpanel" id="area_item">
                <!-- Nav tabs -->
                <ul class="nav nav-pills nav-fill " id="tab_item">
                  <li class="active"><a class="nav-link item_pro" href="#Seoul" data-toggle="tab">서울</a></li>
                  <li><a href="#Gyeonggi" class="nav-link item_pro" data-toggle="tab">경기</a></li>
                  <li><a href="#Incheon" class="nav-link item_pro" data-toggle="tab">인천</a></li>
                  <li><a href="#Gangwon" class="nav-link item_pro" data-toggle="tab">강원</a></li>
                  <li><a href="#Daejeon" class="nav-link item_pro" data-toggle="tab">대전</a></li>
                  <li><a href="#Sejong" class="nav-link item_pro" data-toggle="tab">세종</a></li>
                  <li><a href="#Chungcheongnam" class="nav-link item_pro" data-toggle="tab">충남</a></li>
                  <li><a href="#NorthChungcheong" class="nav-link item_pro" data-toggle="tab">충북</a></li>
                  <li><a href="#Busan" class="nav-link item_pro" data-toggle="tab">부산</a></li>
                  <li><a href="#Ulsan" class="nav-link item_pro" data-toggle="tab">울산</a></li>

                  <li><a href="#Gyeongsangnam" class="nav-link item_pro" data-toggle="tab">경남</a></li>
                  <li><a href="#Gyeongbuk" class="nav-link item_pro" data-toggle="tab">경북</a></li>

                  <li><a href="#Daegu" class="nav-link item_pro" data-toggle="tab">대구</a></li>
                  <li><a href="#Gwangju" class="nav-link item_pro" data-toggle="tab">광주</a></li>
                  <li><a href="#Jeonnam" class="nav-link item_pro" data-toggle="tab">전남</a></li>
                  <li><a href="#Jeonbuk" class="nav-link item_pro" data-toggle="tab">전북</a></li>

                  <li><a href="#Jeju" class="nav-link item_pro" data-toggle="tab">제주</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="Seoul">
                        <div class="checkList">
                          <ul>
                            <li><input name="Region" id="item_detail" type="radio" value="서울전체">전체&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail" type="radio" value="강남구">강남구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail" type="radio" value="강동구">강동구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail" type="radio" value="강복구">강북구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail" type="radio" value="강서구">강서구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail" type="radio" value="관악구">관악구&nbsp;&nbsp;</li>

                            <li><input name="Region" id="item_detail"type="radio" value="광진구">광진구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="구로구">구로구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="금천구">금천구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="노원구">노원구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="도봉구">도봉구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="동대문구">동대문&nbsp;&nbsp;</li>

                            <li><input name="Region" id="item_detail"type="radio" value="동작구">동작구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="마포구">마포구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="서대문구">서대문구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="서초구">서초구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="성동구">성동구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="성북구">성북구&nbsp;&nbsp;</li>

                            <li><input name="Region" id="item_detail"type="radio" value="송파구">송파구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="양천구">양천구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="영등포구">영등포구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="용산구">용산구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="은평구">은평구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="종로구">종로구&nbsp;&nbsp;</li>

                            <li><input name="Region" id="item_detail"type="radio" value="중구">중구&nbsp;&nbsp;</li>
                            <li><input name="Region" id="item_detail"type="radio" value="중랑구" style="margin-bottom:15px;">중랑구&nbsp;&nbsp;</li>
                          </ul>
                        </div>
                    </form>
                </div>

                  <div role="tabpanel" class="tab-pane" id="Gyeonggi">
                    <form class="frm_reset">
                      <div class="checkList">
                          <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="경기전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="가평군">가평군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="고양시">고양시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="과천시">과천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="광명시">광명시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="광주시">광주시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="구리시">구리시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="군포시">군포시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="김포시">김포시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="남양주시">남양주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="동두천시">동두천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="부천시">부천시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="성남시">성남시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="수원시">수원시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="시흥시">시흥시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="안산시">안산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="안성시">안성시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="안양시">안양시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="양주시">양주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="양평군">양평군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="여주시">여주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="연천군">연천군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="오산시">오산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="용인시">용인시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="의왕시">의왕시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="의정부시">의정부시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="이천시">이천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="파주시">파주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="평택시">평택시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="포천시">포천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="하남시">하남시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="화성시" style="margin-bottom:15px;">화성시&nbsp;&nbsp;</li>

                            </ul>
                      </div>
                    </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Incheon">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="인천전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="강화군">강화군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="계양구">계양구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="남동구">남동구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="동구">동구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="미추홀구">미추홀구&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="부평구">부평구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="서구">서구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="연수구">연수구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="옹진군">옹진군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="중구" style="margin-bottom:15px;">중구&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Gangwon">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="강원전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="강릉시">강릉시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="고성군">고성군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="동해시">동해시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="삼척시">삼척시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="속초시">속초시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="양구군">양구군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="양양군">양양군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="영월군">영월군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="원주시">원주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="인제군">인제군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="정선군">정선군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="철원군">철원군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="춘천시">춘천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="태백시">태백시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="평창군">평창군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="홍천군">홍천군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="화천군">화천군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="황성군" style="margin-bottom:15px;">황성군&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Daejeon">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="대전전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="대덕구">대덕구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="동구">동구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="서구">서구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="유성구">유성구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="중구" style="margin-bottom:15px;">중구&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Sejong">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="세종전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="세종시" style="margin-bottom:15px;">세종시&nbsp;&nbsp;</li>
                              <li>&nbsp;&nbsp;</li>
                              <li>&nbsp;&nbsp;</li>
                              <li>&nbsp;&nbsp;</li>
                              <li>&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Chungcheongnam">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="충남전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="계롱시">계룡시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="공주시">공주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="금산군">금산군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="논산시">논산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="당진시">당진시&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="보령시">보령시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="부여군">부여군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="서산시">서산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="서천군">서천군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="아산시">아산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="예산군">예산군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="천안시">천안시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="청양군">청양군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="태안군">태안군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="홍선군" style="margin-bottom:15px;">홍성군&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="NorthChungcheong">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="충북전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="과산군">과산군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="단양군">단양군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="보은군">보은군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="영동군">영동군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="옥천군">옥천군&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="음성군">음성군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="제천시">제천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="증평군">증평군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="진천군">진천군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="청주시">청주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="충주시" style="margin-bottom:15px;">충주시&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Busan">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="부산전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="강서구">강서구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="금정구">금정구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="기장군">기장군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="남구">남구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="동구">동구&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="동래구">동래구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="부산진구">부산진구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="복구">복구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="사상구">사상구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="사하구">사하구&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="서구">서구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="수영구">수영구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="연제구">연제구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="영도구">영도구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="중구">중구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="해운대구" style="margin-bottom:15px;">해운대구&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Ulsan">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="울산전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="강서구">남구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="금정구">동구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="기장군">북구&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="남구">울주군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="해운대구" style="margin-bottom:15px;">중구&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                  </div>

                  <div role="tabpanel" class="tab-pane" id="Gyeongsangnam">
                      <form class="frm_reset">
                          <div class="checkList">
                            <ul>
                              <li><input name="Region" id="item_detail" type="radio" value="경남전체">전체&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="거제시">거제시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="거창군">거창군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="고성군">고성군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="남구">김해시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="남해군">남해군&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="밀양시">밀양시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="사천시">사천시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="산청군">산청군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="양산시">양산시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="의령군">의령군&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="진주시">진주시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="창녕군">창녕군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="창원시">창원시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="통영시">통영시&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="하동군">하동군&nbsp;&nbsp;</li>

                              <li><input name="Region" id="item_detail"type="radio" value="영도구">함안군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail" type="radio" value="함양군">함양군&nbsp;&nbsp;</li>
                              <li><input name="Region" id="item_detail"type="radio" value="함천군" style="margin-bottom:15px;">함천군&nbsp;&nbsp;</li>
                            </ul>
                          </div>
                      </form>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="Gyeongbuk">
                        <form class="frm_reset">
                            <div class="checkList">
                              <ul>
                                <li><input name="Region" id="item_detail" type="radio" value="경북전체">전체&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="경산시">경산시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="경주시">경주시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="고령시">고령시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="구미시">구미시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="군위군">군위군&nbsp;&nbsp;</li>

                                <li><input name="Region" id="item_detail"type="radio" value="김천시">김천시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="문경시">문경시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="봉화구">봉화구&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="상주시">상주시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="성주군">성주군&nbsp;&nbsp;</li>

                                <li><input name="Region" id="item_detail"type="radio" value="안동시">안동시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="영덕군">영덕군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="영양군">영양군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="영주시">영주시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="영천시">영천시&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="예찬군">예찬군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="울릉군">울릉군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="울진군">울진군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="의성군">의성군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="청도군">청도군&nbsp;&nbsp;</li>

                                <li><input name="Region" id="item_detail"type="radio" value="청송군">청송군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail" type="radio" value="칠곡군">칠곡군&nbsp;&nbsp;</li>
                                <li><input name="Region" id="item_detail"type="radio" value="포항시" style="margin-bottom:15px;">포항시&nbsp;&nbsp;</li>
                              </ul>
                            </div>
                        </form>
                      </div>

                      <div role="tabpanel" class="tab-pane" id="Daegu">
                          <form class="frm_reset">
                              <div class="checkList">
                                <ul>
                                  <li><input name="Region" id="item_detail" type="radio" value="대구전체">전체&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="남구">남구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="달서구">달서구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="달성군">달성군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="동구">동구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="북구">북구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="서구">서구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="수성구">수성구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail"type="radio" value="중구" style="margin-bottom:15px;">중구&nbsp;&nbsp;</li>
                                </ul>
                              </div>
                          </form>
                      </div>

                      <div role="tabpanel" class="tab-pane" id="Gwangju">
                          <form class="frm_reset">
                              <div class="checkList">
                                <ul>
                                  <li><input name="Region" id="item_detail" type="radio" value="광주전체">전체&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="광산구">광산구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="남구">남구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="동구">동구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="북구">북구&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail"type="radio" value="서구" style="margin-bottom:15px;">서구&nbsp;&nbsp;</li>
                                </ul>
                              </div>
                          </form>
                      </div>

                      <div role="tabpanel" class="tab-pane" id="Jeonnam">
                          <form class="frm_reset">
                              <div class="checkList">
                                <ul>
                                  <li><input name="Region" id="item_detail" type="radio" value="전남전체">전체&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="강진군">강진군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="고흥군">고흥군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="강릉시">곡성군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="광양시">광양시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="구례군">구례군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="나주시">나주시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="담양군">담양군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="목포시">목포시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="무안군">무안군&nbsp;&nbsp;</li>

                                  <li><input name="Region" id="item_detail" type="radio" value="보성군">보성군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="순천시">순천시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="신안군">신안군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="여주시">여주시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="영광군">영광군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="영암군">영암군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="완도구">완도군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="장성군">장성군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="장흥군">장흥군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="진도군">진도군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="함평군">함평군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="해남군">해남군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail"type="radio" value="화순군" style="margin-bottom:15px;">화순군&nbsp;&nbsp;</li>
                                </ul>
                              </div>
                          </form>
                      </div>

                      <div role="tabpanel" class="tab-pane" id="Jeonbuk">
                          <form class="frm_reset">
                              <div class="checkList">
                                <ul>
                                  <li><input name="Region" id="item_detail" type="radio" value="전북전체">전체&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="고창군">고창군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="군산시">군산시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="김제시">김제시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="남원시">남원시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="무주군">무주군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="부안군">부안군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="순창군">순창군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="완주군">완주군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="익산시">익산시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="임실군">임실군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="장수군">장수군&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="전주시">전주시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="정읍시">정읍시&nbsp;&nbsp;</li>

                                  <li><input name="Region" id="item_detail"type="radio" value="진안군" style="margin-bottom:15px;">진안군&nbsp;&nbsp;</li>
                                </ul>
                              </div>
                          </form>
                      </div>

                      <div role="tabpanel" class="tab-pane" id="Jeju">
                          <form class="frm_reset">
                              <div class="checkList">
                                <ul>
                                  <li><input name="Region" id="item_detail" type="radio" value="제주전체">전체&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail" type="radio" value="서귀포시">서귀포시&nbsp;&nbsp;</li>
                                  <li><input name="Region" id="item_detail"type="radio" value="제주시" style="margin-bottom:15px;">제주시&nbsp;&nbsp;</li>
                                  <li>&nbsp;&nbsp;</li>
                                  <li>&nbsp;&nbsp;</li>
                                  <li>&nbsp;&nbsp;</li>
                                </ul>
                              </div>
                          </form>
                      </div>
                  <div role="tabpanel" class="tab-pane" id="messages">.d..</div>
                  <div role="tabpanel" class="tab-pane" id="settings">.asda..</div>

                  <button id="check_finish" type="button" class="btn">
                    <span class="glyphicon glyphicon-ok"></span>선택완료</button>
                </div>
              </div>
            </td>
          </tr>
          <!-- 지역별 끝 -->
          
          <tr>
            <td id="tab_font"><b>제작 장르</b></td>
            <td colspan="2" class="text-content">
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre1" name="Genre" value="Genre_Action">액션
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre2" name="Genre" value="Genre_Romance"> 로맨스
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre3" name="Genre" value="Genre_Fantasy"> 판타지
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre4" name="Genre" value="Genre_Thriller"> 스릴러
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre5" name="Genre" value="Genre_SF"> SF
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre6" name="Genre" value="Genre_Daily">일상
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="Genre7" name="Genre" value="Genre_Growth">성장
                </label>
                  <label class="checkbox-inline">
                  <input type="checkbox" id="Genre8" name="Genre" value="Genre_Different">기타</label>
            </td>
          </tr>
          <tr>
            <td id="tab_font"><b>작업 기간</b></td>
            <td colspan="2" class="text-content">
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period1" value="Period_No" ondblclick="this.checked=false" >관련사항 없음
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period2" value="Period_Week" ondblclick="this.checked=false" >~1주일
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period3" value="Period_One" ondblclick="this.checked=false" >1주일~1개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period4" value="Period_Three" ondblclick="this.checked=false" >1개월~3개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period5" value="Period_Six" ondblclick="this.checked=false" >3개월~6개월
              </label>
              <label class="radio-inline">
                <input type="radio" name="Period" id="Period6" value="Period_Year" ondblclick="this.checked=false" >6개월~1년
              </label>
            </td>
         </tr>
          <tr>
            <td id="tab_font"><b>프로젝트 크기</b></td>
            <td colspan="2" class="text-content">
              <label class="radio-inline">
                <input type="radio" name="Size" id="Size1" value="Size_No" ondblclick="this.checked=false" >관련사항 없음
              </label>
              <label class="radio-inline">
                <input type="radio" name="Size" id="Size2" value="Size_Very_Short" ondblclick="this.checked=false" >초단편
              </label>
              <label class="radio-inline">
                <input type="radio" name="Size" id="Size3" value="Size_Short" ondblclick="this.checked=false" >단편
              </label>
              <label class="radio-inline">
                <input type="radio" name="Size" id="Size4" value="Size_Middle" ondblclick="this.checked=false" >중편
              </label>
              <label class="radio-inline">
                <input type="radio" name="Size" id="Size5" value="Size_Long" ondblclick="this.checked=false" >장편
              </label>
          </td>
        </tr>
      
        <tr>
          <td id="tab_font"><b>유사 경험</b></td>
          <td colspan="2" class="text-content">
            <label class="radio-inline">
              <input type="radio" name="Experience" id="Experience1" value="Ex_1" ondblclick="this.checked=false" > 유
            </label>
            <label class="radio-inline">
              <input type="radio" name="Experience" id="Experience0" value="Ex_0" ondblclick="this.checked=false" > 무
            </label>
         </td>
       </tr>
      
       <tr>
        <td colspan="3"><button type="submit" id="search" class="btn" name="content_search_btn">검색</button>
        <button type="reset" id="btnReset" class="btn" name="content_reset">초기화</button></td>
      </tr>
    </table>
  </div>
  </form>		
</section><!--검색끝-->


<!--hash-->
<div id="hash" class="container">
    <div id="hash_font">
    <%
    System.out.println("태그리스트는 :" + TagList);
    if(TagList.size()!=0){
    	for(int i=0; i<TagList.size();i++){
    %>
      <a href="./Project.bo?TagSearch=<%=TagList.get(i)%>" rel="hash">#<%=TagList.get(i)%></a>
   	<%
    	}
    }else{%>
    <span>검색 결과가 없습니다.</span>
    <%	
    } 
    %>
    </div>
</div>
<!--/hash-->

    <section>
      <div class="container">
        <div class="row">
        <div class="col-sm-12">
            <nav>
                <ul id="maun_card">

                    <li <%if(sort==0) {%>
                    class="active"<%}%>>
                    <a href="#" rel="maun_card_Latest" id="Atag0_click">최신순</a></li>
                    <li<%if(sort==1){ %>
                    class="active"<%}%>>
                    <a href="#" rel="maun_card_popularity" id="Atag1_click">인기순</a></li>
                    <li<%if(sort==2){ %>
                    class="active"<%}%>>
                    <a href="#" rel="maun_card_Deadline" id="Atag2_click">마감순</a></li>
                </ul>    
            </nav>
         </div>
         </div>

        	<div class="row">
          <div class="col-sm-12">
              
              <%
              for(int i=0; i<list.size(); i++){
              %>
              
            <div id="dede"> 
              <div id="card_User">
                <a href="#">
                <%if(list.get(i).getMem_icon()==null){ %>
                <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip">
                <%}else if(list.get(i).getMem_icon()!=null){System.out.println("아이콘경로있음");} %>
                </a>
                <p class="projact_card_U_font"><%=list.get(i).getMem_nickname() %><br><small><%=list.get(i).getMem_job() %></small></p>
              </div>
             
              <div id="card_content">
                <div class="oneline">
                <ul>
                	<li class="oneline_team"><%=list.get(i).getBoa_category()%></li>
               		<li><a href="#"><%=list.get(i).getBoa_title()%></a>
               		<button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star(<%=list.get(i).getBoa_no()%>)" title="스크랩" data-original-title="Default tooltip"><img id="i_<%=list.get(i).getBoa_no()%>" src="<%=request.getContextPath()%>/image/graystar.png"></button>
					
                	</li>
                	<li><small style="float:right; margin:22px 20px 0px 0px;">등록날짜|&nbsp;&nbsp;<%=list.get(i).getBoa_reg_date()%></small></li>
                </ul>
               </div>
                  <div class="twoline">
                    <table class="table">
                      <tr>
                		<td id="twoline_title">모집분야</td>
                		<td ><b id="twoline_content"><%=list.get(i).getBoa_job()%></b></td>
                      </tr>
                	  <tr>
                        <td id="twoline_title">작업기간</td>
                        <td><b id="twoline_content"><%=list.get(i).getBoa_reg_date()%> ~ <%=list.get(i).getBoa_rec_deadline()%></b></td>
                      </tr>
                      <tr>
                        <td id="twoline_title">마감날짜</td>
                        <td><b id="twoline_content">
                        <%if(list.get(i).getBoa_d_day()>0){ %>
                      D - <%=list.get(i).getBoa_d_day()%>
                      <%}else if(list.get(i).getBoa_d_day()==0){ %>
                      TODAY
                      <%}else if(list.get(i).getBoa_d_day()<0){  int d_day=Math.abs(list.get(i).getBoa_d_day()); %>
                      D + <%=d_day%>
                      <%} %>
                        </b></td>
                      </tr>
                      <tr>
                        <td id="twoline_title">모집인원</td>
                        <td><b id="twoline_content"><%=list.get(i).getApp_number()%>/4 &nbsp;명</b></td>
                      </tr>
                    </table>
                  </div>
                    <div class="threeline">
                    <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                    <ul>
                     <%for(int j=0; j<list.get(i).getBoa_hashtag().size(); j++ ){%>
                      <li><a href="./Project.bo?TagSearch=<%=list.get(i).getBoa_hashtag().get(j)%>" rel="hash">
                      #<%=list.get(i).getBoa_hashtag().get(j)%>
                      </a></li>
                      <%}%>
                    </ul>
                    <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                  </div>

                </div><!--카드상세내용-->
              </div><!--전체카드dede-->


            </div><!--col-->
          </div><!--row-->   
			<%} %>

            </div><!--container-->

    	</section>
	</main>
	
    <footer style="clear:both; background-color: white;">
        <div id="copyright" class="container-fluid">
          <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
        </div>
    </footer>
  
  
  
  
  

                
             
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
</body>
</html>