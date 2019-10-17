package com.spring.board.dto;

public class LoginDto {
	
	String login_id;
	String login_pw;
	String result;
	
	public String getLogin_id() {
		return login_id;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pw() {
		return login_pw;
	}
	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}
}
