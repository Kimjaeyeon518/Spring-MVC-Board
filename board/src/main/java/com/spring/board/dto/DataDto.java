package com.spring.board.dto;

import java.util.Date;
import java.util.List;

public class DataDto extends CommonDto {
	int data_seq;
	String data_subject;
	int data_hits;
	String ins_date;
	String upd_date;
	String data_content;
	String del_yn;
	String data_pw;
	String result;
	
	List<DataFileDto> files;
	
	public int getData_seq() {
		return data_seq;
	}
	public void setData_seq(int data_seq) {
		this.data_seq = data_seq;
	}
	public String getData_subject() {
		return data_subject;
	}
	public List<DataFileDto> getFiles() {
		return files;
	}
	public void setFiles(List<DataFileDto> list) {
		this.files = list;
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
	public String getIns_date() {
		return ins_date;
	}
	public void setIns_date(String ins_date) {
		this.ins_date = ins_date;
	}
	public String getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(String upd_date) {
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
}
