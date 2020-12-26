package kr.or.ddit.evaToLec.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.EvaToLecVO;
import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.evaToLec.dao.EvaToLecDAO;
import kr.or.ddit.request.SearchCriteria;

public class EvaToLecServiceImpl implements EvaToLecService {
	private EvaToLecDAO evaToLecDAO;

	public void setEvaToLecDAO(EvaToLecDAO evaToLecDAO) {
		this.evaToLecDAO = evaToLecDAO;
	}

	@Override
	public List<EvaToLecVO> getEvaToLecList() throws SQLException {

		List<EvaToLecVO> evaToLecList = evaToLecDAO.selectEvaToLecList();
		return evaToLecList;
	}

	@Override
	public EvaToLecVO getEvaToLecByNo(String eva_to_lec_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registEvaToLec(EvaToLecVO evatolec) throws SQLException {
		evaToLecDAO.insertEvaToLec(evatolec);
		
	}

	@Override
	public void modifyEvaToLec(EvaToLecVO evatolec) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeEvaToLec(EvaToLecVO evatolec) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getEva_to_lecNo() throws SQLException {
		return evaToLecDAO.selectEva_to_lecNo();
	}

	@Override
	public List<EvaToLecVO> getEva_to_lecByLectureNo(String lecture_no) throws SQLException {
		return evaToLecDAO.selectEva_to_lecByLectureNo(lecture_no);
	}

}