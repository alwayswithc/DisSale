package com.cm.DisSale.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	//根据id查找出经销商的信息（等级，上级经销商。。。）
	Agency queryAgencyById(int agencyId);

}
