package com.itbank.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.CalenderComponent;
import com.itbank.model.CalenderDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.TicketDTO;
import com.itbank.service.TicketService;


@Controller
public class HomeController {

	@Autowired private CalenderComponent cal;
	@Autowired private TicketService ts;
	
	@RequestMapping("/page404")
    public String handlePageNotFound() {
        // "/WEB-INF/views/page404.jsp"로 포워딩합니다.
        return "page404";
    }
	
	@GetMapping("/")
	public ModelAndView home(@RequestParam(required=false) String strmonth, HttpSession session) {
		ModelAndView mav = new ModelAndView("/home");
		CalenderDTO dto = new CalenderDTO();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
	      
	      if(login != null) {
	         int totalCount = ts.getAlarm(login.getUserid());
	         if(totalCount != 0) {mav.addObject("totalCount", totalCount );}
	      }
		
		Date wantDate = new Date(new java.util.Date().getTime());

        // SimpleDateFormat 객체를 사용하여 Date를 원하는 형식의 String으로 변환
        SimpleDateFormat sdf = new SimpleDateFormat("MM");
        int month = 0;
        if(strmonth == null) {month = Integer.parseInt(sdf.format(wantDate));}	
        else {month = Integer.parseInt(strmonth);}
		
		dto.setMonth(cal.getMonth(month));
		dto.setLastDay(cal.getLastDay(month));
		dto.setStartDayOfWeek(cal.getStartDayOfWeek(month));
		
		mav.addObject("cal", dto);
		mav.addObject("month", month);
		return mav;
	}
	
		@GetMapping("/about")
	    public ModelAndView about() {
	       ModelAndView mav = new ModelAndView();
	       List<TicketDTO> list = ts.getList();
	       mav.addObject("list",list);   
	       return mav;
	    }
	
}
