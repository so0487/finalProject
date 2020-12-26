package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.PostService;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/board/qna")
public class QnAController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private AttachDAO attachService;

	@Autowired
	private PostService postService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	@RequestMapping("/main")
	public String main() throws Exception {
		return "";
	}

	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response, HttpServletRequest request, String board_no) {
		board_no = request.getParameter("board_no");
		String url = "board/qna/qnaRegistForm.page";

		return url;
	}

	@RequestMapping("/regist")
	public void regist(PostVO post, HttpServletRequest request, HttpServletResponse response, String board_no)
			throws SQLException {
		board_no = request.getParameter("board_no");
		post.setBoard_no(board_no);
		try {
			response.setContentType("text/html;charset=utf-8");
			postService.qnaRegistPost(post);

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록되었습니다.');");
			out.println("location.href='" + request.getContextPath() + "/board/qna/list.do?board=qna&board_no=BOARD003';");
			out.println("</script>");

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest requset, SearchCriteria cri, ModelAndView mnv, String board_no) {
		String board = requset.getParameter("board");
		board_no = requset.getParameter("board_no");
		String url = "board/" + board + "/" + board + "List.page";

		try {
			Map<String, Object> dataMap = postService.getPostList(cri, board_no);
			mnv.addAllObjects(dataMap);
			mnv.setViewName(url);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mnv;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String post_no, ModelAndView mnv) {

		// Q&A디테일

		String url = "board/qna/qnaDetail.page";

		try {
			PostVO post = postService.getPostByNo(post_no);
			mnv.addObject("post", post);

			mnv.setViewName(url);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mnv;

	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String post_no, @ModelAttribute("cri") SearchCriteria cri, ModelAndView mnv)
			throws SQLException {

		String url = "board/qna/qnaModifyForm.page";

		PostVO post = postService.getPostByNo(post_no);

		mnv.addObject("post", post);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/modify")
	public void modify(PostVO post, HttpServletResponse response) throws Exception {

		postService.modifyPost(post);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.location.reload();");
		out.println("location.href='detail?post_no=" + post.getPost_no() + "';");
		out.println("</script>");
	}

	@RequestMapping("/remove")
	public void remove(PostVO post, HttpServletResponse response, HttpServletRequest request) throws SQLException {
		response.setContentType("text/html;charset=utf-8");
		postService.removePost(post);
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다.')");
			out.println(
					"location.href='" + request.getContextPath() + "/board/qna/list.do?board=qna&board_no=BOARD003';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void profileUpload(String post_no, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + post_no + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("profileUpload/" + post_no + "/" + str_filename);
		out.close();
	}

}