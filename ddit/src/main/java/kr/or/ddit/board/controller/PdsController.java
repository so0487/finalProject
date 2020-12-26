package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.PostService;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.PostVO;
import kr.or.ddit.request.ModifyPdsRequest;
import kr.or.ddit.request.RegistPostRequest;
import kr.or.ddit.request.SearchCriteria;

@Controller
@RequestMapping("/board/pds")
public class PdsController {
	@Autowired
	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Autowired
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Autowired
	private PostService postService;

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	@Resource(name = "pdsfileUploadPath")
	private String pdsfileUploadPath;
	
	@RequestMapping("/registForm")
	public String registForm(String error, HttpServletResponse response, HttpServletRequest request, String board_no)
			throws SQLException {
		board_no = request.getParameter("board_no");
		String url = "board/pds/pdsRegistForm.page";

		return url;
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST, produces = "text/plain;char=utf-8")
	public void regist(RegistPostRequest registReq, HttpServletResponse response, HttpServletRequest request)
			throws SQLException {
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PostVO post = registReq.toPostVO();
			
			List<AttachVO> attachList = saveFile(registReq);
			
			post.setAttachList(attachList);
			
			postService.pdsRegistPost(post);
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록 되었습니다.')");
			out.println("location.href='" + request.getContextPath()
					+ "/board/list.do?board=pds&board_no=BOARD005';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("등록실패.");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private List<AttachVO> saveFile(RegistPostRequest registReq) throws Exception {
		String pdsfileUploadPath = this.pdsfileUploadPath;
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if (registReq.getUploadFile() != null) {
			for (MultipartFile multi : registReq.getUploadFile()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
				File target = new File(pdsfileUploadPath, fileName);

				if (!target.exists()) {
					target.mkdirs();
				}
				multi.transferTo(target);

				AttachVO attach = new AttachVO();

				attach.setAttach_upload_path(pdsfileUploadPath);
				attach.setAttach_name(fileName);
				attach.setAttach_original_name(multi.getOriginalFilename());
				attach.setAttach_type(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
				
				attachList.add(attach);
			}
		}
		return attachList;
	}
	

	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest requset, SearchCriteria cri, ModelAndView mnv, String board_no)
			throws SQLException {
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
	public ModelAndView detail(String post_no, ModelAndView mnv, HttpServletResponse response) throws SQLException, IOException {
		String url = "board/pds/pdsDetail.page";
		
		PostVO post = postService.getPostByNo(post_no);
		
		response.setContentType("text/html; charset=utf-8");
		
		List<AttachVO> attachList = post.getAttachList();
		
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				String fileName = attach.getAttach_name().split("\\$\\$")[1];	
				attach.setAttach_name(fileName);
			} 
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('리스트 출력 실패');</script>");
		}
		
		mnv.addObject("post", post);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	@RequestMapping("/remove")
	public void remove(PostVO post, HttpServletResponse response, HttpServletRequest request) throws SQLException {
		response.setContentType("text/html;charset=utf-8");
		postService.removePost(post);
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다.')");
			out.println("location.href='" + request.getContextPath()
					+ "/board/pds/list.do?board=pds&board_no=BOARD005';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String post_no, ModelAndView mnv)
			throws SQLException {
		String url = "board/pds/pdsModifyForm.page";

		PostVO post = postService.getPostByNo(post_no);

		//파일명 재정의
		List<AttachVO> attachList = post.getAttachList();
		if(attachList!=null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttach_name().split("\\$\\$")[1];
				attach.setAttach_name(fileName);
			}
		}
		mnv.addObject("post",post);
		mnv.setViewName(url);

		return mnv;
	}
	
	
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public void modifyPost(ModifyPdsRequest modifyReq, HttpSession session, HttpServletResponse response) throws Exception{
		String pdsfileUploadPath = this.pdsfileUploadPath;
		//삭제된 파일 삭제
		if(modifyReq.getDeleteFile()!=null && modifyReq.getDeleteFile().length>0) {
			for(String attach_no : modifyReq.getDeleteFile()) {
				String fileName = attachDAO.selectAttachByAttachNo(attach_no).getAttach_name();
				File deleteFile = new File(pdsfileUploadPath,fileName);
				if(deleteFile.exists()) {
					attachDAO.deleteAttach(attach_no);
					deleteFile.delete();
				}
			}
		}
		
		//추가 혹은 변경될 파일 저장
		List<AttachVO>attachList = saveFile(modifyReq);
		PostVO post = modifyReq.toPostVO();
		for(AttachVO attach : attachList) {
			attach.setPost_no(post.getPost_no());
			
		}
		
		post.setAttachList(attachList);
		
		// DB에 해당 데이터 추가
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			postService.modifyPost(post);

			out.println("<script>");
			out.println("alert('수정되었습니다.');");
			out.println("location.href='detail.page?post_no=" + post.getPost_no() + "';");
			out.println("</script>");

		} catch (SQLException e) {
			out.println("<script>");
			out.println("alert('수정이 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}

	}
	
	

	

}