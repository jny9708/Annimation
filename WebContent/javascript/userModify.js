$('.newbtn').bind("click" , function () {
    $('#pic').click();
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip({
		// container: "body",
		delay: { "show": 0, "hide": 20 }

    });
    
	$('.tooltip-right').tooltip({
		placement: 'right',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-viewport-right').tooltip({
		placement: 'right',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	$('.tooltip-viewport-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	 });

function inNumber(){
  if(event.keyCode<48 || event.keyCode>57){
     event.returnValue=false;
  }
}
	 

function userModify() {

	if(modify.m_kname.value == "") {
		alert("닉네임을 입력해 주세요.");
		modify.m_kname.focus();
		return false;
	}
	else if(modify.m_password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		modify.m_password.focus();	  
		return false;
	}
	else if(modify.m_password_check.value == "") {
		alert("비밀번호를 확인해 주세요.");
		modify.m_password_check.focus();	  
		return false;
	}
	
	else if(modify.m_year.value == "") {
		alert("생년월일을 입력해 주세요.");
		modify.m_year.focus();	  
		return false;
	}
	else if(modify.m_month.value == "") {
		alert("생년월일을 입력해 주세요.");
		modify.m_month.focus();	  
		return false;
	}
	else if(modify.m_day.value == "") {
		alert("생년월일을 입력해 주세요.");
		modify.m_day.focus();	  
		return false;
	}
	else if(modify.m_job.value == "") {
		alert("직업을 선택해 주세요.");
		modify.m_job.focus();	  
		return false;
	}
	else if(modify.m_email.value == "") {
		alert("이메일을 입력해 주세요.");
		modify.m_email.focus();	  
		return false;
	}
	else if(modify.m_phon.value == "") {
		alert("연락처를 입력해 주세요.");
		modify.m_phon.focus();	  
		return false;
	}
	else return true;
	  
	}