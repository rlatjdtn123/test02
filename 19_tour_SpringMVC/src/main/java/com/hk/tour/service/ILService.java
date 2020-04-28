package com.hk.tour.service;

import java.util.List;

import com.hk.tour.dtos.LDto;

public interface ILService {

			//지역별 
			public List<LDto> locationList(String location,String citycounties);
			
			//지역상세
			public List<LDto> cityList(String location,String citycounties);
			
			
			
			//상세정보
			public LDto detailInfo(int tseq);
			
			
			//10위
			public List<LDto> topList();
	
}
