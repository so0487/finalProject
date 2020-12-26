<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div class="content-body">
	<div class="row">

		
		<c:forEach items="${curriculumEmpRatioList}" var="curriculumEmpRatioList">
			<input type="hidden" name="curri_class_no" class="curri_class_no" value="${curriculumEmpRatioList.CLASS_NO}"></input>
			<input type="hidden" name="curri_cnt" class="curri_cnt" value="${curriculumEmpRatioList.CNT}"></input>
			<input type="hidden" name="curri_class_real" class="curri_class_real" value="${curriculumEmpRatioList.CLASS_REAL}"></input>
			<input type="hidden" name="curri_ratio" class="curri_ratio" value="${curriculumEmpRatioList.RATIO}"></input>
			<input type="hidden" name="curri_curriculum_no" class="curri_curriculum_no" value="${curriculumEmpRatioList.CURRICULUM_NO}"></input>
			<input type="hidden" name="curri_curriculum_name" class="curri_curriculum_name" value="${curriculumEmpRatioList.CURRICULUM_NAME}"></input>
		</c:forEach>

		

		<c:forEach items="${studentEmpRatioList}" var="studentEmpRatioList">
			<input type="hidden" name="class_number" class="class_number" value="${studentEmpRatioList.CLASS_NUMBER}">
			<input type="hidden" name="class_empRatio" class="class_empRatio" value="${studentEmpRatioList.STUDENTRATIO}">
		</c:forEach>
	


		<!-- Line -->
		<div class="col-lg-6 col-12 mb-30" style="display: none;">
	         <div class="box">
	             <div class="box-head">
	                 <h4 class="title">Line</h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-line" class="example-morris"></div>
	             </div>
	         </div>
	     </div><!-- Line End -->
	
	     <!-- Bar Start -->
	     
	     <div class="col-lg-12 col-12 mb-30">
	         <div class="box">
	             <div class="box-head">
	                 <h4 class="title">커리큘럼별 취업률</h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-bar" class="example-morris">
	                 	
	                 </div>
	             </div>
	         </div>
	     </div><!-- Bar End -->
	     
	     <div class="col-lg-12 col-12 mb-30">
	         <div class="box">
	             <div class="box-head">
	                 <h4 class="title">회차별 취업률</h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-bar2" class="example-morris">
	                 	
	                 </div>
	             </div>
	         </div>
	     </div><!-- line End -->
					

	
	     <!-- Area Start -->
	     <div class="col-lg-6 col-12 mb-30" style="display: none;">
	         <div class="box">
	             <div class="box-head">
	                 <h4 class="title">Area</h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-area" class="example-morris"></div>
	             </div>
	         </div>
	     </div><!-- Area End -->
	
	     <!-- Donuts Start -->
	     <div class="col-lg-6 col-12 mb-30" style="display: none;">
	         <div class="box">
	             <div class="box-head">
	                 <h4 class="title">Donuts</h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-donuts" class="example-morris"></div>
	             </div>
	         </div>
	     </div><!-- Donuts End -->
      

	</div>
</div>
<!-- Plugins & Activation JS For Only This Page -->




<%@ include file="./empRate_js.jsp" %>
<%-- <%@ include file="./studentEmpRate_js.jsp" %> --%>

