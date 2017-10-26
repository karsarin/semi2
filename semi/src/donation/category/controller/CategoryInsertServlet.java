package donation.category.controller;

import java.io.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import donation.category.service.CategoryService;
import donation.category.vo.Category;

/**
 * Servlet implementation class CategoryInsertServlet
 */
@WebServlet("/cinsert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 원글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		
		// 업로드 할 파일의 용량 제한 : 10Mbyte로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		// enctype="multipart/form-date"로 전송되었는지 확인
		RequestDispatcher view = null;
		
		
		if(!ServletFileUpload.isMultipartContent(request))
		{
			view = request.getRequestDispatcher("views/category/categoryError.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안함");
			view.forward(request, response);
		}
		
		// 해당 컨테이너에서 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		// 업로드 되는 파일이 저장을 폴더명과 루트 경로 연결 처리
		String savePath = root + "cuploadfiles";
		// web/cuploadfiles 로 지정됨
		
		// request를 MultipartRequest 객체로 변환함
		// 자동 지정된 경로에 파일 저장됨
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String title = mrequest.getParameter("ctitle");
		String writer = mrequest.getParameter("cwriter");
		String content = mrequest.getParameter("ccontent");
		int donation = Integer.parseInt(mrequest.getParameter("cdonation"));
		int workdate = Integer.parseInt(mrequest.getParameter("cworkdate"));
		String email = mrequest.getParameter("cemail");
		String phone = mrequest.getParameter("cphone");
		int group = 0;
		
		switch(mrequest.getParameter("category"))
		{
		case "IT":
			group = 1;
			break;
		case "디자인":
			group = 2;
			break;
		case "마케팅":
			group = 3;
			break;
		case "음악":
			group = 4;
			break;
		case "노하우/상담":
			group = 5;
			break;
		case "번역":
			group = 6;
			break;
		case "건강":
			group = 7;
			break;
		case "기타":
			group = 8;
			break;
				
		}
		String originalFileName = mrequest.getFilesystemName("upfile");
		String addImage1 = mrequest.getFilesystemName("cimage1");
		String addImage2 = mrequest.getFilesystemName("cimage2");
		String addImage3 = mrequest.getFilesystemName("cimage3");
		String addImage4 = mrequest.getFilesystemName("cimage4");
		
		String renameFileName = null;
		String addRenameImage1 = null;
		String addRenameImage2 = null;
		String addRenameImage3 = null;
		String addRenameImage4 = null;
		
		Category c = null;
		
		System.out.println("group = " + group);
		System.out.println(mrequest.getParameter("category"));
		
		System.out.println("title : " + title);
		System.out.println("writer : " + writer);
		System.out.println("content : " + content);
		System.out.println("donation : " + donation);
		System.out.println("workdate : " + workdate);
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		System.out.println("originalFileName :" + originalFileName);
		
		
		if(originalFileName != null)
		{
			// 업로드 된 파일이 있을 경우, 파일명을 "년월일시분초.확장자"로 변경함.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			
			// 업로드되어 있는 원래 파일의 이름을 새 이름으로 바꾸기
			File originalFile = new File(savePath + "\\" + originalFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);
			
			
			
			// 파일 이름 바꾸기 실행 >> 실패시 직접 바꾸기함
			// 새 파일 만들고, 원래 파일의 내용 읽어서 복사 기록하고
			// 원 파일 삭제함
			if(!originalFile.renameTo(renameFile))
			{
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(originalFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				while((read = fin.read(buf, 0, buf.length)) != -1)
				{
					fout.write(buf, 0, read);
				}
				fin.close();
				fout.close();
				originalFile.delete();
			}
			
			c = new Category(writer, title, group, writer, content, donation, workdate, email, phone, originalFileName, renameFileName, null, null, null, null, null, null, null, null);
		} 
		
		
		// 추가 이미지 새이름 바꾸기
		if(addImage1 != null){
			// 업로드 된 파일이 있을 경우, 파일명을 "년월일시분초.확장자"로 변경함.
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
						addRenameImage1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ addImage1.substring(addImage1.lastIndexOf(".")+1);
						
						// 업로드되어 있는 원래 파일의 이름을 새 이름으로 바꾸기
						File addFile1 = new File(savePath + "\\" + addImage1);
						File renameFile1 = new File(savePath + "\\" + addRenameImage1);
						
						
						// 파일 이름 바꾸기 실행 >> 실패시 직접 바꾸기함
						// 새 파일 만들고, 원래 파일의 내용 읽어서 복사 기록하고
						// 원 파일 삭제함
						if(!addFile1.renameTo(renameFile1))
						{
							int read = -1;
							byte[] buf = new byte[1024];
							
							FileInputStream fin = new FileInputStream(addFile1);
							FileOutputStream fout = new FileOutputStream(renameFile1);
							
							while((read = fin.read(buf, 0, buf.length)) != -1)
							{
								fout.write(buf, 0, read);
							}
							fin.close();
							fout.close();
							addFile1.delete();
							c = new Category(writer, title, group, writer, content, donation, workdate, email, phone, originalFileName, renameFileName, addImage1, addRenameImage1, null, null, null, null, null, null);
						}
		} 
						
			if(addImage2 != null){
			// 업로드 된 파일이 있을 경우, 파일명을 "년월일시분초.확장자"로 변경함.
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
			addRenameImage2 = sdf2.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ addImage2.substring(addImage2.lastIndexOf(".")+1);
			
			// 업로드되어 있는 원래 파일의 이름을 새 이름으로 바꾸기
			File addImage = new File(savePath + "\\" + addImage2);
			File renameImage = new File(savePath + "\\" + addRenameImage2);
			
			
			// 파일 이름 바꾸기 실행 >> 실패시 직접 바꾸기함
			// 새 파일 만들고, 원래 파일의 내용 읽어서 복사 기록하고
			// 원 파일 삭제함
			if(!addImage.renameTo(renameImage))
			{
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(addImage);
				FileOutputStream fout = new FileOutputStream(renameImage);
				
				while((read = fin.read(buf, 0, buf.length)) != -1)
				{
					fout.write(buf, 0, read);
				}
				fin.close();
				fout.close();
				addImage.delete();
				c = new Category(writer, title, group, writer, content, donation, workdate, email, phone, originalFileName, renameFileName, addImage1, addRenameImage1, addImage2, addRenameImage2, null, null, null, null);
			}
		}
			
			if(addImage3 != null){
				// 업로드 된 파일이 있을 경우, 파일명을 "년월일시분초.확장자"로 변경함.
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
				addRenameImage3 = sdf2.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ addImage3.substring(addImage3.lastIndexOf(".")+1);
				
				// 업로드되어 있는 원래 파일의 이름을 새 이름으로 바꾸기
				File addImage = new File(savePath + "\\" + addImage3);
				File renameImage = new File(savePath + "\\" + addRenameImage3);
				
				
				// 파일 이름 바꾸기 실행 >> 실패시 직접 바꾸기함
				// 새 파일 만들고, 원래 파일의 내용 읽어서 복사 기록하고
				// 원 파일 삭제함
				if(!addImage.renameTo(renameImage))
				{
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(addImage);
					FileOutputStream fout = new FileOutputStream(renameImage);
					
					while((read = fin.read(buf, 0, buf.length)) != -1)
					{
						fout.write(buf, 0, read);
					}
					fin.close();
					fout.close();
					addImage.delete();
					c = new Category(writer, title, group, writer, content, donation, workdate, email, phone, originalFileName, renameFileName, addImage1, addRenameImage1, addImage2, addRenameImage2, addImage3, addRenameImage3, null, null);
				}
			}
		
			if(addImage4 != null){
				// 업로드 된 파일이 있을 경우, 파일명을 "년월일시분초.확장자"로 변경함.
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
				addRenameImage4 = sdf2.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ addImage4.substring(addImage4.lastIndexOf(".")+1);
				
				// 업로드되어 있는 원래 파일의 이름을 새 이름으로 바꾸기
				File addImage = new File(savePath + "\\" + addImage4);
				File renameImage = new File(savePath + "\\" + addRenameImage4);
				
				// 파일 이름 바꾸기 실행 >> 실패시 직접 바꾸기함
				// 새 파일 만들고, 원래 파일의 내용 읽어서 복사 기록하고
				// 원 파일 삭제함
				if(!addImage.renameTo(renameImage))
				{
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(addImage);
					FileOutputStream fout = new FileOutputStream(renameImage);
					
					while((read = fin.read(buf, 0, buf.length)) != -1)
					{
						fout.write(buf, 0, read);
					}
					fin.close();
					fout.close();
					addImage.delete();
					c = new Category(writer, title, group, writer, content, donation, workdate, email, phone, originalFileName, renameFileName, addImage1, addRenameImage1, addImage2, addRenameImage2, addImage3, addRenameImage3, addImage4, addRenameImage4);
				}
			}
						
			
		if(new CategoryService().insertCategory(c) > 0)
		{
			response.sendRedirect("/semi/clist?page=1");
		} else {
			view = request.getRequestDispatcher("views/category/categoryError.jsp");
			request.setAttribute("message", "category 등록 실패");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
 