package com.spring.boardweb.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boardweb.HomeVO;
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
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("hi", "Hello Spring" );
		
		//1. Session Scope
		//System.out.println("session data =======" + session.getAttribute("hello"));
		
		return "home";
	}
	
	//화면단에서 전달되는 파라미터 받기
	//1. @RequestParam 어노테이션을 이용하여 변수에 할당
	/*
	 * @RequestMapping(value = "test.do", method = RequestMethod.GET) public String
	 * testGet(@RequestParam("firstName") String firstName,
	 * 
	 * @RequestParam("lastName") String lastName) { System.out.println("get요청 처리");
	 * System.out.println("get firstName = " + firstName);
	 * System.out.println("get lastName = " + lastName); return "home"; }
	 * 
	 * @RequestMapping(value = "test.do", method = RequestMethod.POST) public String
	 * testPost(@RequestParam("firstName") String firstName,
	 * 
	 * @RequestParam("lastName") String lastName) { System.out.println("post요청 처리");
	 * System.out.println("post firstName = " + firstName);
	 * System.out.println("post lastName = " + lastName); return "home"; }
	 */
	
	//2. @RequestParam 어노테이션을 이용하여 Map에 할당
	/*
	 * @RequestMapping(value = "test.do", method = RequestMethod.GET) public String
	 * testGet(@RequestParam Map<String, Object> paramMap, Model model) {
	 * System.out.println("get요청 처리"); System.out.println("get firstName = " +
	 * paramMap.get("firstName")); System.out.println("get lastName = " +
	 * paramMap.get("lastName")); System.out.println("get age = " +
	 * paramMap.get("age")); System.out.println("get job = " + paramMap.get("job"));
	 * model.addAttribute("hi", "Hello Spring" ); return "home"; }
	 * 
	 * @RequestMapping(value = "test.do", method = RequestMethod.POST) public String
	 * testPost(@RequestParam Map<String, Object> paramMap) {
	 * System.out.println("post요청 처리"); System.out.println("post firstName = " +
	 * paramMap.get("firstName")); System.out.println("post lastName = " +
	 * paramMap.get("lastName")); System.out.println("post age = " +
	 * paramMap.get("age")); System.out.println("post job = " +
	 * paramMap.get("job")); // /WEB-INF/views/home.jsp // redirect : 주소 설정 시
	 * viewResolver를 타지 않고 원하는 주소로 바로 이동하도록 설정 가능 // 주소도 설정한 주소로 변경됨 return
	 * "redirect:/"; }
	 */
	
	//3. Command 객체를 이용하여 파라미터 받기
	//	 Command 객체 : 함수의 매개변수안에 선언된 객체
	@RequestMapping(value = "test.do", method = RequestMethod.GET)
	public String testGet(HomeVO homeVO) {
		System.out.println("get요청 처리");
		System.out.println("get firstName = " + homeVO.getFirstName());
		System.out.println("get lastName = " + homeVO.getLastName());
		System.out.println("get age = " + homeVO.getAge());
		System.out.println("get job = " + homeVO.getJob());
		return "home";
	}
	
	@RequestMapping(value = "test.do", method = RequestMethod.POST)
	public String testPost(HomeVO homeVO) {
		System.out.println("post요청 처리");
		System.out.println("post firstName = " + homeVO.getFirstName());
		System.out.println("post lastName = " + homeVO.getLastName());
		System.out.println("post age = " + homeVO.getAge());
		System.out.println("post job = " + homeVO.getJob());
		// /WEB-INF/views/home.jsp
		// redirect : 주소 설정 시 viewResolver를 타지 않고 원하는 주소로 바로 이동하도록 설정 가능
		// 			  주소도 설정한 주소로 변경됨
		return "redirect:/";
	}
	
	@RequestMapping("/hello.do")
	public String hello(Model model) {
		//1. Session Scope
		//session.setAttribute("hello", "12345");
		
		model.addAttribute("hello","0000");
		
		return "Hello";
	}
	
	@RequestMapping("getNameList.do")
		public String getNameList(Model model) {
		//DB에서 이름 목록을 조회한 결과를 resultList라는 변수에 담아줌
			List<HomeVO> resultList = homeService.getNameList();
			
			model.addAttribute("nameList", resultList);
			
			for(int i=0; i< resultList.size(); i+=1) {
				System.out.println("firstName = " + resultList.get(i).getFirstName());
				System.out.println("lastName = " + resultList.get(i).getLastName());
			}
			
			return "getNameList";
		}
	
	@RequestMapping(value="insertName.do", produces="application/text; charset=utf-8")
	public String insertName(HomeVO homeVO) {
		//insert, update, delete실행 시 성공하면 1, 실패하면 0을 리턴
		homeService.insertName(homeVO);
		
		return "redirect:getNameList.do";
	}
	
	
	@RequestMapping(value="getName.do", produces="application/text; charset=utf-8")
	//Command 객체로 파라미터를 선언할 시
	//HomeVO homeVO = new HomeVO();
	//키값과 이름이 동일한 변수의 setter 메소드를 호출하여 해당 변수에 값을 담아줌
	public String getName(HomeVO homeVO, Model model) {
		//homeVO.setFirstName("하영");
		//homeVO.setLastName("홍");
		model.addAttribute("name", homeVO);
		
		return "getName";
	}
	
	
	@RequestMapping(value="updateName.do", produces="application/text; charset=utf-8")
	public String updateName(@RequestParam Map<String, String> paramMap) {
			homeService.updateName(paramMap);
		return "redirect:getNameList.do";
	}
	
	@RequestMapping(value="deleteName.do", produces="application/text; charset=utf-8")
	public String deleteName(HomeVO homeVO) {
		homeService.deleteName(homeVO);
		
		return "redirect:getNameList.do";
	}
	
}







