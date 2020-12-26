package kr.or.ddit.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.MessageVO;

public class RegistMessageRequest {
	private String message_title;
	private String message_content;
	private String message_sender;
	private String message_receiver;
	private List<MultipartFile> uploadFile;

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public MessageVO toMessageVO() {
		MessageVO message = new MessageVO();
		message.setMessage_title(this.message_title);
		message.setMessage_content(this.message_content);
		message.setMessage_sender(this.message_sender);
		message.setMessage_receiver(this.message_receiver);
	
		return message;

	}

}
