package kr.or.ddit.dto;

public class InterviewHistoryProVO {
	private String interview_no;  //면접id
	private String interview_history_pro_no;  //면접참여내역
	private String professor_id;  //강사id
	
	public String getInterview_no() {
		return interview_no;
	}
	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}
	public String getInterview_history_pro_no() {
		return interview_history_pro_no;
	}
	public void setInterview_history_pro_no(String interview_history_pro_no) {
		this.interview_history_pro_no = interview_history_pro_no;
	}
	public String getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	@Override
	public String toString() {
		return "InterviewHistoryProVO [interview_no=" + interview_no + ", interview_history_pro_no="
				+ interview_history_pro_no + ", professor_id=" + professor_id + "]";
	}
	
	
}
