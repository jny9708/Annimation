/*승인거부 */
$(document).ready(function () {
$('.btn_sp_yes').click(function(e) {
    $('.btn_sp_yes').not(this).removeClass('active');   
    $(this).toggleClass('active');
    if($(this).hasClass('active')){
        $('.btn_sp_no').attr('disabled',true);
        alert('지원자 승인');
    }else{
        $('.btn_sp_no').attr('disabled',false);
        alert('지원자 승인 해제');
    }
    e.preventDefault();
    
});
}); 

$(document).ready(function () {
    $('.btn_sp_no').click(function(e) {
        $('.btn_sp_no').not(this).removeClass('active');   
        $(this).toggleClass('active');
        if($(this).hasClass('active')){
            $('.btn_sp_yes').attr('disabled',true);
            alert('지원자 거부');
        }else{
            $('.btn_sp_yes').attr('disabled',false);
            alert('지원자 거부 해제');
        }
        
        e.preventDefault();
        
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

/*썸머노트 */
$(document).ready(function() {
    $('#summernote').summernote({
        height: 150,
        minHeight: null,             
        maxHeight: null,             
        focus: false 
    });                         
});
/*파일업로드 */
$(document).ready(function(){
    $('#appbutton :file').change(function(e){
        var fileName = e.target.files[0].name; /*이벤트가 발생한 타겟->file의 이름을 가져옴!*/
        $("#file_content").attr('placeholder',fileName) /*file_content의 내용을 파일 이름으로 바꿈!*/
    });
});