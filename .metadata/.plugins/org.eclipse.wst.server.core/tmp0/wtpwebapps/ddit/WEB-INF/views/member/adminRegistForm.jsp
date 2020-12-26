<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="content-body">
	
	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">

		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title">회원등록</h3>
			</div>
		</div>
		<!-- Page Heading End -->

	</div>
	<!-- Page Headings End -->
	
	<form action="adminRegist.do" method="post" name="registForm" role="form" enctype="multipart/form-data">                     
	<div style="width:450px; margin-left:15px;">
		<div class="mailbox-attachments clearfix" style="text-align: center; margin-left: 46px;">
			<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid black; height: 170px; width: 160px; margin: 0 auto 10px;"></div>
			<div class="mailbox-attachment-info">
				<div class="">	
					<label for="inputFile" data-tippy-content="파일선택"class="button button-box button-instagram"><i class="zmdi zmdi-instagram"></i></label>										
					<input id="inputFileName" class="form-control" type="text" name="tempPicture" style="height:40px;width:210px;display: inline-block;"disabled/>
					<input id="member_picture" class="form-control" type="hidden" name="member_picture" />
					<span class="input-group-append-sm">		
					<button type="button" class="button button-dark" style="height:40px;" onclick="upload_go();">업로드</button></span>
				</div>
			</div>
		</div>
	</div>	
	<div class="col-12 mb-20">
	<span style="width:70px; display:inline-block; text-align: right;">ID : </span><input class="form-control" type="text" name="member_id" style="display:inline-block; width:262px;" maxlength="12">                                      <span class="input-group-append-sm">	
											<button type="button" onclick="idCheck_go();" class="btn btn-info">중복확인</button>
										</span>
	</div>
	<div class="col-12 mb-20">
	<span style="width:70px; display:inline-block; text-align: right;">비밀번호 : </span><input class="form-control" type="password" name="member_pwd" id="member_pwd" style="display:inline-block; width:262px;"maxlength="12"><br/>
	</div>
	<div class="col-12 mb-20">
	<span style="width:70px; display:inline-block; text-align: right;">이름 : </span><input class="form-control" type="text" name="member_name" maxlength="12" style="display:inline-block; width:262px;"><br/>
	</div>
<!-- 	이메일 -->
	<div class="col-12 mb-20">
	<span style="width:70px; display:inline-block; text-align: right;" >이메일 : </span>
	<input class="form-control" type="text" name="member_email" id="member_email" placeholder="E-mail" style="width: 130px; display: inline-block;" maxlength="20">@
	<input class="form-control" name="member_email" id="domain" type="text" placeholder="이메일 입력" style="width: 110px; display: inline-block;" readonly maxlength="20">                                        
		<select name="domain" id="domainSelect" onChange="selectEmail(this)"class="form-control" style="width:110px; height:40px; display: inline-block;">
			<option value="" selected>선택</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="gmail.com">gmail.com</option>
			<option value="1" >직접입력</option>
		</select>
		<br>
	<button type="button" onclick="emailCheck_go();" class="btn btn-info btn-sm btn-append" style="margin-left:73px;">이메일 중복확인</button><br/>
	</div>
    <div class="col-12 mb-20">                         
	<span style="width:70px; display:inline-block;  text-align: right;">주소 : </span><br/>
			<input type="text" id="member_zip" name="member_address" placeholder="우편번호" class="form-control" 
				style="width:170px; margin-left:73px; margin-bottom:5px; display:inline-block;" readonly><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="font-size:12px;width:100px;" class="btn btn-info"><br/>
			<input type="text" id="member_address" name="member_address" placeholder="주소" class="form-control" 
				 style="width:333px;margin-left:73px; margin-bottom:5px;" readonly>
			<input type="text" id="member_detailAddress" name="member_address" placeholder="상세주소" maxlength="30"
				 class="form-control" style="width:333px; margin-left:73px;">
	</div>
	<div class="col-12 mb-20">	
    <span style="width:70px; display:inline-block; text-align: right;">연락처 : </span>
        <select style="width:110px; height:40px; display:inline-block;" name="member_phone" id="phone" class="form-control">										
			<option value="">선택</option>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="017">017</option>
			<option value="018">018</option>
		</select><span style="font-weight: bold; size:30px;"> - </span><input type="text" name="member_phone" class="form-control" style="width:100px;display:inline-block;" maxlength='4'><span style="font-weight: bold; size:30px;"> - </span><input type="text" name="member_phone" class="form-control" style="width:100px;display:inline-block;" maxlength='4'>
    </div>
    <div class="col-12 mb-20">
	<span style="width:70px; display:inline-block; height:40px;line-height: 40px;text-align: right;">회원상태 :</span>
		<select id="memStatus" name="member_status" class="form-control" style="width:262px; height:40px; display:inline-block;">
			<option value="0">정상회원</option>
			<option value="3">이메일 미인증회원</option>
		</select> 
	</div>
	<div class="col-12 mb-20">
	<span style="width:70px; height:40px;line-height: 40px;display:inline-block; text-align: right;">회원구분 : </span>
		<select id="memRole" name="member_role" class="form-control" style="width:262px; height:40px; display:inline-block;">
			<option value="ADMIN" disabled>관리자</option>
			<option value="STUDENT">수강생</option>
			<option value="PROFESSOR">강사</option>
		</select>
	</div>
	
	<button id="registBtn" class="button button-outline button-info" style="margin-left:90px;" type="button">등록</button>
	<button type="button" class="button button-outline button-danger" id="cancelBtn">취소</button>
	</form>
	
	
</div>


<script>
	

	
	$('#cancelBtn').click(function(){
		window.close();
	});
</script>


<%@ include file="picture_js.jsp" %>
<%@ include file="regist_js.jsp" %>

 <script>
 
 function selectEmail(ele){
	 var $ele = $(ele);
	 var $domain = $('#domain'); 
	 // '1'인 경우 직접입력
	 if($ele.val() == "1"){
		 $domain.attr('readonly', false);
		 $domain.val('');
	 } else {
		 $domain.attr('readonly', true);
		 $domain.val($ele.val());
	 }
 }

 </script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 	우편번호 api
	  function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }

	                
	                } 

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('member_zip').value = data.zonecode;
	                document.getElementById("member_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("member_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
