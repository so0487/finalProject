package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ExamCategoryVO;
import kr.or.ddit.request.SearchCriteria;

public interface ExamCategoryService {
	List<ExamCategoryVO> getExamCategoryList(SearchCriteria cri) throws SQLException;
	
	ExamCategoryVO getExamCategoryByNo(String exam_category_no) throws SQLException;;
	
	void registExamCategory(ExamCategoryVO examcategory) throws SQLException;
	
	void modifyExamCategory(ExamCategoryVO examcategory) throws SQLException;
	
	void removeExamCategory(ExamCategoryVO examcategory) throws SQLException;
}	
