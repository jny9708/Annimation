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
<title>Insert title here</title>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
     <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
 <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_1).png">
 
 <script type="text/javascript">
 
 $(document).ready(function(){
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
	 if(SearchMap.get("Period")!=null){%>
	 if('<%=SearchMap.get("Period")%>'=="Period_No"){$("input:radio[id='Period1']").prop("checked", true);}
	 else if('<%=SearchMap.get("Period")%>'=="Period_Week"){$("input:radio[id='Period2']").prop("checked", true);}
	 else if('<%=SearchMap.get("Period")%>'=="Period_One"){$("input:radio[id='Period3']").prop("checked", true);}
	 else if('<%=SearchMap.get("Period")%>'=="Period_Three"){$("input:radio[id='Period4']").prop("checked", true);}
	 else if('<%=SearchMap.get("Period")%>'=="Period_Six"){$("input:radio[id='Period5']").prop("checked", true);}
	 else if('<%=SearchMap.get("Period")%>'=="Period_Year"){$("input:radio[id='Period6']").prop("checked", true);}
	 <%}
	 if(SearchMap.get("Size")!=null){%>
	 if('<%=SearchMap.get("Size")%>'=="Size_No"){$("input:radio[id='Size1']").prop("checked", true);}
	 else if('<%=SearchMap.get("Size")%>'=="Size_Very_Short"){$("input:radio[id='Size2']").prop("checked", true);}
	 else if('<%=SearchMap.get("Size")%>'=="Size_Short"){$("input:radio[id='Size3']").prop("checked", true);}
	 else if('<%=SearchMap.get("Size")%>'=="Size_Middle"){$("input:radio[id='Size4']").prop("checked", true);}
	 else if('<%=SearchMap.get("Size")%>'=="Size_Long"){$("input:radio[id='Size5']").prop("checked", true);}
	 <%}
	 if(SearchMap.get("Experience")!=null){%>
	 if('<%=SearchMap.get("Experience")%>'=="Ex_1"){$("input:radio[id='Experience1']").prop("checked", true);}
	 else if('<%=SearchMap.get("Experience")%>'=="Ex_0"){$("input:radio[id='Experience0']").prop("checked", true);}
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


          <form class="navbar-form form-inline  navbar-right" role="search" action="./Project.bo" method="get" id="tag_search" name="tag_search">
          	<input type="hidden" name="sort" value="">
              <div class="input-group">
                 <input type="text" name="TagSearch" id="TagSearch" class="search-box" placeholder="#해시">
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
          <form role="form" action="./Project.bo" method="get" id="searchform" name="searchform">
          <input type="hidden" name="sort" value="">
          <table class="table">
           <tr>
             <td style="border-top:white 1px solid;">
                <div class="input-group act">
                  <input type="search" class="form-control" placeholder="프로젝트 검색" name="Project_Search" id="Project_Search">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="project_search_btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                  </span>
                </div><!-- /input-group -->  
            </td>
            <td style="border-top:white 1px solid;">
              <select class="form-control act" name="Occupation" id="Occupation">
                  <option>직군</option>
                  <option>애니메이터</option>
                  <option>작가</option>
                  <option>성우</option>
                  <option>기타</option>
              </select>
            </td>
            <td style="border-top:white 1px solid;">
              <select class="form-control act" name="Category" id="Category">
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
            <td><b>협업 기간</b></td>
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
            <td><b>프로젝트 크기</b></td>
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
          <td><b>유사 경험</b></td>
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
        <td colspan="3"><button type="submit" id="search" class="btn">검색</button></td>
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
                
              </nav>
              
              <%
              for(int i=0; i<list.size(); i++){
              %>
              
            <div id="dede" style = "position:relative;">
              <div id="card_User">
                <a href="#">
                <%if(list.get(i).getMem_icon()==null){ %>
                <img src="<%=request.getContextPath()%>/image/profile.jpg" alt="User-img" class="projact_card_U img-circle">
                <%}else if(list.get(i).getMem_icon()!=null){System.out.println("아이콘경로있음");} %>
                </a>
                <p class="projact_card_U_font"><%=list.get(i).getMem_nickname() %></p>
              </div>
             
              <div id="card_content">
                <div class="oneline">
                    <button type="submit" id="btn_scrap" class="btn pull-left"><span class="glyphicon glyphicon-asterisk" id="scrap"></span></button>
                    <a href="#" id="card_title" rel="card_U_Title"><h3 name="User_title" id="card_title"><%=list.get(i).getBoa_title()%></h3></a>
                    <div class="D-Day-box">
                      <p class="D-font"><%if(list.get(i).getBoa_d_day()>0){ %>
                      D - <%=list.get(i).getBoa_d_day()%>
                      <%}else if(list.get(i).getBoa_d_day()==0){ %>
                      TODAY
                      <%}else if(list.get(i).getBoa_d_day()<0){  int d_day=Math.abs(list.get(i).getBoa_d_day()); %>
                      D + <%=d_day%>
                      <%} %></p>
                      <%//String register = list.get(i).getBoa_reg_date();
                      	DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
              			String reg_date = sdFormat.format(list.get(i).getBoa_reg_date());
						String[] reg_splitdate = reg_date.split("-");
						String reg = reg_splitdate[1]+"."+reg_splitdate[2];  
						String dead_date = sdFormat.format(list.get(i).getBoa_rec_deadline());
						String[] dead_splitdate = dead_date.split("-");
						String RegAndDead =reg+"~"+ dead_splitdate[1]+"."+dead_splitdate[2];
                      %>
                      <div class="D-Day-block">
                      <p style="display:inline-block;" ><%=RegAndDead%> </p>
                      </div>
                    </div>
                </div>
                <div class="project-content">
                  <div id="card_hash">
                      <%for(int j=0; j<list.get(i).getBoa_hashtag().size(); j++ ){%>
                      <a href="./Project.bo?TagSearch=<%=list.get(i).getBoa_hashtag().get(j)%>" rel="hash">
                      #<%=list.get(i).getBoa_hashtag().get(j)%>
                      </a>
                      <%}%>
                  </div>
                 <table>
                    <tr>
                      <td class="td_block" style="font-weight: bold;">분류</td>
                      <td><%=list.get(i).getBoa_category()%></td>
                    </tr>
                    <tr>
                      <td class="td_block" style="font-weight: bold;">필요 직군</td>
                      <td><%=list.get(i).getBoa_job()%></td>
                    </tr>
                    <tr>
                      <td class="td_block" style="font-weight: bold;">지원자 수</td>
                      <td><%=list.get(i).getApp_number()%></td>
                    </tr>
                  </table>
                
                
               </div>
              </div>
            </div>

			<%} %>

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