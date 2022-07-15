package com.spring.boardweb.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.boardweb.UserVO;
import com.spring.boardweb.service.UserSha256;
import com.spring.boardweb.service.user.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
//	@RequestMapping(value="/join.do", method=RequestMethod.GET)
//	public String joinView() {
//		return "user/join";
//	}
//	
//	@RequestMapping(value="/join.do", method=RequestMethod.POST)
//	public String join() {
//		return "user/join";
//	}
	@RequestMapping("/join.do")
	public String join(UserVO userVO) {
		//ȸ������ ������ �Ѿ���� �ʾ��� ���� ȸ������ ȭ������
		if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
		return "user/join";
		}
		
		//��й�ȣ sha256��ȣȭ
		System.out.println("��ȣȭ ���� �� : " + userVO.getUserPw());//��ȣȭ �� ���
		String shaUserpw = UserSha256.encrypt(userVO.getUserPw());
		userVO.setUserPw(shaUserpw);
		System.out.println("��ȣȭ ���� �� : " + userVO.getUserPw());//��ȣȭ �� ���
		
		//ȸ������ ������ �Ѿ���� ���� ȸ������ ó�� �� �α��� ȭ������
		userService.join(userVO);
		return "user/login";
	}
	
	@RequestMapping(value="/loginPage.do", method=RequestMethod.GET)
	public String loginPage(UserVO userVO) {
		return "/user/login";
	}
	
	@RequestMapping(value="/login.do" , method=RequestMethod.POST)
	@ResponseBody
	public String login(HttpSession session, UserVO userVO) throws JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck<1) {
			jsonMap.put("message", "idFail");
		}else {
			int pwCheck = userService.pwCheck(userVO);
			
			if(pwCheck<1) {
				jsonMap.put("message", "pwFail");
			}else {
				UserVO user = userService.login(userVO);
				
				session.setAttribute("loginUser", user);
				
				jsonMap.put("message", "loginSuccess");
			}
		}
		
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		return jsonStr;
	}
	
	@RequestMapping("/idCheck.do")
	@ResponseBody
	//ViewResolver�� Ÿ�ԵǸ� ResponseBody�� HTML������ ���� ȭ���� ��������
	//ViewResolver�� ���¿�� ��ȯ�� ��ü�� ResponseBody�� ������� @ResponseBody�� ����ؾ� ��
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		//Json ��ü�� ��ȯ���ִ� Ŭ���� ObjectMapper
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int resultIdCheck = userService.idCheck(userVO.getUserId());
		
		jsonMap.put("resultIdCheck", resultIdCheck);
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
		
		System.out.println("jsonString = " + json);
		
		return json;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
}
