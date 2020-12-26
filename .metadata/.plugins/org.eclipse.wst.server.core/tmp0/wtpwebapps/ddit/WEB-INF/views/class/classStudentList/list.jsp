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
                        <h3>합격자조회<span>/${classes.curriculum_name } ${classes.class_number } 회차</span></h3>
                    </div>
                </div><!-- Page Heading End -->

            </div>
		
		<div class="row">
		<div class="add-edit-product-wrap col-12" style="background-color:white">
		
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                 	<div><h4><strong>▶합격자명단</strong></h4></div>
	                     <div class="tab-pane fade show active" id="course">
	                         <table class="table" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
	                               <thead>
	                                   <tr>
	                                       <th data-name="curriculum_no">번호</th>
	                                       <th data-name="curriculum_name">아이디</th>
	                                       <th data-name="curriculum_name">이름</th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${cslList }" var="cslList" varStatus="status">
											<c:if test="${loginUser.member_id eq cslList.student_id}" >
			                            	<tr style="background-color:#e3f5ff; color:black; font-weight: bold">
			                                	<td>${status.count }</td>
			                                	<td>${cslList.student_id }</td>
			                                    <td>${cslList.member.member_name}</td>
			                                </tr>
			                                </c:if>
			                                <c:if test="${loginUser.member_id ne cslList.student_id}" >
			                            	<tr>
			                                	<td>${status.count }</td>
			                                	<td>${cslList.student_id }</td>
			                                    <td>${cslList.member.member_name}</td>
			                                </tr>
			                                </c:if>
	                               		</c:forEach>
	                                 
	                                 
	                               </tbody>
	                           </table>
	                     </div>
	                 </div>
	             </div>
			</div>
		</div>
	</div>
	</div><!-- content-body end -->
	
	
	

</body>


    

