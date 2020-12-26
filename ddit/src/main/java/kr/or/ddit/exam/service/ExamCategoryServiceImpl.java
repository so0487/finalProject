package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ExamCategoryVO;
import kr.or.ddit.exam.dao.ExamCategoryDAO;
import kr.or.ddit.request.SearchCriteria;

public class ExamCategoryServiceImpl implements ExamCategoryService {
	private ExamCategoryDAO examCategoryDAO;

	public void setExamCategoryDAO(ExamCategoryDAO examCategoryDAO) {
		this.examCategoryDAO = examCategoryDAO;
	}

	@Override
	public List<ExamCategoryVO> getExamCategoryList(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExamCategoryVO getExamCategoryByNo(String exam_category_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeExamCategory(ExamCategoryVO examcategory) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
