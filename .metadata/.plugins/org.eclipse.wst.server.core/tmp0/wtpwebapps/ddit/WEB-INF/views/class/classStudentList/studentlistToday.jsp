<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div class="content-body">
   
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


    
  
   
   <!-- Page Headings Start -->
   <div class="row justify-content-between align-items-center mb-10">

      <!-- Page Heading Start -->
      <div class="col-12 col-lg-auto mb-20">
         <div class="page-heading">
            <h3 class="title">수강생목록</h3>
         </div>
      </div>
      <!-- Page Heading End -->
      <div style="z-index:1; position: absolute; top: 80px; left: 300px; width: 230px">
            <ul class="nav nav-tabs mb-15">
            	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/lecture/studentlist?lecture_no=${lecture_no }">weekly</a></li>
            	<li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/lecture/studentlist/today?lecture_no=${lecture_no }">today</a></li>
            </ul>
      </div>
      <div style="z-index:1; position: absolute; top: 80px; right: 150px; width: 230px">
            <span><input type="date" class="form-control input-today"></span>
         
      </div>
      
   </div>
   <!-- Page Headings End -->


   
   <div class="row">
      <div class="col-lg-12 mb-20">
         <div class="box-body">
            <div class="tab-content">
            <div id="keyword" class="card-tools" style="width:600px;height:62px;"></div>
               <div class="tab-pane fade show active" id="tableDiv">
               
                  <table id="attendanceTable" class="table" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
                     <thead>
                        <tr>
                           <th data-name="">번호</th>
                           <th data-name="member_id">아이디</th>
                           <th data-name="member_name">이름</th>
                           <c:set var="now" value="<%=new java.util.Date()%>" />
                           
                           <th data-breakpoints="xs" >출석시간</th>
                           <th data-breakpoints="xs" >출석률</th>
                           
                        </tr>
                     </thead>
                     <tbody id="attendanceBody">
                     <c:forEach items="${cslList}" var="cslList" varStatus="status">
                        <tr>
                           <td>${status.count}</td>
                           <td id="${status.count }0">${cslList.student_id}</td>
                           <td>${cslList.member.member_name}</td>
                           <c:forEach items="${cslList.attendanceList}" var="attendance">
                                <td>${attendance.attendance_date2 }</td> 
                           </c:forEach>
                           <c:if test="${empty cslList.attendanceList }">
                           	<td>출석기록 없음</td>
                           </c:if>
                           <td>${cslList.ratio }</td> 
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
   
   <input type="hidden" value ="${start_date }" name="start_date">
   <input type="hidden" value ="${end_date }" name="end_date">
   <input type="hidden" value ="${classes.class_start_date }" name="start">
   <input type="hidden" value ="${classes.class_end_date }" name="end">
   <input type="hidden" value ="${lecture_no }" name="lecture_no">
   <c:forEach items="${cslList}" var="cslList" varStatus="status">
   <input type="hidden" value="${cslList.student_id}" name="student_id">
   </c:forEach>
   
</div>   

<script>

</script>

<%@include file="/WEB-INF/views/class/classStudentList/StudentlistToday_js.jsp"%>
