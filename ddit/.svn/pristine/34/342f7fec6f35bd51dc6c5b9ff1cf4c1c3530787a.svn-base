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
			<div class="row">
				<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>평가기준번호</h5>
				</div>	
				<div class="col-lg-7 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" value="${evalution_no }" name="evalution_no" id="evalution_no" readonly />
				</div>
			</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>평가기준명</h5>
			</div>	
			<div class="col-lg-7 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="evalution_name" id="evalution_name">
			</div>
		</div>
		</form>


		<!-- button -->
		<div class="row">
			<div class="col-lg-9 mb-20"></div>
	
			<div class="col-lg-3 mb-20">
				<button class="button button-success" id="registBtn">
					<span>등록</span>
				</button>
				<button class="button button-danger" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
		</div>

	</div>
	<script>
$('#registBtn').on('click',function(e){
	
	var form=document.registForm;
	
	if(form.evalution_name.value==""){
		alert("입력하지 않은 항목이 있습니다.");
		return;
	}
	
	form.submit();
});

$('#cancelBtn').on('click',function(e){
	location.href="list.do";
});

</script>

</body>
</html>