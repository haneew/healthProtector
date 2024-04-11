package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.DealDTO;
import com.itbank.model.FoodDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.TicketDTO;
import com.itbank.service.DealService;
import com.itbank.service.FoodService;
import com.itbank.service.MemberService;
import com.itbank.service.TicketService;

@Controller
public class AdminController {

	@Autowired private MemberService ms;
	@Autowired private DealService ds;
	@Autowired private FoodService fs;
	@Autowired private TicketService ts;
	
	@GetMapping("/setting")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView("/admin/home");
		
		List<MemberDTO> memberList = ms.getList();
		List<DealDTO> dealList = ds.getList();
		List<FoodDTO> foodList =  fs.getListByUserInsert();
		List<TicketDTO> ticketList = ts.getList();
		
		mav.addObject("memberList", memberList);
		mav.addObject("dealList", dealList);
		mav.addObject("ticketList", ticketList);
		mav.addObject("foodList", foodList);
		return mav;
	}
	
	@GetMapping("/setting/ticketAdd")
	public String ticketAdd() {
		return "/admin/ticketAdd";
	}
	
	@PostMapping("/setting/ticketAdd")
	public ModelAndView ticketAdd(TicketDTO dto) {
		ModelAndView mav = new ModelAndView("/admin/ticketAdd");
		int row = ts.insert(dto);
		if(row!=0) {mav.addObject("row",row);}
		return mav;
	}
	
}
