package kr.or.ddit.dto;

public class MenuVO {
	private String menu_role;  // 메뉴권한
	private String menu_parent_no;  //상위메뉴id
	private String menu_url;  //메뉴주소
	private String menu_icon;  //메뉴아이콘
	private String menu_no;  //메뉴id
	private String menu_name;  //메뉴이름
	
	public String getMenu_role() {
		return menu_role;
	}
	public void setMenu_role(String menu_role) {
		this.menu_role = menu_role;
	}
	public String getMenu_parent_no() {
		return menu_parent_no;
	}
	public void setMenu_parent_no(String menu_parent_no) {
		this.menu_parent_no = menu_parent_no;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public String getMenu_icon() {
		return menu_icon;
	}
	public void setMenu_icon(String menu_icon) {
		this.menu_icon = menu_icon;
	}
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	
	@Override
	public String toString() {
		return "MenuVO [menu_role=" + menu_role + ", menu_parent_no=" + menu_parent_no + ", menu_url=" + menu_url
				+ ", menu_icon=" + menu_icon + ", menu_no=" + menu_no + ", menu_name=" + menu_name + "]";
	}

	
}
