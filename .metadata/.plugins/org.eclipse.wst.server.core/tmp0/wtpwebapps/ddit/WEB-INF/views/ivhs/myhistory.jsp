<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="content-body">


		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title">면접신청내역 조회</h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->

		<div class="row">
			<div class="col-lg-12 mb-20">
				<div class="box-body">
					<div class="tab-content">
						<div class="tab-pane fade show active" id="course">
							<table class="table footable" data-paging="true"
								data-filtering="true" data-sorting="true"
								data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
								<thead>
									<tr>
										<th data-name="title">교육과정회차</th>
										<th data-name="post_no">면접번호</th>
										
										
										<th data-breakpoints="xs" data-name="writer">면접참여여부</th>
										<th data-breakpoints="xs" data-name="writer">면접결과</th>
										<th data-breakpoints="xs" data-name="writer">신청취소</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="ivhsList" items="${ivhsList }" >
									<tr>
										<td>${ivhsList.interview_history_stu_no }</td>
										<td><a href="<%=request.getContextPath() %>/interview/detail.do?interview_no=${ivhsList.interview_no }">${ivhsList.interview_no }</a></td>
										<td>
										<c:if test="${ivhsList.interview_history_stu_dicision eq '0'}">
   											<c:out value="미참여" />
										</c:if>
										<c:if test="${ivhsList.interview_history_stu_dicision eq '1'}">
   											<c:out value="참여" />
										</c:if>
										</td>
										<td>
										<c:if test="${ivhsList.interview_history_stu_result eq '1'}">
											<c:if test="${ivhsList.interview_history_stu_dicision eq '1'}">
											<c:out value="합격"/>
											</c:if>
										</c:if>
										<c:if test="${ivhsList.interview_history_stu_result eq '0' or ivhsList.interview_history_stu_dicision eq '0'}">
											<c:out value="불합격"/>
										</c:if>
										</td>
										<td>
										<span class="badge badge-primary"><a href="remove.do?interview_history_stu_no=${ivhsList.interview_history_stu_no}">취소</a></span>
										</td>
									</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>

		

		</div>

	</div>

</body>