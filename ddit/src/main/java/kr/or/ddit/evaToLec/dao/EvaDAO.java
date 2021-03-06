
package kr.or.ddit.evaToLec.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.request.SearchCriteria;

public interface EvaDAO {
	List<EvaVO> selectEvaList() throws SQLException;
	
	EvaVO selectEvaByNo(String evalution_no) throws SQLException;;
	
	void insertEva(EvaVO evalution) throws SQLException;
	
	void updateEva(EvaVO evalution) throws SQLException;
	
	void deleteEva(String evalution_no) throws SQLException;
	
	String selectEvaNo() throws SQLException;
	

}
