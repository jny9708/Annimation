<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아울러 : 로그인</title>
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">

    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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


          <form class="navbar-form form-inline  navbar-right" role="search">
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="#해시">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              
              
                 <div class="input-group">
                     <a href="./LoginForm.do">로그인</a>
                </div></div>
     <!--     <ul class="nav navbar-nav navbar-right" id="change">
            <li class="dropdown">
              <a href="#"  class="dropdown-toggle navbar-img" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <h5 style="display: inline-block;">닉네임</h5>
              <img src="<%=request.getContextPath()%>/image/profile.jpg" class="img-circle" alt="Profile Image"/>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#">마이페이지</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">로그아웃</a></li>
              </ul>
            </li>
          </ul>  
로그인 햇으면 이걸로! 드롭다운에는 마이페이지와 로그아웃 넘어가는 드롭다운!-->

        </form>
      </div>
    </nav> 
</header>

	<main>
  		<div class="container signup-block">
   		 <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 ">
                <form role="form" name="loginform" action="./MemberLogin.do" method="post">
                    <a href="./Main.do"><img src="<%=request.getContextPath()%>/image/final_logo(non_writting).png" alt="logo" class="logo-"></a>
                    <div class="form-group">
                        <input type="text" name="mem_id" class="form-control input-lg" placeholder="아이디" tabindex="1">
                    </div> 
                    <div class="form-group">
                        <input type="password" name="mem_password" id="password" class="form-control input-lg" placeholder="비밀번호" tabindex="2">
                    </div>
                    <div class="form-group">
                      <button  class="btn btn-block btn-lg"style="background-color:#fbd14b; color: #FFFFFF" name="login">로그인</button>
                    </div>
                    <div class="form-group">
                        <a href="./SignUpForm.do">회원가입</a>
                    </div>
                </form>
            </div>
        </div><!--/row-->
      </div> <!--/container-->
      
      <footer>
        <div id="copyright" class="container-fluid">
          <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>OWLER.</strong> 인지해 정나영 한수지</p>
        </div>
      </footer>
    </main>











  <!-- 
<form name="loginform" action="./MemberLogin.do" method="post">

<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>로그인 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="mem_id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="mem_password"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
			<a href="MemberJoin.do">회원가입</a>
		</td>
	</tr>
</table>

</form>
-->
</body>
</html>