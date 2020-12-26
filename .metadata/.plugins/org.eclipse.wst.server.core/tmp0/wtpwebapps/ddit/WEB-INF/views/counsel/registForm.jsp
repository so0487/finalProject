<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
   <div class="content-body">
      <div class="col-12 mb-30">
         <div class="box-head">
            <h3 class="title">상담일정등록</h3>
            <div class="col-lg-12 mb-20">
               <h6 class="row mb-15">새로운 상담일정</h6>
               <div class="add-edit-product-wrap col-12 ">
                  <form action="regist.do" method="post" class="col-lg-12">
                     <div class="mb-30"><br/>
                     </div>
                     <div class="row  mb-15">
                        <div class="col-lg-3 mb-15">
                           시작<input type="datetime-local" class="form-control"
                              name="counsel_start">
                        </div>
                        <div class="col-lg-3 mb-15">
                           종료<input type="datetime-local" class="form-control"
                              name="counsel_end">
                        </div>
                        <div class="col-lg-3 col-12 mb-30">
                           상담제목<input type="text" class="form-control"
                              placeholder="상담제목을 입력하세요." name="counsel_title" >
                        </div>
                     </div>
                     <div>
                        <div class="row">
                           <div class="col-lg-2 mb-20">
                              <input type="submit" class="button button-primary" value="등록" />
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>

         </div>
      </div>
   </div>
   
   
</body>


<!-- 체크한 면접관 -->
<script>
	function addProList(){
		var checkArr = new Array();
	
	    $("input[name=proList]:checked").each(function() {
	    	alert( $(this).val());
	    	checkArr.push( $(this).val());
	    });
	    
	    $.ajax({
	        url: '<%=request.getContextPath()%>/interview/regist/proList.do',
	        type: 'post',
	        dataType: 'text',
	        data: {
	        	valueArrTest: checkArr
	        }
	    });
	}

</script>

<script>
   function getSelectValue(frm) {
      var value = $("#interview_name1 option:selected").val();
      var value1 = $('#interview_name1').val();
      
      document.getElementById("interview_name").value = value;
      $('input[name=class_no]').attr('value',value1);
//       alert($('input[name=class_no]').val());
   }

   function getSelectValue1(frm) {
      var value = $("#interview_time1 option:selected").val();

      document.getElementById("interview_time").value = value;

      alert(value);
   }
</script>