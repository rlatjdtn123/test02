package com.hk.tour;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.tour.dtos.LDto;
import com.hk.tour.dtos.RDto;
import com.hk.tour.dtos.UDto;
import com.hk.tour.service.ILService;
import com.hk.tour.service.IRService;
import com.hk.tour.service.IUService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ILService lService; 
	@Autowired
	private IUService uService;
	@Autowired
	private IRService rService;
	
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
		String formattedDate = dateFormat.format(date);
				
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	@RequestMapping(value = "/mainPage.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String mainPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "mainpage";
	}
	
	
	
	
	@RequestMapping(value = "/loginForm.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String loginForm(Locale locale, Model model,UDto dto,HttpServletRequest request) {
		logger.info("로그인 폼 {}.", locale);
		HttpSession session=request.getSession();
		
		UDto ldto=uService.getLogin(dto.getId(), dto.getPassword());
		
		if(ldto==null||ldto.getId()==null) {
			model.addAttribute("msg", "아이디,비밀번호 확인" );
			return "error";
		}else {
			session.setAttribute("ldto", ldto);
			return "mainpage";
		}
	}
	
	
	
	@RequestMapping(value = "/regist.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String regist(Locale locale, Model model) {
		logger.info("회원가입 폼 이동 {}.", locale);
		return "regist";
	}
	
	
	@RequestMapping(value = "/insertUser.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertUser(Locale locale, Model model,UDto dto) {
		logger.info("회원가입{}.", locale);
		boolean isS=uService.insertUser(dto);
		if(isS) {
			return "redirect:index.jsp";	
		}else {
			model.addAttribute("msg", "회원가입 실패" );
			return "error";
		}		
	}
	
	
	@RequestMapping(value = "/idCheck.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String idCheck(Locale locale, Model model,String id) {
		logger.info("아이디중복체크 {}.", locale);
		String resultId=uService.idCheck(id); 
		model.addAttribute("resultId",resultId);
		return "idchkform";
	}
	 
	
	@ResponseBody
	@RequestMapping(value = "/cityDetail.do", method = {RequestMethod.POST,RequestMethod.GET})
	public Map<String, List<LDto>> cityDetail(Locale locale, Model model,LDto dto) {
		logger.info("ajax처리  {}.", locale);
		List<LDto> list=lService.cityList(dto.getLocation(), dto.getCitycounties());
		Map<String, List<LDto>> map=new HashMap<>();
		map.put("list", list);
					
		return map;
	}				
	
	
	
	@RequestMapping(value = "/tourlist.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String tourlist(Locale locale, Model model) {
		logger.info("관광지목록 폼  {}.", locale);
		return "tourlist";
	}
	
	
	
	@RequestMapping(value = "/locationDetail.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String locationDetail(Locale locale, Model model,LDto dto) {
		logger.info("지역별 관광지  {}.", locale);
		List<LDto> list=lService.locationList(dto.getLocation(),dto.getCitycounties());
		model.addAttribute("list", list);
					
		return "locationdetail";
	}		
	
	
	
	@RequestMapping(value = "/detailInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String detailInfo(Locale locale, Model model,int tseq) {
		logger.info("관광지 상세  {}.", locale);
		
		
		LDto dto=lService.detailInfo(tseq);
		model.addAttribute("dto", dto);
					
		return "detailinfo";
	}	
	
	
	@RequestMapping(value = "/write.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String write(Locale locale, Model model,LDto dto,@RequestParam("star-input") String star_input,RDto dto2,HttpServletRequest request) {
		logger.info("관광지 댓글및평점  {}.", locale); 
		
		LDto dto3=lService.detailInfo(dto.getTseq());
		
		UDto lDto=(UDto)request.getSession().getAttribute("ldto");
		String id=lDto.getId();
		
		dto2.setUsergrade(star_input);
		dto2.setId(id);
	
		boolean isS=rService.insertReply(dto2);
		if(isS) {
			model.addAttribute("dto", dto3);
			return "detailinfo";
		}else {
			model.addAttribute("msg", "댓글등록실패");
			return "error";
		}
	}	
	
	@RequestMapping(value = "/logOut.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String logOut(Locale locale, Model model,HttpServletRequest request) {
		logger.info("로그아웃  {}.", locale);
		request.getSession().invalidate();
		
					
		return "redirect:index.jsp"; 
	}	
	
	 
	@ResponseBody
	@RequestMapping(value = "/contentAjax.do", method = {RequestMethod.POST,RequestMethod.GET})
	public Map<String, List<RDto>> contentAjax(Locale locale, Model model,int tseq) {
		logger.info("ajax처리  {}.", locale);
		List<RDto> list=rService.replyList(tseq);
		Map<String, List<RDto>> map=new HashMap<>();
		map.put("list", list);
					
		return map; 
	}	
	
	
	@RequestMapping(value = "/topTen.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String topTen(Locale locale, Model model) {
		logger.info("topten 조회  {}.", locale);
		List<LDto> list=lService.topList();
		model.addAttribute("list", list);		
					
		return "topten"; 
	}	
	
	
	@RequestMapping(value = "/userInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String userInfo(Locale locale, Model model,String id) {
		logger.info("마이페이지  {}.", locale);
		UDto dto=uService.userInfo(id);
		model.addAttribute("dto", dto);
		
					
		return "userinfo"; 
	}
	
	
	@RequestMapping(value = "/updateForm.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateForm(Locale locale, Model model,String id) {
		logger.info("업데이트 폼으로 이동  {}.", locale);
		UDto dto=uService.userInfo(id);
		model.addAttribute("dto", dto);
						
		return "userupdate"; 
	}
	
	
	
	@RequestMapping(value = "/userUpdate.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String userUpdate(Locale locale, Model model,UDto dto) {
		logger.info("유저 정보수정  {}.", locale);
		boolean isS=uService.userUpdate(dto);
		if(isS) {
			return "redirect:userInfo.do?id="+dto.getId(); 
		}else {
			model.addAttribute("msg", "수정실패" );
			return "error";
		}
						
		 
	}
	
	
	
	
	
	
	
}
