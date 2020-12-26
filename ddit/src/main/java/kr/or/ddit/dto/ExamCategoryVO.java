package kr.or.ddit.dto;

public class ExamCategoryVO {
	private String exam_category_no;  //문제카테고리번호
	private String exam_category_name;  //문제카테고리이름
	
	
	public String getExam_category_no() 
	{
		return exam_category_no;
	}
	public void setExam_category_no(String exam_category_no) {
		this.exam_category_no = exam_category_no;
	}
	public String getExam_category_name() {
		return exam_category_name;
	}
	public void setExam_category_name(String exam_category_name) {
		this.exam_category_name = exam_category_name;
	}
	@Override
	public String toString() {
		return "ExamCategoryVO [exam_category_no=" + exam_category_no + ", exam_category_name=" + exam_category_name
				+ "]";
	}
	
	
}
