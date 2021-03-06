package com.sang.bok.vo;

public class UserVO {
	private String sabun;
	private String password;
	private String user_nm;
	private String birth_num;
	private String email;
	private String phonenum;
	private String user_position;
	private String team_nm;
	private int    grade;
	
	public UserVO(){}
	public UserVO(String sabun, String password, String user_nm, String birth_num, String email, String phonenum,
			String user_position, String team_nm, int grade) {
		this.sabun = sabun;
		this.password = password;
		this.user_nm = user_nm;
		this.birth_num = birth_num;
		this.email = email;
		this.phonenum = phonenum;
		this.user_position = user_position;
		this.team_nm = team_nm;
		this.grade = grade;
	}
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getBirth_num() {
		return birth_num;
	}
	public void setBirth_num(String birth_num) {
		this.birth_num = birth_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	public String getTeam_nm() {
		return team_nm;
	}
	public void setTeam_nm(String team_nm) {
		this.team_nm = team_nm;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "UserVO [sabun=" + sabun + ", password=" + password + ", user_nm=" + user_nm + ", birth_num=" + birth_num
				+ ", email=" + email + ", phonenum=" + phonenum + ", user_position=" + user_position + ", team_nm="
				+ team_nm + ", grade=" + grade + "]";
	}
	
	
}
