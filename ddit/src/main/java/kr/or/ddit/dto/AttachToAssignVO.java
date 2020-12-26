package kr.or.ddit.dto;

public class AttachToAssignVO {
	private String attach_name; //파일 이름
	private String attach_type; //파일유형
	private String attach_upload_path; //파일 경로
	private String attach_no;  //첨부파일 번호
	private String assignment_history_no;  //과제내역id
	private String attach_original_name; //첨부파일 원본이름
	

	public String getAttach_name() {
		return attach_name;
	}
	public void setAttach_name(String attach_name) {
		this.attach_name = attach_name;
	}
	public String getAttach_type() {
		return attach_type;
	}
	public void setAttach_type(String attach_type) {
		this.attach_type = attach_type;
	}
	public String getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	public String getAssignment_history_no() {
		return assignment_history_no;
	}
	public void setAssignment_history_no(String assignment_history_no) {
		this.assignment_history_no = assignment_history_no;
	}


	public String getAttach_original_name() {
		return attach_original_name;
	}
	public void setAttach_original_name(String attach_original_name) {
		this.attach_original_name = attach_original_name;
	}
	public String getAttach_upload_path() {
		return attach_upload_path;
	}
	public void setAttach_upload_path(String attach_upload_path) {
		this.attach_upload_path = attach_upload_path;
	}
	@Override
	public String toString() {
		return "AttachToAssignVO [attach_name=" + attach_name + ", attach_type=" + attach_type + ", attach_upload_path="
				+ attach_upload_path + ", attach_no=" + attach_no + ", assignment_history_no=" + assignment_history_no
				+ ", attach_original_name=" + attach_original_name + "]";
	}


	
	
}
