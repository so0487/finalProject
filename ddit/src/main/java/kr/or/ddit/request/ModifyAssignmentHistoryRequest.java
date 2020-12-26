package kr.or.ddit.request;

import kr.or.ddit.dto.AssignmentHistoryVO;


public class ModifyAssignmentHistoryRequest extends RegistAssignmentHistoryRequest{
	private String assignment_history_no;
	private String[] deleteFile;



	public String[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}


	public String getAssignment_history_no() {
		return assignment_history_no;
	}

	public void setAssignment_history_no(String assignment_history_no) {
		this.assignment_history_no = assignment_history_no;
	}

	@Override
	public AssignmentHistoryVO toAssignmentHistoryVO() {
		AssignmentHistoryVO assignHistory = super.toAssignmentHistoryVO();
		assignHistory.setAssignment_history_no(this.assignment_history_no);
		return assignHistory;
	}	
}
