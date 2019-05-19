<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.member.model.*"%>
<!DOCTYPE html>
<%
	int logincheck=0;
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
		logincheck=1;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    
    <link href="<%=request.getContextPath()%>/css/project.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css--> 
    <link href="<%=request.getContextPath()%>/css/userPage.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/javascript/userPage.js" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/javascript/card_content.js" type="text/javascript"></script>
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final logo(mini size_1).png">

    <title>아울러 : 나의 페이지</title>
</head>
<body  style="background:white !important;">
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
            <li class="active"><a href="./Project.bo">팀원모집 </a></li>
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

<div class="container my_wb ">
  <div class="wrap">
    <div class="side front">
          <img src="../image/profile.jpg" class="my_profile img-circle">
          <p class="my_pro_font">솔티카라멜<br><small>애니메이터</small></p>
          <div class="my_pro_block">
            <p>술이제 못먹겠다 힘들어..술이제 못먹겠다 힘들어..술이제 못먹겠다 힘들어..술이제 못먹겠다 힘들어..술이제 못먹겠다 힘들어..</p>
          </div>
          <button class="btn my_modify" type="submit" name="sp_deletion">회원 수정 및 탈퇴</button>
     </div> 
  </div>


<main> <!--스크랩, 지원, 등록 정보 시작-->
    <div role="tab">
        <!-- 해더 tabs -->
        <ul class="tabs">
          <li class="tab active"><a href="#Support" class="lable" data-toggle="tab">지원글</a></li>
          <li class="tab"><a href="#Registration" class="lable" data-toggle="tab">등록글</a></li>
          <li class="tab"><a href="#Scrap" class="lable" data-toggle="tab">스크랩</a></li>
        </ul>
      
        <!-- Tab 내용 -->
        <div class="tab-content">
          <!--지원내용 시작-->
          <div role="tabpanel" class="tab-pane active" id="Support">
              <div class="row">
                  <div class="col-sm-12"><!--지원카드 시작-->
                      
                      <div id="dede">
                          <div id="card_User">
                            <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                            <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                          </div>
                        
                          <div id="card_content">
                            <div class="oneline">
                              <ul>
                                <li class="oneline_team">경기성남</li>
                                <li><a href="#">고구마는 역시 호박고구마</a>  
                                  <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                                </li>
                                <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                              </ul> 
                            </div>
                            <div class="twoline">
                              <table class="table">
                                <tr>
                                  <td id="twoline_title">모집분야</td>
                                  <td ><b id="twoline_content">애니메이터,성우</b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">작업기간</td>
                                  <td><b id="twoline_content">6개월~1년</b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">마감</td>
                                  <td><b id="twoline_content">TODAY</b></td>
                                </tr>
                                <tr>
                                  <td id="twoline_title">모집인원</td>
                                  <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                                </tr>
                              </table>
                            </div>
                            <div class="threeline">
                                <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                <ul>
                                  <li><a href="#">#해dddddddddddd시</a></li>
                                  <li><a href="#">#해ddddddd시</a></li>
                                  <li><a href="#">#로롤롤ㄹㄴ</a></li>
                                  <li><a href="#">#초코파이</a></li>
                                  <li><a href="#">#해시</a></li>
                                  <li><a href="#">#해시</a></li>
                                  <li><a href="#">#해시안녕</a></li>
                                  <li><a href="#">#해시</a></li>
                                  <li><a href="#">#해시</a></li>
                                </ul>
                                <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                              </div>
                        </div><!--카드상세내용-->
                      </div><!--전체카드dede-->

                        <div id="dede">
                            <div id="card_User">
                              <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                              <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                            </div>
                          
                            <div id="card_content">
                              <div class="oneline">
                                <ul>
                                  <li class="oneline_team">경기성남</li>
                                  <li><a href="#">고구마는 역시 호박고구마</a>  
                                    <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                                  </li>
                                  <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                                </ul> 
                              </div>
                              <div class="twoline">
                                <table class="table">
                                  <tr>
                                    <td id="twoline_title">모집분야</td>
                                    <td ><b id="twoline_content">애니메이터,성우</b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">작업기간</td>
                                    <td><b id="twoline_content">6개월~1년</b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">마감</td>
                                    <td><b id="twoline_content">TODAY</b></td>
                                  </tr>
                                  <tr>
                                    <td id="twoline_title">모집인원</td>
                                    <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                                  </tr>
                                </table>
                              </div>
                              <div class="threeline">
                                  <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                  <ul>
                                    <li><a href="#">#해dddddddddddd시</a></li>
                                    <li><a href="#">#해ddddddd시</a></li>
                                    <li><a href="#">#로롤롤ㄹㄴ</a></li>
                                    <li><a href="#">#초코파이</a></li>
                                    <li><a href="#">#해시</a></li>
                                    <li><a href="#">#해시</a></li>
                                    <li><a href="#">#해시안녕</a></li>
                                    <li><a href="#">#해시</a></li>
                                    <li><a href="#">#해시</a></li>
                                  </ul>
                                  <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                                </div>
                            </div><!--카드상세내용-->
                          </div><!--전체카드dede-->

                          <div id="dede">
                              <div id="card_User">
                                <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                                <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                              </div>
                            
                              <div id="card_content">
                                <div class="oneline">
                                  <ul>
                                    <li class="oneline_team">경기성남</li>
                                    <li><a href="#">고구마는 역시 호박고구마</a>  
                                      <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                                    </li>
                                    <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                                  </ul> 
                                </div>
                                <div class="twoline">
                                  <table class="table">
                                    <tr>
                                      <td id="twoline_title">모집분야</td>
                                      <td ><b id="twoline_content">애니메이터,성우</b></td>
                                    </tr>
                                    <tr>
                                      <td id="twoline_title">작업기간</td>
                                      <td><b id="twoline_content">6개월~1년</b></td>
                                    </tr>
                                    <tr>
                                      <td id="twoline_title">마감</td>
                                      <td><b id="twoline_content">TODAY</b></td>
                                    </tr>
                                    <tr>
                                      <td id="twoline_title">모집인원</td>
                                      <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                                    </tr>
                                  </table>
                                </div>
                                <div class="threeline">
                                    <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                    <ul>
                                      <li><a href="#">#해dddddddddddd시</a></li>
                                      <li><a href="#">#해ddddddd시</a></li>
                                      <li><a href="#">#로롤롤ㄹㄴ</a></li>
                                      <li><a href="#">#초코파이</a></li>
                                      <li><a href="#">#해시</a></li>
                                      <li><a href="#">#해시</a></li>
                                      <li><a href="#">#해시안녕</a></li>
                                      <li><a href="#">#해시</a></li>
                                      <li><a href="#">#해시</a></li>
                                    </ul>
                                    <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                                  </div>
                              </div><!--카드상세내용-->
                            </div><!--전체카드dede-->

                            <div id="dede">
                                <div id="card_User">
                                  <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                                  <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                                </div>
                              
                                <div id="card_content">
                                  <div class="oneline">
                                    <ul>
                                      <li class="oneline_team">경기성남</li>
                                      <li><a href="#">고구마는 역시 호박고구마</a>  
                                        <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                                      </li>
                                      <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                                    </ul> 
                                  </div>
                                  <div class="twoline">
                                    <table class="table">
                                      <tr>
                                        <td id="twoline_title">모집분야</td>
                                        <td ><b id="twoline_content">애니메이터,성우</b></td>
                                      </tr>
                                      <tr>
                                        <td id="twoline_title">작업기간</td>
                                        <td><b id="twoline_content">6개월~1년</b></td>
                                      </tr>
                                      <tr>
                                        <td id="twoline_title">마감</td>
                                        <td><b id="twoline_content">TODAY</b></td>
                                      </tr>
                                      <tr>
                                        <td id="twoline_title">모집인원</td>
                                        <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                                      </tr>
                                    </table>
                                  </div>
                                  <div class="threeline">
                                      <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                                      <ul>
                                        <li><a href="#">#해dddddddddddd시</a></li>
                                        <li><a href="#">#해ddddddd시</a></li>
                                        <li><a href="#">#로롤롤ㄹㄴ</a></li>
                                        <li><a href="#">#초코파이</a></li>
                                        <li><a href="#">#해시</a></li>
                                        <li><a href="#">#해시</a></li>
                                        <li><a href="#">#해시안녕</a></li>
                                        <li><a href="#">#해시</a></li>
                                        <li><a href="#">#해시</a></li>
                                      </ul>
                                      <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                                    </div>
                                </div><!--카드상세내용-->
                              </div><!--전체카드dede-->
                            
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
                              <li class="active"><a href="#">1</a></li>
                              <li><a href="#">2</a></li>
                              <li><a href="#">3</a></li>
                              <li>
                                <a href="#" aria-label="오른쪽">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                           </ul>
                        </nav>
                  </div><!--지원탭 끝-->

          <!--등록 탭-->
          <div role="tabpanel" class="tab-pane" id="Registration">
            <div class="row">
                <div class="col-sm-12">
                  <div id="dede">
                      <div id="card_User">
                        <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                        <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                      </div>
                    
                      <div id="card_content">
                        <div class="oneline">
                          <ul>
                            <li class="oneline_team">경기성남</li>
                            <li><a href="#">고구마는 역시 호박고구마</a>  
                              <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                            </li>
                            <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                          </ul> 
                        </div>
                        <div class="twoline">
                          <table class="table">
                            <tr>
                              <td id="twoline_title">모집분야</td>
                              <td ><b id="twoline_content">애니메이터,성우</b></td>
                            </tr>
                            <tr>
                              <td id="twoline_title">작업기간</td>
                              <td><b id="twoline_content">6개월~1년</b></td>
                            </tr>
                            <tr>
                              <td id="twoline_title">마감</td>
                              <td><b id="twoline_content">TODAY</b></td>
                            </tr>
                            <tr>
                              <td id="twoline_title">모집인원</td>
                              <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                            </tr>
                          </table>
                        </div>
                        <div class="threeline">
                            <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                            <ul>
                              <li><a href="#">#해dddddddddddd시</a></li>
                              <li><a href="#">#해ddddddd시</a></li>
                              <li><a href="#">#로롤롤ㄹㄴ</a></li>
                            </ul>
                            <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                          </div>
                      </div><!--카드상세내용-->
                    </div><!--전체카드dede-->

                    <div id="dede">
                        <div id="card_User">
                          <a href="../html/index.html"><img src="../image/profile.jpg" alt="User-img" class="projact_card_U img-circle" data-toggle="tooltip" title="닉네임 페이지 보기" data-original-title="Default tooltip"></a>
                          <p class="projact_card_U_font">닉네임<br><small>애니메이터</small></p>
                        </div>
                      
                        <div id="card_content">
                          <div class="oneline">
                            <ul>
                              <li class="oneline_team">경기성남</li>
                              <li><a href="#">고구마는 역시 호박고구마</a>  
                                <button class='star' type="button" title="스크랩" data-toggle="tooltip" onclick="star('star1')" title="스크랩" data-original-title="Default tooltip"><img id="i_star1" src="../image/graystar.png"></button>            
                              </li>
                              <li><small style="float:right;">등록일|&nbsp;&nbsp;2019-04-23</small></li>
                            </ul> 
                          </div>
                          <div class="twoline">
                            <table class="table">
                              <tr>
                                <td id="twoline_title">모집분야</td>
                                <td ><b id="twoline_content">애니메이터,성우</b></td>
                              </tr>
                              <tr>
                                <td id="twoline_title">작업기간</td>
                                <td><b id="twoline_content">6개월~1년</b></td>
                              </tr>
                              <tr>
                                <td id="twoline_title">마감</td>
                                <td><b id="twoline_content">TODAY</b></td>
                              </tr>
                              <tr>
                                <td id="twoline_title">모집인원</td>
                                <td><b id="twoline_content">0/4 &nbsp;명</b></td>
                              </tr>
                            </table>
                          </div>
                          <div class="threeline">
                              <h4 style="margin-top:2px;"><b>#</b>해시태그</h4>
                              <ul>
                                <li><a href="#">#해dddddddddddd시</a></li>
                              </ul>
                              <small style="float:right">*최대 9개의 해시 태그를 볼 수 있습니다.</small>
                            </div>
                        </div><!--카드상세내용-->
                      </div><!--전체카드dede-->
                  
                      <!--<p id="my_text">다양한 글들을 등록 해보세요.</p>-->
                  </div><!--형태잡기-->
                </div>
          </div><!--등록 끝-->

          <!--스크랩 탭-->
          <div role="tabpanel" class="tab-pane" id="Scrap">
          <div class="row">
              <div class="col-sm-12">
                <p id="my_text">다양한 글들을 스크랩 해보세요.</p>
              </div>
          </div>

        </div><!--스크랩 끝-->
      
    </div><!--탭전체 끝-->
   
</main>
</div><!--저체 닫기-->


<footer style="clear:both; background-color: white;">
  <div id="copyright" class="container-fluid">
    <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
  </div>
</footer>

</body>
</html>