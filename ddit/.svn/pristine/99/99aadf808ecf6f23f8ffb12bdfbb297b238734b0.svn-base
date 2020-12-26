package kr.or.ddit.evaToLec.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.EvaToLecVO;
import kr.or.ddit.request.SearchCriteria;

public interface EvaToLecService {
	List<EvaToLecVO> getEvaToLecList() throws SQLException;
	
	EvaToLecVO getEvaToLecByNo(String eva_to_lec_no) throws SQLException;;
	
	void registEvaToLec(EvaToLecVO evatolec) throws SQLException;
	
	void modifyEvaToLec(EvaToLecVO evatolec) throws SQLException;
	
	void removeEvaToLec(EvaToLecVO evatolec) throws SQLException;
	
	String getEva_to_lecNo() throws SQLException;
	
	List<EvaToLecVO> getEva_to_lecByLectureNo(String lecture_no) throws SQLException;
}
