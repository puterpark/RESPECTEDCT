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
@WebServlet("/FileUploadServlet2")
public class FileUploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int maxSize = 10 * 1024 * 1024; // 10MB
		String uploadDir = "C:/upload";
		
		try{
			String format = "UTF-8";
			MultipartRequest mRequest = new MultipartRequest(request, uploadDir, maxSize, format, new DefaultFileRenamePolicy());
			
//			String nameVal = mRequest.getParameter("name");
//			String ufileVal1 = mRequest.getFilesystemName("ufile1");

			//다중 업로드 
			String fileInput = "";
			String ufileVal = "";			
			String fileType = "";
			File fileObj = null;
			String originFileName = "";    
			String fileExtend = "";
			String fileSize = "";

			Enumeration formNames=mRequest.getFileNames();  // 폼의 이름 반환
			while(formNames.hasMoreElements()) {
				fileInput = (String)formNames.nextElement(); 						// 파일인풋 이름
				ufileVal = mRequest.getFilesystemName(fileInput);					// 파일명
				if (ufileVal != null) {
					
					String filePath = uploadDir + "/" + ufileVal;
					File file2 = new File(filePath);
					
					
					fileType 		= mRequest.getContentType(fileInput); 			//콘텐트타입    
					fileObj 		= mRequest.getFile(fileInput);					//파일객체
					originFileName 	= mRequest.getOriginalFileName(fileInput);		//초기 파일명
					fileExtend = ufileVal.substring(ufileVal.lastIndexOf(".")+1);	//파일 확장자
					fileSize = String.valueOf(fileObj.length());					// 파일크기
				}
			}
			
			response.sendRedirect("/user/file_upload_result.jsp");

		}catch(Exception e){
			e.printStackTrace();
		}



	}

}
