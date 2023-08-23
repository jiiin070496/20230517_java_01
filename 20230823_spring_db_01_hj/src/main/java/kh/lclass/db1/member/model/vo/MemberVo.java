package kh.lclass.db1.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {
	
	private String mid;
	private String mpwd;
	private String mname;
	private String memail;
		
	@Override
	public String toString() {
		return "MemberVo [mid=" + mid + ", mpwd=" + mpwd + ", mname=" + mname + ", memail=" + memail + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	
	
}
