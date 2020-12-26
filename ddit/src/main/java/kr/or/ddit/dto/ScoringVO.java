package kr.or.ddit.dto;

public class ScoringVO {
	private String test_history_no;  //시험내역번호
	private String scoring_input;  //입력한정답
	private String scoring_no;  //채점내역번호
	private String exam_no;  //시험문제번호
	private String scoring_result;  //정답여부
	
	
	public String getTest_history_no() {
		return test_history_no;
	}
	public void setTest_history_no(String test_history_no) {
		this.test_history_no = test_history_no;
	}
	public String getScoring_input() {
		return scoring_input;
	}
	public void setScoring_input(String scoring_input) {
		this.scoring_input = scoring_input;
	}
	public String getScoring_no() {
		return scoring_no;
	}
	public void setScoring_no(String scoring_no) {
		this.scoring_no = scoring_no;
	}
	public String getExam_no() {
		return exam_no;
	}
	public void setExam_no(String exam_no) {
		this.exam_no = exam_no;
	}
	public String getScoring_result() {
		return scoring_result;
	}
	public void setScoring_result(String scoring_result) {
		this.scoring_result = scoring_result;
	}
	@Override
	public String toString() {
		return "ScoringVO [test_history_no=" + test_history_no + ", scoring_input=" + scoring_input + ", scoring_no="
				+ scoring_no + ", exam_no=" + exam_no + ", scoring_result=" + scoring_result + "]";
	}
	
	
	
}
