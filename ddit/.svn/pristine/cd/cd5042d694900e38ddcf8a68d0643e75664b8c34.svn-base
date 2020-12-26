package kr.or.ddit.board.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.PostService;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private AttachDAO attachService;

	@Autowired
	private PostService postService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest requset, SearchCriteria cri, ModelAndView mnv) {
		String board = requset.getParameter("board");
		String board_no = requset.getParameter("board_no");
		String url = "board/"+board+"/"+board+"List.page";

		try {
			Map<String, Object> dataMap = postService.getPostList(cri, board_no);
			mnv.addAllObjects(dataMap);
			mnv.setViewName(url);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mnv;
	}


}
