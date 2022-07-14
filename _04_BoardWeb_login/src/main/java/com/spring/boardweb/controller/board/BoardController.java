package com.spring.boardweb.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boardweb.BoardVO;
import com.spring.boardweb.UserVO;
import com.spring.boardweb.service.board.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(HttpSession session, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "user/login";
		}
		
		List<BoardVO> boardList = boardService.getBoardList();
		
		/*
		 * for(int i=0; i<boardList.size(); i+=1) {
		 * System.out.println(boardList.get(i).toString()); }
		 */
		
		model.addAttribute("boardList", boardList);
		
		return "board/getBoardList";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(HttpSession session, @RequestParam int boardSeq, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "user/login";
		}
		
		boardService.updateBoardCnt(boardSeq);
		
		BoardVO board = boardService.getBoard(boardSeq);
		
		model.addAttribute("board", board);
		
		return "board/getBoard";
	}
	
	@RequestMapping("insertBoard.do")
	public String insertBoard(HttpSession session, BoardVO boardVO) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "user/login";
		}
		
		if(boardVO.getBoardTitle()==null || boardVO.getBoardTitle().equals("")) {
			return "board/insertBoard";
		}
		
		boardService.insertBoard(boardVO);
		
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(HttpSession session, @RequestParam int boardSeq) {
		boardService.deleteBoard(boardSeq);
		
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(HttpSession session, BoardVO boardVO) {
		boardService.updateBoard(boardVO);
		
		return "redirect:getBoardList.do";
	}

}
