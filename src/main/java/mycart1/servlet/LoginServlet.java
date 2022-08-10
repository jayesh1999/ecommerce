package mycart1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart1.dao.UserDao;
import mycart1.entity.User;
import mycart1.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out  =response.getWriter();
		
		String email = request.getParameter("email");
		String password =  request.getParameter("password");
		
		System.out.println(email  +  "     "  +password);
		
		//validation
		
		//authentication user
		UserDao userDao  = new UserDao(FactoryProvider.getFactory());
		User user  = userDao.getUserByEmailAndPassword(email, password);
		
		HttpSession httpSession = request.getSession();
		
		//out.print(user);
		
		if(user == null) {
			httpSession.setAttribute("message", "Invalid Details.. Please try with correct details!!");
			response.sendRedirect("login.jsp");
			return;
		}
		else {
			out.print("<h1>Welcome" +user.getUserName() + "</h1>");
			
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equals("normal")){
				response.sendRedirect("normal.jsp");
			}
			else {
				out.print("<h1>We have not identified user type</h1>");
			}
		}
	
		
		
		
		 
	}

}
