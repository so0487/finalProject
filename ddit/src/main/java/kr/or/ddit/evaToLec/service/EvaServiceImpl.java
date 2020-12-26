package kr.or.ddit.evaToLec.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.evaToLec.dao.EvaDAO;
import kr.or.ddit.request.SearchCriteria;

public class EvaServiceImpl implements EvaService {
	private EvaDAO evaDAO;

	public void setEvaDAO(EvaDAO evaDAO) {
		this.evaDAO = evaDAO;
	}

	@Override
	public List<EvaVO> getEvaList() throws SQLException {
		
		List<EvaVO> evaList = evaDAO.selectEvaList();
		return evaList;
	}

	@Override
	public EvaVO getEvaByNo(String evalution_no) throws SQLException {
		EvaVO eva = evaDAO.selectEvaByNo(evalution_no);
		return eva;
	}

	@Override
	public void registEva(EvaVO evalution) throws SQLException {
		evaDAO.insertEva(evalution);
		
	}

	@Override
	public void modifyEva(EvaVO evalution) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeEva(String evalution_no) throws SQLException {
		evaDAO.deleteEva(evalution_no);
	}

	@Override
	public String getEvaNo() throws SQLException {
		String evalution_no = evaDAO.selectEvaNo();
		return evalution_no;
	}


	
}
