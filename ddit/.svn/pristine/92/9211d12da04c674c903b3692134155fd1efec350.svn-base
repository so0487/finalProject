package kr.or.ddit.request;

public class SearchCriteria {
	
	private int page=1; //페이지 번호
	private int perPageNum=10; //한페이지당 리스트 개수
	private String searchType=""; //검색구분
	private String keyword=""; //검색어
	private String board_no;
	private String counsel_member_id;
	private String counsel_member_type;
	
	private String member_type;
	
	
	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getCounsel_member_type() {
		return counsel_member_type;
	}

	public void setCounsel_member_type(String counsel_member_type) {
		this.counsel_member_type = counsel_member_type;
	}

	public String getCounsel_member_id() {
		return counsel_member_id;
	}

	public void setCounsel_member_id(String counsel_member_id) {
		this.counsel_member_id = counsel_member_id;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public SearchCriteria() {
	}
	
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword, String board_no) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.keyword = keyword;
		this.board_no = board_no;
	}
	
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword) {
		super();
		if(page!=null && !page.isEmpty())this.page = Integer.parseInt(page);
		if(perPageNum!=null && !perPageNum.isEmpty())this.perPageNum = Integer.parseInt(perPageNum);
		if(searchType!=null)this.searchType = searchType;
		if(keyword!=null)this.keyword = keyword;
	}	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		if(page!=null && !page.isEmpty())this.page = Integer.parseInt(page);
		
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		if(perPageNum!=null && !perPageNum.isEmpty())this.perPageNum = Integer.parseInt(perPageNum);
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
	
	@Override
	public String toString() {
		return "SearchCriteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType
				+ ", keyword=" + keyword + "]";
	}
	
	public int getPageStartRowNum() { //각페이지마다 시작하는 행번호
		return (this.page-1)*perPageNum;
	}


}


