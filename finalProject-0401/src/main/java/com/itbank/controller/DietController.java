package com.itbank.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.CalenderComponent;
import com.itbank.model.CalenderDTO;
import com.itbank.model.FoodDTO;
import com.itbank.model.InfoDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.NutritionDTO;
import com.itbank.service.FoodService;
import com.itbank.service.InfoService;
import com.itbank.service.NutritionService;

@Controller
@RequestMapping("/diet")
public class DietController {

	@Autowired private FoodService fs;
	@Autowired private NutritionService ns;
	@Autowired private InfoService is;
	@Autowired private CalenderComponent cal;
	
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session, @RequestParam(required=false) Map<String, String> map) {
		ModelAndView mav = new ModelAndView("/diet/home");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		InfoDTO infoDto = is.getOne(userid);
		String whenStr = map.get("when");
		java.util.Date utilDate = new java.util.Date();
		if(whenStr != null) {
			try {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    utilDate = sdf.parse(whenStr);
			} catch (ParseException e) {
			    e.printStackTrace();
			}
		}
		java.sql.Date when = new java.sql.Date(utilDate.getTime());
		String strmonth = (String) map.get("strmonth");
		NutritionDTO userNutDTO = ns.getDtoByUser(userid, when);
		
		List<FoodDTO> checkM = ns.getListByMeal("아침", userid, when);
		List<FoodDTO> checkL = ns.getListByMeal("점심", userid, when);
		List<FoodDTO> checkD = ns.getListByMeal("저녁", userid, when);
		List<FoodDTO> checkY = ns.getListByMeal("간식", userid, when);
		
		if(checkM.size() != 0) {mav.addObject("foodM", checkM);}
		if(checkL.size() != 0) {mav.addObject("foodL", checkL);}
		if(checkD.size() != 0) {mav.addObject("foodD", checkD);}
		if(checkY.size() != 0) {mav.addObject("foodY", checkY);}
		
		if(userNutDTO != null) {mav.addObject("NutDto", userNutDTO);}
		
		CalenderDTO dto = new CalenderDTO();
		
		Date wantDate = new Date(new java.util.Date().getTime());

        SimpleDateFormat sdf = new SimpleDateFormat("MM");
        int month = 0;
        if(strmonth == null) {month = Integer.parseInt(sdf.format(wantDate));}	
        else {month = Integer.parseInt(strmonth);}
		
		dto.setMonth(cal.getMonth(month));
		dto.setLastDay(cal.getLastDay(month));
		dto.setStartDayOfWeek(cal.getStartDayOfWeek(month));
		List<Integer> dateList = ns.showDate(userid, month);
		
		if(dateList != null) {mav.addObject("dateList", dateList);}
		if(infoDto != null) {mav.addObject("info", infoDto);}
		mav.addObject("cal", dto);
		mav.addObject("month", month);
		
		return mav;
	}
	
	@GetMapping("/add/{meal}")
	public ModelAndView add(@PathVariable("meal") String meal) {
		ModelAndView mav = new ModelAndView("/diet/add");
		List<String> category = fs.getCategory();
		
		mav.addObject("meal_time", meal);
		mav.addObject("category", category);
		
		return mav;
	}
	
	@PostMapping("/add/{meal}")
	public String add(FoodDTO foodDto) {
		fs.add(foodDto);
//		String day = new SimpleDateFormat("dd").format(new java.util.Date());
		return "redirect:/diet/add/{meal}?when="+LocalDate.now();
	}
	
	@GetMapping("/info")
	public void info() {}
	
	@PostMapping("/info")
	public String info(InfoDTO infoDto) {
		
	    String day = new SimpleDateFormat("dd").format(new java.util.Date());
		is.add(infoDto);
		return "redirect:/diet/home?when="+LocalDate.now()+"&day="+day;
	}
	
}
