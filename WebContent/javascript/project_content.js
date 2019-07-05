 function change(boa_app_no) {
	 $("#sp_button_yesno_"+boa_app_no).show();
	 $("#support_content_"+boa_app_no).css("width","77%")
	 $("#sp_button_yesno_"+boa_app_no).css("display","inline-block")
	 $("#show_"+boa_app_no).hide();
 };
 
 function cancel(boa_app_no) {
	 $("#sp_button_yesno_"+boa_app_no).hide();
     $("#support_content_"+boa_app_no).css("width","88%")
     $("#show_"+boa_app_no).show();
 };

/*
$(document).ready(function(){
    
    $("#show").click(function(){
      $("#sp_button_yesno").show();
      $("#support_content").css("width","77%")
      $("#sp_button_yesno").css("display","inline-block")
      $("#show").hide();
    });
    $("#hide").click(function(){
        $("#sp_button_yesno").hide();
        $("#support_content").css("width","88%")
        $("#show").show();
      });  
    
  });
*/
$(document).ready(function(){  
    $("#sp_revise").click(function(){
    	var name = $(this).attr('name');  	
        $(".lone_"+name).show();
        $("#lone_true_"+name).hide();
        $("#sp_revise").hide();
        $(".con_"+name).css("border-bottom","#1b2339 1px solid")
        var contents = $(".lone1_"+name).html();
        console.log(contents);
        $('#summernote_'+name).summernote('code', contents);
        console.log(name+"뭐지?");
        var filename=$("#"+name+" #app_download").text();
        if(filename!='null'){
			$("#file_content_m").attr('placeholder',filename);	
		}
        
    });
  });


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
    /*파일업로드 */
    $(document).ready(function(){
        $('#appbutton :file').change(function(e){
            var fileName = e.target.files[0].name; /*이벤트가 발생한 타겟->file의 이름을 가져옴!*/
            $("#file_content").attr('placeholder',fileName) /*file_content의 내용을 파일 이름으로 바꿈!*/
        });
    });
    
    