<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>



<body>
	

	<div class="content-body">

		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title" style="text-align: left;">교육과정 등록</h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->

		<form role="form" method="post" action="regist.do" name="registForm">
			<div class="row col-lg-12 mb-20">
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>교육과정번호</h5>
				</div>
				<div class="col-lg-2 mb-15">
					<input type="text" class="form-control" value="${curriculum_no }" name="curriculum_no" id="curriculum_no" readonly />
				</div>
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>교육과정명</h5>
				</div>
				<div class="col-lg-3 mb-15">
					<input type="text" class="form-control" name="curriculum_name" id="curriculum_name" maxlength="20"> 
				</div>
					<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>관련자격증</h5>
				</div>
				<div class="col-lg-3 mb-20">
					<input type="text" class="form-control" name="curriculum_certificate" id="curriculum_certificate"  maxlength="20">
				</div>
			</div>
			<div class="row col-lg-12 mb-20">
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>훈련시간</h5>
				</div>
				<div class="col-lg-3 mb-20">
					하루 수업시간(고정)<input type="text" class="form-control"
						name="defaultTime" id="defaultTime" value="8" readonly
						style="text-align: center;" /> 
				</div>
				
				<div class="col-lg-3 mb-20">
					일수<input type="number" class="form-control" name="day" id="day" value="10"
						style="text-align: center;" max="100" min="10"> 
						<input type="text" class="form-control" name="message"
						id="message" readonly
						style="text-align: center; color:red; border: none;">
				</div>
				
				<div class="col-lg-4 mb-20">
					총 훈련시간<input type="text" class="form-control" name="curriculum_time"
						id="curriculum_time" value="80" readonly
						style="text-align: center;">
				</div>
			

			</div>
		
		
		
		<!-- summernote -->
		<div class="row">
			<div class="col-12 mb-30">
				<div class="box">
					<div class="box-head">
						<h3 class="title">교육과정 소개</h3>
					</div>
					<div class="box-body">
						<textarea name="curriculum_introduce" id="curriculum_introduce" class="summernote"></textarea>
					</div>
				</div>
			</div>
		</div>
		</form>


		<!-- button -->
		<div class="row">
			
			<div class="col-lg-9 mb-20"></div>
			<div class="col-lg-3 mb-20">
				<button  style="border:1px solid #dddddd" class="sweetalert sweetalert-basic  btn btn-outline " id="registBtn">
					<span>등록</span>
				</button>
				<button  style="border:1px solid #dddddd" class="btn btn-outline" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
		</div>

	</div>
	
	
	
			
	
	
<script>

	
	
	
$('#registBtn').on('click',function(e){
	
	
	   
	
	
	var input1 =  $('input[name="defaultTime"]').val(); 
	var input2 =  $('input[name="day"]').val();
	
	input1 = parseInt(input1);
	input2 = parseInt(input2);
	if(input2<10){
		alert("일수를 10일 이상으로 입력하세요.");
		return;
	}else if(input2>100){
		alert("일수를 100일 이하로 입력하세요.")
		return;
	}
	
	document.getElementById("curriculum_time").value = input1*input2;
	
	var form=document.registForm;
	
	if(form.curriculum_name.value==""||form.curriculum_time.value==""||form.curriculum_certificate.value==""||form.curriculum_introduce.value==""){
		 swal({
		        title: "등록 오류!",
		        text: "입력하지 않은 항목이 있습니다."
		    });
		return;
	}
	swal({
        title: "작업 완료!",
        text: "등록되었습니다."
    });
	form.submit();
});

$('#cancelBtn').on('click',function(e){
	
	history.go(-1);
});


$('input[name="day"]').on('click',function(e){
	var input1 =  $('input[name="defaultTime"]').val(); 
	var input2 =  $('input[name="day"]').val();
	
	if(input2==""){
		document.getElementById("message").value = "10일 이상으로 입력하세요.";
		$('input[name="day"]').val(10);
		document.getElementById("curriculum_time").value =80;
		return;
	}else{
		document.getElementById("message").value = "";
	}
	input1 = parseInt(input1);
	input2 = parseInt(input2);
	
	document.getElementById("curriculum_time").value = input1*input2;
});

$('input[name="day"]').keyup(function(e){
	var input1 =  $('input[name="defaultTime"]').val(); 
	var input2 =  $('input[name="day"]').val();
	
	if(input2==""){
		document.getElementById("message").value = "10일 이상으로 입력하세요.";
		$('input[name="day"]').val(10);
		$('input[name="curriculum_time"]').val(80);
		return;
	}else{
		document.getElementById("message").value = "";
	}
	input1 = parseInt(input1);
	input2 = parseInt(input2);
	if(input2<10){
		document.getElementById("message").value = "10일 이상으로 입력하세요.";
// 		$('input[name="day"]').val(50);
// 		return;
	}else if(input2>100){
		document.getElementById("message").value = "100일 이하로 입력하세요."
		$('input[name="day"]').val(100);
		input2 =100;
	}
// 	input2= input2;
	
	
	document.getElementById("curriculum_time").value = input1*input2;
});
</script>
</body>
</html>