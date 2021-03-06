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
                    	<h1 class="title" style="text-align: left;">시험문제관리</h1>
                    </div>
                </div><!-- Page Heading End -->

            </div><!-- Page Headings End -->

	<div class="row">
		<div class="col-12 col-lg-auto mb-20">
			<h3>시험선택</h3>
			<select id="test_name" onChange="changeTest(this)" class="form-control">
				<option value="" selected>선택하세요</option>
				<c:forEach items="${testList }" var="test">
					<option  value="${test.test_no }">${test.test_name}</option>
				</c:forEach>
<!-- 				<option value="test1">1번</option> -->
<!-- 				<option value="test2">2번</option> -->
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<a href="list.do">시험문제 read</a>
			<a href="listStu.do">시험보는 read</a>
			<a href="classList.do">회차정보</a>
			<h2 style="margin-bottom:20px;">문제출제</h2>
			<form name="registForm" action="regist.do" method="post">
			<div id="start" style="margin-left:150px;">
				
			
			
			</div>
			</form>
		</div>

	</div>
	
<div id="followquick">
	<button type="button" id="addBtn" class="button button-round button-dark">추가하기</button><br><br>
	
	<button type="button" id="registBtn" class="button button-round button-dark">시험저장</button>
</div>
	
</div>
<style>
	input{
		margin-left:6px;
	}
	.answer{
		margin-bottom: 10px;
/* 		border:1px solid black; */
	}
	.answer_num, .answer_point{
		width:70px;
		margin-right:10px;
		margin-bottom:5px;
	}
	.answer_answer{
		margin-right:10px;
		width:150px;
	}
	.exampleType{
		height:30px;
		margin-right:376px;
		margin-left:7px;
	}
	
	.answerTitle{
		width: 1018px;
		height: 40px;		
		margin-bottom: 10px;
	}
	.example_cont{
		width:500px;
		margin-bottom: 5px;
	}
	
	.delete_btn{		
		background-color: rgba(0,0,0,0);
	}
</style>
<script>
	$('#addBtn').on('click',function(){
		var testName = $('#test_name').val();
		
		$('#start').append("<div id='exam' name='exam' class='answer'>"+
		'<div id="examDiv">문제번호<input type="number" name="exam_no" id="exam_no" class="answer_num">배점<input type="number" name="exam_point" class="answer_point">정답<input type="text" name="exam_answer" class="answer_answer">'+
		'문제유형<select onChange="selectExamCate(this)" name="exam_category_no" class="exampleType"><option value="" selected>선택하세요</option> <option value="EXAMCATE001">객관식</option><option value="EXAMCATE002">주관식</option><option value="EXAMCATE003">서술식</option></select><button type="button" id="examDelete" class="button button-outline button-danger delete_btn"><i class="fa fa-trash-o" aria-hidden="true"></i>&#160;삭제</button><br>'+
		'문제제목<input type="text" name="exam_title" class="answerTitle"><input type="hidden" name="test_no" value="'+testName+'"></div>'+
		"<div id='example'></div>"	
				
		+"</div><hr>");
// 		alert($('input[name=test_name]').val()); //시험번호 히든 값 테스트
	});
	

	
</script>
<script>
	function selectExamCate(ele){
		//문제유형 변경시 지우기
		var btn = $(ele);		
		var examObject = btn.parent().parent(); //exam
		examObject.children('#examDiv').children().remove("#exampleDiv");
		
		var examDiv = btn.parent(); //examDiv
		var thisExamNumber = btn.parent().children("#exam_no").val(); //문제번호 input
		var ele = $(ele);
		
		if(ele.val()=="EXAMCATE001"){
			examDiv.append('<div id="exampleDiv"><ol><li><div><input type="radio" name="exampleNum" ><input type="text" name="example_content" class="example_cont">'
				+'<input type="hidden" name="exam_no2" value="'+thisExamNumber+'"><button type="button" class="delete_btn" id="exampleAdd">+</button><div></li></ol></div>');
		}
// 		else if(ele.val()=="EXAMCATE002"){
// 			examDiv.append('<div id="exampleDiv">주관식 문제 <br><textarea type="text" name="example_content2" maxlength:1000 class="exampleInput2"></textarea>'
// 				+'<input type="hidden" name="exam_no3" value="'+thisExamNumber+'"></div>');
// 		}
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
		div.append('<li><div><input type="radio" name="exampleNum" value="1"><input type="text" name="example_content" class="example_cont"><button type="button" class="delete_btn" id="exampleDelete">X</button><input type="hidden" name="exam_no2" value="'+thisExamNumber+'"></div></li>');		
	});
	
	$(document).on('click','li', function(){
		 var index= $(this).index();	
	});
	
	function changeTest(ele){		
		$('#start').empty();
	}
	
</script>	

<%@ include file="registForm_js.jsp"%>
