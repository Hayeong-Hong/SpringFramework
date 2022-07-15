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
		//회원가입 정보가 넘어오지 않았을 떄는 회원가입 화면으로
		if(userVO.getUserId() == null || userVO.getUserId().equals("")) {
		return "user/join";
		}
		
		//비밀번호 sha256암호화
		System.out.println("암호화 적용 전 : " + userVO.getUserPw());//암호화 전 비번
		String shaUserpw = UserSha256.encrypt(userVO.getUserPw());
		userVO.setUserPw(shaUserpw);
		System.out.println("암호화 적용 후 : " + userVO.getUserPw());//암호화 후 비번
		
		//회원가입 정보가 넘어왔을 때는 회원가입 처리 후 로그인 화면으로
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
	//ViewResolver를 타게되면 ResponseBody를 HTML구조로 만들어서 화면을 리턴해줌
	//ViewResolver를 안태우고 반환값 자체를 ResponseBody로 만들려면 @ResponseBody를 사용해야 함
	public String idCheck(UserVO userVO) throws JsonProcessingException {
		//Json 객체로 변환해주는 클래스 ObjectMapper
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
