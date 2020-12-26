<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />



   <div class="content-body">
      
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">시험목록</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
      
      <div class="row">
         <div class="col-lg-3 mb-20">
                <div class="box-body">
                    <div class="tab-content">                        
                         <table class="table" id="subjectListTable"
                         style="border:2px solid #88868685;">
                               <thead>
                                   <tr>
                                      <th style="border-bottom:2px solid #88868685;">교육과정명</th>
                                   </tr>
                               </thead>
                               <tbody>
                         <c:forEach items="${curriculumList }" var="curriVO">
                                   <tr>
                                       <td><a href="#" onClick=classList2("${curriVO.curriculum_no }");return false;>${curriVO.curriculum_name } </a></td>
                                   </tr>
                                  </c:forEach>                            
                                 
                               </tbody>
                           </table>
                    </div>
                </div>
      </div>
      
         <div class="col-lg-0.5 mb-20" style="line-height: 60px;">
                <div class="box-body">
                    <div class="tab-content">                        
						<i class=" ti-angle-right" style="font-weight:bold; font-size:25px;color:#122D4B; "></i>
                    </div>
                </div>
            </div>

      
      <div class="col-lg-2 mb-20">
             <table class="table" id="classListTable"
              style="border:2px solid #88868685;">
                       <thead>
                          <tr>
                               <th style="border-bottom:2px solid #88868685;">회차</th>                                                        
                           </tr>
                       </thead>
                       <tbody>
                           
                           
                       </tbody>
                 </table>
         </div>
       <div class="col-lg-0.5 mb-20" style="line-height: 60px;color:#17a2b8">
                <div class="box-body">
                    <div class="tab-content">                        
						<i class=" ti-angle-right" style="font-weight:bold; font-size:25px;color:#122D4B; "></i>
                    </div>
                </div>
            </div>
          

         <div class="col-3 mb-20">
             <table class="table" id="lectureListTable"
             style="border:2px solid #88868685;">
                       <thead>
                           <tr>
                               <th style="border-bottom:2px solid #88868685;">강의명</th>
                           </tr>
                       </thead>
                       <tbody>

                           
                           
                       </tbody>
                 </table>
         </div>
         
         <div class="col-lg-10 mb-20" style="margin-top:50px;">
             <table class="table" id="testListTable">
                       <thead>
                          <tr>
                               <th>시험지명</th>
                               <th>시험시작시간</th>
                               <th>시험종료시간</th>
                               <th>만점</th>
                               <th>반영비율</th>
                               <th>상태</th>                                                          
                           </tr>
                       </thead>
                       <tbody>

                           
                           
                       </tbody>
                 </table>
         </div>   
                  
      </div>         
   </div>
   
   </div><!-- content-body end -->




<!-- Modal 시험추가-->
<div class="modal fade" id="modal-testAdd">
   <div class="modal-dialog modal-dialog-centered"  style="margin-left: 600px; margin-top: 0px;">
      <div class="modal-content">

         <div class="modal-header">
            <h5 class="modal-title">시험추가</h5>
            <button type="button" class="close" data-dismiss="modal">
               <i class="zmdi zmdi-close"></i>
            </button>
         </div>

         <div class="form">
            <form role="form" action="insertTest.do" name="registForm" id="testForm" method="post" >
               <div class="row">
                  <div class="col-11 mb-40">
                  <br>
                     <span class="spam">시험이름:</span><input class="form-control" type="text" maxlength="20" id="" name="test_name"  value=""><br>
                     <span class="spam">시험시작시간:</span><input class="form-control" type="datetime-local" maxlength="20" id="" name="test_start_date"  value=""><br>
                     <span class="spam">시험종료시간:</span><input class="form-control" type="datetime-local" maxlength="20" id="" name="test_end_date"  value=""><br>
                     <span class="spam">최대점수:</span><input class="form-control" type="number" maxlength="3"  oninput="maxLengthCheck(this)"id="" name="test_score"  value="test_score"><br>
                     <span class="spam">반영비율:</span><input class="form-control" type="number" maxlength="2"  oninput="maxLengthCheck(this)" id="" name="test_ratio"  value="test_ratio"><br><br>
                     <input type="hidden" name="lecture_no" >
                     <button class="button button-outline button-info" type="button" id="submitBtn" style="margin-left:120px;">추가하기</button> &#160;&#160;&#160;<button class="button button-outline button-danger" data-dismiss="modal">취소</button>
                  </div>   
                  <div id="result_view">
                  </div>
               </div>
            </form>
         </div>

      </div>
   </div>
</div>


<!-- Modal 시험 수정-->
<div class="modal fade" id="modal-testmodi">
   <div class="modal-dialog modal-dialog-centered" style="margin-left: 600px; margin-top: 0px;">
      <div class="modal-content">

         <div class="modal-header">
            <h5 class="modal-title">시험수정</h5>
            <button type="button" class="close" data-dismiss="modal">
               <i class="zmdi zmdi-close"></i>
            </button>
         </div>

         <div class="form">
            <form role="form" action="modifyTest.do" name="modifyForm" id="testmodifyForm" method="post">
               <div class="row">
                  <div class="col-11 mb-40">
                  <br>
                     <span class="spam">시험이름:</span><input class="form-control" type="text" maxlength="20" id="name" name="test_name"  value=""><br>
                     <span class="spam">시험시작시간:</span><input class="form-control" type="datetime-local" maxlength="20" id="start" name="test_start_date"  value="" ><br>
                     <span class="spam">시험종료시간:</span><input class="form-control" type="datetime-local" maxlength="20" id="end" name="test_end_date"  value="" ><br>
                     <span class="spam">최대점수:</span><input class="form-control" type="number" maxlength="3"  oninput="maxLengthCheck(this)"id="max" name="test_score"  value=""><br>
                     <span class="spam">반영비율:</span><input class="form-control" type="number" maxlength="2"  oninput="maxLengthCheck(this)" id="ratio" name="test_ratio"  value=""><br>
                     <span class="spam">삭제여부:</span>
                     <select class="form-control" name="test_status" id="test_status">
                        <option value="0">정상</option>
                        <option value="1">삭제</option>
                     </select>
                     <br><br>
                     <input type="hidden" name="lecture_no" >
                     <input type="hidden" name="test_no">
                     <button class="button button-outline button-info" type="button" id="modifyBtn111" style="margin-left:120px;">수정하기</button> &#160;&#160;&#160;<button class="button button-outline button-danger" data-dismiss="modal">취소</button>
                  </div>   
                  <div id="result_view">
                  </div>
               </div>
            </form>
         </div>

      </div>
   </div>
</div>


<!-- 삭제 모달 -->
<div class="modal fade" id="modal-testdele">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">삭제확인
                </h5>
                <button class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <p>정말 삭제하시겠습니까?</p>                
            </div>
            <form action="">
               <input type="hidden" name="test_name">
               <input type="hidden" name="lecture_no">
               <input type="hidden" name="test_no">
            </form>
            <div class="modal-footer">
                <button class="button button-primary" id="deleteBtn">삭 제</button>
                <button class="button button-danger" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>




<script>   
   //number 타입 길이제한
   function maxLengthCheck(object){
       if (object.value.length > object.maxLength){
         object.value = object.value.slice(0, object.maxLength);
       }    
   }
   
   //테스트 추가
   $('#submitBtn').on('click',function(){
//       var form = $('#testForm').serialize();
//       alert(form);
//       var formData = new FormData(form);
      var start_date = $('input[name=test_start_date]').val();
      var end_date = $('input[name=test_start_date]').val();
      var sdate = moment(start_date).format("YYYY-MM-DD hh:mm:ss")      
      var edate = moment(end_date).format("YYYY-MM-DD hh:mm:ss")      
      if(end_date<start_date){
         alert("시험시작시간보다 시험종료시간이 이전일 수 없습니다.");
         return false;
      }
   
      $.ajax({
         url:'insertTest.do',
         type:'POST',
         data: {
            "test_no":$('input[name=test_no]').val(),
            "lecture_no":$('input[name=lecture_no]').val(),
            "test_name":$('input[name=test_name]').val(),
            localDateTime:start_date,
            localDateTime2:end_date,
            test_score:$('input[name=test_score]').val(),
            test_ratio:$('input[name=test_ratio]').val()
         },
         success:function(data){
            
             getTestPage(data);
         },
         error:function(error){
            alert(error.status);
         }
      });
   });
   
   //시험 수정값 세팅
   $(document).on('click','#modifyTestBtn',function(){
      var testName = $(this).attr("data-test_name");
      var testStartDate = $(this).attr("data-test_start_date");      
      var testEndDate = $(this).attr("data-test_end_date");      
      var testScore = $(this).attr("data-test_score");
      var testRatio = $(this).attr("data-test_ratio");
      var lectureNo = $(this).attr("data-lecture_no");
      var testNo = $(this).attr("data-test_no");
      var testStatus = $(this).attr("data-test_status");
//       alert(testStartDate);

//       console.log(testStartDate);
//       console.log(new Date(Number(testStartDate)).toString("YYYY-MM-DDTHH:mm"));
      var sdate = new Date(Number(testStartDate));
      var edate = new Date(Number(testEndDate));
      
//       console.log(moment(date2).format("YYYY-MM-DDTHH:mm"));
      
      
//       var dateSD = new Date(Number(testStartDate)).toISOString().substring(0,16);      
      var dateSD = moment(sdate).format("YYYY-MM-DDTHH:mm");
      var dateED = moment(edate).format("YYYY-MM-DDTHH:mm");
//       console.log(dateSD);

      $('input[name=test_name]').val(testName);
      $('input[name=test_start_date]').val(dateSD);
      $('input[name=test_end_date]').val(dateED);
      $('input[name=test_score]').val(testScore);
      $('input[name=test_ratio]').val(testRatio);
      $('input[name=lecture_no]').val(lectureNo);      
      $('input[name=test_no]').val(testNo);
      $("#test_status option[value="+testStatus+"]").attr("selected", true);

      
   });
   
   //시험 수정 버튼 
   $('#modifyBtn111').on('click',function(){
      
      var modifyForm = $('form[name="modifyForm"]');
      
      var sdd = $('input[name="test_start_date"]').eq(1).val();
      var edd = $('input[name="test_end_date"]').eq(1).val()
      if(edd<sdd){
         alert("시험시작시간보다 시험종료시간이 이전일 수 없습니다.");
         return false;
      }
      
      var start_date = $('input[name="test_start_date"]').eq(1).val().replace("T"," ");
      var end_date = $('input[name="test_end_date"]').eq(1).val().replace("T"," ");
      
      
      $('input[name="test_start_date"]').eq(1).attr("type","text").val(start_date);
      $('input[name="test_end_date"]').eq(1).attr("type","text").val(end_date);
   
      $.ajax({
         url:'modifyTest.do',
         type:'POST',
         data: modifyForm.serialize(),
         success:function(result){            
            getTestPage(result);
         },
         error:function(error){
            alert(error.status);
         },
          complete : function() {
            $('input[name="test_start_date"]').eq(1).attr("type","datetime-local");
            $('input[name="test_end_date"]').eq(1).attr("type","datetime-local");
            

            $('input[name="test_start_date"]').eq(1).val(sdd);
            $('input[name="test_end_date"]').eq(1).val(edd);
          }

      });
   
   });
   
   //시험 삭제값 심어놓기
   $(document).on('click','#deleteTestBtn',function(){
      var testName = $(this).attr("data-test_name");
      var testNo = $(this).attr("data-test_no");
      var lectureNo = $(this).attr("data-lecture_no");

      $('input[name=test_name]').val(testName);
      $('input[name=test_no]').val(testNo);   
      $('input[name=lecture_no]').val(lectureNo);
         
   });
   
   //시험 삭제
   $('#deleteBtn').on('click',function(){
      $.ajax({
         url:'deleteTest.do',
         type:'POST',
         data: {
            "test_no":$('input[name=test_no]').eq(1).val(),   
            "lecture_no":$('input[name=lecture_no]').eq(2).val()
            
         },
         success:function(result){            
            getTestPage(result);
         },
         error:function(error){
            alert(error.status);
         }
      });
   
   });
   
    
   function classList2(ele){
      var curriculum_no = ele;
      
      $.ajax({
         url:'classList2.do',
         data:{"curriculum_no":curriculum_no},
         type:'post',
         success:function(data){
            getClassPage(data);
         },
         error:function(error){
            alert(error.stauts);
         }
      });
      
   }
   
   // 강의리스트   
   function lectureList(e){
      var class_no = e;
      
      $.ajax({
         url:'lectureList.do',
         data:{"class_no":class_no},
         type:'post',
         success:function(data){                 
            getLecturePage(data);                       

         },
         error:function(error){
            alert(error.status);            
         }
         
      });
   }
   
   //테스트 리스트    
   function testList(ele){
      var lecture_no = ele;
      
      $.ajax({
         url:'testList.do',
         data:{"lecture_no":lecture_no},
         type:'post',
         success:function(data){            
              getTestPage(data);                    

         },
         error:function(error){
            alert(error.status);            
         }
      });
   }
   
   //테스트링크
   function selectTest(ele){
      var test_no = ele;
      
      location.href="list.do?test_no="+test_no;
   }
   
   
   //시험추가
   var lecture_no;
   $(document).on('click','.addTestBtn',function(){
      var btn = $(this);
      lecture_no = btn.parent().parent().children().eq(0).children('input').val();
      $('input[name=lecture_no]').val(lecture_no);
   });
   
   
   
</script>
<!-- 핸들바 - 강의명, 시험지명 -->
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>


<script type="text/x-handlebars-template"  id="lecture-list-template" >
<tbody id="lecutreList"
{{#each .}}
   <tr>
      <td><input type="hidden" value="{{lecture_no}}">
      &#160;&#160;&#160;<a href="#" onClick=testList("{{lecture_no}}");return false;>{{lecture_name}}</a></td>
      
   </tr>
{{/each}}
</tbody>
</script>

<script type="text/x-handlebars-template"  id="test-list-template" >
<tbody id="testList"
{{#each .}}
   <tr>
      <td><a href="#" onClick=selectTest("{{test_no}}");return false;>{{test_name}}</a></td>
      <td>{{dateFormat test_start_date}}</td>
      <td>{{dateFormat test_end_date}} </td>  
      <td>{{test_score}}</td>
      <td>{{test_ratio}}</td>   
      <td>{{statusFormat test_status}}</td>
     
   </tr>
{{/each}}
</tbody>
</script>

<script type="text/x-handlebars-template"  id="class-list-template" >
<tbody id="classList2"
{{#each .}}
   <tr>
      <td><a href="#" onClick=lectureList("{{class_no}}");return false;>{{class_number}}차  </a></td>
   </tr>
{{/each}}
</tbody>
</script>

 

<script>
function getLecturePage(result){ 
      var template=Handlebars.compile($('#lecture-list-template').html());
      var html = template(result); 
      $('#lecutreList').remove();
      $('#testList').remove();
//       $('#lectureListTable').empty();
      $('#lectureListTable').append(html);
   }  
   
function getTestPage(result){ 
      Handlebars.registerHelper('dateFormat', function(context, block) {
        if (window.moment) {
//           var f = block.hash.format || "YYYY년 MM월 DD일 HH:MM";
               
//           return moment(Date(context)).format(f);
          return moment(context).format("YYYY년 MM월 DD일 HH:mm");
        }else{
          return context;   //  moment plugin not available. return data as is.
        };
      });
      
      Handlebars.registerHelper('statusFormat', function(context) {
        if (context==0) {
          return "정상"
        }else{
          return "삭제"
        };
      });
   
      var template=Handlebars.compile($('#test-list-template').html());
      var html = template(result); 
      $('#testList').remove();
      $('#testListTable').append(html);
}

function getClassPage(result){ 
   var template=Handlebars.compile($('#class-list-template').html());
   var html = template(result); 
   $('#classList2').remove();
   $('#lecutreList').remove();
   $('#classListTable').append(html);
} 
   


   

</script>
<style>
/*    #lectureListTable tr:nth-child(1){font-weight: bold;} */
/*    #lectureListTable tr td:nth-child(1) { */
/*       width:200px; */
/*    } */
/*    #lectureListTable tr td:nth-child(2) { */
/*       width:60px; */
/*    } */
   .compose-mail-modal modal fade{
      width:400px;
   }
   .addTestBtn{background-color: rgba(0,0,0,0);border:none;}
   
   .form-control{width:300px; display: inline-block; margin-bottom:5px;}
   .spam{width:100px;display: inline-block; margin-left:10px;}
   .modifyBtn{background-color: rgba(0,0,0,0);border:none;}
   .deleteBtn{background-color: rgba(0,0,0,0);border:none;}


</style>




    
