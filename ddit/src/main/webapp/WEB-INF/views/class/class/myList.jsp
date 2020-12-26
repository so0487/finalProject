<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<body>
	<div class="content-body">
		<div class="col-lg-12 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">내 교육이력</h4>
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
		                                    <div class="card-header" style="border: 2px solid #c6c9cf; padding-top: 10px;">
		                                        <h3 data-toggle="collapse" data-target="#collapseOne${status.index }" class="" aria-expanded="true"> &nbsp&nbsp${classVO.curriculum_name} &nbsp;${classVO.class_number }차</h3>
		                                        <p>&nbsp &nbsp 교육기간 [${classVO.class_start_date} ~ ${classVO.class_end_date}]</p>
		                                        <input type="hidden" value="${classVO.class_no }" id="class_no" name="class_no">
		                                        
		                                    </div>
		                                    <!--Card Header End-->
		                                   
		                                    <div id="collapseOne${status.index }" class="collapse show" data-parent="#accordionExample" style="border: 2px solid #c6c9cf; border-top: none;">
		                                        <div class="card-body">
		                                        	<div id="collapseOne${status.index }" class="collapse show" data-parent="#accordionExample" style="">
					                            	<div class="card-body">
					                            	<table class="table">
					                              	<tbody>
														<tr>
															<th scope="row" style="width: 20%">교육과정명</th>
															<td colspan="5" >${classVO.curriculum_name} </td>
														</tr>
														<tr>
															<th scope="row" style="width: 20%">교육기간</th>
															<td colspan="5">${classVO.class_start_date} ~ ${classVO.class_end_date}</td>
														</tr>
														<tr>
															<th scope="row" style="width: 20%">수강후기
															</th>
															<td>
															<c:if test="${ csl.review_status eq 0 }" >
																	<div class=" rating-read-only rating-font-star h3"  style="cursor: pointer;"></div>
															</c:if>
															<c:forEach items="${reviewList }" var="review" varStatus="status">
																<c:if test="${review.review_status eq '0'&& member_id eq review.student_id && review.class_no eq classVO.class_no && csl.review_status ne 0}">
																	<div class=" rating-read-only rating-font-star h3"style="cursor: pointer;" data-score="${review.review_star }"></div>
																</c:if>
															</c:forEach>																				
															</td>
															<td>
<%-- 																<c:forEach items="${cslList }" var="csl"> --%>
																	<c:if test="${csl.classStudentList_status ne 1 &&  classVO.class_no eq csl.class_no}">
																		<button class="badge badge-outline badge-dark" id="disabled" >수강평등록</button>
																	</c:if>
																	<c:if test="${csl.review_status eq 0 && csl.classStudentList_status eq 1 && classVO.class_no eq csl.class_no}">
																		<button class="badge badge-outline badge-dark" data-toggle="modal" data-target="#exampleModal5" data-whatever="@mdo" >수강평등록</button>
																	</c:if>
																	<c:if test="${csl.review_status ne 0 && csl.classStudentList_status eq 1 && classVO.class_no eq csl.class_no}">
																		<button class="badge badge-outline badge-dark" data-toggle="modal" data-target="#exampleModal6" data-whatever="@mdo" >수강평수정</button>
																	</c:if>
<%-- 																</c:forEach>  --%>
															</td>
															<td colspan="5"></td>
														</tr>
														<tr>
															<th scope="row" style="width: 20%">상태</th>
<%-- 															<c:forEach items="${cslList }" var="csl"> --%>
															
															<c:if test="${csl.classStudentList_status eq 0 && csl.student_id eq member_id }">
																<td>수강중</td>
															</c:if>
															<c:if test="${csl.classStudentList_status eq 1 && csl.student_id eq member_id}">
																<td>수강완료</td>
															</c:if>
<%-- 															</c:forEach> --%>
														</tr>
													
													</tbody>
													</table>
					                    			</div>
					                            </div>
		                                        </div>
		                                    </div>
		                                                                     
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
												<input type="text" class="form-control"  name="review_content">
											</div>
									</div>
									
									<div class="modal-footer">
										<button  style="border:1px solid #dddddd" class="btn btn-outline" id="registReviewBtn" name="registReviewBtn" type="button" >등록</button>
										<button style="border:1px solid #dddddd" class="btn btn-outline" data-dismiss="modal">닫기</button>
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
														<c:if test="${review.review_status eq '0' &&review.student_id eq member_id && review.class_no eq classVO.class_no && csl.class_no eq classVO.class_no && csl.review_status ne 0 }" >
															<input type="hidden"  name="review_no" value="${review.review_no }" >
<%-- 															<input type="hidden"  name="review_star" value="${review.review_star }" > --%>
															<div class="form-group">
																<label for="" class="">평점</label>
																 <div class="rating rating-font rating-font-star h1" data-score="${review.review_star }"style="cursor: pointer;">
																 </div>
															</div>
										
															<div class="form-group">
															<label for="message-text" class="col-form-label">수강평</label>
															<input type="text" class="form-control" name="review_content" value="${review.review_content }">
															</div>
														</c:if>
													</c:forEach>
													</c:forEach>
												</c:forEach>
												
											
											
									</div>
									
									<div class="modal-footer">
										<button style="border:1px solid #dddddd" class="btn btn-outline" id="modifyReviewBtn" name="modifyReviewBtn" type="button" >수정</button>
										<button style="border:1px solid #dddddd" class="btn btn-outline" id="removeReviewBtn" name="removeReviewBtn" type="button" >삭제</button>
										<button style="border:1px solid #dddddd" class="btn btn-outline" data-dismiss="modal">닫기</button>
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
	alert($('input[name="score"]').eq(1).val());
$.ajax({
		type:"POST",
		url :"<%= request.getContextPath() %>/class/regist/review.do",
		data : {
				class_no : $('#class_no').val(),
				review_star : $('input[name="score"]').eq(1).val(),
				review_content : $('input[name="review_content"]').eq(0).val()
				
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
				review_star : $('input[name="score"]').eq(2).val(),
				review_content : $('input[name="review_content"]').eq(1).val()
				
		},
	
	success:function(result){
		alert("수정되었습니다.");		
	},
	error:function(error){
		alert('수정 실패했습니다.');		
	},
	complete:function(){
			$('#exampleModal6').modal('hide');
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
			location.reload(true);
	}
});
});

$('#disabled').on('click',function(e){
	alert("교육과정 수료를 해야 작성가능합니다.");
	return;
});



</script>
</body>