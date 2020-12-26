package kr.or.ddit.request;

import kr.or.ddit.dto.ReplyVO;

public class RegistReplyRequest {
	private String post_no;
	private String reply_writer;
	private String reply_content;

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	@Override
	public String toString() {
		return "RegistReplyRequest [post_no=" + post_no + ", reply_writer=" + reply_writer + ", reply_content="
				+ reply_content + "]";
	}

	public RegistReplyRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RegistReplyRequest(String post_no, String reply_writer, String reply_content) {
		super();
		this.post_no = post_no;
		this.reply_writer = reply_writer;
		this.reply_content = reply_content;
	}

	public ReplyVO toReplyVO() {
		ReplyVO reply = new ReplyVO();
		reply.setPost_no(post_no);
		reply.setReply_writer(reply_writer);
		reply.setReply_content(reply_content);

		return reply;
	}
}
