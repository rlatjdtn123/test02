package com.hk.tour.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hk.tour.dtos.LDto;



public interface ILDao {

		//지역별 
		public List<LDto> locationList(String location,String citycounties);
		
		//지역상세
		public List<LDto> cityList(String location,String citycounties);
		
		
		
		//상세정보
		public LDto detailInfo(int tseq);
		
		
		//10위
		public List<LDto> topList();
	
}
