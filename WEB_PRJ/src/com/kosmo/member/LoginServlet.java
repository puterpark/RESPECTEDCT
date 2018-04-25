package com.kosmo.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Get Call...\n----------");
		HttpSession session = request.getSession();
		session.invalidate(); //3개 지움
//		session.removeAttribute("LVL_SESS_MNAME");
//		session.removeAttribute("LVL_SESS_MGUBUN");
//		session.removeAttribute("LVL_SESS_POINT");
		
		session.setMaxInactiveInterval(0); //세션을 쓸 수 있는 시간 : 0초
		response.sendRedirect("/board/board_login.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		MemberCrud mc = new MemberCrud();
		MemberVO mvo = new MemberVO();
		
		mvo.setMid(mid);
		mvo.setMpw(mpw);
		mc.login(mvo);
		
		if(mvo.getMgubun() != null && mvo.getMgubun().equals("a")) {
			response.sendRedirect("/board/board_admin_main.jsp");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("LVL_SESS_MSEQ", mvo.getMseq());
			session.setAttribute("LVL_SESS_MNAME", mvo.getMname());
			session.setAttribute("LVL_SESS_MGUBUN", mvo.getMgubun());
			
		} else if(mvo.getMgubun() != null && mvo.getMgubun().equals("u")) {
			response.sendRedirect("/board/board_user_main.jsp");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("LVL_SESS_MSEQ", mvo.getMseq());
			session.setAttribute("LVL_SESS_MNAME", mvo.getMname());
			session.setAttribute("LVL_SESS_MGUBUN", mvo.getMgubun());
			
		} else {
			response.sendRedirect("/board/board_login.jsp");
		}
		
//		if(mvo.getMname() == null) {
//			response.sendRedirect("/board/login.jsp");
//		} else {
//			//response.sendRedirect("/member_url");
//			//세션... 쿠키...
//			System.out.println(mvo.getMname());
//			System.out.println(mvo.getMgubun());
//			
//			//세션에는 사용자의 정보를 담는게 좋음
////			HttpSession session = request.getSession();
////			session.setAttribute("LVL_SESS_MNAME", mvo.getMname());
////			session.setAttribute("LVL_SESS_MGUBUN", mvo.getMgubun());
////			session.setAttribute("LVL_SESS_POINT", 2000);
//			
////			Cookie c1 = new Cookie("LVL_SESS_MNAME", mvo.getMname());
////			Cookie c2 = new Cookie("LVL_SESS_MGUBUN", mvo.getMgubun());
////			Cookie c3 = new Cookie("LVL_SESS_POINT", 2000+"");
////			
////			response.addCookie(c1);
////			response.addCookie(c2);
////			response.addCookie(c3);
////			
////			Cookie[] c = request.getCookies();
//			
//			
//			response.sendRedirect("/board/user_main.jsp");
//			
//		}
	}

}
