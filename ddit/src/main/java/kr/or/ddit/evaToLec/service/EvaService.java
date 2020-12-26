package kr.or.ddit.evaToLec.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.request.SearchCriteria;

public interface EvaService {
	List<EvaVO> getEvaList() throws SQLException;
	
	EvaVO getEvaByNo(String evalution_no) throws SQLException;;
	
	void registEva(EvaVO evalution) throws SQLException;
	
	void modifyEva(EvaVO evalution) throws SQLException;
	
	void removeEva(String evalution_no) throws SQLException;
	
	String getEvaNo() throws SQLException;
}
