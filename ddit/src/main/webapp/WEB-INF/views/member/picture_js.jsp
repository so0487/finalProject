<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<form role="imageForm" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>


<script>
	$('input#inputFile').on('change', function(event){
		// 업로드 확인변수 초기화
		$('input[name="checkUpload"]').val(0);
		
		var fileFormat = 
			this.value.substr(this.value.lastIndexOf(".") + 1).toUpperCase();
		
		// 이미지 확장자 jpg/jpeg 확인
		if (fileFormat != "JPG" && fileFormat != "JPEG") {
			alert("이미지는 jpg/jpeg 형식만 가능합니다.")
			$(this).val("");
			return;
		};
		
		// 이미지 파일 용량 체크
		if (this.files[0].size > 1024*1024*1) {
			alert("사진 용량을 1MB 이하만 가능합니다.");
			return;
		};
		
// 		alert(this.files[0].name);

		document.getElementById('inputFileName').value = this.files[0].name;
		
		if(this.files && this.files[0]){
			var reader = new FileReader();
	        reader.onload = function(e){
				$('div#pictureView')
	            .css({
	            	'background-image':'url(' + e.target.result+')',
					'background-position' : 'center',
	                'background-size' : 'cover',
	                'background-repeat' : 'no-repeat'               
	            });
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	
	function upload_go(){
// 		alert("upload btn click");

		if ($('input[name="pictureFile"]').val()=="") {
			alert("사진을 선택하세요.");
			$('input[name="pictureFile"]').click();
			return;
		};
		
		//form 태그 양식을 객체화
		var form = new FormData($('form[role="imageForm"]')[0]);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/member/picture.do",
			data:form,
			type:'post',
			statusCode:{
				302:function(result){
					alert("세션이 만료되었습니다.");
					window.location.reload();
				}
			},				
			processData:false,
			contentType:false,
			success:function(data){
				// 업로드 확인변수 세팅
				$('input[name="checkUpload"]').val(1);

				// 저장된 파일명 저장
				$('input#oldFile').val(data);	// 변경시 삭제될 파일명
				$('form[role="form"]  input[name="member_picture"]').val(data);
				
				alert("사진이 업로드 되었습니다.");
			},
			error:function(error){
				if(error.status=="302")return;
				alert("현재 사진 업로드가 불가능합니다. \n 관리자에게 연락 바랍니다.");
			}
		});
	}
	
</script>

