<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<div class="content-body">
   
   <!-- Page Headings Start -->
   <div class="row justify-content-between align-items-center mb-10">

      <!-- Page Heading Start -->
      <div class="col-12 col-lg-auto mb-20">
         <div class="page-heading">
            <h3 class="title">내 출결현황</h3>
         </div>
      </div>
      <!-- Page Heading End -->
      <div style="z-index:1; position: absolute; top: 80px; left: 300px; width: 230px">
            
      </div>
      <div style="z-index:1; position: absolute; top: 80px; right: 150px; width: 230px">
         
      </div>
      
   </div>
   <!-- Page Headings End -->


   
   <div class="row">
   <div class="col-lg-12 col-12 mb-30">
                    <div class="">
                        <div class="box-head">
                            <h4 class="title"> ▶${classes.curriculum_name } ${classes.class_number }회차</h4>
                        </div>
                        <div class="box-body">
                            <table class="table">
                               
                                <tbody>
							<tr>
								<th scope="row" >교육과정명</th>
								<td colspan="5" >${classes.curriculum_name }</td>
							</tr>
							<tr>
								<th scope="row">교육기간</th>
								<td colspan="5">${classes.class_start_date } ~ ${classes.class_end_date } </td>
							</tr>
							<tr>
								<th scope="row">교육생명</th>
								<td colspan="5">${loginUser.member_name } </td>
							</tr>
							<tr>
								<th scope="row">총 교육일수</th>
								<th>실시일수</th>
								<th>출석일</th>
								<th scope="row">결석일</th>
								<th>출석률 (일수)</th>
							</tr>
							<tr>
								<td> <span class="flr">${date }일</span></td>
								<td> <span class="flr">${realDate}</span></td>
								<td> <span class="flr">${attendanceCnt}</span></td>
								<td> <span class="flr">${realDate - attendanceCnt}</span></td>
								<td> 
									<fmt:formatNumber value="${attendanceCnt/date *100}" pattern="0.00"/>%</span></td>
								
							</tr>
						</tbody>
                            </table>
                        </div>
                    </div>
                </div>
      <div class="col-lg-12 mb-20">
         <div class="box-body">
            <div class="tab-content">
            <div id="keyword" class="card-tools" style="width:600px;height:62px;"></div>
               <div class="tab-pane fade show active" id="tableDiv">
               
                  <table id="attendanceTable" class="table" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
                     <thead class="thead-light">
                        <tr>
                           <th data-name="member_id">날짜</th>
                           <c:set var="now" value="<%=new java.util.Date()%>" />
                           <th data-breakpoints="xs" >출석시간</th>
                           <th>강의</th>
                           <th>수업시간</th>
                           <th>출결상세</th>
                           
                        </tr>
                     </thead>
                     <tbody id="attendanceBody">
                     <c:forEach items="${attendanceList}" var="attendanceList" varStatus="status">
                        <tr>
                        	<td>${fn:substring(attendanceList.attendance_date2,0,10) }</td>
                            <td>${fn:substring(attendanceList.attendance_date2,11,20) }</td>
                            <td>${attendanceList.lecture.lecture_name }</td> 
                            <td>${attendanceList.lecture.lecture_start_date } ~ ${attendanceList.lecture.lecture_end_date }</td> 
                            <c:if test="${attendanceList.attendance_is eq 0}">
                            <td>출석</td>
                            </c:if>
                            <c:if test="${attendanceList.attendance_is eq 1}">
                            <td>지각</td>
                            </c:if>
                        </tr>
                     </c:forEach>
                     </tbody>
                  
                     
                  </table>                  
               </div>
            </div>
         </div>
      </div>

      <!-- button -->

   </div>
   <!-- row end -->
   

</div>  

</body>