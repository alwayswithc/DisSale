package com.cm.DisSale.service.impl;

import java.util.Date;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cm.DisSale.dto.AgencyExecution;
import com.cm.DisSale.enums.AgencyStateEnum;
import com.cm.DisSale.exception.AgencyOperationException;
import com.cm.DisSale.mapper.AgencyMapper;
import com.cm.DisSale.pojo.Agency;
import com.cm.DisSale.service.AgencyService;
import com.google.common.util.concurrent.ExecutionError;


@Service
public class AgencyServiceImpl implements AgencyService {
	@Autowired
	AgencyMapper agencyMapper;

	@Override
	public List<Agency> listAuthAgency(){
		return agencyMapper.listAuthAgency();

	}

	@Override
	public List<Agency> listNoauthAgency(){
		return agencyMapper.listNoauthAgency();
	}

	@Override
	public List<Agency> listAllAgency() {
		return agencyMapper.listAllAgency();
	}

	@Override
	@Transactional
	public int updateAuthCode(int id, String code) {
		return agencyMapper.updateAuthCode(id, code);
	}

	@Override
	@Transactional
	public AgencyExecution insertStairAgency(Agency agency) throws AgencyOperationException{
		System.out.println(agency.getAgencyName());
		// 查询是否已经有了这个账号
		List<Agency> agencys=agencyMapper.listAllAgency();
		for (Agency agency2 : agencys) {
			
			String agencyOldName=agency2.getAgencyName();
			if(agency.getAgencyName().equals(agencyOldName)) {
				return new AgencyExecution(AgencyStateEnum.ACCOUNT_ALREADY_EXISTS);
			}
		}
			try {
				//注册
				agency.setRegistTime(new Date());
				int effectedNum = agencyMapper.insertStairAgency(agency);
				// 判断创建是否成功
				if (effectedNum <= 0) {
					throw new AgencyOperationException("帐号注册失败");
				} else {
					return new AgencyExecution(AgencyStateEnum.SUCCESS, agency);
				}
			} catch (Exception e) {
				throw new AgencyOperationException("insertStairAgency error: " + e.getMessage());
			}	
	}
	

}
