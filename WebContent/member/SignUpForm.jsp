<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"> <!--my css-->
    <link href="<%=request.getContextPath()%>/css/signup.css"rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!--부트스트랩-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!--제이쿼리-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!--부트스트랩-->
    <title>아울러 : 회원가입</title>
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
            <li ><a href="./Main.do">홈 <span class="sr-only">(current)</span></a></li>
            <li><a href="./Project.bo">팀원모집 </a></li>
            <li><a href="#">공모전 정보</a></li>
          </ul>


          <form class="navbar-form form-inline  navbar-right" role="search">
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="#해시">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              
              
                 <div class="input-group">
                     <a href="./LoginForm.do">로그인</a>
                </div></div>

        </form>
      </div>
    </nav> 
</header>
  
  <main> 
    <div class="container signup-block">
              <form role="form" name="loginform" action="./MemberJoin.do" method="post">
                <div style="text-align: center">
                    <a href="<%=request.getContextPath()%>/Main.do"><img src="<%=request.getContextPath()%>/image/final_logo(non_writting).png" alt="아울러"></a>
                </div>
                        
                <div class="form-group">
                    <label>아이디</label>
                    <input type="text" name="mem_id" class="form-control input-lg" placeholder="아이디" tabindex="1">
                </div> 
                           
                <div class="row"> <!--비밀번-->
                     <div class="col-xs-12 col-sm-6 col-md-6">
                          <div class="form-group">
                                 <label>비밀번호</label>
                                 <input type="password" name="mem_password" id="password" class="form-control input-lg" placeholder="비밀번호" tabindex="2">
                           </div>
                     </div>
                     <div class="col-xs-12 col-sm-6 col-md-6">
                          <div class="form-group">
                                  <label>비밀번호 확인</label>
                                  <input type="password" name="mem_password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="비밀번호 확인" tabindex="3">
                          </div>
                     </div>
                </div>

                <div class="row"><!--이름/닉네임-->
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                             <label>이름</label>
                             <input type="text" name="mem_username" id="first_name" class="form-control input-lg" placeholder="이름" tabindex="4">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                         <div class="form-group">
                            <label>닉네임</label>
                             <input type="text" name="mem_nickname"  class="form-control input-lg" placeholder="닉네임" tabindex="5">
                         </div>
                    </div>
                </div>
                     

                        <div class="row">
                            <p style="margin-left:15px; font-size:15px; font-weight: bolder;">생년월일</p>
                          <div class="col-xs-12 col-sm-4 col-md-4">
                              <div class="form-group">
                                  <input type="text" name="mem_bir_year" class="form-control input-lg" placeholder="년(4자)" tabindex="5">
                              </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4">
                            <div class="form-group">
                                <select id="Select" class="form-control" tabindex="6" name="mem_bir_month">
                                    <option>월</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                    <option>04</option>
                                    <option>05</option>
                                    <option>06</option>
                                    <option>07</option>
                                    <option>08</option>
                                    <option>09</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                </select>
                            </div>
                          </div>
                            <div class="col-xs-12 col-sm-4 col-md-4">
                            <div class="form-group">
                              <!--   <input type="text" name="mem_bir_day" class="form-control input-lg" placeholder="일" tabindex="5"> -->
                                 <select id="Select" class="form-control" tabindex="6" name="mem_bir_day">
                                    <option>일</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                    <option>04</option>
                                    <option>05</option>
                                    <option>06</option>
                                    <option>07</option>
                                    <option>08</option>
                                    <option>09</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                    <option>13</option>
                                    <option>14</option>
                                    <option>15</option>
                                    <option>16</option>
                                    <option>17</option>
                                    <option>18</option>
                                    <option>19</option>
                                    <option>20</option>
                                    <option>21</option>
                                    <option>22</option>
                                    <option>23</option>
                                    <option>24</option>
                                    <option>25</option>
                                    <option>26</option>
                                    <option>27</option>
                                    <option>28</option>
                                    <option>29</option>
                                    <option>30</option>
                                    <option>31</option>
                                </select>
                            </div>
                          </div>
                        </div>

                          <div class="form-group">
                            <label>직업</label>
                              <select id="Select" class="form-control" tabindex="6" name="mem_job">
                                  <option>직업</option>
                                  <option>시나리오작가</option>
                                  <option>애니메이터</option>
                                  <option>성우</option>
                                  <option>작곡가</option>
                                  <option>기타</option>
                              </select>
                          </div>
                          
                   

                        <div class="form-group">
                            <label for="type" class=" control-label">이메일</label>
                            <input type="email" name="mem_email" id="email" class="form-control input-lg" placeholder="이메일" tabindex="7">
                        </div>
                        <div class="form-group">
                            <label for="type" class="control-label">연락처</label>
                            <input type="text" name="mem_phone" id="phon-number" class="form-control input-lg" placeholder="(-)없이" tabindex="8">
                        </div>

                        <div class="form-group">
                           <button class="btn btn-block btn-lg" style="background-color:#fbd14b; color: #FFFFFF" name="signup">가입하기</button>
                          </div>
                    </form>
          </div><!--/container-->

          <footer>
              <div id="copyright" class="container-fluid">
                <p>성결대학교 미디어소프트웨어학부 <br> 2019 <strong>OWLER.</strong> 인지해 정나영 한수지</p>
              </div>
         </footer>
        </main>


</body>
</html>