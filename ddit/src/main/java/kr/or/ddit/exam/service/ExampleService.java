package kr.or.ddit.exam.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ExamVO;
import kr.or.ddit.dto.ExampleVO;
import kr.or.ddit.request.SearchCriteria;

public interface ExampleService {
	List<ExampleVO> getExampleList() throws SQLException;
	
	ExampleVO getExampleByNo(String example_no) throws SQLException;;
	
	void registExample(ExampleVO example) throws SQLException;
	
	void modifyExample(ExampleVO example) throws SQLException;
	
	void removeExample(String example_no) throws SQLException;
	

}
