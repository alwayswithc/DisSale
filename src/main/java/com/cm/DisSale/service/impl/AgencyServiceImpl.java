package com.cm.DisSale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cm.DisSale.mapper.AgencyMapper;
import com.cm.DisSale.pojo.Agency;
import com.cm.DisSale.service.AgencyService;

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
	public Agency queryAgencyById(int agencyId) {
		return agencyMapper.queryAgencyById(agencyId);
	}
	

}
