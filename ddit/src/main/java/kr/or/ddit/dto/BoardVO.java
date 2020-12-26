package kr.or.ddit.dto;

public class BoardVO {
	private String board_no;  //게시판번호
	private String board_status;  //상태
	private String board_name;  //게시판이름
	
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_status() {
		return board_status;
	}
	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_name=" + board_name + ", board_status=" + board_status + "]";
	}
	
	
}
