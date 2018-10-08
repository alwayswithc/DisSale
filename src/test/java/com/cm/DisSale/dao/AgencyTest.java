 package com.cm.DisSale.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cm.DisSale.BaseTest;
import com.cm.DisSale.mapper.AgencyMapper;
import com.cm.DisSale.pojo.Agency;
public class AgencyTest extends BaseTest{
	@Autowired 
	AgencyMapper agencyMapper;
	

	public void testQueryAgency(){
	    List<Agency> list=agencyMapper.listNoauthAgency();
	    System.out.println(list); 
	}

	//@Test
	public void testInsertCode() {
		agencyMapper.updateAuthCode(1, "112");
	}
	
	@Test
	public void testInsertStairAgency() {
		Agency agency=new Agency();
		agency.setAgencyName("cm");
		agency.setAgencyPassword("123");
		agency.setPhone("15815791228");
		agency.setRegistTime(new Date());
		agency.setAgencyLevel(1);
		agency.setAgencyAddress("test");
		agencyMapper.insertStairAgency(agency);
	}
}
