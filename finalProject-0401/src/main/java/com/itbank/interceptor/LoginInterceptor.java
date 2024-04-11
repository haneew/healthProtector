package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
	    if (session == null || session.getAttribute("login") == null) {
	        String fullURI = request.getRequestURI(); 
	        String queryString = request.getQueryString(); // 파라미터 문자열 가져오기
	        String contextPath = request.getContextPath(); 
	        String prevPage = fullURI.substring(contextPath.length());

	        // 요청한 주소에 파라미터가 있는 경우
	        if (queryString != null && !queryString.isEmpty()) {
	            prevPage += "?" + queryString; // 파라미터 추가
	        }

	        System.out.println("fullURI : " + fullURI);
	        System.out.println("prevPage : " + prevPage);

	        session = request.getSession(true);
	        session.setAttribute("prevPage", prevPage); 
	        response.sendRedirect(contextPath + "/member/login");
	        return false;
	    }
	    return true;
	   }   

}
