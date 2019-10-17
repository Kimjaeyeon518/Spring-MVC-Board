package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DataForm extends CommonForm {
	
	List<MultipartFile> files;
	String data_subject;
	int data_seq;
	int data_hits;
	Date ins_date;
	Date upd_date;
	String data_content;
	String del_yn;
	String data_pw;
	String result;
	String search_type;
	String data_file;
	

	public String getData_file() {
		return data_file;
	}
	public void setData_file(String data_file) {
		this.data_file = data_file;
	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public int getData_seq() {
		return data_seq;
	}
	public void setData_seq(int data_seq) {
		this.data_seq = data_seq;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getData_subject() {
		return data_subject;
	}
	public void setData_subject(String data_subject) {
		this.data_subject = data_subject;
	}
	public int getData_hits() {
		return data_hits;
	}
	public void setData_hits(int data_hits) {
		this.data_hits = data_hits;
	}
	public Date getIns_date() {
		return ins_date;
	}
	public void setIns_date(Date ins_date) {
		this.ins_date = ins_date;
	}
	public Date getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}
	public String getData_content() {
		return data_content;
	}
	public void setData_content(String data_content) {
		this.data_content = data_content;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getData_pw() {
		return data_pw;
	}
	public void setData_pw(String data_pw) {
		this.data_pw = data_pw;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
}
