package com.itbank.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FeedDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.FeedService;
import com.itbank.service.ReplyService;


@Controller
@RequestMapping("/social")
public class SocialController {
	
	@Autowired private FeedService fs;
	@Autowired private ReplyService rs;
	
	@GetMapping("/home")
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<FeedDTO> list = new ArrayList<>();
		if(login != null) {
			list = fs.getList(login.getUserid());
		}
		else {
			list = fs.getList("");
		}
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/feed/view/{idx}")
	public ModelAndView View(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/social/feed/view");
		FeedDTO dto = fs.getHealth_board(idx);
		mav.addObject("dto", dto);
		List<ReplyDTO> replyList = rs.getReplyList(idx);
		mav.addObject("replyList", replyList);
		return mav;
	}
	
	@GetMapping("/feed/myboard")
	public ModelAndView myboard() {
		ModelAndView mav = new ModelAndView();
		List<FeedDTO> list = fs.getList("");
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/feed/write")
	public void write() {};

	@PostMapping("/feed/write")
	public String write(FeedDTO dto) {
		int row = fs.write(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/myboard";
	}

	
	@GetMapping("/feed/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("social/feed/modify");	
		FeedDTO dto = fs.getHealth_board(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/feed/modify/{idx}")
	public String modify(FeedDTO dto) {
		int row = fs.modify(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/myboard";
	}
	
	@GetMapping("/feed/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/social/alert");
		int row = fs.delete(idx);
		String url = "/social/home";
		String msg = row != 0 ? "성공" : "실패";
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}
	
	@GetMapping("/like/{board_id}")
	public String like(@PathVariable("board_id") int board_id, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		fs.like(login.getUserid(), board_id);
		
		return "redirect:/social/home";
	}
	
	@GetMapping("/unlike/{board_id}")
	public String unlike(@PathVariable("board_id") int board_id, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		fs.unlike(login.getUserid(), board_id);
		
		return "redirect:/social/home";
	}

	
}
