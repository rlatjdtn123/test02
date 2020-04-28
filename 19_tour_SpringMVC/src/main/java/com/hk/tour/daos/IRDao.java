package com.hk.tour.daos;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hk.tour.dtos.RDto;



public interface IRDao {

	//글쓰기
	public boolean insertReply(RDto dto);
		
	//댓글목록
	public List<RDto> replyList(int tseq);
	
}
