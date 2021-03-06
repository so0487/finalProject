<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="content-body">
		<div class="col-12 mb-30">
			<div class="box-head">
				<h3 class="title">면접일정등록</h3>
				<div class="col-lg-12 mb-20">
					<span class="row mb-15">▶새로운 면접일정</span>
					<div class="add-edit-product-wrap col-12 ">
						<form action="regist.do" method="post" class="col-lg-12" name="registForm">
							<div class="mb-30">
								<br /> 교육과정회차 <select class="form-control" id="interview_name1"
									onChange="getSelectValue(this.form);">
									<option>교육과정회차 선택</option>
									<%--<c:forEach var="classes" items="${classList }" varStatus="status"> --%>
									<option value="${classes.class_no}">${classes.curriculum_name}
										${classes.class_number } 회차</option>
									<%--</c:forEach> --%>
								</select> <input type="hidden" name="interview_name" id="interview_name">

							</div>
							<div class="row  mb-15">
								<div class="col-lg-3 mb-15">
									시작<input type="datetime-local" class="form-control"
										name="interview_start_date" id="interview_start_date" required>
								</div>
								<div class="col-lg-3 mb-15">
									진행시간<select class="form-control" id="interview_time1"
										onChange="getSelectValue1(this.form);" required>
										<option>진행시간</option>
										<option>30</option>
										<option>45</option>
										<option>60</option>

									</select> <input type="hidden" id="interview_time" name="interview_time">
								</div>
								<div class="col-lg-3 col-12 mb-30">
								<fmt:parseNumber value="${classes.class_max *1.5}" var ="max" integerOnly="true"/>
									회차모집인원<input type="number" class="form-control"
										placeholder="${classes.class_max *1.5}"
										name="interview_max_personnel" value="${classes.class_max}"
										readonly="readonly">
								</div>
								<div class="col-lg-3 col-12 mb-30">
									수용인원<input type="number" class="form-control"
										placeholder="신청가능인원" name="interview_personnel" min='1'
										max='5' required>
								</div>
							</div>
							<div class="">
								<div class="row">
									<div class="col-12 mb-50">
										<div class="box">
											<div class="box-head">
												<h4 class="title">면접관선택</h4>
											</div>
											<div class="box-body">
												<table class="table table-sm">
													<thead>
														<tr>
															<th style="width:5%">#</th>
															<th style="width:20%">이름</th>
															<th style="width:15%">아이디</th>
															<th style="width:30%">메일</th>
															<th style="width:30%">연락처</th>
														</tr>
													</thead>
													<tbody id="proListTable">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="row">
									<div class="col-lg-5 mb-20"></div>
									<div class="col-lg-2 mb-20">
										<input type="button" id="registBtn" class="button button-primary" value="등록" />


									</div>
									<div class="col-lg-5 mb-20"></div>
								</div>
							</div>
							<input type="hidden" name="class_no">
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<input type="hidden" name="class_start_date"
		value="${classes.class_start_date}">
	<input type="hidden" name="class_recruitment_end"
		value="${classes.class_recruitment_end}">

</body>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="pro-list-template">
{{#each .}}
	<tr>
		<th><input type="checkbox" name="proList" onchange="addProList();" value="{{member_id }}"></th>
		<th>{{member_name }}</th>
		<th>{{member_id }}</th>
		<th>{{member_email }}</th>
		<th>{{member_phone }}</th>
	</tr>
{{/each}}	
</script>



<!-- 체크한 면접관 -->
<script>
	
	$('#registBtn').on("click",function(){
		var form=document.registForm;
		var length = $('input[name=proList]:checked').length;
		var flag =true;
		if(length<=0){
			flag=false;
		}
		if(!$('#interview_time1 > option:selected').val()) {
			flag=false;
		}		
		if(flag==false){
			alert("입력하지 않은 항목이 있습니다.");
			return;
		}
		if(flag==true){
			form.submit();
		}
	})
	

	
	function addProList(){
		var checkArr = new Array();
	
	    $("input[name=proList]:checked").each(function() {
	    	checkArr.push( $(this).val());
	    });
	    
	    
	    $.ajax({
	        url: '<%=request.getContextPath()%>/interview/regist/proList.do',
			type : 'post',
			dataType : 'text',
			data : {
				valueArrTest : checkArr
			}
		});
	}
</script>



<script>



	function getSelectValue(frm) {
		var value = $("#interview_name1 option:selected").val();
		var value1 = $('#interview_name1').val();

		document.getElementById("interview_name").value = value;
		$('input[name=class_no]').attr('value', value1);
	}

	function getSelectValue1(frm) {
		var value = $("#interview_time1 option:selected").val();

		document.getElementById("interview_time").value = value;
	}
	
	var str = $('input[name=class_start_date]').val()+"T00:00:00";
	var str2 = $('input[name=class_recruitment_end]').val()+"T00:00:00";
	
	document.getElementById("interview_start_date").max = str;
	document.getElementById("interview_start_date").min = str2;
	
	
	
	$('input[name=interview_start_date]').on('change',function(){
		$.ajax({
	        url: '<%=request.getContextPath()%>/interview/proList.do',
			type : 'post',
			dataType : 'text',
			data : {
				start_date : str,
				end_date : str2
			},
			success : function(data) {
				var result = JSON.parse(data);
				getPage(result);
			}
		});
	})

	function getPage(result) {
		var template = Handlebars.compile($('#pro-list-template').html());
		var html = template(result);

		$('#proListTable').empty();
		$('#proListTable').html(html);
	}
</script>


