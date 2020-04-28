package com.hk.tour.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tour.dtos.RDto;

@Repository
public class RDaoImp implements IRDao{

	private String nameSpace="com.hk.tour.tourr.";
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertReply(RDto dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertReply", dto);
		return count>0?true:false;
	}

	@Override
	public List<RDto> replyList(int tseq) {
		List<RDto> list=null;
		list=sqlSession.selectList(nameSpace+"replyList", tseq);
		return list;
	}

}
