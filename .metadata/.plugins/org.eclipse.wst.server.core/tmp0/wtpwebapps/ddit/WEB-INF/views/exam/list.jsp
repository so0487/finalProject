<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="content-body" >

	

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
<!-- 			시험선택 -->
<!-- 			<select id="test_name" onChange="changeTest(this)"> -->
<%-- 				<c:forEach items="${testList }" var="test"> --%>
<!-- 				<option value="" selected>선택하세요</option> -->
<%-- 				<option value="${test.test_no }">${test.test_name}</option>					 --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
			
			
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
			</script>
			
<%-- 			<c:if test="${examList.test_no  }"/> --%>
			<form action="modify.do" method="post" name="modifyForm">
			<div id="start">			

			</div>
			</form>
			
		</div>
	</div>
    <div id="followquick">
    <div style="text-align: center;">총 점</div>
    <c:if test="${loginUser.member_role eq 'PROFESSOR' }">
    <input type="text" readonly id="sumPoint" class="pointBox">/<input type="text" readonly id="totalPoint" class="pointBox" value="${test.test_score }">점 <br/><br>    
	<button type="button" class="button button-round button-dark" id="modifyBtn">제출완료</button><br><br>
	<button type="button" class="button button-round button-dark" id="addBtn">문제추가</button><br><br>
	</c:if>
	<c:if test="${loginUser.member_role eq 'ADMIN' }">
    <input type="text" readonly id="sumPoint" class="pointBox">/<input type="text" readonly id="totalPoint" class="pointBox" value="${test.test_score }">점 <br/><br>        
	</c:if>
	
	<button type="button" class="button button-round button-dark" id="backBtn">뒤로가기</button>
</div> 

            
</div>

<input type="hidden" name="test_name" value="${test_no2}"/>
<script>
// 	선택한 시험지 로드
	$(document).ready(function(){

// 		alert($('input[name=test_name]').val());
		changeTest("${test_no2}");
		
		var point = $('input[name=exam_point]');
		var sumpoint=0;
		for (var i = 0; i < point.length; i++) {
			sumpoint += Number($('input[name=exam_point]').eq(i).val());
		}
		$('#sumPoint').val(sumpoint);
	
	});	

</script>

<script>		
	function changeTest(ele){ //시험지 변경		
		$('#start').empty();
		
// 		alert(examList.length);
		
		var testNo = ele;		

		var ab= 0;
		var ac = 0;
		for (var i = 0; i < examList.length; i++) {			
			if((examList[i].test_no)==testNo){				
				$('#start').append("<div id='exam' name='exam' class='answer'>"+
						'<div id="examDiv" name="examDiv2">문제번호<input type="number" maxlength="3" name="exam_no" id="exam_no" class="form-control2 answer_num" oninput="maxLengthCheck(this)">배점<input type="number" name="exam_point" class="answer_point" maxlength="3" oninput="maxLengthCheck(this)">정답<input type="text" name="exam_answer" class="answer_answer">'+
						'문제유형<select onChange="selectExamCate(this)" name="exam_category_no" class="exampleType"><option value="ss" selected>선택하세요</option> <option value="EXAMCATE001">객관식</option><option value="EXAMCATE002">주관식</option><option value="EXAMCATE003">서술식</option></select><button type="button" id="examDelete" class="delete_btn"><i class="fa fa-trash-o" aria-hidden="true"></i>&#160;삭제</button><br>'+
						'문제제목<input type="text" maxlength="100" name="exam_title" class="answerTitle" ><input type="hidden" name="test_no" value="${test_no2}"><input type="hidden" name="exam_id">'+
						"<div id='example'></div>"+"</div>");
				$("input[name=exam_title]").eq(ab).val(examList[i].exam_title);
				$("input[name=exam_no]").eq(ab).val(examList[i].exam_number);				
				$("input[name=exam_point]").eq(ab).val(examList[i].exam_point);
				$("select[name=exam_category_no] option[value="+examList[i].exam_category_no+"]").eq(ab).attr("selected", true);				
				$("input[name=exam_answer]").eq(ab).val(examList[i].exam_answer);
				$("input[name=exam_id]").eq(ab).val(examList[i].exam_no);
				
				
				var z=0;
				for (var y = 0; y < exampleList.length; y++) {					
					if(examList[i].exam_no==exampleList[y].exam_no){
// 						alert(i);
// 						alert(y);
// 						alert(z);
// 						alert(exampleList[y].example_content);
						var thisExamNumber = $("input[name=exam_no]").eq(ab).val();
// 						alert(thisExamNumber);						
						if(z==0){
							$("div[name=examDiv2]").eq(ab).append(					
									'<div id="exampleDiv"><ol><li><div><input type="radio" name="exampleNum" ><input type="text" name="example_content" class="example_cont" maxlength="30">'
									+'<input type="hidden" name="example_no"><button type="button" id="exampleAdd"><i class="zmdi zmdi-brush zmdi-hc-fw"></i></button><input type="hidden" name="exam_no2"  value="'+thisExamNumber+'"><input type="hidden" name="exam_id2"><div></li></ol></div>');
							z++;
						}else{
							$("div[name=examDiv2]").eq(ab).children().children('ol').append(					
									'<li><div><input type="radio" name="exampleNum" ><input type="text" name="example_content" maxlength="30" class="example_cont">'
									+'<input type="hidden" name="example_no"><input type="hidden" name="exam_id2"><input type="hidden" name="exam_no2" value="'+thisExamNumber+'"><button type="button" id="exampleDelete"><i class="zmdi zmdi-block zmdi-hc-fw"></i></button><div></li>');
							z++;
						}
					}					
				}
				for (var x = 0; x < exampleList.length; x++) {
					if(exampleList[x].exam_no==examList[i].exam_no){
//				 			alert(exampleList[x].example_content);
						$("input[name=example_content]").eq(ac).val(exampleList[x].example_content);
						$("input[name=example_no]").eq(ac).val(exampleList[x].example_no);
		 				ac++;	
					}						
				}
				
				ab++;
			}
		}			
	}
	
	
	
	function selectExamCate(ele){ //문제 카테고리 변경
		//문제번호 입력시에 선택가능
		var btn = $(ele);		
		var exam_no_val = btn.parent().children('#exam_no').val()
		if(exam_no_val==""){
			alert('문제번호를 먼저 입력해주세요');
// 			$("select[name=exam_category_no] option[value="+examList[i].exam_category_no+"]").eq(ab).attr("selected", true);	
			$(ele).parent().children('select').find('option:first').attr('selected',false);
			$(ele).parent().children('select').find('option:first').attr('selected','selected');

			return false;
		}
		
		//문제유형 변경시 지우기
		var examObject = btn.parent().parent(); //exam
		examObject.children('#examDiv').children().remove("#exampleDiv");
		
		var examDiv = btn.parent(); //examDiv
		var thisExamNumber = btn.parent().children("#exam_no").val(); //문제번호 input

		var ele = $(ele);
		
		if(ele.val()=="EXAMCATE001"){
			examDiv.append('<div id="exampleDiv"><ol><li><div><input type="radio" name="exampleNum" ><input type="text" name="example_content" class="example_cont">'
				+'<input type="hidden" name="exam_no2" value="'+thisExamNumber+'"><button type="button" id="exampleAdd"><i class="zmdi zmdi-brush zmdi-hc-fw"></i></button><div></li></ol></div>');
		}

	}
	
	
	$(document).on('click', '#examDelete', function(){
		var btn = $(this);
		var div = btn.parent(); //examDiv
		btn.parent().remove();		
	});
	
	$(document).on('click', '#exampleDelete', function(){
		var btn = $(this);
		var div = btn.parent().parent(); 
		div.remove();		
	});

	$(document).on('click', '#exampleAdd', function(){
		var btn = $(this);
		var div = btn.parent().parent().parent(); //examDiv - ol
// 		alert(btn.parent().parent().parent().text());
		var thisExamNumber = btn.parent().parent().parent().parent().parent().children("#exam_no").val(); //문제번호 input
// 		alert(thisExamNumber);
		div.append('<li><div><input type="radio" name="exampleNum"><input type="text" name="example_content" class="example_cont"><button type="button" id="exampleDelete"><i class="zmdi zmdi-block zmdi-hc-fw"></i></button><input type="hidden" name="exam_no2" value="'+thisExamNumber+'"></div></li>');		
	});
	
	//시험문제 추가
	$('#addBtn').on('click',function(){
		var testName = $('#test_name').val();
		
		$('#start').append("<div id='exam' name='exam' class='answer'>"+
		'<div id="examDiv">문제번호<input type="number" name="exam_no" id="exam_no" class="answer_num" maxlength="3" oninput="maxLengthCheck(this)">배점<input type="number" name="exam_point" class="answer_point" maxlength="3" oninput="maxLengthCheck(this)">정답<input type="text" name="exam_answer" class="answer_answer">'+
		'문제유형<select onChange="selectExamCate(this)" name="exam_category_no" class="exampleType"><option value="ss" selected>선택하세요</option> <option value="EXAMCATE001">객관식</option><option value="EXAMCATE002">주관식</option><option value="EXAMCATE003">서술식</option></select><button type="button" id="examDelete" class="delete_btn"><i class="fa fa-trash-o" aria-hidden="true"></i>&#160;삭제</button><br>'+
		'문제제목<input type="text" name="exam_title" class="answerTitle"><input type="hidden" name="test_no" value="${test_no2}"></div>'+
		"<div id='example'></div>"	
		+"</div><hr>");
// 		alert($('input[name=test_name]').val()); //시험번호 히든 값 테스트
	});
	
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	
	
	$(document).on("propertychange change keyup paste input", 'input[name=exam_point]', function() {
		
		var point = $('input[name=exam_point]');
		var sumpoint=0;
		for (var i = 0; i < point.length; i++) {
			sumpoint += Number($('input[name=exam_point]').eq(i).val());
		}
		$('#sumPoint').val(sumpoint);
		
		if(${test.test_score }<sumpoint){
			alert("입력한 점수가 총점을 초과하였습니다.");
		}
	});
	
</script>

<style>
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
		border-bottom : 1px solid #dadce0;
	}
	.answer_answer{
		margin-right:10px;
		width:150px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}
	.exampleType{
		height:30px;
		margin-right:213px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}
	
	.answerTitle{
		width: 800px;
		height: 40px;		
		margin-bottom: 10px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}
	.example_cont{
		width:500px;
		margin-bottom: 5px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}
	
	.delete_btn, #exampleAdd, #exampleDelete{		
		background-color: rgba(0,0,0,0);
		border:none;
		padding-right:20px;
		font-size:15px;
	}
	#examDiv{
		border : 2px solid #dadce0;
		border-left-width: 10px;
		border-left-color: #4285f4;
		padding-left: 10px;
		border-radius: 10px;
		margin-bottom: 20px;
		box-shadow: 5px 3px 5px gray;
	}
	input{
		margin-left: 5px;
		margin-top:10px;
	}
	select{
		margin-left: 10px;
	}
	.pointBox{
		width:35px;
		margin-right:10px;
		margin-bottom:5px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}

</style>

<%@ include file="registForm_js.jsp"%>
