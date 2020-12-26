<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content-body">
	 <div class="add-edit-product-wrap col-12" style="background-color: white; margin-top:-50px ">
	<div class="row justify-content-between align-items-center mb-10">

		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title" style="text-align: left;">교육과정</h3>
			</div>
		</div>
	</div>
	<!-- Page Heading End -->
	
	<div style="z-index:1; position: absolute; top: 130px; right: 80px;">
	<c:if test="${loginUser.member_role eq 'ADMIN' }">
		<button id="modBtn" style="border:1px solid #dddddd" class="btn btn-outline">
			<span>수정</span>
		</button>
		<button id="remBtn" style="border:1px solid #dddddd" class="btn btn-outline">
			<span>삭제</span>
		</button>
	</c:if>
		<button id="cancelBtn" style="border:1px solid #dddddd" class="btn btn-outline">
			<span>뒤로가기</span>
		</button>
	</div>

   <div class="row">
   <div class="col-lg-12 col-12 mb-30">
   
                    <div class="">
                        <div class="box-head">
                            <h4 class="title"> ▶${curriculum.curriculum_name }</h4>
                        </div>
                        <div class="box-body">
                            <table class="table ">
                               
                                <tbody>
							<tr>
								<th scope="row" >교육과정번호</th>
								<td style="width:85%;" colspan="8" >${curriculum.curriculum_no }</td>
							</tr>
							<tr>
								<th scope="row" >교육과정명</th>
								<td colspan="8" >${curriculum.curriculum_name }</td>
							</tr>
							<tr>
								<th scope="row">훈련시간</th>
								<td colspan="8">${curriculum.curriculum_time }</td>
							</tr>
							<tr>
								<th scope="row">관련자격증</th>
								<td colspan="8">${curriculum.curriculum_certificate } </td>
							</tr>
							<tr>
								<th scope="row">교육과정 소개</th>
								<td colspan="5">${curriculum.curriculum_introduce} </td>
							</tr>
							
						</tbody>
                            </table>
                        </div>
                    </div>
                </div>
              </div>
	<!-- Page Headings Start -->
	


	<!-- Page Headings End -->



	<div class="box-head">
		<h4 class="title">수강평</h4>
		<div class="row">
			<div class="col-lg-12 mb-20">
				<div class="box-body">
					<div class="tab-content">
						<div class="tab-pane fade show active">

							<table class="table">
								<thead>
									<tr>
										<th data-name="class_no">리뷰번호</th>
										<th data-name="class_number">회차</th>
										<th data-breakpoints="xs" data-name="class_recruitment_start">작성자</th>
										<th data-breakpoints="xs" data-name="class_recruitment_end">평점</th>
										<th data-breakpoints="xs" data-name="class_max">수강평</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${reviewList }" var="review">
										<c:if test="${review.review_status eq '0'}">
										<tr>
											<td>${review.review_no}</td>
											<c:forEach items="${classList }" var="classVO"    >
												<c:if test="${review.class_no eq classVO.class_no}">
		                                       <td>${classVO.curriculum_name }${classVO.class_number }차</td>
		                                       </c:if>
											</c:forEach>
											<td>${review.student_id}</td>
											<td>
											
													<input type="hidden"  name="revstar" value="${review.review_star }" >
												<div class="rating rating-read-only rating-font-star h3" data-score="${review.review_star }" style="cursor: pointer;">
												</div>
											</td>
											<td>${review.review_content}</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<%@include file="/WEB-INF/views/pagination/review_pagination.jsp"%>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>



<form role="form">
	<input type="hidden" name="curriculum_no" id="curriculum_no"
		value="${curriculum.curriculum_no }" />
</form>

<script>


var formObj = $("form[role='form']");


$('#goBtn').on('click',function(e){
	//alert("regist btn click");
	
	formObj.attr({
		'action':'../../class/list.do',
		'method':'post'
	});
	formObj.submit();
});

$('#modBtn').on('click',function(e){
	//alert("regist btn click");
	
	formObj.attr({
		'action':'../modifyForm.do',
		'method':'post'
	});
	formObj.submit();
});
$('#remBtn').on('click',function(e){
	//alert("regist btn click");
	
	formObj.attr({
		'action':'../remove.do',
		'method':'post'
	});
	formObj.submit();
});
$('#cancelBtn').on('click',function(e){
	location.href="../list.do"
});
</script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/raty/jquery.raty.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/raty/raty.active.js"></script>

