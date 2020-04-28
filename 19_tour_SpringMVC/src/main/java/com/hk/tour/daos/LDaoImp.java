package com.hk.tour.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tour.dtos.LDto;


@Repository
public class LDaoImp implements ILDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace="com.hk.tour.tourl.";
	
	@Override
	public List<LDto> locationList(String location, String citycounties) {
		List<LDto> list=null;
		Map<String, String> map=new HashMap<>();
		map.put("location", location);
		map.put("citycounties", citycounties);
		list=sqlSession.selectList(nameSpace+"locationList", map);
		return list;
	}

	@Override
	public List<LDto> cityList(String location, String citycounties) {
		List<LDto> list=null;
		Map<String, String> map=new HashMap<>();
		map.put("location", location);
		map.put("citycounties", citycounties);
		list=sqlSession.selectList(nameSpace+"cityList", map);
		return list;
	}

	@Override
	public LDto detailInfo(int tseq) {
		LDto dto=null;
		dto=sqlSession.selectOne(nameSpace+"detailInfo", tseq);
		return dto;
	}

	@Override
	public List<LDto> topList() {
		List<LDto> list=null;
		list=sqlSession.selectList(nameSpace+"topList");
		return list;
	}

}
