package com.hk.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tour.daos.ILDao;
import com.hk.tour.dtos.LDto;

@Service
public class LServiceImp implements ILService{

	@Autowired
	private ILDao lDaoImp;
	
	@Override
	public List<LDto> locationList(String location, String citycounties) {
		return lDaoImp.locationList(location, citycounties);
	}

	@Override
	public List<LDto> cityList(String location, String citycounties) {
		return lDaoImp.cityList(location, citycounties);
	}

	@Override
	public LDto detailInfo(int tseq) {
		return lDaoImp.detailInfo(tseq);
	}
 
	@Override
	public List<LDto> topList() {
		return lDaoImp.topList();
	}

}
