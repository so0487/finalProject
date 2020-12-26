package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ExamVO;
import kr.or.ddit.dto.ExampleVO;
import kr.or.ddit.exam.dao.ExampleDAO;
import kr.or.ddit.request.SearchCriteria;

public class ExampleServiceImpl implements ExampleService {
	private ExampleDAO exampleDAO;

	public void setExampleDAO(ExampleDAO exampleDAO) {
		this.exampleDAO = exampleDAO;
	}

	@Override
	public List<ExampleVO> getExampleList() throws SQLException {
		
		return exampleDAO.selectExampleList();
	}

	@Override
	public ExampleVO getExampleByNo(String example_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registExample(ExampleVO example) throws SQLException {
		example.setExample_no(exampleDAO.selectExampleNo());
		exampleDAO.insertExample(example);
	}

	@Override
	public void modifyExample(ExampleVO example) throws SQLException {
		exampleDAO.updateExample(example);	
	}

	@Override
	public void removeExample(String example_no) throws SQLException {
		exampleDAO.deleteExample(example_no);	
	}


	
}
