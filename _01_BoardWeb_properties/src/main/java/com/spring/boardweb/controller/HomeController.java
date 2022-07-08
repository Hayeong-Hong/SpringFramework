package com.spring.boardweb.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.boardweb.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//Autowired는 의존성을 주입할 때 모양만 비교를 함
	//HomeService 모양으로 생성된 객체가 있는지 없는지를 찾음
	//있으면 주입 없으면 에러
	//HomeService모양의 객체가 여러개면 에러가 발생
	//@Autowired //homeService = new HomeServiceImpl();
	//@Qualifier //같은 모양의 객체가 여러개일때 wired를 사용하고싶으면 사용
	//객체의 모양과 이름 모두 비교, 같은 모양의 객체가 존재할 떄 이름으로 비교하여 의존성을 주입
	@Qualifier("homeServiceImpl")
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("hi", "Hello Spring" );
		
		return "home";
	}
	
	@RequestMapping(value = "test.do", method = RequestMethod.GET)
	public String testGet() {
		System.out.println("get요청 처리");
		return "home";
	}
	
	@RequestMapping(value = "test.do", method = RequestMethod.POST)
	public String testPost() {
		System.out.println("post요청 처리");
		return "home";
	}
	
}
