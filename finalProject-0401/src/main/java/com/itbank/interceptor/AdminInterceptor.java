package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.model.MemberDTO;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		String contextPath = request.getContextPath(); 
		String fullURI = request.getRequestURI(); 
		String prevPage = fullURI.substring(contextPath.length());
		
		if (login == null) {
            // 사용자가 로그인하지 않았다면 로그인 페이지로 리다이렉트
			session = request.getSession(true);
	        session.setAttribute("prevPage", prevPage); 
            response.sendRedirect(contextPath + "/member/login");
            return false;
        } else if (login.getUserid().equals("admin")) {
            // admin 권한이 있다면 요청한 페이지로 진행
            return true;
        } else {
            // 일반 사용자라면 홈 페이지로 리다이렉트
            response.sendRedirect(contextPath +"/");
            return false;
        }

		
//		if(login == null || login.getUserid().equals("admin") == false) {
//			String fullURI = request.getRequestURI(); 
//	           String contextPath = request.getContextPath(); 
//	           String prevPage = fullURI.substring(contextPath.length());
//	           if (login != null && login.getUserid().equals("admin") == false)
//	           {
//	        	   prevPage = null;
//	           }
//	           session = request.getSession(true);
//	           session.setAttribute("prevPage", prevPage); 
//	           response.sendRedirect(contextPath + "/member/login");
//	           return false;
//		}
//		else if (login != null && login.getUserid().equals("admin") == false) {
//			String contextPath = request.getContextPath(); 
//			System.out.println(contextPath);
//			response.sendRedirect(contextPath + "/");
//			return false;
//		}
//	
//		return true;	// 계속 진행
	}
}
