package com.cm.DisSale.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cm.DisSale.dto.AgencyExecution;
import com.cm.DisSale.pojo.Agency;

public interface AgencyService {

	// 列出已授权的经销商
	List<Agency> listAuthAgency();

	// 列出未授权的经销商
	List<Agency> listNoauthAgency();

	// 列出所有经销商
	List<Agency> listAllAgency();

	// 插入授权码
	int updateAuthCode(int id, String code);
	
	//注册一级经销商
	AgencyExecution insertStairAgency(Agency agency);
}
