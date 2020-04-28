package com.hk.tour;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.tour.dtos.LDto;
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
	public String locationDetail(Locale locale, Model model) {
		logger.info("관광지목록 폼  {}.", locale);
		return "tourlist";
	}
	
	
	
	
	
	
	
	
	
	
	 
	
	
	
	
	
	
	
	
	
	
}
