<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



	<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">시험목록</h3>
                </div>		
            </div><!-- Page Heading End -->
            
	        <div style="z-index:1; position: absolute; top: 35px; right: 300px; width:120px;">
				<button style="border:1px solid #dddddd" class="btn btn-outline" data-toggle="modal" data-target="#modal-testAdd">시험등록</button>				
			</div>

        </div><!-- Page Headings End -->
        
		
		<div class="row">
					
			<div class="col-lg-10 mb-20">
				 <table class="table" id="testListTable">
                       <thead>
                          <tr>
                               <th>시험지명</th>
                               <th>시험시작시간</th>
                               <th>시험종료시간</th>
                               <th>만점</th>
                               <th>반영비율</th>
                               <th>상태</th>
                               <th>변경</th>
                               <th>채점</th>                                                       
                           </tr>
             	       </thead>
                       <tbody>

                           
                           
                       </tbody>
                 </table>
			</div>							
		</div>	





<!-- Modal 시험추가-->
<div class="modal fade" id="modal-testAdd">
	<div class="modal-dialog modal-dialog-centered" style="margin-left: 700px; margin-top: 0px;">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title">시험추가</h5>
				<button type="button" id="xJoyBtn" class="close" data-dismiss="modal">
					<i class="zmdi zmdi-close"></i>
				</button>
			</div>

			<div class="form">
				<form role="form" action="insertTest.do" name="registForm" id="testForm" method="post" >
					<div class="row">
						<div class="col-11 mb-40">
						<br>
							<span class="spam">시험이름:</span><input class="form-control" type="text" maxlength="20" id="" name="test_name"  value=""><br>
							<input type="hidden" id="class_start_date" name="class_start_date" value="${class_start_date }">
							<span class="spam">시험날짜:</span><input class="form-control" type="date" maxlength="20"  name="test_start_date" id="test_start_date"   max="${class_end_date }" ><br>
							<div id="lecture_time" style="margin-left: 110px;"></div>
							<span class="spam">시험시작시간:</span><input class="form-control" id="test_start_time" type="time" name="test_start_time"  min="09:00" max="12:50" required="required"><br>
							<input type="hidden" id="start_time" name="start_time" value="${lecture.lecture_start_date }">
							<input type="hidden" id="end_time" name="end_time" value="${lecture.lecture_end_date }">
							<span class="spam">시험종료시간:</span><input class="form-control" type="time" id="test_end_time" name="test_end_time"   min="09:00" max="12:50" required><br>
							<span class="spam">최대점수:</span><input class="form-control" type="number" maxlength="3"  oninput="maxLengthCheck(this)"id="" name="test_score"  value="test_score"><br>
							<span class="spam">반영비율:</span><input class="form-control" type="number" maxlength="2"  oninput="maxLengthCheck(this)" id="" name="test_ratio"  value="test_ratio"><br><br>
							<input type="hidden" name="lecture_no" >
							<button class="button button-outline" type="button" id="submitBtn" style="border:1px solid #dddddd; font-color:black; margin-left:120px;" data-dismiss="modal">추가하기</button> &#160;&#160;&#160;<button class="button button-outline" id="cancalBtn" style="border:1px solid #dddddd; font-color:black;"data-dismiss="modal">취소</button>
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
	<div class="modal-dialog modal-dialog-centered" style="margin-left: 700px; margin-top: 0px;">
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
							<span class="spam">시험이름:</span><input class="form-control" type="text" maxlength="20" id="modifyname" name="test_name"  value=""><br>
							<span class="spam">시험날짜:</span><input class="form-control" type="date" maxlength="20" id="modifystartdate" name="modifystartdate"  max="${class_end_date }" value="" ><br>
							<div id="lecture_time2" style="margin-left: 110px;"></div>
							<span class="spam">시험시작시간:</span><input class="form-control" type="time" maxlength="20" id="modifystarttime" name="modifystarttime"  value="" ><br>
							<span class="spam">시험종료시간:</span><input class="form-control" type="time" maxlength="20" id="modifyendtime" name="modifyendtime"  value="" ><br>
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
							<button class="button button-outline" style="margin-left:120px;border:1px solid #dddddd; font-color:black;"  data-dismiss="modal" type="button" id="modifyBtn111">수정하기</button> &#160;&#160;&#160;<button class="button button-outline" style="border:1px solid #dddddd; font-color:black;" data-dismiss="modal">취소</button>
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
	<div class="modal-dialog modal-dialog-centered" style="margin-left: 700px; margin-top: 0px;">
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
                <button class="button button-outline" style="border:1px solid #dddddd; font-color:black;" id="deleteBtn">삭 제</button>
                <button class="button button-outline" style="border:1px solid #dddddd; font-color:black;" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</div><!-- content-body end -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	window.onload=function(){
		testList("${lecture_no}");	
	}

</script>
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>

<script>	

var date = new Date();
var dates = $('#class_start_date').val();
var strs = moment(dates).format("YYYY-MM-DD");
var str = moment(date).format("YYYY-MM-DD");
if(str>$('#class_start_date').val()){
	document.getElementById("test_start_date").min =str;
	document.getElementById("modifystartdate").min =str;
}else{
	document.getElementById("test_start_date").min =strs;
	document.getElementById("modifystartdate").min =strs;
}





	//number 타입 길이제한
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	
	//추가 벨리데이션
	$('input[name=test_start_time]').on('change',function(){
		if($('input[name=start_time]').val()=='09:00'){
			if($('input[name=test_start_time]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 9:00 이후로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			if($('input[name=test_start_time]').val()>$('input[name=end_time]').val()){
				alert("시작시간은 12:50 이전로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			
		}
		if($('input[name=start_time]').val()=='13:30'){
			if($('input[name=test_start_time]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 13:30 이후로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			if($('input[name=test_start_time]').val()>$('input[name=end_time]').val()){
				alert("시작시간은 17:20 이전으로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
		}
		
		
		if($('input[name=test_start_time]').val()>$('input[name=test_end_time]').val() && $('input[name=test_end_time]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			$('input[name=test_end_time]').val("");
			return;
		}
	});
	$('input[name=test_end_time]').on('change',function(){
		if($('input[name=end_time]').val()=='12:50'){
			if($('input[name=test_end_time]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 12:50 이전로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			if($('input[name=test_end_time]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 09:00 이후로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			
		}
		if($('input[name=start_time]').val()=='13:30'){
			if($('input[name=test_end_time]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 17:20 이전으로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			if($('input[name=test_end_time]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 13:30 이후로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
		}
		
		
		
		if($('input[name=test_start_time]').val()>$('input[name=test_end_time]').val() && $('input[name=test_start_time]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			alert($('input[name=test_end_time]').val());
			$('input[name=test_end_time]').val("");
			
			return;
		}
	});
	
	$('input[name=test_start_time]').on('change',function(){
		if($('input[name=start_time]').val()=='09:00'){
			if($('input[name=test_start_time]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 9:00 이후로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			if($('input[name=test_start_time]').val()>$('input[name=end_time]').val()){
				alert("시작시간은 12:50 이전로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			
		}
		if($('input[name=start_time]').val()=='13:30'){
			if($('input[name=test_start_time]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 13:30 이후로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
			if($('input[name=test_start_time]').val()>$('input[name=end_time]').val()){
				alert("시작시간은 17:20 이전으로 선택해주세요.");
				$('input[name=test_start_time]').val("");
				return;
			}
		}
		
		
		if($('input[name=test_start_time]').val()>$('input[name=test_end_time]').val() && $('input[name=test_end_time]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			$('input[name=test_end_time]').val("");
			return;
		}
	});
	$('input[name=test_end_time]').on('change',function(){
		if($('input[name=end_time]').val()=='12:50'){
			if($('input[name=test_end_time]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 12:50 이전로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			if($('input[name=test_end_time]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 09:00 이후로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			
		}
		if($('input[name=start_time]').val()=='13:30'){
			if($('input[name=test_end_time]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 17:20 이전으로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
			if($('input[name=test_end_time]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 13:30 이후로 선택해주세요.");
				$('input[name=test_end_time]').val("");
				return;
			}
		}
		
		
		
		if($('input[name=test_start_time]').val()>$('input[name=test_end_time]').val() && $('input[name=test_start_time]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			alert($('input[name=test_end_time]').val());
			$('input[name=test_end_time]').val("");
			
			return;
		}
	});
	
	
	//수정 벨리데이션
		$('input[name=modifystarttime]').on('change',function(){
		if($('input[name=modifystarttime]').val()=='09:00'){
			if($('input[name=modifystarttime]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 9:00 이후로 선택해주세요.");
				$('input[name=modifystarttime]').val("");
				return;
			}
			if($('input[name=modifystarttime]').val()>$('input[name=end_time]').val()){
				alert("시작시간은 12:50 이전로 선택해주세요.");
				$('input[name=modifystarttime]').val("");
				return;
			}
			
		}
		if($('input[name=modifystarttime]').val()=='13:30'){
			if($('input[name=modifystarttime]').val()<$('input[name=start_time]').val()){
				alert("시작시간은 13:30 이후로 선택해주세요.");
				$('input[name=modifystarttime]').val("");
				return;
			}
			if($('input[name=modifystarttime]').val()>$('input[name=modifyendtime]').val()){
				alert("시작시간은 17:20 이전으로 선택해주세요.");
				$('input[name=modifystarttime]').val("");
				return;
			}
		}
		
		
		if($('input[name=modifystarttime]').val()>$('input[name=modifyendtime]').val() && $('input[name=modifyendtime]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			$('input[name=modifyendtime]').val("");
			return;
		}
	});
	
	$('input[name=modifyendtime]').on('change',function(){		
		if($('input[name=end_time]').val()=='12:50'){
			if($('input[name=modifyendtime]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 12:50 이전로 선택해주세요.");
				$('input[name=modifyendtime]').val("");
				return;
			}
			if($('input[name=modifyendtime]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 09:00 이후로 선택해주세요.");
				$('input[name=modifyendtime]').val("");
				return;
			}
			
		}
		if($('input[name=start_time]').val()=='13:30'){
			if($('input[name=modifyendtime]').val()>$('input[name=end_time]').val()){
				alert("종료시간은 17:20 이전으로 선택해주세요.");
				$('input[name=modifyendtime]').val("");
				return;
			}
			if($('input[name=modifyendtime]').val()<$('input[name=start_time]').val()){
				alert("종료시간은 13:30 이후로 선택해주세요.");
				$('input[name=modifyendtime]').val("");
				return;
			}
		}
		
		
		
		if($('input[name=test_start_time]').val()>$('input[name=modifyendtime]').val() && $('input[name=test_start_time]').val() != ""){
			alert("종료시간이 시작시간을 앞설수는 없습니다. 종료시간을 다시 입력해주세요.")
			alert($('input[name=modifyendtime]').val());
			$('input[name=modifyendtime]').val("");
			
			return;
		}
	});
	
	//테스트 추가
	$('#submitBtn').on('click',function(){
		
		if($('input[name=test_name]').val()==""){
			alert("시험지 이름을 입력해주세요");
			return false;
		}
		if($('input[name=test_start_date]').val()==""){
			alert("시작날짜를 입력해주세요");
			return false;
		}
		if($('input[name=test_start_time]').val()==""){
			alert("시작시간을 입력해주세요");
			return false;
		}
		if($('input[name=test_end_time]').val()==""){
			alert("종료시간을 입력해주세요");
			return false;
		}
		if($('input[name=test_score]').val()==""){
			alert("시험 총점을 입력해주세요");
			return false;
		}
		if($('input[name=test_ratio]').val()==""){
			alert("시험 반영 비율을 입력해주세요");
			return false;
		}

		
// 		var form = $('#testForm').serialize();
// 		alert(form);
// 		var formData = new FormData(form);

		
		var start_date = $('input[name=test_start_date]').val();
		var start_time = $('input[name=test_start_time]').val();
		var end_time = $('input[name=test_end_time]').val();
		
		
		var start_dates = start_date+" "+start_time;
		var end_date = start_date+" "+end_time;
		start_dates = moment(start_dates).format("YYYY-MM-DDTHH:mm:ss");
		end_date = moment(end_date).format("YYYY-MM-DDTHH:mm:ss");
		var sdate = moment(start_date).format("YYYY-MM-DD hh:mm:ss");
		var edate = moment(end_date).format("YYYY-MM-DD hh:mm:ss");
		$('input[name=lecture_no]').val('${lecture_no}');
		if(end_time<start_time){
			alert("시험시작시간보다 시험종료시간이 이전일 수 없습니다.");
			return false;
		}
		var today = new Date();
// 		if(!moment(today).isBefore(start_date)){
// 			alert("오늘보다 이전 날짜를 선택하였습니다.");
// 			return false;
// 		}
		
		
		$.ajax({
			url:'insertTest.do',
			type:'POST',
			data: {
				"test_no":$('input[name=test_no]').val(),
				"lecture_no":$('input[name=lecture_no]').val(),
				"test_name":$('input[name=test_name]').val(),
				localDateTime:start_dates,
				localDateTime2:end_date,
				test_score:$('input[name=test_score]').val(),
				test_ratio:$('input[name=test_ratio]').val()
			},
			success:function(data){				
				getTestPage(data);
				$('input[name=test_no]').val("");
				$('input[name=lecture_no]').val("");
				$('input[name=test_name]').val("");
				$('input[name=test_start_date]').val("");
				$('input[name=test_start_time]').val("");
				$('input[name=test_end_time]').val("");
				$('input[name=test_score]').val("");
				$('input[name=test_ratio]').val("");				 
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
		
	


// 		console.log(testStartDate);
// 		console.log(new Date(Number(testStartDate)).toString("YYYY-MM-DDTHH:mm"));
		var sdate = new Date(Number(testStartDate));
		var edate = new Date(Number(testEndDate));
		
		
// 		console.log(moment(date2).format("YYYY-MM-DDTHH:mm"));
		
		
// 		var dateSD = new Date(Number(testStartDate)).toISOString().substring(0,16);		
		var dateSD = moment(sdate).format("YYYY-MM-DD HH:mm");
		var dateED = moment(edate).format("YYYY-MM-DD HH:mm");

// 		console.log(dateSD);
		var starttime = dateSD.split(' ');
		var endtime = dateED.split(' ');
		$('input[name=test_name]').eq(1).val(testName);
		$('input[name=modifystartdate]').val(starttime[0]);
		$('input[name=modifystarttime]').val(starttime[1]);
		$('input[name=modifyendtime]').val(endtime[1]);
		$('input[name=test_score]').eq(1).val(testScore);
		$('input[name=test_ratio]').eq(1).val(testRatio);
		$('input[name=lecture_no]').eq(1).val(lectureNo);		
		$('input[name=test_no]').eq(0).val(testNo);
		$("#test_status option[value="+testStatus+"]").attr("selected", true);

		
	});
	
	//시험 수정 버튼 
	$('#modifyBtn111').on('click',function(){
		
		var modifyForm = $('form[name="modifyForm"]');
		
		var sdd = $('input[name="modifystartdate"]').val();
		var sdt = $('input[name="modifystarttime"]').val()
		var edd = $('input[name="modifyendtime"]').val()
		
		var today = new Date();
		if(edd<sdt){
			alert("시험시작시간보다 시험종료시간이 이전일 수 없습니다.");
			return false;
		}
// 		if(!moment(today).isBefore(sdd)){
// 			alert("오늘보다 이전 날짜를 선택하였습니다.");
// 			return false;
// 		}
		
		
		
// 		var start_date = $('input[name="modifystartdate"]').eq.val().replace("T"," ");
// 		var end_date = $('input[name="test_end_date"]').eq(1).val().replace("T"," ");
// 		var start_date = $('input[name="test_start_date"]').eq(1).val().replace("T"," ");
// 		var end_date = $('input[name="test_end_date"]').eq(1).val().replace("T"," ");
		
		
		$('input[name="test_start_date"]').eq(1).attr("type","text").val(start_date);
		$('input[name="test_end_date"]').eq(1).attr("type","text").val(end_date);
		
		var start_date = $('input[name=modifystartdate]').val();
		var start_time = $('input[name=modifystarttime]').val();
		var end_time = $('input[name=modifyendtime]').val();
		
		
		var start_dates = start_date+" "+start_time;
		var end_date = start_date+" "+end_time;
		start_dates = moment(start_dates).format("YYYY-MM-DD HH:mm");
		
		$('input[name=lecture_no]').val('${lecture_no}');
		end_date = moment(end_date).format("YYYY-MM-DD HH:mm");

		$.ajax({
			url:'modifyTest.do',
			type:'POST',
// 			data: modifyForm.serialize(),
			data: {
				test_no:$('input[name=test_no]').val(),
				lecture_no:$('input[name=lecture_no]').val(),
				test_name:$('input[name=test_name]').eq(1).val(),
				test_start_date:start_dates,
				test_end_date:end_date,
				test_score:$('input[name=test_score]').eq(1).val(),
				test_ratio:$('input[name=test_ratio]').eq(1).val(),
				test_status:$('#test_status').val()
			},
			success:function(result){				
				getTestPage(result);
			},
			error:function(error){
				alert(error.status);
			},
		    complete : function() {
// 				$('input[name="test_start_date"]').eq(1).attr("type","datetime-local");
// 				$('input[name="test_end_date"]').eq(1).attr("type","datetime-local");
				

// 				$('input[name="test_start_date"]').eq(1).val(sdd);
// 				$('input[name="test_end_date"]').eq(1).val(edd);
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
				location.reload(true);
			},
			error:function(error){
				alert(error.status);
			}
		});
	
	});
	
	//시험 추가 취소 버튼시 값 리셋
	$('#cancalBtn').on('click',function(){
		$('input[name=test_no]').val("");
		$('input[name=lecture_no]').val("");
		$('input[name=test_name]').val("");
		$('input[name=test_start_date]').val("");
		$('input[name=test_start_time]').val("");
		$('input[name=test_end_time]').val("");
		$('input[name=test_score]').val("");
		$('input[name=test_ratio]').val("");
	});
	
	//시험 X 클릭시 값 리셋
	$('#xJoyBtn').on('click',function(){
		$('input[name=test_no]').val("");
		$('input[name=lecture_no]').val("");
		$('input[name=test_name]').val("");
		$('input[name=test_start_date]').val("");
		$('input[name=test_start_time]').val("");
		$('input[name=test_end_time]').val("");
		$('input[name=test_score]').val("");
		$('input[name=test_ratio]').val("");
	});

	
	//테스트 리스트	 
	function testList(ele){
// 		alert(ele);
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
	
	
	//시험 채점 버튼 - 학생목록
	function testMarkBtn(ele){
		location.href="markTestList.do?test_no="+ele;
	}
		

	
	
</script>
<!-- 핸들바 - 강의명, 시험지명 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

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
		<td><button class="modifyBtn" id="modifyTestBtn" data-toggle="modal" data-target="#modal-testmodi" data-test_name={{test_name}} data-test_start_date={{test_start_date}} data-test_end_date={{test_end_date}}
		  data-test_score={{test_score}} data-test_ratio={{test_ratio}} data-lecture_no={{lecture_no}} data-test_no={{test_no}} data-test_status={{test_status}}><i class="fa fa-pencil"></i></button>	
		  <button class="deleteBtn" id="deleteTestBtn" data-toggle="modal" data-target="#modal-testdele" data-test_name={{test_name}} data-lecture_no={{lecture_no}}
		  data-test_no={{test_no}} ><i class="fa fa-trash"></i></button></td>
		<td style="padding:5px;">{{{markBtn test_end_date test_no}}}</td>
   </tr>
{{/each}}
</tbody>
</script>

 

<script>	
// <button class="btn btn-info" id="testMarkBtn" data-test_no={{test_no}}


function getTestPage(result){

		Handlebars.registerHelper('dateFormat', function(context, block) {
		  if (window.moment) {
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
		
		Handlebars.registerHelper('markBtn', function(date,test_no) {
			var today = new Date();
			if(moment(today).isAfter(date)){
				return '<button style="border:1px solid #dddddd" class="btn btn-outline" id="testMarkBtn" onClick=testMarkBtn("'+test_no+'");return false;>채점</button>'
			}else{
				return ""
			}
		});
		
	   var template=Handlebars.compile($('#test-list-template').html());
	   var html = template(result); 
	   $('#testList').remove();
	   $('#testListTable').append(html);

}


$("#lecture_time").html('수업시간 : ${lecture.lecture_start_date}~${lecture.lecture_end_date}');
$("#lecture_time2").html('수업시간 : ${lecture.lecture_start_date}~${lecture.lecture_end_date}');

</script>
<style>
	.compose-mail-modal modal fade{
		width:400px;
	}
	.addTestBtn{background-color: rgba(0,0,0,0);border:none;}	
	.form-control{width:300px; display: inline-block; margin-bottom:5px;}
	.spam{width:100px;display: inline-block; margin-left:10px;}
	.modifyBtn{background-color: rgba(0,0,0,0);border:none;}
	.deleteBtn{background-color: rgba(0,0,0,0);border:none;}
	 table tr td{padding:5px;}
	.table{ text-align: center;}
	
	.btn btn-info{font-size: 13px;}
</style>

<%@ include file="registForm_js.jsp"%>


    

