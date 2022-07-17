package com.spring.boardweb.controller.item;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.boardweb.ItemVO;
import com.spring.boardweb.UserVO;
import com.spring.boardweb.service.item.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/getItemList.do")
	public String getItemList(HttpSession session, Map<String, String> paramMap, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "user/login";
		}
		
		List<ItemVO> searchItemList = itemService.getItemList(paramMap);
				
		model.addAttribute("itemList", searchItemList);
		
		return "/item/getItemList";
	}
	

}
