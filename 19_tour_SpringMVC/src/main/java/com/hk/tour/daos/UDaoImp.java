package com.hk.tour.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tour.dtos.UDto;

@Repository
public class UDaoImp implements IUDao{

	private String nameSpace="com.hk.tour.touru.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertUser(UDto dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertUser", dto);
		return count>0?true:false;
	}

	@Override
	public UDto getLogin(String id, String password) {
		UDto dto=null;
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		dto=sqlSession.selectOne(nameSpace+"getLogin", map);
		return dto;
	}

	@Override
	public UDto userInfo(String id) {
		UDto dto=null;
		dto=sqlSession.selectOne(nameSpace+"userInfo", id);
		return dto;
	}

	@Override
	public boolean userUpdate(UDto dto) {
		int count=0;
		count=sqlSession.update(nameSpace+"userUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public boolean delUser(String id) {
		int count=0;
		count=sqlSession.update(nameSpace+"delUser", id);
		return count>0?true:false;
	}

	@Override
	public String idCheck(String id) {
		String resultId=null;
		resultId=sqlSession.selectOne(nameSpace+"idCheck", id);
		return resultId;
	}

}
