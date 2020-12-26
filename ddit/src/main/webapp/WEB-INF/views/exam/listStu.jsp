<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="content-body">

	

   <!-- Page Headings Start -->
   <div class="row justify-content-between align-items-center mb-10">
       <!-- Page Heading Start -->
       <div class="col-12 col-lg-auto mb-20">
           <div class="page-heading">
           	<h3 class="title" style="text-align: left;">시험문제관리</h3>
			<br>
           	<span>객관식 문제는 해당 번호를 클릭하여 선택해주시고, <span style="color:red;">주관식 문제</span>는 정확한 <span style="color:red;">답만을</span> 입력해주세요. 컴퓨터가 자동으로 채점하오니 정답을 유의하여 입력해주세요.</span><br>
           	<span>서술형 문제는 해당 과목 선생님이 직접 채점합니다.</span>     	
           </div>           
       </div><!-- Page Heading End -->
   </div><!-- Page Headings End -->
      
	<div class="row">
		<div class="col-12 col-lg-auto mb-20">
			
			 <script type="text/javascript">
				var examList= new Array();
				<c:forEach items="${examList2}" var="exam">
// 				alert("${exam.exam_category_no}");
				examList.push({
				      exam_no:"${exam.exam_no}",
					  test_no:"${exam.test_no}",					  
					  exam_category_no:"${exam.exam_category_no}",
					  exam_title:"${exam.exam_title}",
					  exam_point:"${exam.exam_point}",
					  exam_answer:"${exam.exam_answer}",
					  exam_status:"${exam.exam_status}",
					  exam_number:"${exam.exam_number}"
					});
				</c:forEach>
				
				var exampleList= new Array();
				<c:forEach items="${exampleList}" var="example">
				exampleList.push({
					  example_no:"${example.example_no}",
					  exam_no:"${example.exam_no}",
					  example_content:"${example.example_content}",
					  example_number:"${example.example_number}"						  
					});
				</c:forEach>
				
				var testList= new Array();
				<c:forEach items="${testList}" var="test">
				testList.push({
					  test_no:"${test.test_no}",
					  test_end_date:"${test.test_end_date}"
					});
				</c:forEach>
			</script>
			
<%-- 			<c:if test="${examList.test_no  }"/> --%>
			<form action="modify.do" method="post" name="modifyForm">
			<div id="start">			

			</div>
			</form>
			
		</div>
	</div>
    <div id="followquick" style="text-align: center;">    	
    	<span>남은시간</span>
		<div id="timeleft" class="remainTime">
			
		</div>
		<br>
    
	<button type="button" class="button button-round button-dark" id="submitBtn">답압제출</button><br><br>
	
	<button type="button" class="button button-round button-dark" id="backBtnSTL">뒤로가기</button>
</div> 
            
</div>
<!-- 남은시간표시 -->
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script>
	var end_date_temp ="${end_date}";
	var nowTime = new Date();
	var end_date = new Date(end_date_temp);
	
// 	end_date = end_date;			
	
// 	alert(end_date);
	
	const countDownTimer = function (id, date){
		var _vDate = new Date(date);
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;
		
		
		
		function showRemaining(){
			var now = new Date();
			var distDt = _vDate - now;
			
			if(distDt < 0){
				clearInterval(timer);
				
// 				document.getElementById(id).textContent = "해당 이벤트가 종료 되었습니다.";
				$('#submitBtn').trigger('click');
				alert('시험 시간이 종료되었습니다. 작성하신 답안지는 자동으로 제출됩니다.');								
			}
			
			var days = Math.floor(distDt / _day);
			var hours = Math.floor((distDt % _day) / _hour);
			var minutes = Math.floor((distDt % _hour) / _minute);
			var seconds = Math.floor((distDt % _minute) / _second);
			
// 			document.getElementById(id).textContent = days + '일';
			document.getElementById(id).textContent = hours + ':';
			document.getElementById(id).textContent += minutes + ':';
			document.getElementById(id).textContent += seconds + '';
		}		
		
		timer = setInterval(showRemaining, 1000);
		
	}
	
	var dateObj = new Date();
	dateObj.setDate(dateObj.getDate()+1);
<%-- 	alert('<%=request.getParameter("test_end_date")%>'); --%>
	
	countDownTimer('timeleft', end_date);
	
</script>

<script>
$(document).ready(function(){
<%-- 	alert('<%=request.getParameter("test_no")%>'); --%>
	changeTest("${test_no2}");
	
});

	function changeTest(ele){ //시험지 출력
		$('#start').empty();		
		
		var testNo = ele;
		
		
		var ab= 0;
		var ac = 0;
		for (var i = 0; i < examList.length; i++) {
			if((examList[i].test_no)==testNo){
// 				alert(examList[i].exam_category_no);
				$('#start').append("<div id='exam' name='exam' class='answer'>"+
						'<div id="examDiv" name="examDiv2"><input type="text" name="exam_no" id="exam_no" class="answer_num" style="width:40px; margin:0px;font-weight:bold;font-size:25px;" readonly>'+
						'<input  readonly type="text" name="exam_title" class="answerTitle" > (<input type="text" name="exam_category_no"  readonly style="width:50px; margin:0px;">'+
						'<input type="text" name="exam_point" readonly class="answer_point" style="width:20px;margin:0px;">점)'+
						'<input type="hidden" name="test_no" value="'+testNo+'"><input type="hidden" name="exam_id">'+
						"<div id='example'></div>"+"</div><hr>");
				
				//값넣기
				$("input[name=exam_title]").eq(ab).val(examList[i].exam_title);
				$("input[name=exam_no]").eq(ab).val(examList[i].exam_number);
				$("input[name=exam_point]").eq(ab).val(examList[i].exam_point);
				$("input[name=exam_category_no]").eq(ab).val(examList[i].exam_category_no);				
				$("input[name=exam_answer]").eq(ab).val(examList[i].exam_answer);
				$("input[name=exam_id]").eq(ab).val(examList[i].exam_no);
				
				var cate = $("input[name=exam_category_no]").eq(ab).val();
				
				if(cate!="EXAMCATE001"){					
					$("div[name=examDiv2]").eq(ab).append(						
						"답 : <input type='text' name='scoring_input' class='form-control' width:900px;' maxlength='80' value=''>"				
					);
				}				

				var z=0;
				for (var y = 0; y < exampleList.length; y++) {					
					if(examList[i].exam_no==exampleList[y].exam_no){
// 						alert(i);
// 						alert(y);
// 						alert(z);
// 						alert(exampleList[y].example_content);
						var thisExamNumber = $("input[name=exam_no]").eq(ab).val();
						
						if(z==0){
							$("div[name=examDiv2]").eq(ab).append(					
									'<div id="exampleDiv"><ol><li><div><input type="radio" name="selectNo'+i+'" readonly><input type="text" name="example_content" class="example_cont" readonly>'
									+'<input type="hidden" name="example_no"><input type="hidden" name="exam_no2"  value="'+thisExamNumber+'"><input type="hidden" name="exam_id2"><div></li></ol></div>');
							z++;
						}else{
							$("div[name=examDiv2]").eq(ab).children().children('ol').append(
								'<li><div><input type="radio" name="selectNo'+i+'" readonly><input type="text" name="example_content" class="example_cont" readonly>'
								+'<input type="hidden" name="example_no"><input type="hidden" name="exam_id2"><input type="hidden" name="exam_no2" value="'+thisExamNumber+'"><div></li>');
								z++;
						}
					}
				}
				for (var x = 0; x < exampleList.length; x++) {
					if(exampleList[x].exam_no==examList[i].exam_no){
						$("input[name=example_content]").eq(ac).val(exampleList[x].example_content);
						$("input[name=example_no]").eq(ac).val(exampleList[x].example_no);
						ac++;
					}
				}
				ab++;
			}			
		}
		
		var cateName = $("input[name=exam_category_no]");
		for (var i = 0; i < cateName.length; i++) {
			if(cateName.eq(i).val()=="EXAMCATE001"){
				cateName.eq(i).val("객관식");
			} else if(cateName.eq(i).val()=="EXAMCATE002"){
				cateName.eq(i).val("주관식");
			} else{
				cateName.eq(i).val("서술식");
			}
		}
		var examNo = $('input[name=exam_no]');	
		
		for (var i = 0; i < examNo.length; i++) {			
			examNo.eq(i).val(examNo.eq(i).val().concat("."));
		}
	}	

	
	$('#submitBtn').on('click',function(){	
		var answer = new Array();
		var name_exam_no = $("input[name=exam_id]");
		var exam_no=[];
		for (var i = 0; i < name_exam_no.length; i++) {
			exam_no.push(name_exam_no.eq(i).val());			
		}
		
		var cate = $("input[name=exam_category_no]");
		for (var i = 0; i < cate.length; i++) {
			if(cate.eq(i).val()=="객관식"){
// 				alert(cate.eq(i).parent().children("#exampleDiv").children().children().children().children('input[type=radio]:checked').parent().parent().index());
				answer.push(cate.eq(i).parent().children("#exampleDiv").children().children().children().children('input[type=radio]:checked').parent().parent().index()+1);									
			}else if(cate.eq(i).val()=="주관식"){
				answer.push(cate.eq(i).parent().children('input[name=scoring_input]').val());
// 				alert(cate.eq(i).parent().children('input[name=scoring_input]').val());
			}else{
				answer.push(cate.eq(i).parent().children('input[name=scoring_input]').val());
			}
		}		
		
		$.ajax({
			url:'testSubmit.do?test_no=${test_no2}&lecture_no='+"<%=request.getParameter("lecture_no")%>",
			type:'post',
			data:{
				"exam_no" : exam_no,
				"scoring_input" : answer
				
			},
			success:function(result){
				if(result=="success"){
					alert("제출이 완료되었습니다.");
				}else{
					alert("제출권한이없습니다.")
				}
				location.href="studentTestList?lecture_no="+"<%=request.getParameter("lecture_no")%>";
				location.reload(true);
			},
			error:function(error){
				alert(error.status);
				return;
			}			
		});		
	});

	
</script>

<style>
	input{
		border:0px solid white;		
	}
		.answer{
		margin-bottom: 10px;
/* 		border:1px solid black; */
		margin-left:200px;

	}
	.answer_num, .answer_point{
		width:80px;
		margin-right:10px;
		margin-bottom:5px;
		border:none;

	}
	.answer_answer{
		margin-right:10px;
		width:150px;
		border:none;

	}
	.exampleType{
		height:30px;
		margin-right:213px;
		border:none;

	}
	
	.answerTitle{
		width: 800px;
		height: 40px;		
		margin-bottom: 10px;
		border:none;

	}
	.example_cont{
		width:500px;
		margin-bottom: 5px;
		border:none;

	}
	
	.delete_btn, #exampleAdd, #exampleDelete{		
		background-color: rgba(0,0,0,0);
		border:none;
	}
	#examDiv{
		border : 2px solid #dadce0;
		border-left-width: 10px;
		border-left-color: #4285f4;
		padding-left: 10px;
		border-radius: 10px;
		margin-bottom: 20px;
		box-shadow: 5px 3px 5px gray;
		padding: 20px;
	}
	input{
		margin-left: 5px;
		margin-top:10px;
	}
	select{
		margin-left: 10px;
	}
	
	.remainTime{
		font-size: 15px;
		font-weight: bold;		
	}
</style>



<%@ include file="registForm_js.jsp"%>
