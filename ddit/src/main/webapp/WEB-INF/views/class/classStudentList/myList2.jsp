<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<body>

		<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">내 강의 목록</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<div class="row">
			<div class="col-lg-12 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">내 강의</h4>
                        </div>
                        <div class="box-body">
                            <!--Accordion Start-->
                            <div class="accordion" id="accordionExample">

                                <!--Card Start-->
                                <c:forEach items="${cslList }" var="csl">
                                <div class="card">

                                    <!--Card Header Start-->
                                    <c:forEach items="${classList }" var="classVO" varStatus="status">
                                    	<c:if test="${classVO.class_no eq csl.class_no}">
		                                    <div class="card-header" style="border:1px solid gray">
		                                        <h2><button data-toggle="collapse" data-target="#collapseOne${status.index }" class="" aria-expanded="true"  ><span class="ti-angle-double-right"></span> ${classVO.curriculum_name} &nbsp;${classVO.class_number }차 </br><span style="font-size: small;"> [${classVO.class_start_date } ~ ${classVO.class_end_date }]</span> </button></h2>
		                                        <input type="hidden" value="${classVO.class_no }" id="class_no" name="class_no"  >
		                                    </div>
		                                    <!--Card Header End-->
		                                    <c:forEach items="${classVO.lectureList }" var="lectureList">
		                                    <div id="collapseOne${status.index }" class="collapse show" data-parent="#accordionExample" style="border:1px solid gray; border-top: none;">
		                                        <div class="card-body">
		                                        	<div id="collapseOne${status.index }" class="collapse show" data-parent="#accordionExample" style="">
					                            	<div class="card-body">
					                                	<ul class="list-group">
				                                			<li class="list-group-item list-group-item-dark">
				                                				<strong><a href="<%=request.getContextPath()%>/lecture/mylecture?lecture_no=${lectureList.lecture_no }">${lectureList.lecture_name } &nbsp${lectureList.lecture_start_date } ~  ${lectureList.lecture_end_date }</a></strong>
				                                				
				                                			</li>
							                                <li class="list-group-item"><a href="<%=request.getContextPath()%>/lecture/mylecture?lecture_no=${lectureList.lecture_no }">강의실입장</a></li>
				                                			<li class="list-group-item"><a href="/ddit/lecture/myattendance?class_no=${classVO.class_no }&start_date=${classVO.class_start_date}&end_date=${classVO.class_end_date}&lecture_no=${lectureList.lecture_no }">내 출결관리</a></li>
				                                			<!-- 시험 -->		                             
				                                			<c:if test="${loginUser.member_role eq 'STUDENT' }">
			                            						<li class="list-group-item"><a href="<%=request.getContextPath()%>/exam/studentTestList?lecture_no=${lectureList.lecture_no}">시험</a></li>
				                                			</c:if>
				                                			<!-- 시험 -->		
				                                			<!-- 과제 -->
				                                			<c:if test="${loginUser.member_role eq 'STUDENT' }">
			                            						<li class="list-group-item"><a href="<%=request.getContextPath()%>/assign/list?lecture_no=${lectureList.lecture_no}">과제제출</a></li>
				                                			</c:if>
			                            				</ul>
					                    			</div>
					                            </div>
		                                        </div>
		                                    </div>
		                                    </c:forEach>
			                            				
                                    	</c:if>
                                    <!--Collapse Start-->
                                    
									</c:forEach>
                                    <!--Collapse End-->

                                </div>
                                <!--Card End-->
                                </c:forEach>
                            </div>
                            <!--Accordion End-->
                        </div>
                    </div>
                </div>
		</div>
	
	</div><!-- content-body end -->
	
				<div class="box">
					<div class="box-body">
						<!-- Modal -->
						<form role="form" class="form-horizontal" action="../regist/lecture.do" method="post">	
						<div class="modal fade" id="exampleModal6">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">수강평 수정</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
												<c:forEach items="${reviewList }" var="review">
													<c:forEach items="${classList }" var="classVO" varStatus="status">
													<c:forEach items="${cslList }" var="csl" varStatus="status">
														<c:if test="${review.student_id eq member_id && review.class_no eq classVO.class_no && csl.class_no eq classVO.class_no }" >
															<input type="hidden"  name="review_no" value="${review.review_no }" >
															<input type="hidden"  name="review_star" value="${review.review_star }" >
															<div class="form-group">
																<label for="" class="">평점</label>
																 <div class="rating rating-font rating-font-star h1" style="cursor: pointer;">
																 </div>
															</div>
										
															<div class="form-group">
															<label for="message-text" class="col-form-label">수강평</label>
															<input type="text" class="form-control" id="review_content" name="review_content" value="${review.review_content }">
															</div>
														</c:if>
													</c:forEach>
													</c:forEach>
												</c:forEach>
												
											
											
									</div>
									
									<div class="modal-footer">
										<button class="button button-primary" id="modifyReviewBtn" name="modifyReviewBtn" type="button" >수정</button>
										<button class="button button-primary" id="removeReviewBtn" name="removeReviewBtn" type="button" >삭제</button>
										<button class="button button-danger" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
									</form>
					</div>
				</div>
				
				<div class="box">
					<div class="box-body">
						<!-- Modal -->
						<form role="form" class="form-horizontal" action="../regist/lecture.do" method="post">	
						<div class="modal fade" id="exampleModal5">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">수강평 등록</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
											<div class="form-group">
												<label for="" class="">평점</label>
												<div class="rating rating-font rating-font-star h1" style="width: 100%;"></div>
											</div>
										
											<div class="form-group">
												<label for="message-text" class="col-form-label">수강평</label>
												<input type="text" class="form-control" id="review_content" name="review_content">
											</div>
									</div>
									
									<div class="modal-footer">
										<button class="button button-primary" id="registReviewBtn" name="registReviewBtn" type="button" >등록</button>
										<button class="button button-danger" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
									</form>
					</div>
				</div>
				
				
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/raty/jquery.raty.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/raty/raty.active.js"></script>
	
<script>

$('#registReviewBtn').on('click',function(e){
	$.ajax({
		type:"POST",
		url :"<%= request.getContextPath() %>/class/regist/review.do",
		data : {
				class_no : $('#class_no').val(),
				review_star : $('input[name="score"]').val(),
				review_content : $('input[name="review_content"]').val()
				
		},
	
	success:function(result){
		alert("등록되었습니다.");		
	},
	error:function(error){
		alert('등록 실패했습니다.');		
	},
	complete:function(){
			$('#exampleModal5').modal('hide');
			location.href="../class/registForm.do";
			location.reload(true);
	}
});
});

$('#modifyReviewBtn').on('click',function(e){
	$.ajax({
		type:"POST",
		url :"<%= request.getContextPath() %>/class/modify/review.do",
		data : {
				review_no : $('input[name="review_no"]').val(),
				review_star : $('input[name="score"]').val(),
				review_content : $('input[name="review_content"]').val()
				
		},
	
	success:function(result){
		alert("수정되었습니다.");		
	},
	error:function(error){
		alert('수정 실패했습니다.');		
	},
	complete:function(){
			$('#exampleModal6').modal('hide');
			location.href="../class/registForm.do";
			location.reload(true);
	}
});
});
$('#removeReviewBtn').on('click',function(e){
	$.ajax({
		type:"POST",
		url :"<%= request.getContextPath() %>/class/remove/review.do",
		data : {
			review_no : $('input[name="review_no"]').val()
		},
	
	success:function(result){
		alert("삭제되었습니다.");		
	},
	error:function(error){
		alert('삭제 실패했습니다.');		
	},
	complete:function(){
			$('#exampleModal6').modal('hide');
			location.href="../class/registForm.do";
			location.reload(true);
	}
});
});

$('#disabled').on('click',function(e){
	alert("교육과정 수료를 해야 작성가능합니다.");
});

</script>
</body>


    

