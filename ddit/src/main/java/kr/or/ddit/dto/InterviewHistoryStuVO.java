package kr.or.ddit.dto;

public class InterviewHistoryStuVO {
	private String interview_no;  //면접id
	private String student_id;  //수강생id
	private String interview_history_stu_result;  //면접결과
	private String interview_history_stu_no;  //면접내역id
	private String interview_history_stu_dicision;  //수강여부결정
	private String student_name;
	private String student_phone;
	
	
	
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_phone() {
		return student_phone;
	}
	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}
	public String getInterview_no() {
		return interview_no;
	}
	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getInterview_history_stu_result() {
		return interview_history_stu_result;
	}
	public void setInterview_history_stu_result(String interview_history_stu_result) {
		this.interview_history_stu_result = interview_history_stu_result;
	}
	public String getInterview_history_stu_no() {
		return interview_history_stu_no;
	}
	public void setInterview_history_stu_no(String interview_history_stu_no) {
		this.interview_history_stu_no = interview_history_stu_no;
	}
	public String getInterview_history_stu_dicision() {
		return interview_history_stu_dicision;
	}
	public void setInterview_history_stu_dicision(String interview_history_stu_dicision) {
		this.interview_history_stu_dicision = interview_history_stu_dicision;
	}
	@Override
	public String toString() {
		return "InterviewHistoryStuVO [interview_no=" + interview_no + ", student_id=" + student_id
				+ ", interview_history_stu_result=" + interview_history_stu_result + ", interview_history_stu_no="
				+ interview_history_stu_no + ", interview_history_stu_dicision=" + interview_history_stu_dicision + "]";
	}
	
	
}
