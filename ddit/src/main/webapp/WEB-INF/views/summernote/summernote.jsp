<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script>
$(function(){

	$('#post_content').summernote({
		placeholder:'여기에 내용을 적으세요.',
		height:250,
		disableResizeEditor: true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				//file size check!
				for (var i = files.length - 1; i >= 0; i--) {
					if(files[i].size > 1024*1024*5){
	            		alert("이미지는 5MB 미만입니다.");
	            		return;
					}					
				}
				//file sending
				for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
			},
			onMediaDelete : function(target) {
				var answer = confirm("정말 이미지를 삭제하겠습니까?");
				if(answer){
					deleteFile(target[0].src);
				}
			}
		}
	});
	
	$('.summernote').summernote({
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
	
});

function sendFile(file, el) {
	
	var form_data = new FormData();
		form_data.append("file", file); 
		$.ajax({
	    	data: form_data,
	    	type: "POST",
	    	url: '<%=request.getContextPath()%>/uploadImg.do',
	    	cache: false,
	    	contentType: false,	    	
	    	processData: false,
	    	success: function(img_url) {
	      		$(el).summernote('editor.insertImage', img_url);
	    	}
	  	});
	}
	
	function deleteFile(src){
		var splitSrc = src.split("=");
		var fileName = splitSrc[splitSrc.length-1];
		
		//alert(fileName)
		var fileData = {
			fileName:fileName
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/deleteImg.do",
			data : JSON.stringify(fileData), //JSON형태로 serialize하여 보낸다.
			type : "post",
			success : function(res) {
				console.log(res);
			}
		})

	}
	
</script>