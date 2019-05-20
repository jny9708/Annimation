<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.member.model.*"%>
    <%@page import="com.board.model.*"%>
<!DOCTYPE html>
<%
	int logincheck=0;
	MemberDto MemberDto = null;
	if(session.getAttribute("Member")!=null){
		MemberDto=(MemberDto)session.getAttribute("Member");
		logincheck=1;
	}
	String birthday = MemberDto.getMem_birthday();
	System.out.println("뭐야또갑자기"+birthday);
	String year = birthday.split("-")[0];
	String month = birthday.split("-")[1];
	String day = birthday.split("-")[2];
	String content = "";
	if(MemberDto.getMem_profile_content()!=null){
		content = MemberDto.getMem_profile_content();
	}
	System.out.println("month"+month);
	System.out.println("직업"+MemberDto.getMem_job());
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/image/final_logo(mini_size_1).png">
    
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!--부트스트랩-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!--제이쿼리-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!--부트스트랩-->
    
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link href="<%=request.getContextPath()%>/css/userModify.css"rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/javascript/userModify.js"></script>
    <title>아울러 : 회원정보수정</title>
</head>
<script  type="text/javascript">
$(document).ready(function() {
	$('.sel_month').val('<%=month%>');
	$('.sel_job').val('<%=MemberDto.getMem_job()%>');
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
            <li ><a href="./Project.bo">팀원모집 </a></li>
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
        <h2>회원정보 수정</h2>
        <div id="modify_block">
            <form action="./UserUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return userModify()" name="modify">
                <table>
                    <tr>
                        <td colspan="4">
                            <label class="newbtn">
                            <%if(MemberDto.getMem_icon().equals("profile.jpg")){ %>
                                <img id="blah" src="<%=request.getContextPath()%>/image/profile.jpg" alt="user_image" class="img_block img-circle" data-toggle="tooltip" title="프로필 사진 변경" data-original-title="Default tooltip">
                                 <%}else{
                                	 System.out.println("아이콘경로있음");%>
                                	 <img id="blah" src="<%=request.getContextPath()%>/image/<%=MemberDto.getMem_icon()%>" class="img_block img-circle" alt="user_image" data-toggle="tooltip" title="프로필 사진 변경" data-original-title="Default tooltip">
                                	 <%} %>
                                <input id="pic" class='pis img_block2' onchange="readURL(this);" type="file" name="usericon">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_kname">닉네임</label></th>
                        <td colspan="3"><input type="text" value="<%=MemberDto.getMem_nickname()%>" placeholder="닉네임을 작성해주세요." id="modify_con" name="m_kname" tabindex="1"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_password">비밀번호</label></th>
                        <td colspan="3"><input type="password"  id="modify_con" name="m_password" tabindex="2"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_password_check">비밀번호 확인</label></th>
                        <td colspan="3"><input type="password"  id="modify_con" name="m_password_check" tabindex="3"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_birthday">생년월일</label></th>
                        <td> <input type="text" name="m_year" id="modify_con" value="<%=year%>" class="m_birthday" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  placeholder="년(4자)" tabindex="4"></td>
                        <td> <select id="modify_con"  class="sel_month" tabindex="5" name="m_month" >
                                <option value="">월</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </td>
                        <td><input type="text"id="modify_con"  name="m_day" class="m_birthday"  onKeyup="this.value=this.value.replace(/[^0-9]/g,''); placeholder="일" value="<%=day%>" tabindex="6"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_job">직업</label></th>
                        <td colspan="3"><select id="modify_con" class="sel_job" tabindex="7" name="m_job" value="<%=MemberDto.getMem_job()%>">
                                <option value="">직업</option>
                                <option value="애니메이터">애니메이터</option>
                                <option value="시나리오작가">시나리오작가</option>
                                <option value="성우">성우</option>
                                <option value="작곡가">작곡가</option>
                                <option value="기타">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_email">이메일</label></th>
                        <td colspan="3"><input type="text" name="m_email" id="modify_con"  placeholder="이메일" value="<%=MemberDto.getMem_email()%>" tabindex="8"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_phone">연락처</label></th>
                        <td colspan="3"><input type="text" name="m_phone" id="modify_con"  placeholder="(-)없이" value="<%=MemberDto.getMem_phone()%>" tabindex="9"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="label_b"><label for="m_introduction">자기소개</label></th>
                        <td colspan="3"><textarea rows="5" id="modify_text" style="resize: none;" name="m_introduction" value="<%=content%>" tabindex="10"></textarea></td>
                    </tr>
                </table>
                <div id="modify_b2">
                    <button class="btn-modify" type="submit" >수정</button>
                    <button class="btn-modify2" type="button" onclick="history.back(-1);">취소</button>
                </div>
                <a href="./MemberDelete.do" class="modify_withdrawal" onClick="alert('탈퇴하셨습니다.')">회원 탈퇴</a>
            </form>
        </div>
    </div>
</main>
    <footer style="clear:both; background-color: white;">
        <div id="copyright" class="container-fluid">
          <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>아울러.</strong> 인지해 정나영 한수지</p>
        </div>
    </footer>

</body>
</html>