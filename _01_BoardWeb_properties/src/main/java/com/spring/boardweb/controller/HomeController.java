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
	//Autowired�� �������� ������ �� ��縸 �񱳸� ��
	//HomeService ������� ������ ��ü�� �ִ��� �������� ã��
	//������ ���� ������ ����
	//HomeService����� ��ü�� �������� ������ �߻�
	//@Autowired //homeService = new HomeServiceImpl();
	//@Qualifier //���� ����� ��ü�� �������϶� wired�� ����ϰ������ ���
	//��ü�� ���� �̸� ��� ��, ���� ����� ��ü�� ������ �� �̸����� ���Ͽ� �������� ����
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("hi", "Hello Spring" );
		
		//1. Session Scope
		//System.out.println("session data =======" + session.getAttribute("hello"));
		
		return "home";
	}
	
	//ȭ��ܿ��� ���޵Ǵ� �Ķ���� �ޱ�
	//1. @RequestParam ������̼��� �̿��Ͽ� ������ �Ҵ�
	/*
	 * @RequestMapping(value = "test.do", method = RequestMethod.GET) public String
	 * testGet(@RequestParam("firstName") String firstName,
	 * 
	 * @RequestParam("lastName") String lastName) { System.out.println("get��û ó��");
	 * System.out.println("get firstName = " + firstName);
	 * System.out.println("get lastName = " + lastName); return "home"; }
	 * 
	 * @RequestMapping(value = "test.do", method = RequestMethod.POST) public String
	 * testPost(@RequestParam("firstName") String firstName,
	 * 
	 * @RequestParam("lastName") String lastName) { System.out.println("post��û ó��");
	 * System.out.println("post firstName = " + firstName);
	 * System.out.println("post lastName = " + lastName); return "home"; }
	 */
	
	//2. @RequestParam ������̼��� �̿��Ͽ� Map�� �Ҵ�
	/*
	 * @RequestMapping(value = "test.do", method = RequestMethod.GET) public String
	 * testGet(@RequestParam Map<String, Object> paramMap, Model model) {
	 * System.out.println("get��û ó��"); System.out.println("get firstName = " +
	 * paramMap.get("firstName")); System.out.println("get lastName = " +
	 * paramMap.get("lastName")); System.out.println("get age = " +
	 * paramMap.get("age")); System.out.println("get job = " + paramMap.get("job"));
	 * model.addAttribute("hi", "Hello Spring" ); return "home"; }
	 * 
	 * @RequestMapping(value = "test.do", method = RequestMethod.POST) public String
	 * testPost(@RequestParam Map<String, Object> paramMap) {
	 * System.out.println("post��û ó��"); System.out.println("post firstName = " +
	 * paramMap.get("firstName")); System.out.println("post lastName = " +
	 * paramMap.get("lastName")); System.out.println("post age = " +
	 * paramMap.get("age")); System.out.println("post job = " +
	 * paramMap.get("job")); // /WEB-INF/views/home.jsp // redirect : �ּ� ���� ��
	 * viewResolver�� Ÿ�� �ʰ� ���ϴ� �ּҷ� �ٷ� �̵��ϵ��� ���� ���� // �ּҵ� ������ �ּҷ� ����� return
	 * "redirect:/"; }
	 */
	
	//3. Command ��ü�� �̿��Ͽ� �Ķ���� �ޱ�
	//	 Command ��ü : �Լ��� �Ű������ȿ� ����� ��ü
	@RequestMapping(value = "test.do", method = RequestMethod.GET)
	public String testGet(HomeVO homeVO) {
		System.out.println("get��û ó��");
		System.out.println("get firstName = " + homeVO.getFirstName());
		System.out.println("get lastName = " + homeVO.getLastName());
		System.out.println("get age = " + homeVO.getAge());
		System.out.println("get job = " + homeVO.getJob());
		return "home";
	}
	
	@RequestMapping(value = "test.do", method = RequestMethod.POST)
	public String testPost(HomeVO homeVO) {
		System.out.println("post��û ó��");
		System.out.println("post firstName = " + homeVO.getFirstName());
		System.out.println("post lastName = " + homeVO.getLastName());
		System.out.println("post age = " + homeVO.getAge());
		System.out.println("post job = " + homeVO.getJob());
		// /WEB-INF/views/home.jsp
		// redirect : �ּ� ���� �� viewResolver�� Ÿ�� �ʰ� ���ϴ� �ּҷ� �ٷ� �̵��ϵ��� ���� ����
		// 			  �ּҵ� ������ �ּҷ� �����
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
		//DB���� �̸� ����� ��ȸ�� ����� resultList��� ������ �����
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
		//insert, update, delete���� �� �����ϸ� 1, �����ϸ� 0�� ����
		homeService.insertName(homeVO);
		
		return "redirect:getNameList.do";
	}
	
	
	@RequestMapping(value="getName.do", produces="application/text; charset=utf-8")
	//Command ��ü�� �Ķ���͸� ������ ��
	//HomeVO homeVO = new HomeVO();
	//Ű���� �̸��� ������ ������ setter �޼ҵ带 ȣ���Ͽ� �ش� ������ ���� �����
	public String getName(HomeVO homeVO, Model model) {
		//homeVO.setFirstName("�Ͽ�");
		//homeVO.setLastName("ȫ");
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







