package com.hk.tour.service;

import java.util.List;

import com.hk.tour.dtos.RDto;

public interface IRService {

			//글쓰기
			public boolean insertReply(RDto dto);
			
			//댓글목록
			public List<RDto> replyList(int tseq);
	
}
