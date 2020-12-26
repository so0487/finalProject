<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<body>

	<!-- Content Body Start -->
	<div class="content-body">
		<div class="row">
			<div class="col-lg-4 col-12 mb-30" >
                    <div class="box" style="max-height:400px; overflow-y: auto; height:400px" >
                        <div class="box-head">
                            <h4 class="title"><a href="<%=request.getContextPath()%>/schedule/calendar/calendar.do">오늘 일정</a></h4>
                        </div>
                        <div class="box-body">
                            
                             <c:forEach var="schedule" items="${scheduleList }">
                            
                            <div class="content">
                                        <!-- Category -->
                                        <div class="categories">
                                            <a href="#" class="new" style="color:white; padding-left:5px; padding-right:5px; border-radius: 25px; background-color:${schedule.schedule_color}; "> ${schedule.schedule_category_name }</a>
                                        	&nbsp<i class="zmdi zmdi-time"></i>${schedule.schedule_start_date}
                                        </div>
                                        <!-- Title -->
                                        <h4 class="title"><a href="#">${schedule.schedule_title }</a></h4>
                                        <!-- Meta -->
                                        <p>${schedule.schedule_content}</p>
                           </div>
                            <hr>
                           </c:forEach>
                        </div>
                       
                    </div>
                </div>
                
<!--             <div class="col-lg-8 col-12 mb-30" > -->
<!--             </div>     -->
			<div class="col-lg-4 col-12 mb-30" >
                    <div class="box" style="height:400px; " >
                        <div class="box-head">
                            <h4 class="title"><a href="<%=request.getContextPath()%>/board/list.do?board=notice&board_no=BOARD001">공지사항</a></h4>
                        </div>
                        <div class="box-body">
                            <table class="table" style="table-layout:fixed; table-layout: auto; border:1px solid #dddddd; width: 100%; table-layout: fixed; ">

								<colgroup>
							    <col width="70%" />
							    <col width="30%" />
							    </colgroup>
                                <thead class="thead-light">
                                    <tr>
                                        <th style="text-align:center;">제목</th>
                                        <th style="text-align:center;">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="noticeList" items="${noticeList }">
                                		<tr >
                                			<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; background-color: white"><a href="<%=request.getContextPath()%>/board/notice/detail.page?post_no=${noticeList.post_no}">${noticeList.post_title }</a></td>
                                			<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; text-align:center; background-color: white">${noticeList.post_reg_date }</td>
                                		</tr>
                                	</c:forEach>
<%--                                 	<c:forEach var="i" begin="1" end="${4-status }" step="1"> --%>
<!--                                 		<tr > -->
<!--                                 			<td style="background-color: white" ><a></a></td> -->
<!--                                 			<td style="text-align:center; background-color: white"></td> -->
<!--                                 		</tr> -->
<%--                                 	</c:forEach>	 --%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-4 mb-30">
                    <div class="box" style="max-height:400px; overflow-y: auto; height:400px">
                        <div class="box-head">
                            <h4 class="title">합격자조회</h4>
                        </div>
                        <div class="box-body">
                        
                       		<div class="accordion" id="accordionExample">
								<c:forEach var="classList" items="${classList}" varStatus="status">
                                <!--Card Start-->
                                <div class="card">

                                    <!--Card Header Start-->
                                    <div class="card-header">
                                        <h2><button onclick="location.href='<%=request.getContextPath()%>/class/cls/list?class_no=${classList.class_no}'"data-toggle="collapse" data-target="#collapseOne">${classList.curriculum_name} &nbsp${classList.class_number }회차</button></h2>
                                    </div>
                                    <!--Card Header End-->


                                </div>
								</c:forEach>	
<%-- 								<c:forEach var="i" begin="1" end="${4-status }" step="1"> --%>
<!--                                 Card Start -->
<!--                                 <div class="card"> -->
<!--                                     Card Header Start -->
<!--                                     <div class="card-header"> -->
<!--                                         <h2><button data-toggle="collapse" data-target="#collapseOne"> .</button></h2> -->
<!--                                     </div> -->
<!--                                     Card Header End -->
<!--                                 </div> -->
<%-- 								</c:forEach>	 --%>
                                <!--Card End-->
								
									
                               
                               
                            </div>
                        </div>
                    </div>
                </div>
                
				<div class="col-lg-8 col-8 mb-30">
					
			<c:forEach items="${curriculumEmpRatioList}" var="curriculumEmpRatioList">
				<input type="hidden" name="curri_class_no" class="curri_class_no" value="${curriculumEmpRatioList.CLASS_NO}"></input>
				<input type="hidden" name="curri_cnt" class="curri_cnt" value="${curriculumEmpRatioList.CNT}"></input>
				<input type="hidden" name="curri_class_real" class="curri_class_real" value="${curriculumEmpRatioList.CLASS_REAL}"></input>
				<input type="hidden" name="curri_ratio" class="curri_ratio" value="${curriculumEmpRatioList.RATIO}"></input>
				<input type="hidden" name="curri_curriculum_no" class="curri_curriculum_no" value="${curriculumEmpRatioList.CURRICULUM_NO}"></input>
				<input type="hidden" name="curri_curriculum_name" class="curri_curriculum_name" value="${curriculumEmpRatioList.CURRICULUM_NAME}"></input>
			</c:forEach>

		</div>


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
	                 <h4 class="title" ><a href="<%=request.getContextPath()%>/curriculum/emprate/list.do">커리큘럼별 취업률</a></h4>
	             </div>
	             <div class="box-body">
	                 <div id="example-morris-bar" class="example-morris"></div>
	             </div>
	         </div>
	     </div><!-- Bar End -->
	
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
		
	
		
	
	
	</body>
	
		<%@ include file="/WEB-INF/views/emprate/empRate_js.jsp" %>
	
	



