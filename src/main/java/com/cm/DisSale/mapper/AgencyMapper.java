package com.cm.DisSale.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cm.DisSale.pojo.Agency;


public interface AgencyMapper {

	// 列出已授权的经销商
	List<Agency> listAuthAgency();

	// 列出未授权的经销商
	List<Agency> listNoauthAgency();

	// 列出所有经销商
	List<Agency> listAllAgency();

	// 插入授权码
	int updateAuthCode(@Param("id")int id,@Param("code")String code);
	
	//注册一级经销商
	int insertStairAgency(Agency agency);

}