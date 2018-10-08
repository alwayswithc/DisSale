package com.cm.DisSale.dto;

import java.util.List;

import com.cm.DisSale.enums.AgencyStateEnum;
import com.cm.DisSale.pojo.Agency;

public class AgencyExecution {
	// 结果状态
	private int state;

	// 状态标识
	private String stateInfo;

	private int count;

	private Agency agency;

	private List<Agency> agencyList;

	public AgencyExecution() {
	}

	// 失败的构造器
	public AgencyExecution(AgencyStateEnum stateEnum) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
	}

	// 成功的构造器
	public AgencyExecution(AgencyStateEnum stateEnum, Agency agency) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
		this.agency = agency;
	}

	// 成功的构造器
	public AgencyExecution(AgencyStateEnum stateEnum,
			List<Agency> agencyList) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
		this.agencyList = agencyList;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public void setStateInfo(String stateInfo) {
		this.stateInfo = stateInfo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Agency getLocalAuth() {
		return agency;
	}

	public void setLocalAuth(Agency agency) {
		this.agency = agency;
	}

	public List<Agency> getLocalAuthList() {
		return agencyList;
	}

	public void setLocalAuthList(List<Agency> agencyList) {
		this.agencyList = agencyList;
	}

}
