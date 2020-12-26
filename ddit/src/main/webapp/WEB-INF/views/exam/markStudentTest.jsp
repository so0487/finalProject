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
				
				var scoringList= new Array();
				<c:forEach items="${scoringList}" var="scoring">
				scoringList.push({
					  scoring_no:"${scoring.scoring_no}",
					  exam_no:"${scoring.exam_no}",
					  test_history_no:"${scoring.test_history_no}",
					  scoring_input:"${scoring.scoring_input}",
					  scoring_result:"${scoring.scoring_result}"					  
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

    
	<button type="button" class="button button-round button-dark" id="markBtn">채점완료</button><br><br>
	
	<button type="button" class="button button-round button-dark" id="backBtnMarkList">뒤로가기</button>
</div> 
            
</div>


<script>
$(document).ready(function(){
<%-- 	alert('<%=request.getParameter("test_no")%>'); --%>
	changeTest("${test_no2}");

	
});

	function changeTest(ele){ //시험지 출력
		$('#start').empty();		
		
		var testNo = ele;
		
		var af= 0;
		var ab= 0;
		var ac = 0;
		for (var i = 0; i < examList.length; i++) {
			if((examList[i].test_no)==testNo){
// 				alert(examList[i].exam_category_no);
				$('#start').append("<div id='exam' name='exam' class='answer'>"+						
						'<div id="examDiv" name="examDiv2"><div> 정답 : <input type="text" name="exam_answer" readonly></div><input type="text" name="exam_no" id="exam_no" class="answer_num" style="width:50px; margin:0px;font-weight:bold;font-size:35px;" readonly>'+
						'<input  readonly type="text" name="exam_title" class="answerTitle" > (<input type="text" name="exam_category_no"  readonly style="width:50px; margin:0px;">'+
						'<input type="text" name="exam_point" readonly class="answer_point" style="width:25px;margin:0px;">점)'+
						'<input type="hidden" name="test_no" value="'+testNo+'"><input type="hidden" name="exam_id"><input type="hidden" name="scoring_result">'+
						"<div id='example'></div>"+"</div><hr>");
				
				//값넣기
				$("input[name=exam_title]").eq(ab).val(examList[i].exam_title);
				$("input[name=exam_no]").eq(ab).val(examList[i].exam_number);
				$("input[name=exam_point]").eq(ab).val(examList[i].exam_point);
				$("input[name=exam_category_no]").eq(ab).val(examList[i].exam_category_no);				
				$("input[name=exam_answer]").eq(ab).val(examList[i].exam_answer);
				$("input[name=exam_id]").eq(ab).val(examList[i].exam_no);
				$("input[name=exam_answer]").eq(ab).val(examList[i].exam_answer);
				
				var cate = $("input[name=exam_category_no]").eq(ab).val();
				
				if(cate!="EXAMCATE001"){					
					$("div[name=examDiv2]").eq(ab).append(						
						"답 : <input type='text' name='scoring_input' class='form-control' width:900px;' maxlength='50' value='' readonly>"				
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
									'<div id="exampleDiv"><ol><li><div><input type="radio" name="selectNo" value="'+exampleList[y].example_number+'" onclick="return(false);"><input type="text" name="example_content" class="example_cont" readonly>'
									+'<input type="hidden" name="example_no"><input type="hidden" name="exam_no2"  value="'+thisExamNumber+'"><input type="hidden" name="exam_id2" value="'+examList[i].exam_no+'"><div></li></ol></div>');
							z++;
						}else{
							$("div[name=examDiv2]").eq(ab).children().children('ol').append(
								'<li><div><input type="radio" name="selectNo" value="'+exampleList[y].example_number+'" onclick="return(false);"><input type="text" name="example_content" class="example_cont" readonly>'
								+'<input type="hidden" name="example_no"><input type="hidden" name="exam_id2" value="'+examList[i].exam_no+'"><input type="hidden" name="exam_no2" value="'+thisExamNumber+'" ><div></li>');
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
			

			
			for (var d = 0; d < scoringList.length; d++) {					
				if(examList[i].exam_no==scoringList[d].exam_no){
					if(examList[i].exam_category_no=="EXAMCATE001"){
						$("input[name=exam_id]").eq(af).parent().children('#exampleDiv').children().children().eq(scoringList[d].scoring_input-1).children().children('input[name=selectNo]').attr("checked",true);						
					}else{						
						$("input[name=exam_id]").eq(af).parent().children('input[name=scoring_input]').val(scoringList[d].scoring_input);
					}					
					$("input[name=exam_id]").eq(af).parent().children('input[name=scoring_result]').val(scoringList[d].scoring_result);
					af++;
				}
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
			if(examNo.eq(i).parent().children('input[name=scoring_result]').val()==0){
				examNo.eq(i).attr('style','width:50px; margin:0px;font-weight:bold;font-size:35px;color:blue');
			}else{
				examNo.eq(i).attr('style','width:50px; margin:0px;font-weight:bold;font-size:35px;color:red');
			}
		}				

	}	

	
	
	
	$('#markBtn').on('click',function(){
		var test_no = testList[0].test_no;
		var test_history_no = scoringList[0].test_history_no;
		var result = new Array();
		var exam_no=[];
		var name_exam_no = $("input[name=exam_id]");
		for (var i = 0; i < name_exam_no.length; i++) {
			exam_no.push(name_exam_no.eq(i).val());
// 			alert(name_exam_no.eq(i).val());
		}
		
		var checkResult = $("input[name=scoring_result]");
		for (var i = 0; i < checkResult.length; i++) {
			result.push(checkResult.eq(i).val());
// 			alert(checkResult.eq(i).val());
		}
		
		
		$.ajax({
			url:'markTestResult.do?test_history_no='+test_history_no,
			type:'post',
			data:{
				"exam_no" : exam_no,
				"scoring_result" : result				
			},
			success:function(result){
				if(result=="success"){
					alert("채점이 완료되었습니다.");
				}else{
					alert("채점권한이없습니다.")
				}
				location.href="markTestList.do?test_no=${test_no2}";				
			},
			error:function(error){
				alert(error.status);
				return;
			}			
		});		
	});
	
	$('#backBtnMarkList').on('click',function(){
		location.href="markTestList.do?test_no=${test_no2}";
	});

	$(document).on('click', '#exam_no', function(){
		var btn = $(this);		
		if(btn.parent().children('input[name=scoring_result]').val()==0){
			btn.parent().children('input[name=scoring_result]').val("1");
			btn.attr('style','width:50px; margin:0px;font-weight:bold;font-size:35px;color:red');
		}else{
			btn.parent().children('input[name=scoring_result]').val("0");
			btn.attr('style','width:50px; margin:0px;font-weight:bold;font-size:35px;color:blue');
		}		
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
		width:70px;
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
