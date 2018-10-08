package com.cm.DisSale.pojo;

import java.io.Serializable;
import java.util.Date;


public class Agency implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Integer getAgencyId() {
		return agencyId;
	}
	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getAgencyPassword() {
		return agencyPassword;
	}
	public void setAgencyPassword(String agencyPassword) {
		this.agencyPassword = agencyPassword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getAgencyLevel() {
		return agencyLevel;
	}
	public void setAgencyLevel(Integer agencyLevel) {
		this.agencyLevel = agencyLevel;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	public String getAgencyAddress() {
		return agencyAddress;
	}
	public void setAgencyAddress(String agencyAddress) {
		this.agencyAddress = agencyAddress;
	}
	public Integer getHigherAgencyId() {
		return higherAgencyId;
	}
	public void setHigherAgencyId(Integer higherAgencyId) {
		this.higherAgencyId = higherAgencyId;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	private Integer agencyId;
    private String agencyName;
    private String agencyPassword;
    private String phone;
    /**
     * 1,2对应一级二级经销商
     */
    //等级
    private Integer agencyLevel;
    //注册时间
    private Date registTime;
    private String agencyAddress;
    private Integer higherAgencyId;
    //认证码
    private String authCode;
}