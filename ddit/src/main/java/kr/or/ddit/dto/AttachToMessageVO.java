package kr.or.ddit.dto;

public class AttachToMessageVO {
	private String message_no;
	private String file_type;
	private String file_name;
	private String upload_path;
	private String attach_no;
	
	
	public String getMessage_no() {
		return message_no;
	}
	public void setMessage_no(String message_no) {
		this.message_no = message_no;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getUpload_path() {
		return upload_path;
	}
	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
	public String getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	
	
	@Override
	public String toString() {
		return "AttachToMessageVO [message_no=" + message_no + ", file_type=" + file_type + ", file_name=" + file_name
				+ ", upload_path=" + upload_path + ", attach_no=" + attach_no + "]";
	}
	
	
}
