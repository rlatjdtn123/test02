package com.hk.tour.service;

import com.hk.tour.dtos.UDto;

public interface IUService {

			//1.회원가입
			public boolean insertUser(UDto dto);
			
			//2.로그인 로그아웃
			public UDto getLogin(String id,String password);
			
			
			
			//3.나의 정보 조회 
			public UDto userInfo(String id);
			
			
			//4.나의 정보수정
			public boolean userUpdate(UDto dto);
			
			//5.회원 탈퇴    N  -- > Y
			public boolean delUser(String id);
			
			
			//6.아이디 중복 체크
			public String idCheck(String id);
	
}
