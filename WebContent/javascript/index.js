$(function() {   
    var welcomeSection = $('.welcome-section'),
        enterButton = welcomeSection.find('.enter-button');
    
    setTimeout(function() {
        welcomeSection.removeClass('content-hidden');
    }, 500);
    
})();

function mover1(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle1");
        M.innerText="아마추어 웹 애니메이션 제작자들의 웹 애니메이션 제작을 고려한 팀원 모집 사이트";
        M.style.border=" #dedcee 1px solid";
        M.style.background="white";
        M.style.color="#082e3c";
    },200);
    
} 
    
function mout1(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle1");
        M.innerText="맞춤형 웹사이트";
        M.style.border=" #343434 0px dashed";
        M.style.background="#0b3c4e";
        M.style.color="white";
    },200);
} 
    
function mover2(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle2");
        M.innerText="댓글 지원 형식을 사용한 간단한 지원방식";
        M.style.border="#dedcee 1px solid";
        M.style.background="white";
        M.style.color="#082e3c";
    },200);
    
} 
    
function mout2(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle2");
        M.innerText="손쉬운 지원방식";
        M.style.border=" #343434 0px dashed";
        M.style.background="#0b3c4e";
        M.style.color="white";
    },200);
} 

function mover3(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle3");
        M.innerText="팀원 모집과 공모전 정보를 통합적으로 볼수 있는 사이트";
        M.style.border="#dedcee 1px solid";
        M.style.background="white";
        M.style.color="#082e3c";
    },200);
    
} 
    
function mout3(){
    setTimeout(function() {
        var M
        M = document.getElementById("ad_circle3");
        M.innerText="팀원 모집과 공모전 정보를 하나로";
        M.style.border=" #343434 0px dashed";
        M.style.background="#0b3c4e";
        M.style.color="white";
    },200);
} 
    