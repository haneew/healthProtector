package com.itbank.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.itbank.model.DealDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.TicketDTO;
import com.itbank.service.DealService;
import com.itbank.service.TicketService;


@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired TicketService ts;
	@Autowired DealService ds;
	
	// 티켓 홈
	@GetMapping("/tkHome")
	public ModelAndView tkhome(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		mav.addObject("login", login);
		
		if(login!=null) {
		int tkCount = ts.getAlarm(login.getUserid());
		mav.addObject("tkCount", tkCount);
		}
		
		return mav;	
	}
	
	// 티켓 리스트
	   @GetMapping("/tkBuy")
	   public ModelAndView getList() {
	      ModelAndView mav = new ModelAndView();
	      List<TicketDTO> list = ts.getList();
	      mav.addObject("list",list);   
	      Date today = new Date();
	      mav.addObject("today", today);
	      return mav;
	   }
	
	
   // 구매한 거 리스트
   @PostMapping("/Buy")
   public ModelAndView buybb(@RequestBody Map<String, Object> map, HttpSession session) {
      ModelAndView mav = new ModelAndView("redirect:/ticket/tkList");
      MemberDTO login = (MemberDTO) session.getAttribute("login");
      int row = ts.buy(map, login.getUserid());
      
      List<DealDTO> list = ds.buyList(login.getUserid());
      mav.addObject("list",list);
      System.out.println(row != 0 ? "구매 성공" : "구매 실패");
      return mav;
   }
	
	@GetMapping("/refund")
	public ModelAndView refund(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		List<DealDTO> list = ds.getRefundList(login.getUserid());
		
		if(list.size() != 0) {
			mav.addObject("list", list);
		}
		
		return mav;
	}
	
	// 이용권 조회
	@GetMapping("/tkList")
	public ModelAndView buybb(HttpSession session) {
		ModelAndView mav = new ModelAndView("/ticket/tkList");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<DealDTO> list = ds.buyList(login.getUserid());
		mav.addObject("list",list);
		return mav;	
	}
	
	// 이용권 사용
//	@GetMapping("/useTicket")
//	public String use(HttpSession session) {
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		int row = ds.update(login.getUserid());
//		System.out.println(row != 0 ? "사용 성공" : "사용 실패");
//		return "redirect:/ticket/abList";
//	}
	
	@GetMapping("/useTicket")
    public String use(HttpSession session) {
        try {
            MemberDTO login = (MemberDTO) session.getAttribute("login");
            int row = ds.update(login.getUserid());
            System.out.println(row != 0 ? "사용 성공" : "사용 실패");
            return "redirect:/ticket/abList";
        } catch (DataAccessException ex) {
            Throwable cause = ex.getMostSpecificCause();
            if (cause instanceof SQLException) {
                SQLException sqlEx = (SQLException) cause;
                if (sqlEx.getErrorCode() == -20001) {
                    // SQL 에러 코드 -20001에 해당하는 예외 처리
                    return "redirect:/ticket/notToday";
                }
            }
            // 다른 DataAccessException 예외 처리
            return "redirect:/ticket/notToday";
        }
    }   
	
	// 이용권 환불
	@PostMapping("/refund/{countsString}")
	public String refund(@PathVariable("countsString") String countsString){		
		int row = ds.delete(countsString);
		System.out.println(row != 0 ? "환불 성공" : "환불 실패");
		return "redirect:/ticket/tkList";
	}
	
	@GetMapping("/notToday")
    public String notToday() {
        return "/ticket/notToday";
    }
	
	
}
