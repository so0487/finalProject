package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CurriculumVO;
import kr.or.ddit.dto.LectureVO;
import kr.or.ddit.request.SearchCriteria;

public class LectureDAOImpl implements LectureDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<LectureVO> selectLectureList() throws SQLException {

		List<LectureVO> lectureList = sqlSession.selectList("Lecture-Mapper.selectLectureList");

		return lectureList;
	}

	@Override
	public LectureVO selectLectureByNo(String lecture_no) throws SQLException {
		LectureVO lecture = sqlSession.selectOne("Lecture-Mapper.selectLectureByNo",lecture_no);
		return lecture;
	}

	@Override
	public void insertLecture(LectureVO lecture) throws SQLException {
		sqlSession.update("Lecture-Mapper.insertLecture",lecture);
		
	}

	@Override
	public void updateLecture(LectureVO lecture) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLecture(LectureVO lecture) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectLectureNo() throws SQLException {
		String lecture_no =sqlSession.selectOne("Lecture-Mapper.selectLectureNo");
		return lecture_no;
	}

	@Override
	public List<LectureVO> selectLectureListByClass_no(String class_no) throws SQLException {
		List<LectureVO> lectureList = sqlSession.selectList("Lecture-Mapper.selectLectureListByClass_no",class_no);
		
		return lectureList;
	}

	@Override
	public List<LectureVO> selectLectureByPro(String professor_id) throws SQLException {
		List<LectureVO> lectureList = sqlSession.selectList("Lecture-Mapper.selectLectureByPro",professor_id);
		return lectureList;
	}

}
