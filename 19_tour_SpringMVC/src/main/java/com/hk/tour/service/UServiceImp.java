package com.hk.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tour.daos.IUDao;
import com.hk.tour.dtos.UDto;

@Service
public class UServiceImp implements IUService{

	@Autowired
	private IUDao uDaoImp;
	
	@Override
	public boolean insertUser(UDto dto) {
		return uDaoImp.insertUser(dto);
	}

	@Override
	public UDto getLogin(String id, String password) {
		return uDaoImp.getLogin(id, password);
	}

	@Override
	public UDto userInfo(String id) {
		return uDaoImp.userInfo(id);
	}

	@Override
	public boolean userUpdate(UDto dto) {
		return uDaoImp.userUpdate(dto);
	}

	@Override
	public boolean delUser(String id) {
		return uDaoImp.delUser(id);
	}

	@Override
	public String idCheck(String id) {
		return uDaoImp.idCheck(id);
	}

}
