package member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String pwdHint;
	private String pwdHintAnswer;
	private String name;
	private String phone;
	private Date enrollDate;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pwd, String pwdHint, String pwdHintAnswer, String name, String phone,
			Date enrollDate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.pwdHint = pwdHint;
		this.pwdHintAnswer = pwdHintAnswer;
		this.name = name;
		this.phone = phone;
		this.enrollDate = enrollDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdHint() {
		return pwdHint;
	}
	public void setPwdHint(String pwdHint) {
		this.pwdHint = pwdHint;
	}
	public String getPwdHintAnswer() {
		return pwdHintAnswer;
	}
	public void setPwdHintAnswer(String pwdHintAnswer) {
		this.pwdHintAnswer = pwdHintAnswer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	
}
