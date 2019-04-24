package com.board.model;

import java.util.ArrayList;
import java.util.Date;
import com.member.model.MemberDto;

public class ProBoardDto {

	int boa_no;  
	String boa_category;
	String boa_title;
	String boa_teamname;
	String boa_format;
	String boa_experi;
	String boa_con_method;
	String boa_job;
	int boa_progress;
	int boa_num;
	String boa_con_address;
	Date boa_rec_deadline;
	String boa_size;
	String boa_pro_period;
	String boa_contents;
	int boa_hit;
	Date boa_reg_date;
	int mem_no;
	String mem_nickname;
	String mem_icon;
	String mem_job;
	int app_number;
	int boa_d_day;
	ArrayList<String> boa_hashtag = new ArrayList<String>();
	//MemberDto MemberDto;
	
	public String getMem_job() {
		return mem_job;
	}
	public void setMem_job(String mem_job) {
		this.mem_job = mem_job;
	}
	public ArrayList<String> getBoa_hashtag() {
		return boa_hashtag;
	}
	public void setBoa_hashtag(ArrayList<String> boa_hashtag) {
		this.boa_hashtag = boa_hashtag;
	}
	public int getBoa_d_day() {
		return boa_d_day;
	}
	public void setBoa_d_day(int boa_d_day) {
		this.boa_d_day = boa_d_day;
	}
	public int getApp_number() {
		return app_number;
	}
	public void setApp_number(int app_number) {
		this.app_number = app_number;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_icon() {
		return mem_icon;
	}
	public void setMem_icon(String mem_icon) {
		this.mem_icon = mem_icon;
	}
	/*public MemberDto getMemberDto() {
		return MemberDto;
	}
	public void setMemberDto(MemberDto memberDto) {
		MemberDto = memberDto;
	}*/
	public int getBoa_no() {
		return boa_no;
	}
	public void setBoa_no(int boa_no) {
		this.boa_no = boa_no;
	}
	public String getBoa_category() {
		return boa_category;
	}
	public void setBoa_category(String boa_category) {
		this.boa_category = boa_category;
	}
	public String getBoa_title() {
		return boa_title;
	}
	public void setBoa_title(String boa_title) {
		this.boa_title = boa_title;
	}
	public String getBoa_teamname() {
		return boa_teamname;
	}
	public void setBoa_teamname(String boa_teamname) {
		this.boa_teamname = boa_teamname;
	}
	public String getBoa_format() {
		return boa_format;
	}
	public void setBoa_format(String boa_format) {
		this.boa_format = boa_format;
	}
	public String getBoa_experi() {
		return boa_experi;
	}
	public void setBoa_experi(String boa_experi) {
		this.boa_experi = boa_experi;
	}
	public String getBoa_con_method() {
		return boa_con_method;
	}
	public void setBoa_con_method(String boa_con_method) {
		this.boa_con_method = boa_con_method;
	}
	public String getBoa_job() {
		return boa_job;
	}
	public void setBoa_job(String boa_job) {
		this.boa_job = boa_job;
	}
	public int getBoa_progress() {
		return boa_progress;
	}
	public void setBoa_progress(int boa_progress) {
		this.boa_progress = boa_progress;
	}
	public int getBoa_num() {
		return boa_num;
	}
	public void setBoa_num(int boa_num) {
		this.boa_num = boa_num;
	}
	public String getBoa_con_address() {
		return boa_con_address;
	}
	public void setBoa_con_address(String boa_con_address) {
		this.boa_con_address = boa_con_address;
	}
	public Date getBoa_rec_deadline() {
		return boa_rec_deadline;
	}
	public void setBoa_rec_deadline(Date boa_rec_deadline) {
		this.boa_rec_deadline = boa_rec_deadline;
	}
	public String getBoa_size() {
		return boa_size;
	}
	public void setBoa_size(String boa_size) {
		this.boa_size = boa_size;
	}
	public String getBoa_pro_period() {
		return boa_pro_period;
	}
	public void setBoa_pro_period(String boa_pro_period) {
		this.boa_pro_period = boa_pro_period;
	}
	public String getBoa_contents() {
		return boa_contents;
	}
	public void setBoa_contents(String boa_contents) {
		this.boa_contents = boa_contents;
	}
	public int getBoa_hit() {
		return boa_hit;
	}
	public void setBoa_hit(int boa_hit) {
		this.boa_hit = boa_hit;
	}
	public Date getBoa_reg_date() {
		return boa_reg_date;
	}
	public void setBoa_reg_date(Date boa_reg_date) {
		this.boa_reg_date = boa_reg_date;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	
}
