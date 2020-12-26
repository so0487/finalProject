package kr.or.ddit.request;

import kr.or.ddit.dto.PostVO;

public class ModifyPostRequest extends RegistPostRequest {
	private String post_no;
	private String[] deleteFile;

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}

	@Override
	public PostVO toPostVO() {
		PostVO post = super.toPostVO();
		post.setPost_no(this.post_no);
		return post;
	}

}
