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
                    <h3 class="title">회차목록</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<div style="z-index:1; position: absolute; top: 85px; right: 30px;">
			<button id="regBtn" style="border:1px solid #dddddd" class="btn btn-outline" onclick="location.href='list/mylist?'">
				<span>등록</span>
			</button>
		</div>
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                     <div class="tab-pane fade show active" id="course">
	                     
	                         <table class="table footable" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
	                               <thead>
	                                   <tr>
	                                       <th data-name="class_no">번호</th>
	                                       <th data-name="class_number">회차</th>
	                                       <th data-breakpoints="xs" data-name="class_recruitment_start">모집시작</th>
	                                       <th data-breakpoints="xs" data-name="class_recruitment_end">모집종료</th>
	                                       <th data-breakpoints="xs" data-name="class_max">모집인원</th>
	                                       <th data-breakpoints="xs" data-name="class_status">상태</th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${classList }" var="classVO">
		                                   <tr>
		                                       <td>${classVO.class_no }</td>
		                                       <td><a href="javascript:location.href='detail.page?class_no=${classVO.class_no}'">${classVO.curriculum_name} &nbsp;${classVO.class_number }차  </a></td>
		                                       <td><fmt:formatDate value="${classVO.class_recruitment_start }"	pattern="yyyy-MM-dd" /></td>
		                                       <td><fmt:formatDate value="${classVO.class_recruitment_end }"	pattern="yyyy-MM-dd" /></td>
		                                       <td>${classVO.class_max }</td>
		                                       
		                                       <c:if test="${classVO.class_status eq '모집 중'}">
		                                       <td><button class="badge badge-info" onclick="location.href='<%=request.getContextPath()%>/interview/list?class_no=${classVO.class_no}'" >신청하기</button></td>
		                                   	   </c:if>
		                                   	   <c:if test="${classVO.class_status eq '모집 마감'}">
		                                       <td><button class="badge badge-primary" onclick="apply('${interview.interview_no}');" disabled="disabled">마감</button></td>
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
	
<script>


$('#regBtn').on('click',function(e){
	
	location.href="registForm.do";
});

</script>
</body>


    
