package kr.or.ddit.exam.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ExamCategoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface ExamCategoryDAO {
	List<ExamCategoryVO> selectExamCategoryList(SearchCriteria cri) throws SQLException;
	
	ExamCategoryVO selectExamCategoryByNo(String exam_category_no) throws SQLException;;
	
	void insertExamCategory(ExamCategoryVO examcategory) throws SQLException;
	
	void updateExamCategory(ExamCategoryVO examcategory) throws SQLException;
	
	void deleteExamCategory(ExamCategoryVO examcategory) throws SQLException;
	
	 String selectExamCateNo() throws SQLException;
}
