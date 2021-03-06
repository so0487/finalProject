package kr.or.ddit.dto;

public class TestHistoryVO {
	private String student_id;  //수강생id
	private String test_history_no;  //시험내역번호
	private int test_history_score;  //시험점수
	private String test_no;  //시험번호
	private String test_history_submit; //시험 제출여부
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getTest_history_no() {
		return test_history_no;
	}
	public void setTest_history_no(String test_history_no) {
		this.test_history_no = test_history_no;
	}
	public int getTest_history_score() {
		return test_history_score;
	}
	public void setTest_history_score(int test_history_score) {
		this.test_history_score = test_history_score;
	}
	public String getTest_no() {
		return test_no;
	}
	public void setTest_no(String test_no) {
		this.test_no = test_no;
	}


	public String getTest_history_submit() {
		return test_history_submit;
	}
	public void setTest_history_submit(String test_history_submit) {
		this.test_history_submit = test_history_submit;
	}
	@Override
	public String toString() {
		return "TestHistoryVO [student_id=" + student_id + ", test_history_no=" + test_history_no
				+ ", test_history_score=" + test_history_score + ", test_no=" + test_no + ", test_history_submit="
				+ test_history_submit + "]";
	}
	

	
	
	
}
