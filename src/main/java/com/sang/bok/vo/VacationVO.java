package com.sang.bok.vo;

public class VacationVO {
	private int idx;
	private String sabun;
	private String assigned_tsk;
	private String bsns_tkvr;
	private String vacation_type;
	private String vacation_cont;
	private String vacation_stt;
	private String vacation_end;
	private String emrgn_num;
	private String reviewers;
	private String approver;
	private String reviewaiting;
	private String approverwaiting;
	private String regdate;
	
	public VacationVO(){}

	public VacationVO(int idx, String sabun, String assigned_tsk, String bsns_tkvr, String vacation_type,
			String vacation_cont, String vacation_stt, String vacation_end, String emrgn_num, String reviewers,
			String approver, String reviewaiting, String approverwaiting, String regdate) {
		super();
		this.idx = idx;
		this.sabun = sabun;
		this.assigned_tsk = assigned_tsk;
		this.bsns_tkvr = bsns_tkvr;
		this.vacation_type = vacation_type;
		this.vacation_cont = vacation_cont;
		this.vacation_stt = vacation_stt;
		this.vacation_end = vacation_end;
		this.emrgn_num = emrgn_num;
		this.reviewers = reviewers;
		this.approver = approver;
		this.reviewaiting = reviewaiting;
		this.approverwaiting = approverwaiting;
		this.regdate = regdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSabun() {
		return sabun;
	}

	public void setSabun(String sabun) {
		this.sabun = sabun;
	}

	public String getAssigned_tsk() {
		return assigned_tsk;
	}

	public void setAssigned_tsk(String assigned_tsk) {
		this.assigned_tsk = assigned_tsk;
	}

	public String getBsns_tkvr() {
		return bsns_tkvr;
	}

	public void setBsns_tkvr(String bsns_tkvr) {
		this.bsns_tkvr = bsns_tkvr;
	}

	public String getVacation_type() {
		return vacation_type;
	}

	public void setVacation_type(String vacation_type) {
		this.vacation_type = vacation_type;
	}

	public String getVacation_cont() {
		return vacation_cont;
	}

	public void setVacation_cont(String vacation_cont) {
		this.vacation_cont = vacation_cont;
	}

	public String getVacation_stt() {
		return vacation_stt;
	}

	public void setVacation_stt(String vacation_stt) {
		this.vacation_stt = vacation_stt;
	}

	public String getVacation_end() {
		return vacation_end;
	}

	public void setVacation_end(String vacation_end) {
		this.vacation_end = vacation_end;
	}

	public String getEmrgn_num() {
		return emrgn_num;
	}

	public void setEmrgn_num(String emrgn_num) {
		this.emrgn_num = emrgn_num;
	}

	public String getReviewers() {
		return reviewers;
	}

	public void setReviewers(String reviewers) {
		this.reviewers = reviewers;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getReviewaiting() {
		return reviewaiting;
	}

	public void setReviewaiting(String reviewaiting) {
		this.reviewaiting = reviewaiting;
	}

	public String getApproverwaiting() {
		return approverwaiting;
	}

	public void setApproverwaiting(String approverwaiting) {
		this.approverwaiting = approverwaiting;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "VacationVO [idx=" + idx + ", sabun=" + sabun + ", assigned_tsk=" + assigned_tsk + ", bsns_tkvr="
				+ bsns_tkvr + ", vacation_type=" + vacation_type + ", vacation_cont=" + vacation_cont
				+ ", vacation_stt=" + vacation_stt + ", vacation_end=" + vacation_end + ", emrgn_num=" + emrgn_num
				+ ", reviewers=" + reviewers + ", approver=" + approver + ", reviewaiting=" + reviewaiting
				+ ", approverwaiting=" + approverwaiting + ", regdate=" + regdate + "]";
	}
}
