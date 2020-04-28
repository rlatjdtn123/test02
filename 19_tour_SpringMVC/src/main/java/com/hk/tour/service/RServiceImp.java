package com.hk.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tour.daos.IRDao;
import com.hk.tour.dtos.RDto;

@Service
public class RServiceImp implements IRService{

	@Autowired
	private IRDao rDaoImp;
	
	@Override
	public boolean insertReply(RDto dto) {
		return rDaoImp.insertReply(dto);
	}

	@Override
	public List<RDto> replyList(int tseq) {
		return rDaoImp.replyList(tseq);
	}

}
