<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
	var checkedID="";
	var checkedEmail="";
	var checkPwd="";
	function idCheck_go(){
		var input_ID=$('input[name="member_id"]');
		
		if(input_ID.val()==""){
			alert("아이디를 입력하세요");
			input_ID.focus();
			return;
		} else{
			//아이디는 4~12자의 영문자와 숫자로만 입력
			var reqID=/^[a-z]{1}[a-zA-Z0-9]{3,12}$/;
			if(!reqID.test($('input[name="member_id"]').val())){
				alert("아이디는 첫글자는 영소문자이며, \n4~13자의 영문자와 숫자의 조합으로 가능합니다.");
				$('input[name="member_id"]').focus();
				return;
			}
		}
		
		var data = {member_id : input_ID.val().trim()}

		
		
		$.ajax({

			url:"<%=request.getContextPath()%>/member/idCheck.do",
			data: data,		
			type:'post',
			statusCode:{
				302:function(result){
					alert(result.status);
					window.location.reload();
				}
			},
			success:function(result){ //callback, xhr -> statuscode : xhr.status
				if(result=="duplicated"){
					alert("중복된 아이디입니다.");
					$('input[name="member_id"]').focus();
					$('input[name="member_id"]').val("");
				}else{
					alert("사용 가능한 아이디입니다.");
					checkedID = input_ID.val().trim();
					$('input[name="member_id"]').val().trim();
					$('input[name="member_id"]').attr('readonly', 'true');
				}				
			},
			error:function(error){ // statuscode : error.status
// 				alert("error:"+error.status);
			if(error.status=="302") return;	
			alert("아이디 확인에 문제가 생겨서 가입이 불가합니다.");
			}
		});
	}
	
	// 이메일 중복 체크
	function emailCheck_go(){
		var email = document.getElementsByName("member_email")[0].value; 
		var email2 = document.getElementsByName("member_email")[1].value; 
		
		var email = email.concat('@').concat(email2);
		
		
		var input_Email=$('input[name="member_email"]');		
		var input_Email2=$('#domain');
		
		
		if(input_Email.val()==""){
			alert("이메일을 입력하세요");
			input_Email.focus();
			return;
		}
		if(input_Email2.val()==""){
			alert("도메인을 입력하세요");
			input_Email.focus();
			return;
		} 
		
		var data = {member_email : email.trim()}

		
		
		$.ajax({

			url:"<%=request.getContextPath()%>/member/emailCheck.do",
			data: data,		
			type:'post',
			statusCode:{
				302:function(result){
					alert("로그인 세션이 만료되었습니다.");
					window.location.reload();
				}
			},
			success:function(result){ //callback, xhr -> statuscode : xhr.status
				if(result=="duplicated"){
					alert("중복된 이메일입니다.");
					$('#member_email').focus();
					$('#member_email').val("");
				}else{
					alert("사용 가능한 이메일입니다.");
					checkedEmail = input_Email.val().trim();
					$('input[name="member_email"]').val().trim();
					$('input[name="member_email"]').attr('readonly','true');
					$('#domainSelect').attr('disabled','true');
				}				
			},
			error:function(error){ // statuscode : error.status
// 				alert("error:"+error.status);
			$('input[name="member_email"]').val("");
			if(error.status=="302") return false;	
			alert("이메일 중복 확인에 문제가 발생했습니다.");
			}
		});
	}

</script>


<script>
	$('#registBtn').on('click', function(e){

	
		var uploadCheck = $('input[name="checkUpload"]').val();

		
		if($('input[name="member_id"]').val()==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if($('input[name="member_id"]').val()!=checkedID){
			alert("아이디를 중복체크해주세요.");
			return false;
		}
		
		if($('input[name="member_email"]').val()==""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		if($('#domain').val()==""){
			alert("이메일 도메인을 입력해주세요.");
			return false;
		}
		
		if($('input[name="member_email"]').val()!=checkedEmail){
			alert("이메일 중복체크를 해주세요.");
			return false;
		}
		
		if($('input[name="member_pwd"]').val()==""){
			alert("패스워드를 확인해주세요.");
			return false;
		}		
		
		if(checkPwd==""){
			alert("비밀번호의 형식이 맞지 않습니다.")
			return false;
		}
		
		if($('input[name="member_pwd"]').eq(1).val()==""){
			alert("패스워드 재입력을 확인해주세요.");
			return false;
		}
		
		if($('input[name="member_name"]').val()==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if($('input[name="member_name"]').val()==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if($('#member_address').val()==""){
			alert("주소를 입력해주세요.");
			return false;
		}
		
		if($('#member_detailAddress').val()==""){
			alert("상세 주소를 입력해주세요.");
			return false;
		}
		
		
		var member_phone = $('input[name=member_phone]');		
		for (var i = 0; i < member_phone.length; i++) {
			if(member_phone.eq(i).val()==""){				
				alert("연락처를 입력해주세요.");
				return false;			
			}
		}
		
		var form = $('form[role="form"]');
		form.submit();
	});	

</script>

<script>
$('#sendMail').on('click', function(e){
	var form = $('form[role="mail"]');
	var form2 = $('form[role="form"]');
	form.member_id.val=form2.member_id.val
	form.member_email.val=form2.member_email.val
	form.submit();
});

$('#member_pwd').on("propertychange change keyup paste input", function() {
	var reqID=/^[A-Za-z0-9+]{6,12}$/;
    

	
	var upw = $('#member_pwd').val();
    var chk_num = upw.search(/[0-9]/g);
    var chk_eng = upw.search(/[a-z]/ig);
	if(!reqID.test($(this).val())){
	    
		$('#passInfo').text("암호는 6자~12 영문,숫자를 혼합하여 입력해주세요");
		$('#member_pwd').focus();
		checkPwd="";
	}else{

	    if(chk_num < 0 || chk_eng < 0)
	    {
	    	$('#passInfo').text("암호는 6자~12 영문,숫자를 혼합하여 입력해주세요");
			$('#member_pwd').focus();
			checkPwd="";
	    }else{
	    	$('#passInfo').text("");
			checkPwd=2;	
	    }
		
	}
});

$('#backBtn').on('click', function(e){
	location.href="/ddit/";
});



</script>

