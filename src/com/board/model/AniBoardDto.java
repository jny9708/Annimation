package com.board.model;

import java.util.Date;

public class AniBoardDto {
	int boa_no;
	String boa_title;
	String boa_content;
	Date boa_date;
	int boa_hit;
	int boa_like;
	int mem_no;
	String boa_thum_path;
	
	public int getBoa_no() {
		return boa_no;
	}
	public void setBoa_no(int boa_no) {
		this.boa_no = boa_no;
	}
	public String getBoa_title() {
		return boa_title;
	}
	public void setBoa_title(String boa_title) {
		this.boa_title = boa_title;
	}
	public String getBoa_content() {
		return boa_content;
	}
	public void setBoa_content(String boa_content) {
		this.boa_content = boa_content;
	}
	public Date getBoa_date() {
		return boa_date;
	}
	public void setBoa_date(Date boa_date) {
		this.boa_date = boa_date;
	}
	public int getBoa_hit() {
		return boa_hit;
	}
	public void setBoa_hit(int boa_hit) {
		this.boa_hit = boa_hit;
	}
	public int getBoa_like() {
		return boa_like;
	}
	public void setBoa_like(int boa_like) {
		this.boa_like = boa_like;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getBoa_thum_path() {
		return boa_thum_path;
	}
	public void setBoa_thum_path(String boa_thum_path) {
		this.boa_thum_path = boa_thum_path;
	}
	
}
