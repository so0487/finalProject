<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  

<!-- 추가하기 스크롤바   -->
<style>
	#followquick { position:absolute; top:220px; right:50%; margin-right:-800px; }
	
	.redBox{
		border:2px solid red;
	}
</style>
<script>
	//follow quick menu
	$(window).scroll(function() {
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 180) {
			scrollTop = 180;
		}
		$("#followquick").stop();
		$("#followquick").animate({
			"top" : scrollTop
		});
	});
	
	
	$('#registBtn').on('click',function(){
		for (var i = 0; i < $('input[name=exam_no]').length; i++) {
			if($('input[name=exam_no]').eq(i).val()==""){
				alert("문제번호를 입력해주세요.")
				$('input[name=exam_no]').eq(i).focus();
				return false;
			}	
		}
	
		for (var i = 0; i < $('input[name=exam_title]').length; i++) {
		if($('input[name=exam_title]').eq(i).val()==""){
			alert("문제제목을 입력해주세요")
			$('input[name=exam_title]').eq(i).focus();
			return false;
		}
		}

		for (var i = 0; i < $('select[name=exam_category_no]').length; i++) {		
		if($('select[name=exam_category_no]').eq(i).val()=="ss"){
			alert("문제유형을 선택해주세요")
			$('select[name=exam_category_no]').eq(i).focus();

			return false;
		}
		}
		for (var i = 0; i < $('input[name=exam_point]').length; i++) {
		if($('input[name=exam_point]').eq(i).val()==""){
			alert("문제배점을 입력해주세요")
			$('input[name=exam_point]').eq(i).focus();
			return false;
		}
		}
		for (var i = 0; i < $('input[name=exam_answer]').length; i++) {
		if($('input[name=exam_answer]').eq(i).val()==""){
			alert("문제정답을 입력해주세요")
			$('input[name=exam_answer]').eq(i).focus();
			return false;
		}
		}
		for (var i = 0; i < $('input[name=example_content]').length; i++) {
		if($('input[name=example_content]').eq(i).val()==""){
			alert("객관식 문항의 내용을 입력해주세요")
			$('input[name=example_content]').eq(i).focus();
			return false;
		}
		}
		for (var i = 0; i < $('input[name=test_name]').length; i++) {
		if($('input[name=test_name]').eq(i).val()==""){
			alert("시험지를 선택해주세요")
			$('input[name=test_name]').eq(i).focus();
			return false;	
		}
		}

		
		var form = document.registForm;
		form.submit();		
	});
</script>

<script>
$('#modifyBtn').on('click',function(){
	for (var i = 0; i < $('input[name=exam_no]').length; i++) {
		if($('input[name=exam_no]').eq(i).val()==""){
			alert("문제번호를 입력해주세요.")
			$('input[name=exam_no]').eq(i).focus();
			return false;
		}	
	}

	for (var i = 0; i < $('input[name=exam_title]').length; i++) {
	if($('input[name=exam_title]').eq(i).val()==""){
		alert("문제제목을 입력해주세요")
		$('input[name=exam_title]').eq(i).focus();
		return false;
	}
	}
	
	for (var i = 0; i < $('select[name=exam_category_no]').length; i++) {
	if($('select[name=exam_category_no]').eq(i).val()=="ss"){
		alert("문제유형을 선택해주세요")
		$('select[name=exam_category_no]').eq(i).focus();

		return false;
	}
	}
	for (var i = 0; i < $('input[name=exam_point]').length; i++) {
	if($('input[name=exam_point]').eq(i).val()==""){
		alert("문제배점을 입력해주세요")
		$('input[name=exam_point]').eq(i).focus();
		return false;
	}
	}
	for (var i = 0; i < $('input[name=exam_answer]').length; i++) {
	if($('input[name=exam_answer]').eq(i).val()==""){
		alert("문제정답을 입력해주세요")
		$('input[name=exam_answer]').eq(i).focus();
		return false;
	}
	}
	for (var i = 0; i < $('input[name=example_content]').length; i++) {
	if($('input[name=example_content]').eq(i).val()==""){
		alert("객관식 문항의 내용을 입력해주세요")
		$('input[name=example_content]').eq(i).focus();
		return false;
	}
	}
	for (var i = 0; i < $('input[name=test_name]').length; i++) {
	if($('input[name=test_name]').eq(i).val()==""){
		alert("시험지를 선택해주세요")
		$('input[name=test_name]').eq(i).focus();
		return false;	
	}
	}
	if(!(${test.test_score }==$('#sumPoint').val())){
		alert("총점과 시험배점이 다릅니다.");
		return false;
	}

	
	var form = document.modifyForm;
	form.submit();		
});

</script>

<script>
$(document).ready(function(){
	$(document).on("change keyup paste input", "input", function() {
		$(this).attr('style','border:1px solid rgb(118, 118, 118)');
	});
});

$("#backBtn").on('click', function(){
	location.href="lectureTestList?lecture_no=${test.lecture_no}"
});

$("#backBtnSTL").on('click', function(){
	location.href="studentTestList?lecture_no="+"<%=request.getParameter("lecture_no")%>";
});
</script>