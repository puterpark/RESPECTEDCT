package com.kosmo.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class TestServlet
 */
//@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int uploadFileMaxSize;
	public String uploadFileDir;
	public String uploadFileFormat;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// TODO Auto-generated method stub
		
		if(config.getInitParameter("MAX_SIZE") != null)
			uploadFileMaxSize = Integer.parseInt(config.getInitParameter("MAX_SIZE"));
		
		if(config.getInitParameter("UPLOAD_DIR") != null)
			uploadFileDir = config.getInitParameter("UPLOAD_DIR");
		
		if(config.getInitParameter("FILE_FORMAT") != null)
			uploadFileFormat = config.getInitParameter("FILE_FORMAT");
		
		System.out.println("init :" + uploadFileMaxSize + uploadFileDir);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		System.out.println("get call");
		
		String fileName = request.getParameter("ufile");
		String filePath = uploadFileDir + "/" + fileName;
		
		System.out.println("doGet : " + filePath);
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String realPath = uploadFileDir;
		System.out.println(realPath);
		
		MultipartRequest mRequest = new MultipartRequest(request, realPath, uploadFileMaxSize, uploadFileFormat, new DefaultFileRenamePolicy());
		String idVal = mRequest.getParameter("mid");
		String nameVal = mRequest.getParameter("mname");
		String ufileVal = mRequest.getFilesystemName("ufile");
		
		System.out.println("doPost : " + idVal + ", " + nameVal + ", " + ufileVal);
		
		String fullPath =  realPath + "\\" + ufileVal;
		File f = new File(fullPath); //파일생성
		
		System.out.println("doPost : " + fullPath);
		
		//realPath == bfilePath
		//ufileVal == bfileName
		//TODO
		
		response.sendRedirect("/board/file_upload_result.jsp?ufile="+ufileVal);
		
	}

}
