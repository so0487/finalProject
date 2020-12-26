<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
	

	<div class="content-body">

		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title" style="text-align: left;">상세보기</h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->

		<form role="form" method="post" action="modify.do" name="modifyForm">
			<div class="row">
				<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>회차아이디</h5>
				</div>	
				<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" value="${classVO.class_no }" name="class_no" id="class_no" readonly />
				</div>
			</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>교육과정회차</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
			<input type="text" class="form-control" value="${classVO.curriculum_name}${classVO.class_number }차" name="" id="" readonly />
			<input type="text" class="form-control" value="${classVO.curriculum_name }"  name="curriculum_name" id="curriculum_name"  style="display: none;" />
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>훈련시작날짜</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="date" class="form-control" name="class_start_date" id="class_start_date" value="${classVO.class_start_date }"  >
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>훈련종료날짜</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="date" class="form-control" name="class_end_date" id="class_end_date" value="${classVO.class_end_date }"  >
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>모집시작날짜</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="date" class="form-control" name="class_recruitment_start" id="class_recruitment_start" value="${classVO.class_recruitment_start }"  >
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;" >
				<h5>모집종료날짜</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="date" class="form-control" name="class_recruitment_end" id="class_recruitment_end"  value="${classVO.class_recruitment_end }"  >
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>수강취소기간</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="date" class="form-control" name="class_forgive_date" id="class_forgive_date" value="${classVO.class_forgive_date }" >
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>정원수</h5>
			</div>	
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="class_max" id="class_max" value="${classVO.class_max }" >
				<input type="text" class="form-control" name="class_number" id="class_number"  value="${classVO.class_number }"  style="display: none;">
				<input type="text" class="form-control" name="class_real" id="class_real" style="display: none;" value="${classVO.class_real }" >
				<input type="text" class="form-control" name="class_status" id="class_status" style="display: none;" value="${classVO.class_status }" >
				<input type="text" class="form-control" name="class_delete" id="class_delete" style="display: none;" value="${classVO.class_delete }" >
			</div>
		</div>
		
		</form>



		
		



		





		
		<!-- button -->
		<div class="row">
			<div class="col-lg-7 mb-20"></div>
	
			<div class="col-lg-5 mb-20">
				<button style="border:1px solid #dddddd" class="btn btn-outline" id="modBtn">
					<span>수정</span>
				</button>
				<button style="border:1px solid #dddddd" class="btn btn-outline" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
		</div>

	</div>

	
<script>
var formObj = $("form[role='form']");



$('#modBtn').on('click',function(e){
	//alert("regist btn click");
	
	var form=document.modifyForm;
	
	if(form.class_start_date.value==""||form.class_end_date.value==""||form.class_recruitment_start.value==""||form.class_recruitment_end.value==""
			||form.class_forgive_date.value==""||form.class_max.value==""){class_max
		alert("입력하지 않은 항목이 있습니다.");
		return;
	}
	
	form.submit();
});

$('#cancelBtn').on('click',function(e){
	//alert("regist btn click");
	location.href="detail.do?class_no?=${classVO.class_no}";
// 	history.go(-1);
});

</script>

</body>
</html>