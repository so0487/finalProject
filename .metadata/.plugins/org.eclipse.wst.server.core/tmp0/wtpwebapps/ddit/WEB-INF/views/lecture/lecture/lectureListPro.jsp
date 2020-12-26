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
                    <h3 class="title">강의관리</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<div class="row">
			<div class="col-lg-12 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">강의목록 (${loginUser.member_name })</h4>
                        </div>
                        <div class="box-body">
                            <!--Accordion Start-->
                            <div class="accordion" id="accordionExample">

                                <!--Card Start-->
	                            <c:forEach items="${lectureList }" var="lectureList" varStatus="status">
                                <div class="card">
                                    <!--Card Header Start-->
	                                <div class="card-header">
		                            	<h2><button data-toggle="collapse" style="border: 2px solid #c6c9cf;" data-target="#collapseOne${status.index }" class="" aria-expanded="true"><span class="ti-angle-double-right"></span> ${lectureList.classes.curriculum_name }
		                            	 &nbsp${lectureList.classes.class_number }회차 
		                            	 <span style="font-size: small;"> [${lectureList.classes.class_start_date } ~ ${lectureList.classes.class_end_date }]</span> 
		                            	 <hr><span style="color:#428bfa;"><strong>${lectureList.lecture_name }</strong></span> </br>${lectureList.lecture_start_date } ~ ${lectureList.lecture_end_date }</br> &nbsp</button></h2>
		                            	 
		                                    
		                                    <input type="hidden" value="${lectureList.lecture_name }" id="class_no" name="class_no">
		                            </div>
		                            <!--Card Header End-->
		                            
		                            <div id="collapseOne${status.index }" class="collapse" data-parent="#accordionExample" style="border: 2px solid #c6c9cf; border-top: none;">
		                            	<div class="card-body">
		                                	<ul class="list-group">
				                                <li class="list-group-item"><a href='<%=request.getContextPath()%>/lecture/mylecture?lecture_no=${lectureList.lecture_no }'>실시간강의</a></li>
				                                <!-- 시험 -->
				                                <li class="list-group-item"><a href='<%=request.getContextPath()%>/exam/lectureTestList?lecture_no=${lectureList.lecture_no }'>시험관리</a></li>
				                                <!-- 과제 -->
				                                <li class="list-group-item"><a href='<%=request.getContextPath()%>/assign/list?lecture_no=${lectureList.lecture_no }'>과제관리</a></li>
				                                <!-- 과제 -->

	                                			<li class="list-group-item"><a href="<%=request.getContextPath()%>/lecture/studentlist?lecture_no=${lectureList.lecture_no }">수강생출결관리</a></li>
                            					<li class="list-group-item"><a href='<%=request.getContextPath()%>/lecture/list.do?lecture_no=${lectureList.lecture_no }'>수강생평가</a></li>
                            				</ul>
		                    			</div>
		                            </div>
									
                                    <!--Collapse Start-->
                                    <!--Collapse End-->
                                </div>
                                </c:forEach>
                                <!--Card End-->
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
						<div class="modal fade" id="exampleModal5">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">평가 상세</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
											<div class="form-group">
												<label for="" class="">강의명</label>
											</div>
										
											<div class="form-group">
												<label for="message-text" class="col-form-label">평가상세비율</label>
												 <c:forEach items="${evaToLecList }" var="evaToLec">
												 <c:forEach items="${lectureList }" var="lecture">
												 <c:if test="${lecture.lecture_no eq evaToLec.lecture_no}">
												<input type="text" class="form-control" name="eva_to_lec_name" value="${evaToLec.eva_to_lec_name}">
												<input type="text" class="form-control" name="eva_to_lec_ratio" value="${evaToLec.eva_to_lec_ratio}">
												</c:if>
												</c:forEach>
												</c:forEach>
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

</script>
</body>


    

