package com.kosmo.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

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
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public FileUploadServlet() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String fileName = request.getParameter("fname");
		String fileName = "1.key";
		String uploadDir = "C:/upload";
		String filePath = uploadDir + "/" + fileName;
		
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
	
	
	public void init(ServletConfig config) throws ServletException {
		String ss = config.getInitParameter("lkh22");
		System.out.println(ss);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		int maxSize = 10 * 1024 * 1024; // 10MB


		//------------------------------------------------
		// ServletContext 객체 생성 / 값 추출 
		ServletContext ctx = this.getServletContext(); 
		String xmlVal = ctx.getInitParameter("lkh"); 
		
		// ServletConfig 객체 생성 / 값 추출
		ServletConfig cfg = this.getServletConfig(); 
		String xmlVal22 = cfg.getInitParameter("lkh22"); 
		//------------------------------------------------
		

		//upload폴더를 이클립스에서 만들었지만 이 폴더가 실제로는  플러그인 폴더로 재구성이 되서 실행
		//String uploadDir = request.getRealPath("/upload");
		String uploadDir = ctx.getRealPath("/upload");
		System.out.println(uploadDir);
		//D:\\workspaceJava\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\web\\upload
		
		//프로젝트를 재생성 하여도 변경되지 않는 경로 설정   (예)D:\\upload 
		//해당 경로는 WAS가 바로 접근 불가 -->  다운로드 전용 서블릿 필요
		String uploadDir2 = "C:/upload";
		
		try{
			String format = "UTF-8";
			//▼변환 과정
			MultipartRequest mRequest = new MultipartRequest(request, uploadDir, maxSize, format, new DefaultFileRenamePolicy());
			String idVal = mRequest.getParameter("mid");
			String nameVal = mRequest.getParameter("name");
			//▼파일이 옴
			String ufileVal = mRequest.getFilesystemName("ufile");
			
			String filePath = uploadDir + "\\" + ufileVal;
			String filePath2 = uploadDir2 + "/" + ufileVal;
			System.out.println(filePath);
			System.out.println(filePath2);
			
			File file = new File(filePath);
			File file2 = new File(filePath2);
			
			
			response.sendRedirect("/user/file_upload_result.jsp");

		}catch(Exception e){
			e.printStackTrace();
		}



	}

}
