package com.kosmo.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosmo.common.PagingUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board")
public class BoardServlet_copy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	int upload_file_max_size = 1000000;
	String upload_file_dir = "C:\\34DEV\\Java\\workspaceJava\\WEB_PRJ\\webapp\\uploads";
	String upload_file_format = "UTF-8";
	
	
	public BoardServlet_copy() {
        super();
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get call");
		
		String action = request.getParameter("action");
		String type = request.getParameter("type");
		
		if(type == null) type = "";
		
		
		String url = "/board?action=list&type="+type;
		int currentPage = 1;
		int blockCount = 16; // 아래 번호당 나올 게시물 수
		int blockPage = 10; // |1|2|3|4|5|...
		
		if(action == null || action.equals("list")) {
			WrapperVO wvo = new WrapperVO();
			BoardVO bvo = new BoardVO();
			BoardCrud bc = new BoardCrud();
			
			int totalCount = bc.boardCount(type);
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			PagingUtil pu = new PagingUtil(url, currentPage, totalCount, blockCount, blockPage);
			String html = pu.getPagingHtml();
			
			ArrayList<WrapperVO> list = bc.boardList(pu.getStartSeq(), pu.getEndSeq(), type);
			
			request.setAttribute("LVL_LIST", list);
			request.setAttribute("LVL_PAGING", html);
			request.setAttribute("LVL_VO", bvo);
			request.setAttribute("LVL_TYPE", type);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_list.jsp");
			rd.forward(request, response);
		} else if(action.equals("view")) {
			BoardVO bvo = new BoardVO();
			BoardCrud bc = new BoardCrud();
			
			String bseq = request.getParameter("bseq");
			
			bvo = bc.bodySelect(Integer.parseInt(bseq));
			
			request.setAttribute("LVL_VO", bvo);
			request.setAttribute("LVL_TYPE", type);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_view.jsp");
			rd.forward(request, response);
		} else if(action.equals("detail")) {
			System.out.println("doGet Detail");
			BoardVO bvo = new BoardVO();
			BoardCrud bc = new BoardCrud();
			
			String bseq = request.getParameter("bseq");
			
			bvo = bc.bodySelect(Integer.parseInt(bseq));
			
			request.setAttribute("LVL_VO", bvo);
			request.setAttribute("LVL_TYPE", type);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board_edit.jsp");
			rd.forward(request, response);
		} else if(action.equals("down")) {
			//String fileName = request.getParameter("fname");
			String fileName = request.getParameter("fname");
			String filePath = upload_file_dir + "/" + fileName;
			
			//MIME type of the file
			ServletContext ctx = this.getServletContext();
			String mimeType = ctx.getMimeType(filePath);
			if (mimeType == null) {        
				mimeType = "application/octet-stream"; //바이너리 타입
			}
			System.out.println("MIME type: " + mimeType);

			
			//▼HTTP 헤더 규격화
			//modifies HTTP header response
			File downloadFile = new File(filePath);
			FileInputStream inStream = new FileInputStream(downloadFile);
			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());

			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			
			//send http response using output stream
			OutputStream outStream = response.getOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			inStream.close();
			outStream.close();   
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("UTF-8"); //한글화 처리
		System.out.println("post call");
		
		BoardVO bvo = new BoardVO();
		BoardCrud bc = new BoardCrud();
		
		String action = request.getParameter("action");
		MultipartRequest mRequest = null;
		
		if(action == null) {
			mRequest = new MultipartRequest(request, upload_file_dir, upload_file_max_size, upload_file_format, new DefaultFileRenamePolicy());
			action = mRequest.getParameter("action");
			System.out.println(upload_file_max_size + ", " + upload_file_dir);
		}
		
		if(action.equals("insert")) {
			
			
			
			String btype = mRequest.getParameter("btype");
			String btitle = mRequest.getParameter("btitle");
			String bcon = mRequest.getParameter("bcon");
			String mseq = "1";
			String ufile = mRequest.getParameter("ufile");
			String filename = mRequest.getFilesystemName("ufile");
			
			HttpSession session = request.getSession();
			mseq = session.getAttribute("LVL_SESS_MSEQ")+"";
			
			bvo.setBtype(btype);
			bvo.setBtitle(btitle);
			bvo.setMseq(Integer.parseInt(mseq));
			bvo.setBcon(bcon);
			
			
			String fullPath = upload_file_dir + "\\" + filename;
			File newFile = new File(fullPath);
			bvo.setBfileSize(newFile.length());
			bvo.setBfilePath(upload_file_dir);
			bvo.setBfileName(filename);
			
			int res = bc.boardInsert(bvo);
			System.out.println(res);
			if(res > 0) {
				response.sendRedirect("/board");
//				response.sendRedirect("/board?action=view&type="+btype+"&bseq="+bseq);
				
				//board?action=view&type=humor&bseq=42
			}
			
		} else if(action.equals("update")) {
			int res = 0;
			
			String bseq = mRequest.getParameter("bseq");
			String btype = mRequest.getParameter("btype");
			String btitle = mRequest.getParameter("btitle");
			String bcon = mRequest.getParameter("bcon");
			String bfilePath = mRequest.getParameter("bfilePath");
			String bfileName = mRequest.getParameter("bfileName");
			String bfileSize = mRequest.getParameter("bfileSize");	
			String ufile = mRequest.getFilesystemName("ufile");
			
			bvo.setBseq(Integer.parseInt(bseq));
			bvo.setBtype(btype);
			bvo.setBtitle(btitle);
			bvo.setBcon(bcon);
			
			System.out.println(bfilePath);
			System.out.println(bfileName);
			System.out.println(bfileSize);
			
			if(ufile == null) {
				res = bc.boardNonFileUpdate(bvo);
			} else {
				File oldFile = new File(bfilePath + "\\" + bfileName);
				if(oldFile.exists())
					oldFile.delete();
				
				String fullPath = upload_file_dir + "\\" + ufile;
				File newFile = new File(fullPath);
				
				bvo.setBfileSize(newFile.length());
				bvo.setBfilePath(upload_file_dir);
				bvo.setBfileName(ufile);
				res = bc.boardUpdate(bvo);
			}
			
			if(res > 0) {
				response.sendRedirect("/board?action=view&btype="+btype+"&bseq="+bseq);
//				response.sendRedirect("/board?action=view&type="+btype+"&bseq="+bseq);
				
				//board?action=view&type=humor&bseq=42
			}
			
		} else if(action.equals("delete")) {
			String bseq = mRequest.getParameter("bseq");
			
			String bfilePath = mRequest.getParameter("bfilePath");
			String bfileName = mRequest.getParameter("bfileName");
			File oldFile = new File(bfilePath + "\\" + bfileName);
			
			if(oldFile.exists())
				oldFile.delete();
			
			int res = bc.boardDelete(Integer.parseInt(bseq));
			
			if(res > 0) {
				response.sendRedirect("/board");
			}
		}
		
		
		
	}

}
