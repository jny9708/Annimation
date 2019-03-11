package com.member.model;

import java.util.Date;

public class MemberDto {

	int mem_no;
	String mem_id;
	String mem_email;
	String mem_password;
	String mem_username;
	String mem_nickname;
	String mem_homepage;
	String mem_phone;
	String mem_job;
	int mem_email_cert;
	Date mem_register_datetime;
	int mem_is_admin;
	String mem_profile_content;
	String mem_icon;
	
	public int getMem_no() {
		return mem_no;
	}
	public MemberDto setMem_no(int mem_no) {
		this.mem_no = mem_no;
		return this;
	}
	public String getMem_id() {
		return mem_id;
	}
	public MemberDto setMem_id(String mem_id) {
		this.mem_id = mem_id;
		return this;
	}
	public String getMem_email() {
		return mem_email;
	}
	public MemberDto setMem_email(String mem_email) {
		this.mem_email = mem_email;
		return this;
	}
	public String getMem_password() {
		return mem_password;
	}
	public MemberDto setMem_password(String mem_password) {
		this.mem_password = mem_password;
		return this;
	}
	public String getMem_username() {
		return mem_username;
	}
	public MemberDto setMem_username(String mem_username) {
		this.mem_username = mem_username;
		return this;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public MemberDto setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
		return this;
	}
	public String getMem_homepage() {
		return mem_homepage;
	}
	public MemberDto setMem_homepage(String mem_homepage) {
		this.mem_homepage = mem_homepage;
		return this;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public MemberDto setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
		return this;
	}
	public String getMem_job() {
		return mem_job;
	}
	public MemberDto setMem_job(String mem_job) {
		this.mem_job = mem_job;
		return this;
	}
	public int getMem_email_cert() {
		return mem_email_cert;
	}
	public MemberDto setMem_email_cert(int mem_email_cert) {
		this.mem_email_cert = mem_email_cert;
		return this;
	}
	public Date getMem_register_datetime() {
		return mem_register_datetime;
	}
	public MemberDto setMem_register_datetime(Date mem_register_datetime) {
		this.mem_register_datetime = mem_register_datetime;
		return this;
	}
	public int getMem_is_admin() {
		return mem_is_admin;
	}
	public MemberDto setMem_is_admin(int mem_is_admin) {
		this.mem_is_admin = mem_is_admin;
		return this;
	}
	public String getMem_profile_content() {
		return mem_profile_content;
	}
	public MemberDto setMem_profile_content(String mem_profile_content) {
		this.mem_profile_content = mem_profile_content;
		return this;
	}
	public String getMem_icon() {
		return mem_icon;
	}
	public MemberDto setMem_icon(String mem_icon) {
		this.mem_icon = mem_icon;
		return this;
	}
}
