package com.kosmo.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosmo.common.PagingUtil;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member_url")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get call");

		String ACTIONSTR = request.getParameter("ACTIONSTR");
		String url = "/member_url?ACTIONSTR=LIST";
		int currentPage = 1;
		int blockCount = 20;
		int blockPage = 3;
		
		if(ACTIONSTR == null || ACTIONSTR.equals("LIST") || ACTIONSTR.equals("list")) {
			//member_list.jsp
			
			MemberVO vo = new MemberVO();
			MemberCrud m = new MemberCrud();
			
			int totalCount = m.memberCount();
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			PagingUtil pu = new PagingUtil(url, currentPage, totalCount, blockCount, blockPage);
			String html = pu.getPagingHtml();
			
			ArrayList<MemberVO> list = m.memberList(pu.getStartSeq(), pu.getEndSeq());
			
//			response.sendRedirect("/test/member_list.jsp");

			request.setAttribute("LVL_LIST", list);
			request.setAttribute("LVL_PAGING", html);
			request.setAttribute("LVL_VO", vo);
			
			//포워딩 -> 객체를 보낼 수 있다, 지휘권 줄 수 있다
			RequestDispatcher rd = request.getRequestDispatcher("/test/member_list.jsp");
			rd.forward(request, response);
		} else if(ACTIONSTR.equals("DETAIL")) {
			//member_detail.jsp
			MemberCrud mc = new MemberCrud();
			MemberVO mvo = new MemberVO();

			String mseq = request.getParameter("mseq");

			mvo = mc.memberSelect(Integer.parseInt(mseq));

//			response.sendRedirect("/test/member_detail.jsp");

			request.setAttribute("LVL_VO", mvo);
			RequestDispatcher rd = request.getRequestDispatcher("/test/member_detail_jq.jsp");
			rd.forward(request, response);
		} else if(ACTIONSTR.equals("AJAX")) {
			//request.setCharacterEncoding("UTF-8"); //한글화 처리
			MemberCrud mc = new MemberCrud();
			MemberVO mvo = new MemberVO();
			
			String idVal = request.getParameter("mid");
			String pwVal = request.getParameter("mpw");
			
			System.out.println(idVal+ ", " + pwVal);
			
			mvo.setMid(idVal);
			mvo.setMpw(pwVal);
			mc.login(mvo);
			
			String data = mvo.getMname();
//			String data = "test";
			response.setContentType("text/plain");
			response.getWriter().write(data);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post call");
		
		//request.setCharacterEncoding("UTF-8"); //한글화 처리
		
		PrintWriter out = response.getWriter();
		
		MemberVO vo = new MemberVO();
		MemberCrud mc = new MemberCrud();
		
		String ACTIONSTR = request.getParameter("ACTIONSTR");
		
		if(ACTIONSTR.equals("INSERT")) {
			//insert_proc.jsp
			String val1 = request.getParameter("mid");
			String val2 = request.getParameter("mpw");
			String val3 = request.getParameter("mname");	
			String val4 = request.getParameter("mgubun");
			//--------------
			String[] val5 = request.getParameterValues("habit");
			String val6 = request.getParameter("secret");
			String val7 = request.getParameter("addr");
			String val8 = request.getParameter("memo");

			System.out.println(val1);
			System.out.println(val2);
			System.out.println(val3);
			System.out.println(val4);

			for(int i=0; i<val5.length; i++) {
				System.out.print(val5[i] + ", ");
			}
			System.out.println(val6);
			System.out.println(val7);
			System.out.println(val8);
			
			
//			MemberVO vo = new MemberVO();
//			MemberCrud mc = new MemberCrud();
			vo.setMid(val1);
			vo.setMpw(val2);
			vo.setMname(val3);

			int res = mc.memberInsert(vo);
			
			System.out.println(res + "건 입력");
			
//			response.sendRedirect("/member_url");
			
			int mseq = mc.searchMseq(val1, val2);
			System.out.println(mseq);
			response.sendRedirect("/member_url?ACTIONSTR=DETAIL&mseq="+mseq);
			
		} else if(ACTIONSTR.equals("UPDATE")) {
			//update_proc
			String mseq = request.getParameter("mseq");
			String mpw = request.getParameter("mpw");
			String mname = request.getParameter("mname");

//			MemberVO vo = new MemberVO();+
//			MemberCrud mc = new MemberCrud();

			vo.setMseq(Integer.parseInt(mseq));
			vo.setMpw(mpw);
			vo.setMname(mname);

			mc.memberUpdate(vo); 
			
			response.sendRedirect("/member_url");
			
			//member_url?ACTIONSTR=DETAIL&mseq=
			
			//response.sendRedirect("/board?action=view&type="+btype+"&bseq="+bseq);
			
		} else if(ACTIONSTR.equals("DELETE")) {
			//delete_proc
			String mseq = request.getParameter("mseq");

//			MemberVO vo = new MemberVO();
//			MemberCrud mc = new MemberCrud();

			mc.memberDelete(Integer.parseInt(mseq));
			response.sendRedirect("/member_url");
			
		}
		
		
		




	}

}
