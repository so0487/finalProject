package kr.or.ddit.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.AssignmentHistoryVO;


public class RegistAssignmentHistoryRequest {
	private String assignment_history_name;  //과제제출명
	private String assignment_history_content;  //과제제출내용	
	private String assignment_no; //과제 번호
	private String student_id; //작성자 아이디
	private String lecture_no; //강의번호
	
	private List<MultipartFile> uploadFile;

	public String getAssignment_history_name() {
		return assignment_history_name;
	}

	public void setAssignment_history_name(String assignment_history_name) {
		this.assignment_history_name = assignment_history_name;
	}

	public String getAssignment_history_content() {
		return assignment_history_content;
	}

	public void setAssignment_history_content(String assignment_history_content) {
		this.assignment_history_content = assignment_history_content;
	}


	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}


	
	public AssignmentHistoryVO toAssignmentHistoryVO() {
		AssignmentHistoryVO assign = new AssignmentHistoryVO();
		assign.setAssignment_history_content(this.assignment_history_content);
		assign.setAssignment_history_name(this.assignment_history_name);		
		assign.setAssignment_no(this.assignment_no);
		assign.setStudent_id(this.student_id);
		assign.setLecture_no(this.lecture_no);
		return assign;
	}

	public String getAssignment_no() {
		return assignment_no;
	}

	public void setAssignment_no(String assignment_no) {
		this.assignment_no = assignment_no;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	@Override
	public String toString() {
		return "registAssignmentHistoryRequest [assignment_history_name=" + assignment_history_name
				+ ", assignment_history_content=" + assignment_history_content + ", assignment_no=" + assignment_no
				+ ", student_id=" + student_id + ", uploadFile=" + uploadFile + "]";
	}

	public String getLecture_no() {
		return lecture_no;
	}

	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}
	
}
