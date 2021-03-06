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
                    <h3 class="title">내 교육과정 목록</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                     <div class="tab-pane fade show active" id="course">
	                     
	                         <table class="table footable" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
	                               <thead>
	                                   <tr>
	                                       <th data-name="classStudentList_no">번호</th>
	                                       <th data-name="class_number">교육과정</th>
	                                       <th data-breakpoints="xs" data-name="class_start_date">훈련시작날짜</th>
	                                       <th data-breakpoints="xs" data-name="class_end_date">훈련종료날짜</th>
	                                       <th data-breakpoints="xs" data-name="class_status">상태</th>
	                                       <th data-breakpoints="xs" data-name="class_status">수강평등록</th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${cslList }" var="csl">
		                                   <tr>
		                                       <td>${csl.classStudentList_no }</td>
												<c:forEach items="${classList }" var="classVO">
			                                   	   <c:if test="${classVO.class_no eq csl.class_no}">
				                                       <td>${classVO.curriculum_name} &nbsp;${classVO.class_number }차</td>
				                                       <input type="hidden" value="${classVO.class_no }" id="class_no" name="class_no">
		                                       		   <td><fmt:formatDate value="${classVO.class_start_date }"	pattern="yyyy-MM-dd" /></td>
				                                       <td><fmt:formatDate value="${classVO.class_end_date }"	pattern="yyyy-MM-dd" /></td>
				                                   </c:if>
			                                    </c:forEach>   
		                                       <td>${csl.classStudentList_status }</td>
		                                       
		                                       <c:if test="${csl.classStudentList_status eq '0'}">
		                                       <td><button class="button button-primary" data-toggle="modal"data-target="#exampleModal5" data-whatever="@mdo">수강평등록</button></td>
		                                   	   </c:if>
		                                   	   <c:if test="${csl.classStudentList_status ne '0'}">
		                                       <td><button class="button button-primary" data-toggle="modal"data-target="#exampleModal5" data-whatever="@mdo" disabled="disabled">수강평등록</button></td>
		                                   	   </c:if>
		                                   </tr>
	                               		</c:forEach>
	                                 
	                                 
	                               </tbody>
	                           </table>
	                     </div>
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

</script>
</body>


    

