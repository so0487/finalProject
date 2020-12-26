<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<script>
	$(document).ready(function() {
		$('.summmernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						if(files[i].size > 1024 * 1024 * 10){
		            		alert("이미지는 10MB 미만입니다.");
		            		return;
						}					
					}
					
					for (var i = 0; i < files.length; i++) {
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
	});
	
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '<%=request.getContextPath()%>/resources/img/summernote/uploadImg.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_url) {
				$(el).summernote('editor.insertImage', img_url);
			}
		});
	}
	
	function deleteFile(src) {
		var splitSrc = src.split("=");
		var fileName = splitSrc[splitSrc.length-1];
		
		var fileData = {
			fileName:fileName
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/resources/img/summernote/deleteImg.do",
			data : JSON.stringify(fileData), 
			type : "POST",
			success : function(res) {
				console.log(res);
			}
		});
	}
</script>