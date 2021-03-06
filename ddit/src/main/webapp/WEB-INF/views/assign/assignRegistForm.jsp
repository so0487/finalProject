<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="content-body">

	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">

		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title" style="text-align: left;">과제자료실</h3>
			</div>

		</div>
		<!-- Page Heading End -->

		<!-- button -->
		<div style="position: absolute; top: 25px; right: 62px;">
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="registBtn">
				<span>등록</span>
			</button>
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="cancelBtn">
				<span>취소</span>
			</button>
		</div>

	</div>
	<!-- Page Headings End -->

	<form role="form" method="post" action="regist.do" name="registForm" >
		<div class="row">
			<input type="hidden" id="class_start_date" name="class_start_date" value="${class_start_date }">
			<input type="hidden" name="student_id"	value="${loginUser.member_id}" /> 
			<input type="hidden" name="lecture_no"	value="${lecture_no}" /> 

			<div class="col-lg-11 mb-20" style="margin-left: 30px;">
				과제제목<input type="text" class="form-control" name="assignment_name" id="assignment_name">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 mb-20" style="margin-left: 30px;">
				총점<input  type="number" oninput="maxLengthCheck(this)" maxlength="3" class="form-control" name="assignment_score" id="assignment_content">
			</div>
			<div class="col-lg-3 mb-20">
				반영비율<input  type="number" oninput="maxLengthCheck(this)" maxlength="3" class="form-control" name="assignment_ratio" id="assignment_ratio">
			</div>
			<div class="col-lg-5 mb-20">
				제출기한<input type="date" class="form-control" name="assignment_end_date" id="assignment_end_date"  max="${classVO.class_end_date }">
			</div>
		</div>
		


		<!-- summernote -->
		<div class="row">
			<div class="col-12 mb-30">
				<div class="box">
					<div class="box-head">
						<h3 class="title">제출내용</h3>
					</div>
					<div class="box-body">
						<textarea id="assign_content" name="assignment_content" class="summernote" maxlength="10"></textarea>
					</div>
				</div>
			</div>
		</div>

	</form>

</div>
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script>
	

	var date = new Date();
	var dates = $('#class_start_date').val();
	var strs = moment(dates).format("YYYY-MM-DD");
	var str = moment(date).format("YYYY-MM-DD");
	if(str>$('#class_start_date').val()){
		document.getElementById("assignment_end_date").min =str;
	}else{
		document.getElementById("assignment_end_date").min =strs;
	}
	
	$('#registBtn').on('click', function(e) {
		
		var end_date = $('#assignment_end_date').val();
		var today = new Date();
		today.setDate(today.getDate()-1);
		var today2 = moment(today).format("YYYY-MM-DD");
		
		if(!moment(today2).isBefore(end_date)){
			alert("오늘보다 이전 날짜를 선택하였습니다.");
			return false;
		}
		
		var form = document.registForm;
		//alert($('#post_title').val().length);
		if (form.assignment_name.value == "") {
			alert("제목은 필수적으로 입력되어야 합니다.");
			return false;
		}
		if ($('#assignment_name').val().length > 50) {
			alert("입력가능한 최대 바이트를 초과하였습니다.");
			return false;
		}
		if ($('#assignment_name').val().length > 100) {
			alert("제목 최대 입력 크기를 초과하였습니다.");
			return false;
		}
		if ($('#assignment_content').val().length > 1000000) {
			alert("내용 최대 입력 크기를 초과하였습니다.");
			return false;
		}
		
// 		var files = $('input[name="uploadFile"]');
// 	 	for(var file of files){
// 	 		if(file.value==""){
// 				alert("파일을 선택하세요.");
// 				file.focus();
// 				file.click();
// 				return;
// 	 		}
// 	 	}
		
		form.submit();
	});

	$('#cancelBtn').on('click', function(e) {
		history.go(-1);
	});
	
	  function maxLengthCheck(object){
		    if (object.value.length > object.maxLength){
		      //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
		      object.value = object.value.slice(0, object.maxLength);
		    }    
		  }
</script>
<%-- <%@ include file="attach_js.jsp"%> --%>

