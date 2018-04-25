package com.kosmo.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("Post Call...\n------------");
		
		//1. String 응답
//		String searchStr = request.getParameter("searchStr");
//		String searchGubun = request.getParameter("searchGubun");
//		
//		System.out.println(searchGubun + ", " + searchStr);
//		
//		PrintWriter out = response.getWriter();
//		out.println(searchGubun + ", " + searchStr);
		
		//2. dataType: "json" 데이터 꺼내기
		String str = request.getParameter("MYKEY");
		System.out.println(str);
		
		BoardVO bvo = new BoardVO();
		Gson g = new Gson();
		
		bvo = g.fromJson(str, BoardVO.class);
		System.out.println(bvo.getSearchGubun() + ", " + bvo.getSearchStr());
		
		BoardCrud bc = new BoardCrud();
		
		ArrayList<WrapperVO> list = bc.boardList(1, 10, "", bvo.getSearchGubun(), bvo.getSearchStr());
		
		String res = g.toJson(list);
		PrintWriter out = response.getWriter();
		out.println(res);

	}

}
