package kr.or.ddit.exam.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ExampleVO;
import kr.or.ddit.request.SearchCriteria;

public interface ExampleDAO {
	List<ExampleVO> selectExampleList() throws SQLException;
	
	ExampleVO selectExampleByNo(String example_no) throws SQLException;;
	
	void insertExample(ExampleVO example) throws SQLException;
	
	void updateExample(ExampleVO example) throws SQLException;
	
	void deleteExample(String example_no) throws SQLException;
	
	String selectExampleNo() throws SQLException;
}
