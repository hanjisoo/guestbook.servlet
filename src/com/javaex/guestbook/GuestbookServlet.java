package com.javaex.guestbook;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;


@WebServlet("/book")
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//한글 안깨지게
		
		String actionName=request.getParameter("a");//요청할때 쓸껴
		
		if("add".equals(actionName)) {
			System.out.println("추가");
			
			String name=request.getParameter("name");
			String password=request.getParameter("pass");
			String content=request.getParameter("content");
			
			GuestbookVo vo=new GuestbookVo(name,  password, content);
			
			GuestbookDao bookdao =new GuestbookDao();
			bookdao.insert(vo);
			
			response.sendRedirect("/guestbook2/book");
			
			
		}else if("delete".equals(actionName)) {
			System.out.println("삭제");
			
			String password=request.getParameter("password");
			String no=request.getParameter("no");
			
			GuestbookVo vo=new GuestbookVo(Integer.valueOf(no), password);
			
			GuestbookDao bookdao =new GuestbookDao();
			bookdao.delete(vo);
			
			
			response.sendRedirect("/guestbook2/book");
			
			
		}else if("deleteform".equals(actionName)) {
			System.out.println("삭제형식");
			
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/deleteform.jsp");
			rd.forward(request, response);
			
			
			
		}else {
			System.out.println("리스트");
			
			GuestbookDao dao=new GuestbookDao();
			List<GuestbookVo> list=dao.getList();
			/*vo형태로 데이터받아옴*/
			request.setAttribute("list", list);
								/*별명,	위에 vo에서 받은 list를 실어줘*/
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
