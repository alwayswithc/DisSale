package com.cm.DisSale.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cm.DisSale.BaseTest;
import com.cm.DisSale.dto.AgencyExecution;
import com.cm.DisSale.pojo.Agency;


/** 
* @author 作者 DHL: 
* @version 创建时间：2018年10月6日 下午10:12:27 
* 类说明 
*/
public class AgencyServiceTest extends BaseTest{
	
	@Autowired
	private AgencyService agencyService;

	@Test
	public void testInsertStairAgency() {
		
		// 新增一条平台帐号
		Agency agency = new Agency();
		
		String username = "testService";
		String password = "123";
		// 给平台帐号设置上用户信息
		// 设置帐号
		agency.setAgencyName(username);
		// 设置密码
		agency.setAgencyPassword(password);
		
		agency.setPhone("123");
		agency.setAgencyLevel(1);
		agency.setAgencyAddress("test");
		// 绑定帐号
		agencyService.insertStairAgency(agency);
	}
}
