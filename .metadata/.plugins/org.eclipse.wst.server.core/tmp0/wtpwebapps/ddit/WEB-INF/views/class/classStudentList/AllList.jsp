<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<body>

      <div class="content-body">
      
       <!-- Page Headings Start -->
        
      
      <div class="row" style="margin-top: -70px;">
         <div class="add-edit-product-wrap col-12" style="background-color: white; margin-top:-50px ">
         <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading" style="margin-top: 100px;">
                    <h2 class="title" style="margin-top: -80px">▶${classes.curriculum_name } ${classes.class_number }회차</h2>
                </div>
            </div><!-- Page Heading End -->
      <div class="col-xlg-3 col-md-6 col-12 mb-2" style="margin-top: 60px;">
                    <div class="top-report">

                        <!-- Head -->
                        <div class="head" style="margin-top: -20px;">
                            <h4>취업률</h4>
                        </div>

                        <!-- Content -->
                        <div class="content" style="margin-top: -10px">
                            <h3 style="display:inline;"><fmt:formatNumber value="${empRate.EMP_REATIO}" pattern="#.#"/> %</h3><span style="display:inline;">  (취업인원/총원)</span>
                        </div>
                        <!-- Footer -->
                        <div class="progress progress-round" style="margin-bottom: -10px; margin-top: -20px;">
                                <div class="progress-bar" role="progressbar" style="width: ${empRate.EMP_REATIO}%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>

                    </div>
                </div>
        </div><!-- Page Headings End -->
                <div class="box-body" style="margin-top: -75px;">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="course">
                           <p>회차진행기간 ${classes.class_start_date } ~ ${classes.class_end_date }</p>
                           <p style="margin-top: -10px;">총 인원 : ${classes.class_real }</p>
                            <table class="table table-bordered" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
                                  <thead class="thead-light">
                                      <tr>
                                          <th width="100px" data-name="curriculum_no">번호</th>
                                          <th width="150px" data-name="curriculum_name">수강생아이디</th>
                                          <th width="150px" data-name="curriculum_name">수강생이름</th>
                                          <th data-name="curriculum_name">강의</th>
                                          <th data-name="curriculum_name">점수</th>
                                          
                                          <th data-breakpoints="xs" data-name="curriculum_certificate">총점(평균)</th>
                                          <th data-breakpoints="xs" data-name="curriculum_certificate">상태</th>
                                          <th data-breakpoints="xs" data-name="curriculum_certificate">취업여부</th>
                                      </tr>
                                      
                                  </thead>
                                  <tbody>
                                        <c:set value="${scoreList }" var="scoreList"/>
                                           
                                 <c:forEach items="${cslList }" var="csl" varStatus="status">
                                 <c:set var="lecture1" value="${testList[0] }"/>
                                 <c:set var ="lecture01" value="${lecture1 }"/>
                                    
                                 <c:set var="lecture2" value="${testList[1] }"/>
                                 <c:set var ="lecture02" value="${lecture2 }"/>
                                   
                                       
                                    <tr>
                                       <td style="text-align: center; vertical-align: middle; " rowspan="2">${status.count }</td>
                                       <td style="text-align: center; vertical-align: middle;" rowspan="2">${csl.member.member_id }</td>
                                       <td style="text-align: center; vertical-align: middle;" rowspan="2">${csl.member.member_name }</td>
                                       <td>${lectureList[0].lecture_name }</td>
                                       <fmt:formatNumber value="${scoreList[status.index][0].attendance * lecture01[0].eva_to_lec_ratio/100 + scoreList[status.index][0].test * lecture01[1].eva_to_lec_ratio/100 +scoreList[status.index][0].assign * lecture01[2].eva_to_lec_ratio/100}" pattern="#,##" var="lecture1Score"/>
                                     
                                       <td>${lecture1Score} 점</td>
<%--                                        <td>${scoreList[status.index][0].attendance} * ${ lecture01[0].eva_to_lec_ratio/100} + ${scoreList[status.index][0].test} *${lecture01[1].eva_to_lec_ratio/100}</td> --%>
                                       <td style="text-align: center; vertical-align: middle;" rowspan="2"><h5><fmt:formatNumber value="${(lecture1Score + scoreList[status.index][1].attendance * lecture01[0].eva_to_lec_ratio/100 + scoreList[status.index][1].test * lecture01[1].eva_to_lec_ratio/100 + scoreList[status.index][1].assign * lecture01[2].eva_to_lec_ratio/100)/2}" pattern="#,##"/> 점</h5></td>
                                       <c:if test="${csl.classStudentList_status eq 0}">
                                          <td style="text-align: center; vertical-align: middle;" rowspan="2">수강중</td>
                                       </c:if>
                                       <c:if test="${csl.classStudentList_status eq 1}">
                                          <td style="text-align: center; vertical-align: middle;" rowspan="2">수료</td>
                                       </c:if>
                                       
                                       <c:if test="${csl.classStudent_emp_status eq 0}">
                                          <td id="td${status.index }" style="text-align: center; vertical-align: middle;" rowspan="2" onclick="empChange('${csl.class_no }','${csl.classStudentList_no}','${status.index }');">미취업</td>
                                       </c:if>
                                       <c:if test="${csl.classStudent_emp_status eq 1}">
                                          <td id="td${status.index }" style="text-align: center; vertical-align: middle;" rowspan="2" onclick="empChange('${csl.class_no }','${csl.classStudentList_no}','${status.index }');"><strong>취업</strong></td>
                                       </c:if>
                                    </tr>
                                    <tr>
                                       <td>${lectureList[1].lecture_name }</td>
                                       <fmt:formatNumber value="${scoreList[status.index][1].attendance * lecture01[0].eva_to_lec_ratio/100 + scoreList[status.index][1].test * lecture01[1].eva_to_lec_ratio/100 + scoreList[status.index][1].assign * lecture01[2].eva_to_lec_ratio/100}" pattern="#,##" var="lecture2Score"/>
                                       <td>${lecture2Score } 점</td>
<%--                                        <td>${scoreList[status.index][1].attendance * lecture01[0].eva_to_lec_ratio/100}  ${scoreList[status.index][1].test * lecture01[1].eva_to_lec_ratio/100}</td> --%>
                                    </tr>
                                    
                                 </c:forEach>
                                    
                                    
                                  </tbody>
                              </table>
                        </div>
                    </div>
                </div>
         </div>
              
              <!-- button -->
<!--               <div class="col-lg-9 mb-20"></div> -->
              
<!--               <div class="col-lg-3 mb-20"> -->
               
<!--                <button id="regBtn" class="button button-info"> -->
<!--                   <span>등록</span> -->
<!--                </button>    -->
               
<!--             </div>              -->
         
      </div>
   
   </div><!-- content-body end -->
   
   
   
<script>


$('#regBtn').on('click',function(e){
   
   location.href="registForm.do";
});


function empChange(class_no,cls_no,id){
   
   confirm("취업 상태를 변경하시겠습니까?");
   
   $.ajax({
      url: '<%=request.getContextPath()%>/class/cls/empStatus/change.do',
          type: 'post',
          dataType: 'text',
          data: {
             classstudent_no:cls_no,
             class_no:class_no
          },
          success:function(data){
           
           location.reload();
           
          }
   });
}
</script>
</body>


    
